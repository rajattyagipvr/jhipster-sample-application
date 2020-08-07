#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash helm-apply.sh
cs=csvc
suffix=helm
if [ -d "${cs}-${suffix}" ]; then
helm dep up ./${cs}-${suffix}
helm upgrade --install ${cs} ./${cs}-${suffix} --namespace default
fi
helm dep up ./jhipstersampleapplication-${suffix}
helm upgrade --install jhipstersampleapplication ./jhipstersampleapplication-${suffix} --namespace default


