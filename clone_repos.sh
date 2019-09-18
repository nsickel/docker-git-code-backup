#!/usr/bin/env bash

array=( $( cat repos.txt ) )

mkdir -p repos_backup && cd repos_backup

for element in ${array[@]}
do
  git clone "$element"
done
cd ..
file_name=$(date +"%Y_%m_%d")"_repos_backup.tar.gz"

tar -zcvf $file_name repos_backup

aws s3 cp $file_name s3://$BACKUP_BUCKET_NAME/$file_name