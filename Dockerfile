FROM debian:9

ARG SOURCE_BRANCH=master

ADD https://github.com/rojopolis/thinkbox-deadline-client/raw/$SOURCE_BRANCH/DeadlineClient-10.0.15.5-linux-x64-installer.run .
RUN apt-get update && apt-get install -y bzip2 &&\
    chmod +x ./DeadlineClient-*.run && \
    ./DeadlineClient-*.run \
    --mode unattended --repositorydir /repo && \
    rm -f ./DeadlineClient-*.run
CMD ["/opt/Thinkbox/Deadline10/bin/deadlinelauncher", "-nogui", "-slave"]