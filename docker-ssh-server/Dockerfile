FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server iproute2 net-tools curl sudo  && \
    mkdir /var/run/sshd
    
RUN echo 'root:1' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    rm -rf /var/lib/apt/lists/*


RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    echo "export VISIBLE=now" >> /etc/profile 

# RUN echo 'root:Passw0rd' | chpasswd
# RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# ENV NOTVISIBLE "in users profile"
# RUN echo "export VISIBLE=now" >> /etc/profile

# EXPOSE 22
CMD ["/usr/sbin/sshd", "-D","-p","2222"]
# COPY /root /
# ENTRYPOINT [ "/entrypoint.sh" ]