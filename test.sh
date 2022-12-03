mkdir test
chmod 755 test
cd test
aws ecr describe-images --repository-name gvh \
--query 'sort_by(imageDetails,& imagePushedAt)[*].imageTags[0]' --output yaml \
| tail -n 3 | awk -F'- ' '{print $2}' >> output.txt
cat output.txt
