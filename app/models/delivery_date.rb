class DeliveryDate < ActiveHash::Base
  self.data = [
    { id: nil, name: '---', date: '---' },
    { id: 2, name: '1~2日で発送', date: '1~2日で発送' },
    { id: 3, name: '2~3日で発送', date: '2~3日で発送' },
    { id: 4, name: '4~7日で発送', date: '4~7日で発送' }
  ]
end



