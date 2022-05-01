node {
              
    stage('Git clone') {
         
        git credentialsId: 'jenkins', url: 'git@gitlab.com:boubaker.am/dotnet_angular.git'
         
    }
       
    stage('Docker Build') {
        sh ' cd dotnetback && docker build -t imech/devops2022:NET-$BUILD_NUMBER .' 
        }   
    

    stage('Push') {
         withDockerRegistry([ credentialsId: "dockerHUB", url: "" ]) {       
         
         sh 'docker push imech/devops2022:NET-$BUILD_NUMBER'
        
    }

    }
    stage('Deploy to K8S Master') {
       
kubernetesDeploy configs: 'deployNET.yaml', kubeConfig: [path: ''], kubeconfigId: 'kubernetes', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', 
        serverUrl: 'https://']

   }    
     
           
}
