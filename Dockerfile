from mono:3.10

# install ruby 2.1.5
# instructions from https://stackoverflow.com/questions/18490591/how-to-install-ruby-2-on-ubuntu-without-rvm?answertab=active#tab-top

workdir /tmp
run \
    apt-get -y update && \
    apt-get -y install wget build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev && \
    wget http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz

run \
    tar -xvzf ruby-2.1.5.tar.gz && \
    cd ruby-2.1.5/ && \
    ./configure --prefix=/usr/local && \
    make && \
    make install


# copy the application files to the image
workdir /srv/tomecast-webhooks
run mkdir /srv/tomecast-webhooks
copy . /srv/tomecast-webhooks/
run bundle install --path vendor/bundle



#finish up
EXPOSE 8080
CMD ["bash"]