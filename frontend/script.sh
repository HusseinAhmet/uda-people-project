#! /bin/bash
        echo ${CIRCLE_WORKFLOW_ID:0:7}
          export BACKEND_PUBLIC_IP=$(aws ec2 describe-instances \
              --region us-east-1 \
              --filters "Name=tag:Name,Values=backend-${CIRCLE_WORKFLOW_ID:0:7}" \
              --query 'Reservations[*].Instances[*].PublicIpAddress' \
              --output text)

          echo $BACKEND_PUBLIC_IP
          
         echo "API_URL=http://$BACKEND_PUBLIC_IP:3030" >> .env
