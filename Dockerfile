FROM ghcr.io/element-hq/synapse:v1.129.0

# label container witht the version of the image from the FROM line
LABEL version="1.129.0"

RUN apt-get update && \
    apt-get install -y git
# Install the policy server checker from the git repository using pip.
RUN pip install git+https://github.com/element-hq/policyserv_spam_checker#egg=policy-server-checker
