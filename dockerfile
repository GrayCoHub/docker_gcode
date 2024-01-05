# Start from a base image with Python 3 support
FROM python:3

# Install Jupyter Lab and any required Python libraries
RUN pip install jupyter jupyterlab

# Install R and the necessary components for the R kernel in Jupyter
RUN apt-get update && apt-get install -y \
    r-base \
    libcurl4-openssl-dev libssl-dev libxml2-dev

# Install IRkernel for R in Jupyter using R's package manager
RUN R -e "install.packages(c('IRkernel', 'IRdisplay'), repos='https://cloud.r-project.org/')"
RUN R -e "IRkernel::installspec(user = FALSE)"

# Create a directory to store notebooks and set it as the working directory
WORKDIR /notebooks

# Copy your notebook file into the container (provide the source and destination paths)
# COPY /Gcode/docker_gcode/turn_down.ipynb /notebooks/
COPY turn_down.ipynb /notebooks/


# Expose Jupyter Lab port
EXPOSE 8888



# Nother change to Dockerfile
# CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--      NotebookApp.password=''", "--NotebookApp.disable_check_xsrf=True"]

# Command to start Jupyter Lab with the copied notebook
# CMD ["jupyter", "lab", "--ip='*'", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''", "--NotebookApp.disable_check_xsrf=True", "--notebook-dir=/notebooks"]


# CMD ["jupyter", "lab", "--ip='*'", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''", "--NotebookApp.disable_check_xsrf=True", "--notebook-dir=/notebooks", "turn_down.ipynb"]


CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=", "--turn_down.ipynb"]
