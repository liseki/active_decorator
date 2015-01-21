require 'spec_helper'

class Comic
  def presenter
    'decorator'
  end
end

module ComicPresenter
  def presenter
    'presenter'
  end
end

describe 'Configure' do
  let(:comic) { Comic.new }

  before do
    ActiveDecorator.configure do |config|
      config.decorator_suffix = 'Presenter'
    end

    ActiveDecorator::Decorator.instance.decorate(comic)
  end

  after do
    ActiveDecorator.configure do |config|
      config.decorator_suffix = 'Decorator'
    end
  end

  it 'must use MoviePresenter' do
    expect(comic.presenter).to eq 'presenter'
  end
end