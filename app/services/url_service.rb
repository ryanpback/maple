class UrlService
  BASE_URL = 'https://maple.com'.freeze
  SLUG_LENGTH = 8

  attr_accessor :long_url, :shortener

  def initialize(long_url:)
    @long_url = long_url
  end

  def call
    existing_url = Url.find_by(long_url: long_url)
    return existing_url if existing_url

    slug = slugify!

    url = Url.create(
      long_url: long_url,
      slug: slug
    )

    call if url.errors.added?(:slug, 'has already been taken')

    url
  end

  private

  def slugify!
    # The argument SLUG_LENGTH specifies the length, in bytes, of the random number to be generated. The length of the result string is about 4/3 of n.
    # This should result in a random string of about 11 characters
    slug = SecureRandom.urlsafe_base64(SLUG_LENGTH)
    "#{BASE_URL}/#{slug}"
  end
end
