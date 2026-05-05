import jenkins.model.*
import hudson.model.*
import org.jenkinsci.plugins.workflow.job.WorkflowJob

def job = Jenkins.instance.createProject(WorkflowJob, "cicd-pipeline")

job.setDefinition(new org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition(
    new hudson.plugins.git.GitSCM("https://github.com/AVISRJ062002/jenkins-pipeline.git"),
    "jenkins/Jenkinsfile"
))

job.save()
