base_name = "ticketless-flow"
location  = "centralus"

docker_image_name = "ticketless-flow-app"
docker_image_tag = "latest"

tag_business_unit = "Ticketless"

app_environment_variables = {
  # TODO: Enable once Key Vault secret is created via Azure Portal
  "XTZ_CoreConnect__ApiKey" = "@Microsoft.KeyVault(SecretUri=${module.key_vault.output.uri}/secrets/XTZ-CoreConnect-ApiKey/"
}
