pipeline {
    agent any 
    environment {
        doError = '0'
    }
    stages {
	    stage ('check-in') {
		steps {
    			input 'Are you sure?'
		}
	    }
         stage('Build Started Mail Sent') {
            steps {
                 notifyBuildStarted();
                }
	        }
        stage('Building DDL files->DML files->PKS files->PKB files->Shell Scripts->Jar files') {
            steps {
                withCredentials([
                string(credentialsId: 'Declarations', variable: 'alpha'),
                string(credentialsId: 'DB_UNAME', variable: 'uname'),
                string(credentialsId: 'DB_PASSWORD', variable: 'pswd'),
                string(credentialsId: 'SID', variable: 'sid')
                ])  
                {
                   dir("C:/Users/itiwari/Documents") {
                   bat script: 'sh md5_some.sh';
                   } // dir block over
                }  // withCredentials block over
            }  // steps over
        }   // stage over
        
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
