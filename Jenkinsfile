node {
              
    stage('Git clone') {
         
      //  git branch: 'main', credentialsId: 'jenkins', url: 'git@github.com:ingamine/odoo-k8s.git'
          git branch: 'main', credentialsId: 'jenkins', url: 'git@github.com:ingamine/official-images.git'
         
    }
       
    stage('Docker Build') {
        sh 'docker build -t imech/odoo:NET-$BUILD_NUMBER .' 
        }   
    

    stage('Push') {
         withDockerRegistry([ credentialsId: "dockerHUB", url: "" ]) {       
         
         sh 'docker push imech/odoo:NET-$BUILD_NUMBER'
        
    }

    }
    stage('Deploy to K8S Master') {
       
           kubernetesDeploy configs: 'odoo.yaml', kubeConfig: [path: ''], kubeconfigId: 'kubernetes', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', 
    serverUrl: 'https://']

    }    
           
}
