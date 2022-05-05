node {
              
    stage('Git clone') {
         
            git branch: 'main', credentialsId: 'jenkins', url: 'git@github.com:DevOps-odoo/odoo-k8s.git'
       //   git branch: 'main', credentialsId: 'jenkins', url: 'git@github.com:ingamine/official-images.git'
         //generate pair key jenkins private github public 
    }
       
    stage('Docker Build') {
       sh 'docker build -t imag/odoo:NET-$BUILD_NUMBER .' 
        // sh 'docker build -t imag/odoo:latest .' 
        }   
    

    stage('Push') {
         withDockerRegistry([ credentialsId: "dockerHUB", url: "" ]) {       
         
         sh 'docker push imag/odoo:NET-$BUILD_NUMBER'
        // sh 'docker push imag/odoo:latest'
        // token from dockerhub
    }

    }
    stage('Deploy to K8S Master') {
       //admin.conf from k8s
          kubernetesDeploy configs: 'deployodoo.yaml', kubeConfig: [path: ''], kubeconfigId: 'kubernetes', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']

    }    
           
}
