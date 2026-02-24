# aws-cloudwatch-agent-ec2-metrics-logs
Install CloudWatch Logs Agent on EC2 Instance and View CloudWatch Metrics
# Install CloudWatch Agent on EC2 and View CloudWatch Metrics


## The steps
1. Create an EC2 instance
2. SSH into EC2
3. Download and install the CloudWatch Agent
4. Configure and start the agent
5. View the metrics in CloudWatch Metrics (and optionally Logs)

## Architecture (simple)
EC2 instance → CloudWatch Agent → CloudWatch Metrics (+ CloudWatch Logs)

---

## Prerequisites
- AWS account
- EC2 key pair for SSH
- An IAM role attached to the EC2 instance with CloudWatch Agent permissions

> Tip: Best practice is IAM Role (not access keys on the instance).

---

## Step 1 — Create IAM Role for EC2 (CloudWatch Agent)
1. Create an IAM Role:
   - Trusted entity: EC2
   - Use trust policy: `iam/trust-ec2.json`
2. Attach policy:
   - Use `iam/cloudwatch-agent-policy.json` (custom minimal-ish policy)
   - Or attach AWS managed: `CloudWatchAgentServerPolicy` (simpler)

Attach this role to your EC2 instance.

---

## Step 2 — Launch EC2
- Amazon Linux 2 or Ubuntu (both supported here)
- Security Group: allow SSH (22) from your IP

---

## Step 3 — SSH into the instance
Example:
    bash
ssh -i /path/to/key.pem ec2-user@EC2_PUBLIC_IP

### Step 4 — Install CloudWatch Agent
Amazon Linux 2
bash scripts/install_amazon_linux_2.sh

### Step 5 — Configure CloudWatch Agent (JSON)

This lab uses a JSON config file.

Open the example:
configs/cloudwatch-agent-config.json

Edit it if needed (log file paths, log group name, etc.).

Copy it to the expected location:
sudo mkdir -p /opt/aws/amazon-cloudwatch-agent/etc/
sudo cp configs/cloudwatch-agent-config.json /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json

#### Step 6 — Start the agent
bash scripts/start_agent.sh

Check status:
bash scripts/status_agent.sh
