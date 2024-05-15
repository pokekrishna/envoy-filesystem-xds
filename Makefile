apply:
	@kubectl get ns test || kubectl create ns test
	@for file in $$(ls *.yaml); do kubectl -n test apply -f $$file; done

destroy: 
	@kubectl delete ns test

list: 
	@kubectl -n test get all

restart-deployment:	
	@kubectl -n test rollout restart deployment/test-deployment

load:
	@kubectl -n test run hey-load-test --image=pokekrishna/hey --restart=Never --rm -it -- -z 300s http://test-service:80