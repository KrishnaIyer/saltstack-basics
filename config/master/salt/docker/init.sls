#https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
docker: 
  pkgrepo.managed:
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ pillar['installation']['docker']['release'] }} stable
    - dist: {{ pillar['installation']['docker']['release'] }}
    - key_url: https://download.docker.com/linux/ubuntu/gpg
