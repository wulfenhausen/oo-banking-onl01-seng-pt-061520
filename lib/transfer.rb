class Transfer
  attr_accessor :balance, :amount, :deposit
  attr_accessor :sender, :receiver, :status

  def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @amount = amount
   @status = "pending"
 end
    
  def valid? 
    sender.valid? && receiver.valid?
  end
  
   def execute_transaction
    if valid? && sender.balance > @amount && self.status == "pending"
      onetransfer
      
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end
  
   def onetransfer
   @sender.balance -= @amount
   @receiver.balance += @amount
    self.status = "complete"
  end

  def reverse_transfer
    if self.status == "complete"
    sender.balance += @amount
    receiver.balance -= @amount
    self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
