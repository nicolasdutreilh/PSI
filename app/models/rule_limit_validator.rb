class RuleLimitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, values)
    total = values.inject(0) do |accumulator, target_payment_rule|
      accumulator + target_payment_rule.payment_rule.percent
    end

    if total > 100.0
      record.errors[attribute] << (options[:message] || 'contains too many payment rules')
    elsif total < 100.0
      record.errors[attribute] << (options[:message] || 'contains not enough payment rules')
    end
  end
end