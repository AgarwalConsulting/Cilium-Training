# Write your own CiliumNetwork Policies

Define `CiliumNetworkPolicy` or `CiliumClusterwideNetworkPolicy` which can control traffic for the `Simple FE/BE` application.

## Step 1: Make sure the `FE/BE` application is deployed

```bash
ls examples/05-simple-fe-be-app/*.yaml | xargs -n 1 kubectl apply -f
```

## Step 2: Define the `CiliumNetworkPolicy` or `CiliumClusterwideNetworkPolicy`
