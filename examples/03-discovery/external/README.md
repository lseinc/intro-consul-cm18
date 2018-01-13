### External Service Location

- In the event an external service out of normal control needs to be registered, there is a way using the API to do this
- Either use something embedded to call the API to register or deregister or script something using curl
- Example:  register a service called search with consul
<code>
curl -v -4 -X PUT -d '{"Datacenter": "dc1",
     "Node": "google",
     "Address": "www.google.com",
     "Service": {"Service": "search", "Port": 80}}' \
     http://localhost:8500/v1/catalog/register
</code>
- Example:  DNS Lookup using dig
<code>
dig @127.0.0.1 -p 8600 search.service.consul SRV
</code>
- Example:  deregister a service called search with consul
<code>
curl -v -4 -X PUT -d '{"Datacenter": "dc1",
     "Node": "google" }' \
     http://localhost:8500/v1/catalog/deregister
</code>
- 
