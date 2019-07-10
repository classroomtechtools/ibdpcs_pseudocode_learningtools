# IB DP Computer Science Pseudocode Workflow

Three solutions to execute IB Pseudocode with Repl.it and/or Jupyter Lab and/or the command line.

## Quickstart

You can use either or both of the **repl.it**, or **Jupyter Lab**, or **command line** solution.

### repl.it

The easiest and fastest way to get started executing IB Pseudocode is to simply [navigate to this repl](https://repl.it/@adammorris/IB-DP-Pseudocode-Practice) and follow the onscreen instructions.

This solution is useful as it has no installation requirements.

### Jupyter Lab

While the above is simple and complete, for extensive study this solution is recommended. Here is video explaining it.

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/WDoVN0ABy2I/3.jpg)](https://www.youtube.com/watch?v=WDoVN0ABy2I)

The following will install Jupyter and Jupyter Labs into a distinct directory on your (Mac) machine:

Please use [pipenv](https://docs.pipenv.org/en/latest/) to manage your python installations. On Mac:

```
# install homebrew: https://brew.sh/
# at the terminal:
brew install pipenv
```

And then…

```
# create virtual environment
git clone https://github.com/classroomtechtools/ibdpcs_pseudocode_workflow.git
cd ibdpcs_pseudocode_workflow
pipenv shell

# you are now inside the virtual environment
# this will take a few minutes:
pip install -r requirements.txt

# this installs the custom jupyter kernel:
python -m metakernel_pseudocode install

# and finally, launch Jupyter Lab:
jupyter lab
```

Your default browser will open a new tab with Jupyter Lab, prompting you to choose what to do. Choose "new notebook" with "IB Pseudocode Python." In the cell, type:

```
output "Hello World"
```

and then type Control-Enter (or click the play button). Output is:

```
Hello World
```

You're done! You can now type IB Pseudocode and execute it like real code!

To exit the Jupyter Lab program, type `^C` or close the terminal window.

### Command Line

Follow the instructions above for Jupyter installation. When you are in the virtual environment, you have available to you the command `pseudo` and can be used like this:

- Type your code into a file, for example `nano student.psuedo` and type `output "Hello, World"`
- Execute the code by typing `pseudo execute student`
- See the transpiled code by typing `pseudo transpile student`
- There are further example pseudocode in the `examples` folder


## Usage notes

Both solutions work in much the same way: It converts what you typed into valid Python code, and then runs that.

- Syntax and data structures for IB Pseudocode can be found [here](https://ib.compscihub.net/programming/pseudo-code)

- Create structures such as `Array`, `Collection` with an initilizer: `ARR = Array()`, `COL = Collection()` You can find [more information here](https://github.com/classroomtechtools/ibdpcs_pseudocode_workflow/blob/master/ib_pseudocode_python/README.md)

- If you make an error, all of these solutions produce output that help you to debug the program

### Usage notes for Repl.it

- Run the program, which installs the converter software, by clicking on the green Run / Play button. You only need to do that once per session.

- After that, execute the code you have written by typing `execute` followed by a space and the name of the file at the interpreter prompt

- To see what the converted Python code is, type `transpile` followed by a space and the name of the file

### Usage notes for Jupyter

- Every cell executes the pseudocode entered into that cell only. It does not "see" the code in other cells.

- To see what the converted Python code is, type the special `@@transpile` "magic" code into the top of the cell. When you run the cell, it will output the Python code (as well as any resulting output)
