FROM ubuntu:20.04

# update local package cache
RUN apt-get update

# intall wget for downloading the .zip file
RUN apt-get install -y wget

# url of .zip file
ARG zip_url=https://github.com/eficode-academy/devops-academy-whale/archive/refs/heads/master.zip

# download .zip file of github repository
RUN wget --output-document /tmp/repo.zip ${zip_url}

RUN apt-get remove -y wget

RUN apt-get install -y unzip

# unzip the downloaded repository
RUN unzip /tmp/repo.zip -d /tmp/

RUN apt-get remove -y unzip

RUN mkdir /lolcat

#move the whale file to appropriate place
RUN mv /tmp/devops-academy-whale-master/whale.txt /lolcat/whale.txt

# delete all the other stuff we don't need
RUN rm -rf /tmp/devops-academy-handins-public-master

# install ruby to get the gem package manager
RUN apt-get install -y ruby

# install lolcat as a gem (ruby package)
RUN gem install lolcat

# colorize the whale!
RUN lolcat --seed=123 --force /lolcat/whale.txt > /lolcat/color_whale.txt

RUN rm /lolcat/whale.txt

# 'gem uninstall' must be approved interactively, so we use 'yes' to do so...
RUN yes | gem uninstall lolcat

# delete all unused gem packages
RUN gem cleanup

RUN apt-get remove -y ruby

# remove all unsued .deb packages
RUN apt-get autoremove -y

# clean out local package cache
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["cat", "/lolcat/color_whale.txt"]
