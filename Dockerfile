FROM ubuntu
RUN apt-get update && \
      apt-get -y install sudo tmux git unzip ripgrep wget curl \ 
      gcc make 

RUN useradd -m jackson -s /bin/bash && echo "jackson:123456" | chpasswd && adduser jackson sudo
RUN wget https://github.com/neovim/neovim-releases/releases/download/nightly/nvim-linux64.deb
RUN apt install ./nvim-linux64.deb
RUN rm ./nvim-linux64.deb

USER jackson

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

WORKDIR /home/jackson
RUN git clone https://github.com/jw-jackson/config.git

WORKDIR /home/jackson/config
RUN chmod +x ./config.sh ./neovim/config.sh ./tmux/config.sh
RUN ./config.sh

CMD /bin/bash
