aws ecr describe-images --repository-name ecs_repo --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]' --output text 
#aws ecr describe-images --repository-name ecs_repo \
#--query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output yaml \
#| tail -n 3 | awk -F'- ' '{print $2}' | head -2  >> $GITHUB_OUTPUT
