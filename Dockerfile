FROM dockerfile/java

MAINTAINER nicerobot <http://github.com/nicerobot/docker-irkernel>

# Install Anaconda
RUN curl -L -o Anaconda3.sh https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda3-2.4.1-Linux-x86_64.sh \
    && echo "45249376f914fdc9fd920ff419a62263 *Anaconda3.sh" | md5sum -c - \
    && chmod +x Anaconda3.sh \
    && ./Anaconda3.sh -b

RUN echo 'export PATH=/root/anaconda3/bin:${PATH}' >> ~/.bashrc

# Add a notebook profile.
RUN mkdir -p -m 700 /root/.jupyter/
ADD ./jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888

ENTRYPOINT ["jupyter"]
CMD ["--help"]
