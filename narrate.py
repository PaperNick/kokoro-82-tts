from kokoro import KPipeline
from IPython.display import display, Audio

import argparse
import soundfile as sf
import torch


def say(text: str):
    pipeline = KPipeline(lang_code='a', repo_id='hexgrad/Kokoro-82M')
    generator = pipeline(text, voice='af_heart', speed=0.8)
    for i, (gs, ps, audio) in enumerate(generator):
        print(i, gs, ps)
        display(Audio(data=audio, rate=24000, autoplay=i==0))
        sf.write(f'{i}.wav', audio, 24000)


def main():
    parser = argparse.ArgumentParser(description="Generate a voice narration of the given text.")
    parser.add_argument("text", help="The text to narrate")
    args = parser.parse_args()

    if not args.text:
        print(f"Please specify a text to narrate.")
        exit(1)

    say(args.text)


if __name__ == "__main__":
    main()
