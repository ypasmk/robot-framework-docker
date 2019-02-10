FROM ubuntu:16.04

MAINTAINER "Ipatios Asmanidis" <ypasmk@gmail.com>

LABEL name="Docker build for acceptance testing using the robot framework"

RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev
RUN apt-get install -y python-pip python-dev gcc phantomjs firefox
RUN apt-get install -y xvfb zip wget
RUN apt-get install ca-certificates
RUN apt-get install ntpdate

RUN apt-get update && apt-get install -y libnss3-dev libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation

RUN pip install --upgrade pip
RUN pip install robotframework
RUN pip install robotframework-sshlibrary
RUN pip install robotframework-selenium2library
RUN pip install -U robotframework-httplibrary
RUN pip install -U requests[security] && pip install -U robotframework-requests
RUN pip install robotframework-xvfb
RUN pip install certifi
RUN pip install urllib3[secure]
RUN pip install robotframework-excellibrary
RUN pip install openpyxl
RUN pip install pyyaml
RUN pip install Pillow
RUN pip install ndg-httpsclient
RUN pip install pyopenssl
RUN pip install pyasn1
RUN pip install robotframework-testrail
RUN pip install robotframework-angularjs 

RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz
RUN tar xvzf geckodriver-v0.11.1-linux64.tar.gz
RUN rm geckodriver-v0.11.1-linux64.tar.gz
RUN cp geckodriver /usr/local/bin && chmod +x /usr/local/bin/geckodriver
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb
RUN wget https://chromedriver.storage.googleapis.com/2.46/chromedriver_linux64.zip && unzip chromedriver_linux64.zip
RUN cp chromedriver /usr/local/bin && chmod +x /usr/local/bin/chromedriver

# RUN apt-get install -y udev

CMD ["/scripts/run_suite.sh"]

