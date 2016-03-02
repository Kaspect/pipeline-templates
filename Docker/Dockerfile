from blang/latex
WORKDIR /home
RUN apt-get update -qq
RUN apt-get dist-upgrade -y
ENV R_BASE_VERSION 3.2.3
RUN echo deb "http://cran.cnr.berkeley.edu/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51716619E084DAB9
RUN apt-get update && apt-get install -y --no-install-recommends \
		littler \
        r-cran-littler \
		r-base=${R_BASE_VERSION}* \
		r-base-dev=${R_BASE_VERSION}* \
		r-recommended=${R_BASE_VERSION}*

RUN apt-get install -y build-essential checkinstall
RUN apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
RUN apt-get install -y python python-pip
RUN apt-get install -y git curl
RUN pip install awscli

RUN git clone http://github.com/Kaspect/pipeline-templates.git && cd pipeline-templates && git checkout iss15 && r Docker/install.r knitr
