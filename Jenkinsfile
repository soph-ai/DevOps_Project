pipeline {
    agent any
    environment {
        MYSQL_ROOT_PASSWORD = credentials("MYSQL_ROOT_PASSWORD")
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
        SECRET_KEY = credentials("SECRET_KEY")
    }
    stages {

        
        // stage("Test Front"){
        //     steps {
        //         sh '''
        //                 docker-compose down 
        //                 docker-compose up -d
        //                 cd ./frontend
                        
        //                 pytest
        //         '''
        //     }
        // }

        //  stage("Test Back"){
        //     steps {
        //         sh '''
        //                 docker ps --all
        //                 docker-compose up -d
        //                 cd ./backend
                        
        //                 pytest
        //         '''
        //     }
        // }
        

        // for first run through add: git clone https://github.com/QACTrainers/soph-ai_assessment.git
        stage("Deploy"){
            steps {
                sh '''    
                                 
                        ssh -i '~/.ssh/firstkey' ubuntu@10.0.1.50 -oStrictHostKeyChecking=no << EOF
                                                                        sudo apt update -y 
                                                                        cd soph-ai_assessment
                                                                        git pull 
                                                                        docker-compose up -d
                                                                        EOF
                '''                                                    
            }
        }
        
    }
}