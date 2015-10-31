#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'mqtt'

# MQTTHOST = "free.mqtt.shiguredo.jp"
MQTTHOST = "test.mosquitto.org"
USERNAME = "example@github"
PASSWORD = "<password>"
TOPIC = "design-fun.com/#"

class Subscriber
  def initialize
    # MQTTに接続するためのクライアントを作成します
    $client = MQTT::Client.new(
      :host => MQTTHOST,
      :port => 1883,
      # :username => USERNAME,
      # :password => PASSWORD
    )
  end

  def get_message(topic)
    # 接続します Subscribe example
    $client.connect do |c|
      # Subscribeします
      c.get(topic) do |topic, message|
        puts "#{topic}: #{message}"
      end
    end
  end

  def sub
end

Subscriber.new.get_message(TOPIC)
