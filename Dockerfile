FROM korvus/debian10:0.6.3

WORKDIR /root
RUN chsh -s "/bin/bash" root
RUN curl -sfL https://get.k3s.io > cilium-k3s.sh
RUN chmod +x cilium-k3s.sh

WORKDIR /labs
COPY . .
RUN make install-linux
