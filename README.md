# CSGO TERRAFORM

## Install 

Make sure to install terraform. [link](https://learn.hashicorp.com/tutorials/terraform/install-cli).

Then run the following command inside the provider's folder of your choice (very important)
```bash
$ terraform init
```

## Deploy

In order to run the scripts, each provider's folder comes with a **bin** folder containing some helpers to execute the usual terraform scripts. 

### Script helpers
The project comes with a **bin** folder that contains some `bash` scripts:
* plan.sh: executes terraform plan 
* apply.sh: executes terraform apply
* destroy.sh: executes terraform apply

We highly encourage using them because they integrate important parameters like `-state` and `-out` while keeping a consitent location of the state accross different actions.

In order to use the these script you need at least to provide the location of the parameter file (see parameter section).

### How to deploy

You must be located inside one of the providers to execute the following:

1. Copy `example.tfvar.json` to another file. We will refer to it as `params.tfvar.json`.
2. Fill `params.tfvar.json` using the data in the parameters table above.
3. Make the bin scripts executable using:
    ```bash
    $ chmod +x bin/*
    ```
4. Deploy your infrastructure using
    ```bash
    $ ./bin/apply.sh /path/to/params.tfvar.json
    ```

We encourage you to execute the `plan` script before `apply`. 

## Destroy

You must be located inside one of the providers to execute the following:

```bash
$ ./bin/destroy.sh /path/to/params.tfvar.json
```

## Plan

You must be located inside one of the providers to execute the following:

```bash
$ ./bin/plan.sh /path/to/params.tfvar.json
```

## Services

The formation deploys [CSGO](https://hub.docker.com/r/cm2network/csgo) using docker-compose. It also deploys [Portainer](https://hub.docker.com/r/portainer/portainer) to manage the containers.

## Useful Links

- [Maps](https://liquipedia.net/counterstrike/Portal:Maps)
- [Advanced Configuration](https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers#Advanced_Configuration)
- [Game Mode](https://developer.valvesoftware.com/wiki/CSGO_Game_Mode_Commands)
