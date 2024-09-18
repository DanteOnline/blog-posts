ExUnit.start()
Code.require_file("support/io_behaviour.ex", __DIR__)
Mox.defmock(IOBehaviourMock, for: IOBehaviour)
