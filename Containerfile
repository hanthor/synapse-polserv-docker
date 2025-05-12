FROM ghcr.io/element-hq/synapse:v1.128.0

# Install git and other necessary build dependencies if any.
# We update the package list and install git in a single RUN layer
# for efficiency and to keep the image size down by cleaning up apt lists.
# The exact packages needed might vary slightly depending on the base image's OS (likely Debian).
# Let's assume apt is available.
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Install the policy server checker from the git repository using pip.
# This command requires git to be installed (which we did in the previous step).
RUN pip install git+https://github.com/element-hq/policyserv_spam_checker#egg=policy-server-checker

# The base image's CMD and ENTRYPOINT will be preserved.
# You can add additional configuration steps here if needed
# to enable or configure the policy server checker within Synapse.
# Refer to the policyserv_spam_checker and Synapse documentation for that.

# Example: If you needed to copy a configuration file
# COPY my_policy_config.yaml /etc/synapse/conf.d/my_policy_config.yaml
