# -*- coding: utf-8 -*-
"""
Created on Sun May 14 13:50:17 2023

@author: Ameer Abdullah
"""
import librosa
import soundfile
import numpy as np
import joblib

from flask import Flask, jsonify, request
from pyspark import SparkContext, SparkConf

# Import your scikit-learn model and any other dependencies
import joblib


def extract_feature(file_name, mfcc, chroma, mel):
    with soundfile.SoundFile(file_name) as sound_file:
        X = sound_file.read(dtype="float32")
        X=librosa.to_mono(X)
        sample_rate=sound_file.samplerate
        if chroma:
          try:
            stft=np.abs(librosa.stft(X))
          except:
            return None

        result=np.array([])
        if mfcc:
          try:
              mfccs=np.mean(librosa.feature.mfcc(y=X, sr=sample_rate, n_mfcc=40).T, axis=0)
              result=np.hstack((result, mfccs))
          except:
            return None
        if chroma:
          try:
            chroma=np.mean(librosa.feature.chroma_stft(S=stft, sr=sample_rate).T,axis=0)
            result=np.hstack((result, chroma))
          except:
            return None

        if mel:
          try:
            mel=np.mean(librosa.feature.melspectrogram(X, sr=sample_rate).T,axis=0)
            result=np.hstack((result, mel))
          except:
            return None
    return result


# Load the trained model
model = joblib.load('model.pkl')

# Create the Flask application
app = Flask(__name__)

# Initialize the Spark context
conf = SparkConf().setAppName('SpeechEmotionRecognitionAPI')
sc = SparkContext(conf=conf)

# Define an endpoint for making predictions
@app.route('/predict', methods=['POST'])
def predict():
    # Retrieve the audio data from the request
    audio_data = extract_feature('audio', mfcc=True, chroma=True, mel=True)
    # Preprocess the audio data if required

    # Perform prediction using your trained model
    prediction = model.predict(audio_data)
    emotions=['calm', 'happy', 'fearful', 'disgust']
    

    # Return the predicted emotion as JSON response
    response = {'emotion': emotions[prediction]}
    return jsonify(response)

if __name__ == '__main__':
    # Run the Flask application
    app.run(host='0.0.0.0', port=5000)
