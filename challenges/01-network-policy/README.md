# Write your own Network Policies

Define `NetworkPolicy` which can control traffic for the `Sock Shop` application.

## Step 1: Make sure the `Socks Shop` application is running

```bash
kubectl apply -f examples/02-sock-shop/sock-shop.yaml
```

## Step 2: Define the `NetworkPolicy`

Enforce rules like:

- Order service only can talk to Order DB
  - Same with User service, Catalogues, Cart service

- Frontend should not be able to reach Shipping service

- Isolate each of the services in their own namespaces
  - If not, at least `backend` and `frontend` namespaces

- Implement more rules as you wish
