#PLEASE refer to the README.md for accepted values for the variables below
authentication_method           = "PLEASE ENTER AUTHENTICATION METHOD"                                                  # "Service Principal"
client_secret                   = "PLEASE ENTER CLIENT SECRET"                                                          # "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
client_id                       = "PLEASE ENTER CLIENT ID"                                                              # "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
tenant_id                       = "PLEASE ENTER TENANT ID"                                                              # "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
subscription_id                 = "PLEASE ENTER SUBSCRIPTION ID"                                                        # "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
resource-group-name 			= "PLEASE ENTER RESOURCE GROUP NAME"                                                    # "tf-managed-app-resource-group"
location 						= "PLEASE ENTER LOCATION"                                                               # "westcentralus"
vwan-hub-name 					= "PLEASE ENTER VWAN HUB NAME"                                                          # "tf-vwan-hub"
vwan-hub-resource-group 		= "PLEASE ENTER VWAN HUB RESOURCE GROUP"                                                # "tf-vwan-hub-rg"
managed-app-name 				= "PLEASE ENTER MANAGED APPLICATION NAME"                                               # "tf-vwan-managed-app-nva"
nva-rg-name 					= "PLEASE ENTER NVA RESOURCE GROUP NAME"                                                # "tf-vwan-nva-rg"
nva-name 						= "PLEASE ENTER SUBSCRIPTION ID"                                                        # "tf-vwan-nva"
cloudguard-version 				= "PLEASE ENTER CLOUDGUARD VERSION"                                                     # "R81.10 - Pay As You Go (NGTP)"
scale-unit 						= "PLEASE ENTER SCALE UNIT"                                                             # "2"
bootstrap-script 				= "PLEASE ENTER CUSTOM SCRIPT OR LEAVE EMPTY DOUBLE QUOTES"                             # "touch /home/admin/bootstrap.txt; echo 'hello_world' > /home/admin/bootstrap.txt"
admin-shell 					= "PLEASE ENTER ADMIN SHELL"                                                            # "/etc/cli.sh"
sic-key 						= "PLEASE ENTER SIC KEY"                                                                # "xxxxxxxxxx"
ssh-public-key 					= "PLEASE ENTER SSH PUBLIC KEY"                                                         # "ssh-rsa xxxxxxxxxxxxxxxxxxxxxxxx imported-openssh-key"
bgp-asn 						= "PLEASE ENTER BGP AUTONOMOUS SYSTEM NUMBER"                                           # "64512"
custom-metrics 					= "PLEASE ENTER yes or no"                                                              # "yes"
routing-intent-internet-traffic = "PLEASE ENTER yes or no"                                                              # "yes"
routing-intent-private-traffic  = "PLEASE ENTER yes or no"                                                              # "yes"
smart1-cloud-token-a 			= "PASTE TOKEN FROM SMART-1 CLOUD PORTAL FOR INSTANCE A OR LEAVE EMPTY DOUBLE QUOTES"   # "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
smart1-cloud-token-b 			= "PASTE TOKEN FROM SMART-1 CLOUD PORTAL FOR INSTANCE B OR LEAVE EMPTY DOUBLE QUOTES"   # "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
smart1-cloud-token-c 			= "PASTE TOKEN FROM SMART-1 CLOUD PORTAL FOR INSTANCE C OR LEAVE EMPTY DOUBLE QUOTES"   # "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
smart1-cloud-token-d 			= "PASTE TOKEN FROM SMART-1 CLOUD PORTAL FOR INSTANCE D OR LEAVE EMPTY DOUBLE QUOTES"   # "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
smart1-cloud-token-e 			= "PASTE TOKEN FROM SMART-1 CLOUD PORTAL FOR INSTANCE E OR LEAVE EMPTY DOUBLE QUOTES"   # "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"