node {
              
    stage('Git clone') {
         
            git branch: 'main', credentialsId: 'jenkins', url: 'git@github.com:DevOps-odoo/odoo-k8s.git'
               //generate pair key jenkins private github public 
    }
       
    stage('Docker Build') {
      sh 'docker build -t assc2/odoo-docker:latest .' 
       // sh 'docker build -t assc2/imech:NET-$BUILD_NUMBER .' 
        }   
    

    stage('Push') {
           withDockerRegistry([ credentialsId: "dockerHUB", url: "" ]) {   
         
       sh 'docker push assc2/odoo-docer:latest'
         //sh 'docker push assc2/imech:NET-$BUILD_NUMBER'
        // token from dockerhub
    }
    }
    stage('Deploy to K8S Master') {
       //admin.conf from k8s
        kubernetesDeploy configs: 'deployodoo.yaml', kubeConfig: [path: ''], kubeconfigId: 'kubernetes', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']

    }    
          

    }    
           
