# Saltstack basics

## Machines 

For this demo, We'll be using [Vagrant](https://www.vagrantup.com) to setup three virtual machines.
- 1 Master
- 2 Minions

These would communicate over localhost.

> Use the script provided to setup the virtual boxes. Once done, directly start the machines from the vagrant global list.


## Salt configuration Files

### State files

* All the salt files are present in the [config/master/salt](./config/master/salt/) folder. It's tree structure is described below:
    ```
    |____docker
    | |____init.sls
    |____common
    | |____init.sls
    |____nginx
    | |____config
    | | |____nginx.conf
    | |____init.sls
    |____users
    | |____init.sls
    |____top.sls
    ```
* The `top.sls` file contains the base config which is relatively linked to the other configuration files.
* Please refer to the salt documentation for more details.
* On the master, this folder is stored in `/srv/salt`.

> This entire folder is copied by salt onto the minion (/etc/) and hence this is reserved for configuration that affects all minions.

### Pillar Files
* Pillar files contain configuration information that can be selectively applied to individual minions and is placed in `/srv/pillar` in the salt-master.
* The pillar also has a `top.sls` that contains the base config. All configs under '*' is applied to all minions.

## Troubleshooting

|Issue|Solution|
|---|---|
| Minion already exists| https://stackoverflow.com/a/34581195|
|Deleting existing machines| `$vagrant global-status`,  `vagrant destroy <minion id>`|
|Remove inaccessible machines|`$vagrant global-status --prune`|
