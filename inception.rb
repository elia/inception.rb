# LUCID DREAMS

class DreamBox
  attr_reader :dreamer, :people
  
  def connect dreamer
    @dreamer = dreamer
    self
  end
  
  def with *people
    @people = people
    self
  end
  
  def start! &block
    (people << dreamer).each { |person| person.extend MilitarySharedDreamResearch }
    dreamer.dream!(*people, &block)
  end
  
  module MilitarySharedDreamResearch
    def dreaming
      class << self
        self
      end
    end

    def dream! *people
      dreamer = self.dreaming
      dream   = Module.new
      yield dreamer, dream, *people.map(&:dreaming)
      self.extend(dream)
    end
    alias start_shared_dream dream!
  end
end


# BACKGROUND

FathersEmpire = '$' * 10_000_000
module Concept
  def I_ll_split_my_fathers_empire?
    true
  end
  
  def split empire
    piecies = []
    piecies << empire.slice!(-1) until empire.empty?
  end
end


# PEOPLE

class Person
  @@Memory = {}
end

RobertFischer = Person.new
Cobb          = Person.new # extractor
Ariadne       = Architect.new # change
Saito         = Person.new # stability
Arthur        = Person.new # left brain
Eames         = Forger.new # right brain
Yusuf


# COBB

(1..3).inject(Cobb){|cobb, _| cobb.extend DreamBox::MilitarySharedDreamResearch; cobb.dreaming}
def (Cobb.dreaming.dreaming.dreaming.dreaming).Mal
  @@Mal = Object.new
end

class << Cobb
  @@mrCharles = %Q{mrCharles: "we're dreaming! I'll protect you from your uncle!"}
end


# ARIADNE

class << Ariadne
  @@City     ||= Module.new
  @@Hotel    ||= Module.new
  @@Fortress ||= Module.new
end


# PLOT

box1 = DreamBox.new
box1.connect(RobertFischer).with(Cobb, Ariadne).start! do |bob1, dream1, cobb1, ari1|
  puts '** dream1 **'
  dream1.extend ari1.instance_eval{ @@City }
  puts 'kidnapped with the uncle'
  
  box2 = DreamBox.new
  box2.connect(bob1).with(cobb1, ari1).start! do |bob2, dream2, cobb2, ari2|
    puts '** dream2 **'
    dream2.extend ari1.instance_eval{ @@Hotel }
    puts cobb2.instance_eval{ @@mrCharles }
    
    box3 = DreamBox.new
    box3.connect(bob2).with(cobb2, ari2).start! do |bob3, dream3, cobb3, ari3|
      puts '** dream3 **'
      dream3.extend ari1.instance_eval{ @@Fortress }
      
      dream3.class_eval {include Concept}
    end
  end
end

if RobertFischer.I_ll_split_my_fathers_empire?
  RobertFischer.split! FathersEmpire
end
