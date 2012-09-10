_Not published yet_

# GrapeDoc

This gem generate API documentation from Grape API.

## Installation

Add this line to your application's Gemfile under development group

    gem 'grape_doc'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grape_doc

## Usage

To generate API documentation you should cd to your app directory

    $ cd app_dir

    # rails
    $ grape_doc

    # non-rails
    $ grape_doc --path sinatra_app.rb # for example


It'll generate documentation for each Grape::API subclass and place it into **grape_doc** directory. Each API subclass were placed as separated file.   

You can pass a doc formatter as parameter

    $ grape_doc

_At this time it supports only MarkDown format._

## API description

### Parameters

#### grape > 0.2.1

    desc "Returns a tweet."
    params do
      requires :id, 
               :type => Integer, 
               :desc => "Tweet id."
    end
    get '/show/:id' do
      Tweet.find(params[:id])
    end

#### grape <= 0.2.1

    desc "Returns a tweet.",
    :params => {
      :id => {
        :desc => "Tweet id.",
        :type => Integer,
        :requires => true
      }
    }
    get '/show/:id' do
      Tweet.find(params[:id])
    end

### Manual response description

Single entity

    desc "Returns a tweet.", 
    :response => {
      :id => 14,
      :tweet => "FooBarBazz"
    }
    get '/show/:id' do
      Tweet.find(params[:id])
    end

Array of entities

    desc "Returns a tweets",
    :response => [
      {
        :id => 14,
        :tweet => "FooBarBazz"
      },
      {
        :id => 14,
        :tweet => "FooBarBazz"
      }
    ]
    get '/tweets' do
      Tweet.all
    end

### Response using Grape::Entity

Single entity

    desc "Returns a tweet.", 
    :response_with => { :entity => API::Entities::Tweet }
    get '/show/:id' do
      Tweet.find(params[:id])
    end

Array of entities

    desc "Returns a tweet.", 
    :response_with => { :entities => API::Entities::Tweet }
    get '/show/:id' do
      Tweet.find(params[:id])
    end

Grape::Entity description 

    class Tweet < Grape::Entity
      expose :tweet, :documentation => {:type => String, :desc => "words go here", :value => "FuuBar"}
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
