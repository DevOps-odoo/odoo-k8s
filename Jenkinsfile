node{
     
    stage('SCM Checkout'){
        git credentialsId: 'GIT_CREDENTIALS', url:  'https://github.com/DevOps-odoo/odoo-k8s.git,branch: 'main'
    }
      
    } 
    
    
    stage('Build Docker Image'){
        sh 'docker build -t docker/odoo:14.0 .'
    }
    
    stage('Push Docker Image'){
        withCredentials([string(credentialsId: 'DOKCER_HUB_PASSWORD', variable: 'DOKCER_HUB_PASSWORD')]) {
          sh "docker login -u assc2022 -p ${DOKCER_HUB_PASSWORD}"
        }
        sh 'docker push docker/odoo:14.0'
     }
     
     stage("Deploy To Kuberates Cluster"){
       kubernetesDeploy(
         configs: 'odoo-deploy.yaml', 
         kubeconfigId: 'KUBERNATES_CONFIG',
         enableConfigSubstitution: true
        )
     }
	 
	  /**
      stage("Deploy To Kuberates Cluster"){
        sh 'kubectl apply -f odoo-deploy.yaml'
      } **/
     
}

