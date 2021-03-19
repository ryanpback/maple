require 'spec_helper'

describe UrlService do
  let(:url) { 'ryanpback.com' }
  let(:base_url) { described_class::BASE_URL }
  let(:slug_length) { described_class::SLUG_LENGTH }
  subject { described_class.new(long_url: url)}

  it 'creates a Url object' do
    expect(subject.call).to be_kind_of(Url)
  end

  it 'stores the original url as "long_url"' do
    expect(subject.call.long_url).to eq(url)
  end

  it 'stores the slug' do
    expect(subject.call.slug).to_not be_nil
  end

  it 'creates a unique id in the slug equal to the length defined in UrlService' do
    slug            = subject.call.slug
    max_slug_length = slug_length + (0.333 * 8).round
    unique_string   = slug.split("#{base_url}/")[1]

    expect(unique_string.length)
      .to be_between(slug_length, max_slug_length )
  end

  it 'returns an existing Url if it already exists by long_url' do
    unique_string = 'aaaa'
    slug = "#{base_url}/#{unique_string}"
    url1 = Url.create(long_url: url, slug: slug)
    expect(subject.call.long_url).to eq(url1.long_url)
  end

  it 're-generates unique string if already exists' do
    unique_string = 'aaaaa'
    slug = "#{base_url}/#{unique_string}"
    a_url_object = Url.create(long_url: 'a different url', slug: slug)

    allow(subject).to receive(:slugify!)
      .and_return(slug).and_call_original

    new_url = subject.call
    expect(new_url.slug).to_not eq(slug)
  end
end
