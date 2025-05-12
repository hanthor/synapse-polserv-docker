FROM ghcr.io/element-hq/synapse:v1.129.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Install the policy server checker from the git repository using pip.
RUN pip install git+https://github.com/element-hq/policyserv_spam_checker#egg=policy-server-checker
