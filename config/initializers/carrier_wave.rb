if Rails.env.production?
	CarrierWave.configure do |config|
		config.fog_credentials = {
			# Confiugre for Amazon S3
			:provider 							=> 'AWS',
			:aws_access_key_id 			=> ENV['AKIAJY3IUTBUAXUI75XA'],
			:aws_secret_access_key 	=> ENV['T/jNHm9DcrQr/TRNcH++n2p5Vss79t4IBmnEOsp+'],
			:region 								=> ENV['us-east-1']
		}
		config.fog_directory			= ENV['sample.app.storage']
	end
end