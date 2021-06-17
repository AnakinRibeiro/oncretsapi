class Elongation < ApplicationRecord
  has_paper_trail
  
  before_create :calculate_elongation

  belongs_to :cable
  belongs_to :cables_reviews_type, optional: true
  
  has_many :comments, as: :commentable

  validates :elongation, presence: true

  private

    def calculate_elongation
      #self.cables_reviews_type = CablesReviewsType.find(6)

      if LimitsElongation.where("initial_length <= ? AND final_length >= ?", self.cable.length, self.cable.length).exists?
        limit = LimitsElongation.where("initial_length <= ? AND final_length >= ?", self.cable.length, self.cable.length).first

        if self.cable.predicted_elongation != 0
          self.deviation = ((self.elongation - self.cable.predicted_elongation) / self.cable.predicted_elongation * 100).round(2)
        else
          self.deviation = 0
        end

        self.elongation_meter = (self.elongation / self.cable.length).round(2)

        if self.elongation_meter == limit.inferior_limit
            #mensagem = Traducao("DENTRO DOS PADRÕES MÍNIMOS !!")
            self.cables_reviews_type_id = 1
            self.status = 1
        elsif self.elongation_meter < limit.inferior_limit
            #mensagem = Traducao("ALONGAMENTO MENOR QUE O MÌNIMO !- REQUER ATENÇÃO !!")
            self.cables_reviews_type_id = 2
            self.status = 2
        elsif self.elongation_meter > limit.inferior_limit && self.elongation_meter < limit.upper_limit
            #mensagem = Traducao("DENTRO DOS PADRÕES MÉDIOS !!")
            self.cables_reviews_type_id = 3
            self.status = 1
        elsif self.elongation_meter == limit.upper_limit
            #mensagem = Traducao("DENTRO DOS PADRÕES MÁXIMOS !!")
            self.cables_reviews_type_id = 4
            self.status = 1
        elsif self.elongation_meter > limit.upper_limit
            #mensagem = Traducao("ALONGAMENTO MAIOR QUE O PADRÃO !! - REQUER ATENÇÃO !!")
            self.cables_reviews_type_id = 5
            self.status = 2
        end

      else
        if self.cable.predicted_elongation != 0
          self.deviation = ((self.elongation - self.cable.predicted_elongation) / self.cable.predicted_elongation * 100).round(2)
        else
          self.deviation = 0
        end

        self.elongation_meter = (self.elongation / self.cable.length).round(2)
        self.cables_reviews_type_id = 6
        self.status = 0
      end
    end
end
