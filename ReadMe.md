#### fast and simple code backups
This docker image can simply clone all repos that are listed in file [repos.txt](repos.txt) 
Once all repos have been cloned they will be packaged and uploaded to a s3-bucket.

##### Environment variables
```
GIT_TOKEN: secret access token to git, optional in case of private repos
BACKUP_BUCKET_NAME: name of s3 bucket to upload the files
AWS_ACCESS_KEY_ID: access key id for programmatic AWS access
AWS_SECRET_ACCESS_KEY: access key secrect for programmatic AWS access
```

##### build and run
```
docker build -t nisckel/git-code-backup .
docker run nsickel/git-code-backup
```