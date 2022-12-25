# [Choice] Ubuntu version (use jammy or bionic on local arm64/Apple Silicon): jammy, focal, bionic
ARG VARIANT="jammy"
FROM buildpack-deps:${VARIANT}-curl
# Have to set it again to be included in the build
ARG VARIANT

LABEL dev.containers.features="common"

RUN if [ "${VARIANT}" = "bionic" ] ; then \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get -y install software-properties-common && \
	add-apt-repository ppa:martin-frost/thoughtbot-rcm ; \
	fi

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
	&& apt-get -y install --no-install-recommends rcm
