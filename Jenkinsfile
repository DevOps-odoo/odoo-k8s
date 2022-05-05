 pipeline {
	agent any
	
	environment {
      DOCKER_CREDENTIALS = credentials('dockerHUB')
    }
	
stages {
              
    stage('Git clone') {
         steps {
			git branch: 'main', credentialsId: 'jenkins', url: 'git@github.com:DevOps-odoo/odoo-k8s.git'
            //generate pair key jenkins private github public 
		 }

    }
       
    stage('Docker Build') {
		steps {
			sh 'docker build -t assc2/imech:NET-$BUILD_NUMBER .' 
			// sh 'docker build -t imech/odoo:latest .' 
		}

        }   
    

    stage('Push') {
          steps {
			sh 'ech $DOCKER_CREDENTIALS_PSW | docker login -u $DOCKER_CREDENTIALS_USR --password-stdin' 	
			sh 'docker push assc2/imech:NET-$BUILD_NUMBER'
			// sh 'docker push imech/odoo:latest'
			// token from dockerhub
		  
		  } 
    
    }
	}
	}

    stage('Deploy to K8S Master') {
       //admin.conf from k8s
          kubernetesDeploy configs: 'deployodoo.yaml', kubeConfig: [path: ''], kubeconfigId: 'kubernetes', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']

    }    

