class Skynet::Bayes
  def initialize(*categories)
    @words = Hash.new
    #@total_words = 0
    @categories_documents = Hash.new
    @total_documents = 0
    @categories_words = Hash.new

    categories.each { |category|
      @words[category] = Hash.new
      @categories_documents[category] = 0
      @categories_words[category] = 0
    }
  end

  def word_count(document)
    # split document string into individual words
    words = document.split(/\W+/) # you should probably ditch all the as, to, the, a, etc here
    counts = Hash.new 0

    # map words to a hash with their count
    words.each do |word|
        counts[word] += 1
    end
    counts
  end

  def train(category, document)
    # Loop through, add the words to the words hash for each category, and the count
    word_count(document).each do |word, count|
      @words[category][word] ||= 0
      @words[category][word] += count
      #@total_words += count
      @categories_words[category] += count
    end

    # Increment shitty counts
    @categories_documents[category] += 1
    @total_documents += 1
  end

  def classify(document, default='unknown')
    # Takes a string and returns a hash of predicted classification and 0-1 float representing the classifiers confidence in the prediction
    sorted = probabilities(document).sort {|a,b| a[1]<=>b[1]}
    best, second_best = sorted.pop, sorted.pop
    return best[0] if (best[1]/second_best[1] > 1.5) #1.5 is our threshold
    return default
  end


  def probabilities(document)
    probabilities = Hash.new
    @words.each_key {|category|
      probabilities[category] = probability(category, document)
    }
    return probabilities
  end

  def probability(category, document)
    doc_probability(category, document) * category_probability(category)
  end

  def doc_probability(category, document)
    doc_prob = 1
    word_count(document).each { |word| doc_prob *= word_probability(category, word[0]) }
    return doc_prob
  end

  def word_probability(category, word)
    (@words[category][word].to_f + 1)/@categories_words[category].to_f
  end

  def category_probability(category)
    @categories_documents[category].to_f/@total_documents.to_f
  end


end
