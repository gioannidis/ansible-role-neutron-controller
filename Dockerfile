FROM ansible/ubuntu14.04-ansible:stable
MAINTAINER Mark Stillwell <mark@stillwell.me>

COPY . /var/cache/docker/neutron-controller
WORKDIR /var/cache/docker/neutron-controller

RUN if [ ! -f provisioning/group_vars/all.yml ]; then \
      mkdir -p provisioning/group_vars;\
      ln -s ../../defaults/main.yml provisioning/group_vars/all.yml;\
    fi && \
    ansible-playbook -i inventories/local.ini provisioning/install.yml && \
    rm -rf /var/lib/apt/lists/*

VOLUME [ "/etc/neutron", "/var/lib/neutron", "/var/log/neutron", \
         "/var/log/supervisor" ]

CMD [ "/usr/bin/supervisord" ]

EXPOSE 9696
