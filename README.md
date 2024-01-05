The host folder has very limited documents. 

C:\Gcode\docker_gcode

The main file, dockerfile, will be used to build a JupyterLab notebook using the R kernel.  The requirements.txt file may be necessary for the dockerfile.  
The gcode notebook, turn_down.ipynb, will be copied into the container's file system named /notebook.

For version control, a license, .gitignore, and README files are also included to local folder.


The Github remote: https://github.com/GrayCoHub/docker_gcode


Processes:

A few tweeks fixed the dockerfile. A docker image is built and named: gcode_juplab


Note1	There were no errors when running the docker image: 
	
	docker run -p 8888:8888 gcode_juplab
	
	But, the preable of code displayed while building the notebook did not look right -
	there was no token id provided. 

	And the notebook did not open into a new browser tab.  It was necessary to open a browser tab and type:  localhost:8888/lab 
	The JupyerLab  "launcher" page opens.
	
	The launcher pages looks right.  The directory displays the turn_down.ipynb
	being the only file displayed.  This indicates the turn_down.ipynb was 
	copied from the host folder into the container folder since the folder. 
    The folder displayed in the launcher is named "notebooks" - which is the name 
	used in the dockerfile to name the container's folder.

	The turn_down notebook can be selected and run in the brower.  The notebook runs normally with the common input values.

	The notebook's plot displays and the gcode.csv file named turn_down.ngc is created in the 
	container's folder (/notebook)

	An near success.  The RUN command in the dockerfile needs some tweeking in order 
	to get the desired outcome: turn_down.ipynb will open and start at the top cell .

: Position for initial commit: 01/04/2024