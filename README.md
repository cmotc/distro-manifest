distro-manifest
===============

Workspace for doing my personal enthusiast distro related stuff. The order is
especially subject to change.

Deducing the best way to generate a Debian-Like GNU/Linux distribution more-or-less by Accident
===============================================================================================

Step Zero: Dependencies I guess? You're going to need Docker, so welcome to sid
-------------------------------------------------------------------------------

[See also/For now:](https://cmotc.github.io/cmotc/homelab-project)

Step One: Configure apt-cacher-ng in a Docker container
-------------------------------------------------------

[See also/For now:](https://cmotc.github.io/cmotc/hoarderCache-docker)

Step Three: Configure live-build in a Docker container
------------------------------------------------------

[See also/For now:](https://cmotc.github.io/cmotc/hoarderMediaOS)

[See also/For now:](https://cmotc.github.io/cmotc/fireaxe)

Step Four: Configure the Containers to talk to eachother
--------------------------------------------------------


Step Five: Configure Cron to automate Nightly Builds
----------------------------------------------------

Step Six: Test Automatic Reproducible Deployment
------------------------------------------------

To Clone:

        repo init -u https://github.com/cmotc/distro-manifest && repo sync && make init

