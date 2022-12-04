#aws ecr describe-images --repository-name ecs_repo --query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output text 
aws ecr describe-images --repository-name ecs_repo \
--query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output yaml \
| tail -n 3 | awk -F'- ' '{print $2}' | head -1 >> env.$GITHUB_OUTPUT
#>> env.$GITHUB_OUTPUT
