#https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
docker download: 
  pkgrepo.managed:
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ pillar['installation']['docker']['release'] }} stable
    - dist: {{ pillar['installation']['docker']['release'] }}
    - key_url: https://download.docker.com/linux/ubuntu/gpg

docker install:
  pkg.installed:
    - pkgs: [docker-ce]
    - require:
      - pkgrepo: docker download

docker compose download install: 
  file.managed:
    - source: https://github.com/docker/compose/releases/download/{{ pillar['installation']['docker-compose']['version'] }}/docker-compose-Linux-x86_64
    - name: /usr/local/bin/docker-compose
    - source_hash: {{ pillar['installation']['docker-compose']['source-hash'] }} #salt complains if it cannot verify the hash (which is desirable for security purposes)
    - mode: 755

{% if pillar['installation']['create-groups'] %}
'groupadd docker > /dev/null':
  cmd.run:
    - runas: root
    - require:
      - pkg: docker install
{% endif %}
