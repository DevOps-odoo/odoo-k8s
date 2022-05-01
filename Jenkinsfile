node {
              
    stage('Git clone') {
         
        git branch: 'main', credentialsId: 'jenkins', url: 'git@github.com:ingamine/odoo-k8s.git'
         
    }
       
    stage('Docker Build') {
        sh 'docker build -t imech/odoo:NET-$BUILD_NUMBER .' 
        }   
    

    stage('Push') {
         withDockerRegistry([ credentialsId: "dockerHUB", url: "" ]) {       
         
         sh 'docker push imech/odoo:NET-$BUILD_NUMBER'
        
    }

    }
         
           
}
