apply:
	@kubectl get ns test || kubectl create ns test
	@for file in $$(ls *.yaml); do kubectl -n test apply -f $$file; done

destroy: 
	@kubectl delete ns test

list: 
	@kubectl -n test get all

load:
	@kubectl -n test run hey-load-test --image=pokekrishna/hey --restart=Never --rm -it -- -z 300s http://envoy-service:80

restart-deployment:	
	@kubectl -n test rollout restart deployment/envoy-deployment

port-forward:
	@kubectl -n test port-forward service/envoy-service 10000:80

logs-envoy:
	@kubectl -n test logs --follow  --selector app=test-pod