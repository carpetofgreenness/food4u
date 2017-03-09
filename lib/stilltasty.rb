class StillTasty

	require "net/http"
	require "json"

	def self.search(food)

		uri = URI("https://shelf-life-api.herokuapp.com/search?q=#{food}")

		response = Net::HTTP.get(uri)

		json = JSON.parse(response)

		result = json[0]["id"]

		uri2 = URI("https://shelf-life-api.herokuapp.com/guides/#{result}")

		response2 = Net::HTTP.get(uri2)

		json2 = JSON.parse(response2)

	end

end

# p StillTasty.search("apple")