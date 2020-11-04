module Imageable extend ActiveSupport::Concern

    def self.sizes
    { 
        small: { resize: "15x15" },
        thumb: { resize: "35x35" },
        normal: { resize: "50x50" },
        big: { resize: "100x100" },
    }
    end

end
