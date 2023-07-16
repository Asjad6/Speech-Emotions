import requests

# server url
URL = "http://127.0.0.1:5000/predict"


# audio file we'd like to send for predicting keyword
FILE_PATH = 'test.wav'


if __name__ == "__main__":

    # open files
    file = open('test.wav', "rb")
    # package stuff to send and perform POST request
    values = {"file": (FILE_PATH, file, "audio/wav")}
    response = requests.post(URL, files=values)
    print(response.text)
    data = response.json()

    print("Predicted keyword: {}".format(data["keyword"]))
