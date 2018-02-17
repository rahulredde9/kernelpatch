# Author: RahulReddy
LIST_OF_HOST=$1
for i in `cat $LIST_OF_HOST`; do aws ec2 describe-instances --filters "Name=private-ip-address,Values=$i"  --query 'Reservations[*].Instances[*].[InstanceId]' --profile default --region us-east-1 | tr '"' '\n' | grep ^i- | awk '{print "aws ec2 reboot-instances --instance-ids "  $1 " --profile default --region us-east-1"}' | sh; sleep 300; done

