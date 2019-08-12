class Stack(object):
    def __init__(self):
        self.stack = []

    def push(self, value): 
        self.stack.append(value)

    def pop(self):
        if self.is_empty():
            return None
        old=self.stack[-1]
        self.stack.pop()
        return old

    def is_empty(self):
        return self.size()==0

    def top(self): 
        return self.stack[-1]

    def size(self):
        return len(self.stack)


class Queue:
    def __init__(self):
        self.items = []

    def enqueue(self, item):
        self.items.append(item)

    def dequeue(self):
        try:
            return self.items.pop(0)
        except :
            return None

    def empty(self):
        return self.size() == 0

    def size(self):
        return len(self.items)