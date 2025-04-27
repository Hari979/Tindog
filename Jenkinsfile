pipeline {
    agent  {label 'Jenkins-Slave'}
    environment {
        TARGET_DIR = '/usr/share/nginx/html'
      }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'Github', url: 'https://github.com/Hari979/Tindog.git'
            }
        }

        stage('Deploy to Nginx') {
            steps {
                sh '''
                echo "Cleaning old files..."
                sudo rm -rf $TARGET_DIR/*

                echo "Copying new files..."
                sudo cp -r * $TARGET_DIR/

                echo "Restarting Nginx..."
                sudo systemctl restart nginx

                echo "Deployment complete and Nginx restarted!"
                '''
            }
        }
    }
}
