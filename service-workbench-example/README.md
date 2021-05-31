# RNASeq Service Workbench Workspace
This CloudFormation template will deploy a Service Catalog Product for an RNASeq Bulk SageMaker Notebook instance for use with Service Workbench.

## Deployment Instructions
1. Upload the contents of this directory to the EnvironmentInstanceFiles directory created during the deployment of Service Workbench. 

The following bucket (or similar) should exist: `s3://<ACCOUNTID>-<SWB-NAMESPACE>-environments-bootstrap-scripts/environment-files/`.  
```bash
aws s3 sync . s3://<ACCOUNTID>-<SWB-NAMESPACE>-environments-bootstrap-scripts/environment-files/custom-environment-files/rnaseq-bulk/
```  
where `custom-environment-files/rnaseq-bulk` is a new prefix. If you change this prefix, it should be updated in the `Mappings` section of the `rnaseq-bulk-sagemaker-cfn.yml' template.

2. Deploy RNASeq Bulk CloudFormation template for the Service Catalog product (`rnaseq-bulk-servicecatalog-cfn.yml`).
   - ProductCloudFormationTemplate: Full S3 URL (https://) to `rnaseq-bulk-sagemaker-cfn.yml`
   - ConstraintRoleName: Name of the role to use when launching workspace. This is created automatically by SWB and can be found in the AWS Console, under ServiceCatalog -> Portfolio and viewing other Launch Constrains in the `Constraints` tab.
   - PortfolioId: The portfolio id (similar to `port-fdsakljvio`) used by SWB
3. After the CloudFormation completes deployment, the new Workspace Type should be available in the Service Workbench interface, ready to be configured by an admin.
