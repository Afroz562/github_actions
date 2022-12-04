#aws ecr describe-images --repository-name ecs_repo --query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output text 
BUILD_VERSION=aws ecr describe-images --repository-name ecs_repo \
--query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output yaml \
| tail -n 3 | awk -F'- ' '{print $2}' | head -1 
echo "BUILD_VERSION=$BUILD_VERSION" >> $GITHUB_ENV
#>> env.$GITHUB_OUTPUT
