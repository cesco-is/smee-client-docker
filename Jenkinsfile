def lastTagName = ""
def regName = ""
def imageName = regName + ""
def regUri = "http://" + regName

pipeline {
    agent any
    stages{
        stage('Git Clone Repository') {
            steps {
                // git clone
                git (
                    branch: '',
                    credentialsId: '',
                    url: ''
                )

                // tag settings
                script {
                    lastTagName = sh(returnStdout:  true, script: "git tag --sort=-creatordate | head -n 1").trim()
                }
                
                echo "last tag name : ${lastTagName}"
            }
        }
        
        stage('Container Image Build & Push') {
            steps {
                withDockerRegistry([url: regUri, credentialsId: ""]) {
                    // docker build
                    sh "docker build . -t ${imageName}:${lastTagName}"
                    
                    // docker latest Tag
                    sh "docker tag ${imageName}:${lastTagName}"
                    
                    // docker image push
                    sh "docker push ${imageName}:${lastTagName}"
                    
                    // docker image delete
                    sh "docker rmi ${imageName}:${lastTagName}"
                }
            }
        }
    }
}
