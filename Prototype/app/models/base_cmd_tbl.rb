class BASE_CMD_TBL < ExternalDbAccess
	self.table_name = "BASE_CMD_TBL"
	has_paper_trail class_name: 'Version'
    serialize :CONFIRMATION_TYPE, JSON    #to store as json, without --- serializer object text
	has_many :prereq_conf_expr_tbls, class_name: "PREREQ_CONF_EXPR_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID"
	has_many :cmd_part_tbls, class_name: "CMD_PART_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID", dependent: :destroy
	has_many :cpid_tbls, class_name: "CPID_TBL", foreign_key: "CMD_ID", primary_key: "CMD_ID"
	has_many :expressions, through: :prereq_conf_expr_tbls
    belongs_to :subsystem_tbl, class_name: "SUBSYSTEM_TBL", foreign_key: "SUBSYSTEM", primary_key: "SUBSYSTEM_ID", inverse_of: :base_cmd_tbls
	belongs_to :cmd_types_tbl, class_name: "CMD_TYPES_TBL", primary_key: "CMD_TYPE_ID", foreign_key: "CMD_TYPE"
	belongs_to :ui_types_tbl, class_name: "UI_TYPES_TBL", primary_key: "UI_TYPE_ID", foreign_key: "UI_TYPE", inverse_of: :base_cmd_tbls
	before_save :ConverterArray
    attr_accessor :valv

    #  def self.Conf_count  # self. is used when u have to call the method on te whole class example User.Conf_count
    #      Confirmer.count
    #  end

    def ConverterArray  # self. is not used when u have to call the method on the instance variable for example user = User.new, user.ConverterArray
        count = CONFIRMER_TBL.count
        index = Array.new(count, 0) #create array of size count and values equal to 0
        conf = self.CONFIRMATION_TYPE.map(&:to_i) #creates a new array from the object or array sent from the form parameters
        conf.each do |n|
            index[n-1] = 1
        end
        #index.shift()       #to remove the first element since it is always zero. Note: It not just removes first element, it cuts it out entirely decreasing the length of array
        index = index*"" #convert to binary values ['0','1'] => "01"
        self.CONFIRMATION_TYPE = index #since its a assign
    end

    # def DecoderArray
    #     count = CONFIRMER_TBL.count
    #     value = []
    #     conf = self.CONFIRMATION_TYPE.split("")
    #     i = 0
    #     conf.each_with_index do |n,index|
    #         if n=="1"
    #             value[i] = index+1
    #             i+=1
    #         end
    #     end
    #     @valv = CONFIRMER_TBL.where(:position => value).pluck(:name)
    # end

    def DecoderArray(confirmer)
        value = []
        conf = self.CONFIRMATION_TYPE.split("")
        i = 0
        conf.each_with_index do |n,index|
            if n=="1"
                value[i] = index+1
                i+=1
            end
        end
        value.map!(&:to_s)
        @valv = confirmer.values_at(*value)
    end

    def DecoderForEdit
        value = []
        conf = self.CONFIRMATION_TYPE.split("")
        i = 0
        conf.each_with_index do |n,index|
            if n=="1"
                value[i] = index+1
                i+=1
            end
        end
        self.CONFIRMATION_TYPE = value
    end
end