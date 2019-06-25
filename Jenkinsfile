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
		      bat script: 'sh C:/Users/itiwari/Documents/md5.sh';
		 } // step over here credentials part over here
		post {
			success {
				archiveArtifacts artifacts: '/**,build/test/results/*.xml', allowEmptyArchive: true
			}
		} 
    }  // stage over here
	
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


