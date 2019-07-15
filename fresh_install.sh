if hash brew 2>/dev/null; then 
  # Brew is installed
  
  if hash pipenv 2>/dev/null; then 
    echo "pipenv already installed"
  else
    echo "Installing pipenv https://docs.pipenv.org/en/latest/"
    brew install pipenv
  fi

  mkdir ~/Documents/IB\ CS\ Learning\ Tools
  cd ~/Documents/IB\ CS\ Learning\ Tools/
  
  echo "Installing into Documents folder"
  git clone --recurse-submodules https://github.com/classroomtechtools/ibdpcs_pseudocode_learningtools.git  ~/Documents/IB\ CS\ Learning\ Tools/
  touch DONOT_MODIFY_THISFOLDER.txt

  echo "Installing Jupyter"
  pipenv run pip install -r requirements.txt

  echo "Installing Pseudocode Kernel"
  pipenv run python -m metakernel_pseudocode install

  echo "Installing alias"
  echo 'alias IBCS="sh ~/Documents/IB\ CS\ Learning\ Tools/launch.sh"' >> ~/.bash_profile
  source ~/.bash_profile

  echo "------------"
  echo "Installation Complete"
  echo "To launch Jupyter, open a new window in your terminal, and type:"
  echo "IBCS"
else
  echo "Please install brew first! Exiting"
  echo "https://docs.brew.sh/Installation"
fi
