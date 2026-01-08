# Kokoro TTS

This projects provides a helper script to narrate text using the [Kokoro-82M TTS model](https://huggingface.co/hexgrad/Kokoro-82M)


# Installation


### Create virtual environment and install dependencies

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements_lock.txt
```


# Narrate

To narrate text content, invoke the `say.sh` script and provide the text as a first param

```bash
./say.sh "Belle is a fictional character in Disney's Beauty and the Beast franchise."
```
