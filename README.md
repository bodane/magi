Coin Magi
====================

Copyright (c) 2009-2012 The Bitcoin Core developers

Copyright (c) 2012-2014 The PPCoin developers

Copyright (c) 2014-2017 The Magi Core developers

Coin Magi, derived from Bitcoin and PPCoin, is released under the terms of 
the MIT license. See COPYING for more information or see 
http://opensource.org/licenses/MIT.

Intro
---------------------
Coin Magi (XMG) is an online payment system, enabling instant payments to anyone in the world without using an intermediary. Magi coins can be minted by computational devices including personal computers and portable devices through mPoW and mPoS. Magi aims at fairness, cost effective and energy efficiency during coin minting. Magi is a hybrid PoW/PoS-based cryptocurrency that integrates two mechanisms: proof-of-work (PoW) and proof-of-stake (PoS) protocols. Magi is a CPU coin. 

Features
---------------------
- mPoW, the magi's proof-of-work (PoW) protocol, in addition to required computational works to be done to deter denial of service attacks, is also a network-dependent rewarding model system. The mPoW rewards participants who solve complicated cryptographical questions not only to validate transactions but also to create new blocks in order to generate coins. The coins mined via mPoW are adjusted and balanced by two primary mechanisms: 1) stimulating network activities by issuing rewards, and 2) mitigating redundant mining sources by reducing rewards.

- The particular designed block reward system to remove the competitive nature of 
mining and offer an even playing field for anyone looking to issue coins 
without expensive equipment - offering features such as energy saving, proof of 
mining.

- mPoS, the magi's proof-of-stake (PoS) protocol, aims to achieve distributed consensus through operations in addition to mPoW. mPoS is designed such that it rejects potential attacks, for example, through accumulating a large amount of coins or offline stake time. Magi hybridizes PoW with PoS, and integrate both consensus approaches in order to acquire benefits from the two mechanisms and create a more robust payment system. mPoS particularly enhances the security of XMG's staking system that distinguishes itself from the original concept developed by PPCoin. 

Development process
---------------------

Developers work in their own trees, then submit pull requests when
they think their feature or bug fix is ready.

The patch will be accepted if there is broad consensus that it is a
good thing.  Developers should expect to rework and resubmit patches
if they don't match the project's coding conventions (see coding.txt)
or are controversial.

The master branch is regularly built and tested, but is not guaranteed
to be completely stable. Tags are regularly created to indicate new
stable release versions of Magi.

Feature branches are created when there are major new features being
worked on by several people.

From time to time a pull request will become outdated. If this occurs, and
the pull is no longer automatically mergeable; a comment on the pull will
be used to issue a warning of closure. The pull will be closed 15 days
after the warning if action is not taken by the author. Pull requests closed
in this manner will have their corresponding issue labeled 'stagnant'.

Issues with no commits will be given a similar warning, and closed after
15 days from their last activity. Issues closed in this manner will be 
labeled 'stale'.

Setup
---------------------
If you are just starting to explore magi, or upgrading wallet from versions prior to v1.3.0, the following procedure is recommended:  

1) Backup wallet.dat;

2) Remove the block-chain data under the .magi (unix-like system) or Magi (OS X or Windows) folder, except for wallet.dat;

3) Download latest block-chain data from here: http://m-core.org/bin/block-chain;

4) Unzip all the contents under "m-blockchain" into the .magi or Magi folder;

5) Launch the new wallet. 

- Windows: double click to install, or unpack the files and run the wallet directly;

- Mac OS: unpack the files and copy to the Application folder, and then run the wallet directly;

- Linux: unpack the files and run the wallet directly. 

Docker
---------------------
Docker allows you to easily deploy a Docker magi image on any host operating system that supports Docker.

Before proceeding [install Docker](https://docs.docker.com/get-docker/) for your host operating system.

**NOTE:** To allow for easy access to magi files while using Docker, bind mount volumes are used in this guide. If wanting to isolate the environment however ensure data persistenance with named or anonymous volumes, that particular configuration is outside the scope of this guide.

### Linux / MAC-OSX / Windows

1. Create your docker image. **<- Skip to Step 2 presently as the compile process is not working - see attempted code in `Dockerfile_compile` if wanting to build from source. The `Dockerfile` contained in this repo is ingesting the offical binary directly to keep this setup straightforward.**

  - Clone repo on host which will compile and build the Docker image.
  - Update Dockerfile `ARG ARCH=""` with appropriate architecture, then build image:

    **Linux / MAC-OSX**
    
    ```
    cd magi
    DOCKER_BUILDKIT=1 docker build -t magi-build .
    ```

    **Windows**
    ```
    cd magi
    docker build -t magi-build .
    ```

    **NOTE**: Replace `magi-build:tag` with your preferred image name and tag.

2. If not already downloaded, clone this repository.

  - Enter the `magi` directory and edit file `.env` with your own RPC username and password. This will need to match your `magi.conf` referred to in the next step. If this is a new setup, create a your username and set a random password - you don't need to remember this.

    ```
    RPC_USER=changeme-to-match-your-magi-conf
    RPC_PASSWORD=changeme-to-match-your-magi-conf
    ```

    **IMPORTANT:** Treat the `.env` file as you would your `magi.conf` file and do not share your credentials.

3. Copy your magi.conf, wallet (optional) and chain data (optional) as appropriate in their respective folders:

  - Copy your already setup `magi.conf` file into the `data` directory.
    
    - If needing a copy of `magi.conf`, you can source it from the official repo here: (https://github.com/m-pays/magi/releases/latest). You may wish to update the `magi.conf` node list to ensure you have the most up-to-date node list. See the [nodes](https://discord.com/channels/654322830737145901/655513985633746944) channel on the official magi discord server for details.

  - If you wish to restore your existing `wallet.dat` (optional), and chain data (optional) into the `data` directory, ensure you place all files in the `data` folder. **Ensure at a minimum `magi.conf` exists before proceeding to the next steps**

      **NOTE:** Not placing any files in the `data` folder will mean a new wallet is created and chain data will be synced from a height of 0.

  **Linux / MAC-OSX**

  ```
  $ ls data
  blocks  database  wallet.dat magi.conf
  ```

  **Windows**

  ```
  C:\magi>dir DIR
  Volume in drive C is DATA
  Volume Serial Number is 1895-5A31

  Directory of c:\magi\data

  04/01/2024  05:56 PM    <DIR>          .
  04/01/2024  05:56 PM    <DIR>          ..
  03/27/2024  01:25 AM    <DIR>          blocks
  03/27/2024  01:25 AM    <DIR>          database
  03/27/2024  01:13 AM               903 magi.conf
  04/01/2024  04:41 PM            77,824 wallet.dat
                2 File(s)      4,998,074 bytes
                2 Dir(s)  754,317,275,136 bytes free
  ```

4. Now run your Magi container! :)

### Recommended easy way to start `magid` in a container

From past steps your current base directory will be the `magi` directory. Ensure this is the case before proceeding with the below commands:

```
docker-compose up -d
```

All done! :)

Go to testing section below to confirm `magid` is working OK from the container.

### Other methods  
A more manual option is using the `docker run` command. You will however be required to enter RPC credentials during runtime as shown below.

**NOTE:** You may also modify the `docker-compose.yml` file if you so choose to do this. However it is zero touch configuration in it's current state.

**Linux / MAC-OSX**

```
docker run -d \
  --name magi \
  -p 8233:8233/tcp \
  -p 8232:8232/tcp \
  -v $(pwd)/data/magi.conf:/magi/data/magi.conf:ro \
  -v $(pwd)/data:/magi/data \
  -e RPC_USER=changeme-to-match-your-magi-conf \
  -e RPC_PASSWORD=change-to-match-your-magi-conf \
  bodane/magi:1.4.6.2
```

**Windows**

```
docker run -d --name magi -e RPC_USER=changeme-to-match-your-magi-conf -e RPC_PASSWORD=changeme-to-match-your-magi-conf -v ${PWD}/data/magi.conf:/magi/data/magi.conf:ro -v ${PWD}/data:/magi/data bodane/magi:1.4.6.2
```
All done! :)

Go to testing section below to confirm `magid` is working OK from the container.

# Test magid is working inside docker

If you used the recommended way via `docker-compose` the command will be as follows:

```
docker exec magi-daemon-1 magid -conf="/magi/data/magi.conf"  getinfo
{
    "version" : "v1.4.6.2",
    "protocolversion" : 71065,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "newmint" : 0.00000000,
    "stake" : 0.00000000,
    "blocks" : 3472784,
    "timeoffset" : -1,
    "moneysupply" : 15765186.82457296,
    "connections" : 40,
    "proxy" : "",
    "ip" : "121.214.243.111",
    "ipv4" : "121.214.243.111",
    "ipv6" : "121.214.243.111",
    "difficulty" : {
        "proof-of-work" : 0.77666509,
        "proof-of-stake" : 0.00817296
    },
    "testnet" : false,
    "keypoololdest" : 1523178499,
    "keypoolsize" : 102,
    "mininput" : 0.00000000,
    "paytxfee" : 0.00010000,
    "unlocked_until" : 1653717758,
    "errors" : ""
```

If you used `docker run` to run the container.
```
$ docker exec magi magid -conf="/magi/data/magi.conf" getinfo
{
    "version" : "v1.4.6.2",
    "protocolversion" : 71065,
    "walletversion" : 60000,
    "balance" : 0.00000000,
    "newmint" : 0.00000000,
    "stake" : 0.00000000,
    "blocks" : 3472784,
    "timeoffset" : -1,
    "moneysupply" : 15765186.82457296,
    "connections" : 40,
    "proxy" : "",
    "ip" : "121.214.243.111",
    "ipv4" : "121.214.243.111",
    "ipv6" : "121.214.243.111",
    "difficulty" : {
        "proof-of-work" : 0.77666509,
        "proof-of-stake" : 0.00817296
    },
    "testnet" : false,
    "keypoololdest" : 1523178499,
    "keypoolsize" : 102,
    "mininput" : 0.00000000,
    "paytxfee" : 0.00010000,
    "unlocked_until" : 1653717758,
    "errors" : ""
```

***Known Issues***

   - When `docker exec` commands are issued to the `magi` or `magi-daemon` (docker-compose) container names, presently docker environment variables need to pass `magi.conf` each time a command is entered since this information is not passed to the container correctly. A fix of this would make use easier.


Info
---------------------
- Website: http://www.m-core.org
- Bitcointalk thread: https://bitcointalk.org/index.php?topic=735170.0
- Forum: http://www.m-talk.org/
- Freenode IRC: #magi
