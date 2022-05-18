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
The Dockerfile allows for anyone to create and use their own compiled from source Magi Socker image for any architecture - refer to Dockerfile comments.
This allows you to easily deploy a Docker magi image on any host operating system that supports Docker.

Below is a simple approach to create a basic docker image without `magi.conf`, `wallet.dat` or chain data. These files can be brought in when the container is created for flexilibity to reduce the need for a new docker image each time a change is made.

Before proceeding [install Docker](https://docs.docker.com/get-docker/) for your host operating system.

### Linux / MAC-OSX

1. Create your docker image.

  - Clone repo on host which will be compile and build the Docker image.
  - Update Dockerfile `ARG ARCH=""` with appropriate architecture, then build image:

```
cd magi
DOCKER_BUILDKIT=1 docker build -t magi-build:64 .
```

  **NOTE**: Replace `magi-build:64` with your preferred image name and tag.

2. Prepare magi files which the docker container will read upon start.

`cd .. && mkdir -p docker-magi/data docker-magi/conf && cd docker-magi`

  **NOTE**: We're creating local paths which will contain your magi.conf, wallet and chain data (optional to make your daemon run immediately for wallet or mining use).

3. Copy your magi.conf, wallet (optional) and chain data (optional) as appropriate.

  - Copy your already setup `magi.conf` file in the created `conf` directory, in this case it is `docker-magi/conf`.
  - Copy your your existing wallet (optional), chain data (optional) into the created `data` directory, in this case it is `docker-magi/data`. Not placing one here will mean a new wallet is created. This also applies to the chain data, if not copied here it will be synced inside container only.

```
$ ls conf
magi.conf

$ ls data
blocks  database  wallet.dat
```

4. Now run your Magi container.

```
docker run -d \
  --name magid \
  -p 8233:8233/tcp \
  -p 8232:8232/tcp \
  -v $(pwd)/conf/magi.conf:/magi/conf/magi.conf:ro \
  -v $(pwd)/data:/magi/data \
  magi-chain:64
```
OR
```
docker run -d \
  --name magid \
  -p 8233:8233/tcp \
  -p 8232:8232/tcp \
  -v $(pwd)/conf/magi.conf:/magi/conf/magi.conf:ro \
  -v $(pwd)/data/wallet.dat:/magi/data/wallet.dat \
  magi-chain:64
```
  **NOTE**: No local chain to reduce disk usage. Run risk of removing chain my accident if container were removed however a more efficient docker run method.

5. Test the Magid process works

```
$ docker exec magid magid -rpcuser=x -rpcpassword=x getinfo
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

***Other Considerations / Improvements***

  - Environment variables can be added to the `Dockerfile` to not require the need for RPC credentials each time a command is run outside the docker container.
  - Environment variables could be added to override `magi.conf` file configuration on `magid` start without editing the file. Need a fresh container to have a ENV value change take effect, therefore may not be preferred if frequent changes are needed.
  - Other OS's such as Windows uses different bind mount volume syntax however all Linux instructions are valid for Windows use or other.
  - Magid could be run in daemon mode to give flexibility when attaching to container.


Info
---------------------
- Website: http://www.m-core.org
- Bitcointalk thread: https://bitcointalk.org/index.php?topic=735170.0
- Forum: http://www.m-talk.org/
- Freenode IRC: #magi
