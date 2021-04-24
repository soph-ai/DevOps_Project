pipeline {
    agent any
    environment {
        MYSQL_ROOT_PASSWORD = credentials("MYSQL_ROOT_PASSWORD")
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
        // DATABASE_URI = credentials("DATABASE_URI")
        // TEST_DATABASE_URI = credentials("TEST_DATABASE_URI")
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
        
        stage("Deploy"){
            steps {
                sh '''    
                                 
                        ssh -i '~/.ssh/firstkey' ubuntu@10.0.1.50 -oStrictHostKeyChecking=no << EOF
                                                                        url: 'https://github.com/soph-ai/DevOps_Project.git'
                                                                        docker-compose up -d
                                                                        EOF
                '''                                                    
            }
        }
        
    }
}