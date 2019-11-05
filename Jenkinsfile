pipeline {
   agent any
      stages {
        stage ('Git Checkout ') {

            steps {
                git branch: 'demo-7Nov',
                    credentialsId: 'git',
                    url: 'https://github.com/parveensindhwani/hello-world.git'
                }
            }
			
		stage ('Build') {
		   steps {
		      sh '''
			  cd $WORKSPACE
			  export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-0.amzn2.0.1.x86_64
                          export MAVEN_HOME=/opt/apache-maven-3.6.2/bin
                          export PATH=$PATH:$MAVEN_HOME:$JAVA_HOME
			  mvn clean install package
			  
			  
			  
			  '''
			      }
            }
		stage ('Deploy') {
		   steps {
		      sh '''
		     sudo sh /opt/apache-tomcat-8.5.47/bin/shutdown.sh
                     sudo cp $WORKSPACE/webapp/target/webapp.war /opt/apache-tomcat-8.5.47/webapps/
                     sudo sh /opt/apache-tomcat-8.5.47/bin/startup.sh
			  
			  
			  '''
			      }
            }
		
		
		
		}
	} 
