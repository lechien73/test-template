FROM gitpod/workspace-postgres

RUN echo "CI version from postgres"

ENV PYTHONUSERBASE=/workspace/.pip-modules \
    PIP_USER=yes
ENV PATH=$PYTHONUSERBASE/bin:$PATH

# Setup Heroku CLI
RUN curl https://cli-assets.heroku.com/install.sh | sh

# Add aliases

RUN echo 'alias run="python3 $GITPOD_REPO_ROOT/manage.py runserver 0.0.0.0:8000"' >> ~/.bashrc && \
    echo 'alias heroku_config=". $GITPOD_REPO_ROOT/.vscode/heroku_config.sh"' >> ~/.bashrc && \
    echo 'alias python=python3' >> ~/.bashrc && \
    echo 'alias pip=pip3' >> ~/.bashrc && \
    echo 'alias arctictern="python3 $GITPOD_REPO_ROOT/.vscode/arctictern.py"' >> ~/.bashrc && \
    echo 'alias font_fix="python3 $GITPOD_REPO_ROOT/.vscode/font_fix.py"' >> ~/.bashrc && \
    echo 'alias set_pg="export PGHOSTADDR=127.0.0.1"' >> ~/.bashrc && \
    echo 'alias mongo=mongosh' >> ~/.bashrc && \
    echo 'alias make_url="python3 $GITPOD_REPO_ROOT/.vscode/make_url.py "' >> ~/.bashrc

# Local environment variables
ENV PORT="8080"
ENV IP="0.0.0.0"

# Despite the scary name, this is just to allow React and DRF to run together on Gitpod
ENV DANGEROUSLY_DISABLE_HOST_CHECK=true
