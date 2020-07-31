pipeline {
  agent any
  triggers {
    githubPush()
  }
      stages {
        stage ('Git Checkout ') {

            steps {
                git branch: 'master',
                    credentialsId: 'git-credentials',
                    url: 'https://github.com/parveensindhwani/hello-world.git'
                }
            }
	      
	     stage ('check hook') {
		   steps {
		      script {

          // get build cause (time triggered vs. SCM change)
          def buildCause = currentBuild.getBuildCauses()[0].shortDescription
          echo "Current build was caused by: ${buildCause}\n"

          // e.g. "Current build was caused by: Started by GitHub push by mirekphd test"
          // vs. "Started by timer dummy"

        }
			      }
            }
			
		stage ('Build') {
		   steps {
		      sh '''
		          echo "${buildCause}"
		          echo "it is run ${BUILD_USER} test: env.BUILD_USER"
			  cd $WORKSPACE
			  mvn clean install package
			  
			  
			  '''
			      }
            }
		stage ('Deploy') {
		   steps {
		      sh '''
		      cd $WORKSPACE
		      sudo /root/apache-tomcat-8.5.54/bin/shutdown.sh
		      sudo cp webapp/target/webapp.war /root/apache-tomcat-8.5.54/webapps/
                      sudo /root/apache-tomcat-8.5.54/bin/startup.sh  
		      '''
			      }
            }
		
		
		
		}
	} 
