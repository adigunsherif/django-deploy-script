Generate an SSH key: ssh-keygen -t rsa -C "your-email-address"
Press Enter key until a randomart image is generated.
Log into Bitbucket -> View profile -> Manage account -> SSH keys -> Add key
Paste the key you have generated in Step 1 in the text box. To get the key, run the following command: cat ~/.ssh/id_rsa.pub
Go to your repository -> Clone. Now you can see the SSH url for your repository. Copy it.
Clone your repository: git clone <ssh-url>