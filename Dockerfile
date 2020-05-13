FROM centos

RUN yum install wget -y &&\
    wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo &&\
    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key &&\
    yum install java-11-openjdk.x86_64 -y &&\
    yum install jenkins -y &&\
    echo -e "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers 

USER jenkins
ENV USER jenkins

CMD ["java","-jar","/usr/lib/jenkins/jenkins.war"]
