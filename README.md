# AWS tools

Set of scripts to easily query ECS status of containers.

# ecs-find

Example usage:
```
$ ecs-find my-services awesome-app

{
  "failures": [],
  "tasks": [
    {
      "taskArn": "arn:aws:ecs:eu-west-1:123456789:task/uuid-uuid-uuid-uuid",
      "overrides": {
        "containerOverrides": [
          {
            "name": "awesome-app"
          }
        ]
      },
      "lastStatus": "RUNNING",
      "containerInstanceArn": "arn:aws:ecs:eu-west-1:123456789:container-instance/uuid-uuid-uuid-uuid",
      "createdAt": 1464166060.517,
      "clusterArn": "arn:aws:ecs:eu-west-1:123456789:cluster/my-services",
      "startedAt": 1464166070.984,
      "desiredStatus": "RUNNING",
      "taskDefinitionArn": "arn:aws:ecs:eu-west-1:123456789:task-definition/awesome-app:48",
      "startedBy": "ecs-svc/1246287273727327",
      "containers": [
        {
          "containerArn": "arn:aws:ecs:eu-west-1:123456789:container/uuid-uuid-uuid-uuid",
          "taskArn": "arn:aws:ecs:eu-west-1:123456789:task/uuid-uuid-uuid-uuid",
          "lastStatus": "RUNNING",
          "name": "awesome-app",
          "networkBindings": [
            {
              "protocol": "tcp",
              "bindIP": "0.0.0.0",
              "containerPort": 8080,
              "hostPort": 80
            }
          ]
        }
      ]
    }
  ]
}
```

# ec2-find

Find EC2 instances based on two tags (Environment, Purpose).

# ec2-run

Find instances with ec2-find, then run a script on them. Extra arguments are passed as they are to the remotely-uploaded script.
