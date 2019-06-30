pipeline {
    agent any
    environment {
        //This variable need be tested as string
        doError = '0'
       // alpha = '0'
        //Path = 'C:/Users/itiwari/Documents'
       
    }
    stages {
        stage('Build Started Mail Sent') {
            steps {
                notifyBuildStarted();
            }
	}

		stage('Building DDL files->DML files->PKS files->PKB files->Shell Scripts->Jar files') {
            steps {
                withCredentials([string(credentialsId: 'Docs', variable: 'Master'),
                string(credentialsId: 'GIT_URL', variable: 'git_url'),
                string(credentialsId: 'DDL', variable: 'ddl'),
                string(credentialsId: 'DML', variable: 'dml'),
                string(credentialsId: 'PKS', variable: 'pks'),
                string(credentialsId: 'PKB', variable: 'pkb'),
                string(credentialsId: 'SHELL', variable: 'shell'),
                string(credentialsId: 'DB_UNAME', variable: 'uname'),
                string(credentialsId: 'DB_PASSWORD', variable: 'pswd'),
                string(credentialsId: 'SID', variable: 'sid'),
                string(credentialsId: 'GIT_START', variable: 'Git_Main'),
                string(credentialsId: 'NEW_PATH', variable: 'new_path')
                ])  
                {
                   dir("${Master}") {
                   bat script: 'sh md5.sh';
                   } // dir over
                }  // withCredentials over
            }  // steps over
			
		post {
			success {
					archiveArtifacts artifacts: '/**,build/test/results/*.xml', allowEmptyArchive: true
				}
		     } 
			
    		}  // stage('Building DDL files->DML files->PKS files->PKB files->Shell Scripts->Jar files') over here
	
        stage('Success') {
            when {
                expression { doError == '0' }
            }
            steps {
                echo "ok"
            }
        }
    }  //stages over
    
    post {
     success {
            // Archive the built artifacts
            echo "Success";
        }

        always {
            echo "Sending Feedback Mail"
     		// Feedback Mail Sent
            emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
                subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
        }  // always over
    }  // post over
    
} // pipeline over
  
// Notify about build has started mail sent
  def notifyBuildStarted()
  {
      
            emailext body: "Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} started \n More info at: ${env.BUILD_URL}",
                recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
                subject: "Jenkins Build Started: Job ${env.JOB_NAME}"
  }


