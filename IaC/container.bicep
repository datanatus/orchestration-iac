param cginstancename string
param scheduler_instance string
param dispatcher_instance string
param scheduler_instance_img string
param dispatcher_instance_img string
resource orchcg 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  location: 'westeurope'
  name: cginstancename
  properties: {
		osType: 'Linux'
    containers: [
      {
				name: dispatcher_instance
				properties: {
					image: dispatcher_instance_img
					ports: [
						{
							port: 8000
							protocol: 'TCP'
						}
					]
					resources: {
						requests: {
							cpu: 1
							memoryInGB: json('1.5')
						}
					}
				}
     }
		 {
				name: scheduler_instance
				properties: {
					image: scheduler_instance_img
					ports: [
						{
							port: 8000
							protocol: 'TCP'
						}
					]
					resources: {
						requests: {
							cpu: 1
							memoryInGB: json('1.5')
						}
					}
				}
     }
		]
	} 	
}
