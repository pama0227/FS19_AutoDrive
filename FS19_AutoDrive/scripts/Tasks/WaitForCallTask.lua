WaitForCallTask = ADInheritsFrom(AbstractTask)

function WaitForCallTask:new(vehicle)
    local o = WaitForCallTask:create()
    o.vehicle = vehicle
    o.propagate = propagate
    return o
end

function WaitForCallTask:setUp()
    print("WaitForCallTask:setUp()")
    self.vehicle.ad.specialDrivingModule:stopVehicle()
end

function WaitForCallTask:update(dt)
    self.vehicle.ad.specialDrivingModule:update(dt)
end

function WaitForCallTask:abort()
end

function WaitForCallTask:finished()
    self.vehicle.ad.taskModule:setCurrentTaskFinished(self.propagate)
end
