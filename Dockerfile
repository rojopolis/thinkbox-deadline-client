FROM debian:9

COPY DeadlineClient-10.0.15.5-linux-x64-installer.run .
RUN apt-get update && apt-get install -y bzip2 &&\
    ./DeadlineClient-10.0.15.5-linux-x64-installer.run \
    --mode unattended --repositorydir /repo && \
    rm -f ./DeadlineClient-10.0.15.5-linux-x64-installer.run
CMD ["/opt/Thinkbox/Deadline10/bin/deadlinelauncher", "-nogui", "-slave"]