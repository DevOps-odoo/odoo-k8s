pipeline {
//      environment {
//	registryCredential = 'assc2022'
//          }

	agent any

pipeline {
     environment {
	registryCredential = 'assc2022'
         }

	agent any

stages {
  stage('checkout source') {
             steps{
                git url:'https://github.com/DevOps-odoo/odoo-k8s.git', branch:'main'
             }
  }
  //    }

 stage('Build Docker Image'){
        sh 'docker build -t assc2022/odoo:10.0 .'
    }
    
    stage('Push Docker Image'){
        withCredentials([string(credentialsId: 'DOKCER_HUB_PASSWORD', variable: 'DOKCER_HUB_PASSWORD')]) {
          sh "docker login -u assc2020 -p ${DOKCER_HUB_PASSWORD}"
        }
        sh 'docker push dockerhandson/spring-boot-mongo'
     }
     
     stage("Deploy To Kuberates Cluster"){
       kubernetesDeploy(
         configs: 'deploy-odoo.yaml', 
         kubeconfigId: 'KUBERNATES_CONFIG',
         enableConfigSubstitution: true
        )
     }
	 
	  /**
      stage("Deploy To Kuberates Cluster"){
        sh 'kubectl apply -f deploy-odoo.yaml'
      } **/
     
}
