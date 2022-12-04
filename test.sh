#aws ecr describe-images --repository-name ecs_repo --query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output text 
#!/bin/bash
#BUILD_VERSION="$1"

# aws ecr describe-images --repository-name ecs_repo \
#--query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output yaml \
#| tail -n 2 | awk -F'- ' '{print $2}' | head -1  >> $GITHUB_ENV
#echo ‘EOF’ >> $GITHUB_ENV
#echo "$BUILD_VERSION"
#>> env.$GITHUB_OUTPUT
#AWS_REPOS=`aws ecr describe-images --repository-name ecs_repo\
#--query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output yaml \
#|tail -n 3 |awk -F'- ' '{print $2}' |head -1`
#echo $"AWS_REPOS" 
aws ecr describe-images --output json --repository-name ecs_repo $DOCKER_IMAGE_NAME --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]' | jq . --raw-output >> $GITHUB_ENV
