'groupadd docker':
  cmd.run:
    - runas: root

users:
  user.present:
    - name: testuser
    - home: /home/testuser
    - shell: /bin/zsh
    - groups: 
      - docker
