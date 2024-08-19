cd /var/lib/jenkins/tools/bin
./sonar-scanner -Dsonar.projectKey=mern-final \
-Dsonar.projectBaseDir=${WORKSPACE} \
-Dsonar.sources=${WORKSPACE} \
-Dsonar.host.url=http://localhost:9000 \
-Dsonar.login=sqa_698f505e7a6686bbb74a5081c36b053b0dbb0996

sonar_result=$(curl -s -u sqa_698f505e7a6686bbb74a5081c36b053b0dbb0996 : http://localhost:9000/api/qualitygates/project_status?projectKey=mern-final | jq -r '.projectStatus.status')
echo $sonar_result

docker build -t arpitpatil/mernci:frontend ${WORKSPACE}/client
docker push arpitpatil/mernci:frontend

docker build -t arpitpatil/mernci:frontend ${WORKSPACE}/api
docker push arpitpatil/mernci:backend

ssh -o StrictHostKeyChecking=no -i /var/lib/jenkins/.ssh/jenkins.pem ubuntu@18.232.148.41
kubectl set image deployment/backend-deployment backend=arpitpatil/mernci:backend
kubectl set image deployment/frontend-deployment frontend arpitpatil/mernci:frontend
