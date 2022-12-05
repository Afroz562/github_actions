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
#BUILD_ID=$(aws ecr describe-images --output json --repository-name ecs_repo $DOCKER_IMAGE_NAME --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]' | jq . --raw-output)
#echo $"BUILD_ID"
#!/bin/bash
result=$( aws ecr describe-images --repository-name ecs_repo \
--query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output yaml \
| tail -n 4  | awk -F'- ' '{print $2}')
for val in $result; do
    echo "Run: Display IMAGE TAGS $val"
done
result=$(aws ecr describe-images --output json --repository-name ecs_repo $DOCKER_IMAGE_NAME --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]' | jq . --raw-output)
result=$( aws ecr describe-images --repository-name ecs_repo \
--query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output yaml \
| tail -n 3 | awk -F'- ' '{print $2}' | head +1)
for val in $result; do
    echo "Run: Display IMAGE TAG $val"
    #echo "Run:build_id=$val"
    #echo ::set-output {name}=image::$val"
    echo "::set-output name=image::056584266475.dkr.ecr.us-east-1.amazonaws.com/ecs_repo:$val"
done
