# 

# Art Analyzer

## Analyze artwork using GPT Vision and LLM

Art Analyzer is an app that uses GPT Vision (See: [OpenAI Platform](https://platform.openai.com/docs/guides/vision)) to identify artwork from images and AI language models like GPT-4 to provide detailed critiques of paintings, drawings, and other visual art forms. Users can upload an image of a piece for review, and the app will generate an analysis of the artwork covering composition, use of color, brushwork/texture, emotional impact, originality/creativity, and recommendations of similar artists and paintings.

Can we really use AI as an art critic or expert? Yes and No. This app is a fun experiment to see how far along GPT Vision has come, and the results are generally very good and surprisingly detailed. But, if you are looking to analyze and critique artwork in a more official capacity feel free to defer to art historians, experts, and enthusiasts.



Read more:

**Blog Post** - https://eric-blue.com/2023/12/05/art-analyzer/

**YouTube Video** - https://youtu.be/9-nDqjFrpk0?si=OjIyTMSvDYHY0d5o



## Tech

**Uses**:

* Python

* Streamlit (https://streamlit.io/)

* OpenAI - GPT-4 with Vision (GPT-4V or gpt-4-vision-preview - [OpenAI Platform](https://platform.openai.com/docs/guides/vision))

## Demo URL

* Streamlit - https://artanalyzer.streamlit.app/ (requires OpenAI API Key)

## Development Environment

### Running the app

To start the app, run:

```
streamlit run streamlit_art.py
```

## Docker

A docker image is publicly available by pulling ericblue/artanalyzer:0.1 and on  [Dockerhub](https://hub.docker.com/repository/docker/ericblue/artanalyzer/general)

## Building the Docker Image

* Dockerfile based on instructions from https://docs.streamlit.io/knowledge-base/tutorials/deploy/docker

* Pipreqs (https://pypi.org/project/pipreqs/) used to generate requirements.txt


```
# build an image with the 'latest' tag
make build

# build an image with a custom tag (e.g. 0.1)
make build TAG=<enter your custom tag>
```   

## Running the Docker Image

* Docker public repo at https://hub.docker.com/r/ericblue/artanalyzer


```
## Default Docker Run
docker run -p 8080:8501 ericblue/artanalyzer:0.1

## Run with custom eternal port
docker run -p 8080:8501 ericblue/artanalyzer:0.1

## Run with custom ENV variables containing the OPENAI_API_KEY var
docker run -p 8080:8501 --env-file .env ericblue/artanalyzer:0.1
```   


## Known Issues

- On occasion, GPT-4V does not like to provide artist details, including similar artists or paintings (e.g. while analyzing Mona Lisa, the following is returned "*I cannot name the artist, but this painting is one of the most recognized works in the world.*").  Often times, simply reloading and trying again will return successful results.



## About

Analyze artwork using GPT Vision and LLM

This tool is a work in progress. You can contribute to the project on GitHub ([ericblue/art-analyzer · GitHub](https://github.com/ericblue/art-analyzer)) with your feedback and suggestions💡.

Created by Eric Blue ([https://eric-blue.com](https://eric-blue.com/) & [https://ericblueart.com](https://ericblueart.com/)).
