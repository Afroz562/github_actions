#aws ecr describe-images --repository-name ecs_repo --query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output text 
#!/bin/bash
#BUILD_VERSION="$1"
aws ecr describe-images --repository-name ecs_repo \
--query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output yaml \
| tail -n 3 | awk -F'- ' '{print $2}' | head -1 
#echo "$BUILD_VERSION"
#>> env.$GITHUB_OUTPUT
#AWS_REPOS=`aws ecr describe-images --repository-name ecs_repo\
#--query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output yaml \
#|tail -n 3 |awk -F'- ' '{print $2}' |head -1`
echo $"AWS_REPOS" >> $GITHUB_OUTPUT
