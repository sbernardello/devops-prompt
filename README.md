# Run commands on a local folder using a linux container

Example

```bash
# example
# preload aws env using aws-vault and run sops to edit a local encrypted file
aws-vault exec aws-eu -- ./run.sh sops secrets.env
```
