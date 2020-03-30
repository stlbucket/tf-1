import unittest
from fn import handler

class TestLambda(unittest.TestCase):

  def test_handler(self):
    self.assertEqual(handler('foo', ''), 'foo')

if __name__ == '__main__':
    unittest.main()
