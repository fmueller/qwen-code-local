FROM ghcr.io/qwenlm/qwen-code:0.0.10

RUN groupadd -r qwen && \
    useradd -m -r -g qwen qwen

RUN mkdir -p /home/qwen/.qwen && \
    chown -R qwen:qwen /home/qwen

COPY settings.json /home/qwen/.qwen/settings.json
RUN chown qwen:qwen /home/qwen/.qwen/settings.json

ENV PATH="/usr/local/bin:${PATH}"

COPY entrypoint.sh /home/qwen/entrypoint.sh
RUN chown qwen:qwen /home/qwen/entrypoint.sh && chmod +x /home/qwen/entrypoint.sh

USER qwen
WORKDIR /home/qwen

ENTRYPOINT ["/home/qwen/entrypoint.sh"]
CMD ["bash"]
