class_name InventoryData extends Resource

@export var slots : Array[SlotData]

func add_item(item: ItemData, count : int = 1) -> bool:
	for s in slots:
		if s:
			if s.item_data == item:
				s.quantity += count
				return true
	
	for i in slots.size():
		if slots[i] == null:
			var new_slot = SlotData.new()
			new_slot.item_data = item
			new_slot.quantity = count
			slots[i] = new_slot
			return true
	
	print("inventory was full")
	return false
