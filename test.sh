aws ecr describe-images --repository-name ecs_repo \
--query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' jq . --raw-output
