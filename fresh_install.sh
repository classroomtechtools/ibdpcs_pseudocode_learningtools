if hash brew 2>/dev/null; then 
  # Brew is installed
  
  if hash pipenv 2>/dev/null; then 
    echo "pipenv already installed"
  else
    echo "Installing pipenv https://docs.pipenv.org/en/latest/"
    brew install pipenv
  fi
  echo "Installing Python Package Manager"

  mkdir ~/Documents/IB\ CS\ Learning\ Tools
  cd ~/Documents/IB\ CS\ Learning\ Tools    
  touch ~/Documents/IB\ CS\ Learning\ Tools/do_not_mod_this_folder.txt

  echo "Installing into Documents folder"
  cd ~/Documents/IB\ CS\ Learning\ Tools/
  git clone --recurse-submodules https://github.com/classroomtechtools/ibdpcs_pseudocode_learningtools.git .

  echo "Installing Jupyter"
  pipenv run pip install -r requirements.txt

  echo "Installing Pseudocode Kernel"
  pipenv run python -m metakernel_pseudocode install

  echo "------------"
  echo "Installation Complete"
  echo "To launch Jupyter, type:"
  echo "sh launch.sh"
  
else
  echo "Please install brew first! Exiting"
  echo "https://docs.brew.sh/Installation"
fi
