require 'spec_helper'

describe RunsHelper do
  describe "#scraped_domains_list" do
    let(:foo_domain) { mock_model(Domain, name: "foo.com")}
    let(:bar_domain) { mock_model(Domain, name: "bar.com")}
    let(:www_foo_domain) { mock_model(Domain, name: "www.foo.com")}
    let(:www_bar_domain) { mock_model(Domain, name: "www.bar.com")}
    let(:fiddle_domain) { mock_model(Domain, name: "fiddle.com")}

    it do
      expect(helper.scraped_domains_list([foo_domain])).to eq '<a href="http://foo.com" target="_blank">foo.com</a>'
      expect(helper.scraped_domains_list([foo_domain])).to be_html_safe
    end

    it do
      expect(helper.scraped_domains_list([foo_domain, bar_domain])).to eq '<a href="http://foo.com" target="_blank">foo.com</a> and <a href="http://bar.com" target="_blank">bar.com</a>'
      expect(helper.scraped_domains_list([foo_domain, bar_domain])).to be_html_safe
    end

    it do
      expect(helper.scraped_domains_list([foo_domain, bar_domain, www_foo_domain])).to eq '<a href="http://foo.com" target="_blank">foo.com</a>, <a href="http://bar.com" target="_blank">bar.com</a>, and <a href="http://www.foo.com" target="_blank">www.foo.com</a>'
      expect(helper.scraped_domains_list([foo_domain, bar_domain, www_foo_domain])).to be_html_safe
    end

    it do
      expect(helper.scraped_domains_list([foo_domain, bar_domain, www_foo_domain, www_bar_domain])).to eq '<a href="http://foo.com" target="_blank">foo.com</a>, <a href="http://bar.com" target="_blank">bar.com</a>, <a href="http://www.foo.com" target="_blank">www.foo.com</a>, and 1 other domain'
      expect(helper.scraped_domains_list([foo_domain, bar_domain, www_foo_domain, www_bar_domain])).to be_html_safe
    end

    it do
      expect(helper.scraped_domains_list([foo_domain, bar_domain, www_foo_domain, www_bar_domain, fiddle_domain])).to eq '<a href="http://foo.com" target="_blank">foo.com</a>, <a href="http://bar.com" target="_blank">bar.com</a>, <a href="http://www.foo.com" target="_blank">www.foo.com</a>, and 2 other domains'
      expect(helper.scraped_domains_list([foo_domain, bar_domain, www_foo_domain, www_bar_domain, fiddle_domain])).to be_html_safe
    end
  end

  describe "#simplified_scraped_domains_list" do
    let(:foo_domain) { mock_model(Domain, name: "foo.com")}
    let(:bar_domain) { mock_model(Domain, name: "bar.com")}
    let(:www_foo_domain) { mock_model(Domain, name: "www.foo.com")}
    let(:www_bar_domain) { mock_model(Domain, name: "www.bar.com")}
    let(:fiddle_domain) { mock_model(Domain, name: "fiddle.com")}

    it do
      expect(helper.simplified_scraped_domains_list([foo_domain])).to eq 'foo.com'
    end

    it do
      expect(helper.simplified_scraped_domains_list([foo_domain, bar_domain])).to eq 'foo.com, bar.com'
    end

    it do
      expect(helper.simplified_scraped_domains_list([foo_domain, bar_domain, www_foo_domain])).to eq 'foo.com, bar.com, www.foo.com'
    end

    it do
      expect(helper.simplified_scraped_domains_list([foo_domain, bar_domain, www_foo_domain, www_bar_domain])).to eq 'foo.com, bar.com, www.foo.com, and 1 other'
    end

    it do
      expect(helper.simplified_scraped_domains_list([foo_domain, bar_domain, www_foo_domain, www_bar_domain, fiddle_domain])).to eq 'foo.com, bar.com, www.foo.com, and 2 others'
    end
  end
end
