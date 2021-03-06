// This is the base job that creates clones of the jobs listed above for each envionment.

freeStyleJob('/Seed-job') {
  description('Create seed job to configure pipelines/jobs')

  scm {
    git {
      remote {
        url 'https://github.com/yogi0001122/jenkins-automation.git'
        credentials 'git-user'
      }
      branch 'master'
    }
  }
  parameters {
    stringParam 'environment_name', "", "Environment Name"
  }
  triggers {
        githubPush()
    }
  steps {
    dsl {
      external 'seed_job.groovy'
    }
  }
}
