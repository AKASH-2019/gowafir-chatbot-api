# gowafir-chatbot-api
*** one time[

What this does step-by-step:

  - brew install pyenv → Installs Python version manager

  - pyenv install 3.10.14 → Gets Python 3.10 (Rasa-compatible)

  - pyenv local 3.10.14 → Sets local version for your project

virtual environment 

  - python3.10 -m venv env_rasa → Creates a new isolated environment

  - source env_rasa/bin/activate → Activates the environment

<!-- 
  - pip install --upgrade pip setuptools wheel → Updates core packaging tools

  - pip install rasa 
-->

pip install -r requirements.txt

]

Terminal (if add/change something in model):
rasa train 

Run on Terminal 1:
   - rasa run actions

Run on Terminal 2:
   - rasa run --enable-api --cors "*"

