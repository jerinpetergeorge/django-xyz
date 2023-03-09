FROM python:3.10-bullseye as base

LABEL maintainer="Jerin Peter George <jerinpetergeorge@gmail.com>"

# Set arguments
ARG USERNAME=app_user
ARG USER_DIR=/home/$USERNAME
ARG WORK_DIR=$USER_DIR/app

# Creating a non-root user
RUN useradd -m $USERNAME

# Switching the user
USER $USERNAME

# Create a new directory to keep the project files
RUN mkdir $WORK_DIR

# Copy local contents into container
COPY ./ $WORK_DIR

# Setting newly created directory as PWD
WORKDIR $WORK_DIR

# Adding user's bin path to `PATH` variable
ENV PATH "$PATH:$USER_DIR/.local/bin"

# Installing pip packages
RUN pip install pip -U

FROM base as dev
RUN pip install -r requirements/dev.txt -U

FROM base AS prod
RUN pip install -r requirements/production.txt -U
