# NOTE: EKS module manages control plane and node security groups internally.
# Custom security group rules are configured via module.eks.node_security_group_additional_rules.
# Do not create standalone network ACLs here; the default subnet ACLs are safer for node bootstrap.
