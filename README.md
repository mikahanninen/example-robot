# Readme

Task will download all attachments from emails sent by defined **sender** (defined in the **vault.yaml**) and will parse specific address information from the PDF file.

To run this task, the **vault.yaml** file containing necessary secrets needs to be created to the Robot root level.

```yaml
email:
  username: EMAIL-USERNAME
  password: EMAIL-PASSWORD
  sender: SENDER-EMAILADDRESS
```
