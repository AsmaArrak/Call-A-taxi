package com.assignment.cabservice.controller;

import com.assignment.cabservice.exception.InvalidSeatingCapacityException;
import com.assignment.cabservice.model.Car;
import com.assignment.cabservice.model.Driver;
import com.assignment.cabservice.repository.CarRepository;
import com.assignment.cabservice.repository.DriverRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Controller
public class CarController {

    @Autowired
    private CarRepository carRepository;
    @Autowired
    private DriverRepository driverRepository;

    @RequestMapping("list-cars")
    public String listAllCars(ModelMap modelMap) {
        List<Car> cars=carRepository.findAll();
        modelMap.put("cars",cars);
        return "listCars";
    }

    @RequestMapping("list-available-cars")
    public String listAllAvailableCarsForBooking(@RequestParam int seatingCapacity,ModelMap modelMap) {
        List<Car> cars=carRepository.findBySeatingCapacityAndAvailableForBookingTrue(seatingCapacity);
        modelMap.put("cars",cars);
        return "listCarsAvailableForBooking";
    }

    @RequestMapping(value="add-car",method= RequestMethod.GET)
    public String showNewCarPage(Car car) {
        return "car";
    }




   @RequestMapping(value = "add-car", method = RequestMethod.POST)
public String addNewCar(@ModelAttribute Car car) throws Exception {
    int capacity = car.getSeatingCapacity();
    if (capacity != 3 && capacity != 4 && capacity != 7) {
        throw new InvalidSeatingCapacityException("Allowed capacities are: {3,4,7}");
    }
    
    car.setAvailableForBooking(true);
    carRepository.save(car);
    return "redirect:list-cars";
}

    @RequestMapping(value="delete-car")
    public String deleteCar(@RequestParam int id) {
        carRepository.deleteById(id);
        return "redirect:list-cars";
    }



    @GetMapping(value="assign-car/carId/{carId}/driverId/{driverId}")
    public String assignDriverToCar(@PathVariable int carId,@PathVariable int driverId) throws Exception {
        Driver driver=driverRepository.findById(driverId).orElseThrow(() ->
                new Exception("Driver not found with driverID - " + driverId));
        int previousAssignedCarId=driver.getAssignedCarId();
        driver.setAssignedCarId(carId);
        driver.setUsedCarIds(driver.getUsedCarIds()+","+carId);
        Car previousAssignedCar=carRepository.findById(previousAssignedCarId).orElseThrow(() ->
                new Exception("Car not found with carID - " + previousAssignedCarId));;
        previousAssignedCar.setDriverId(null);
        Car car=carRepository.findById(carId).orElseThrow(() ->
                new Exception("Car not found with carID - " + carId));;
        car.setDriverId(driverId);
        carRepository.save(previousAssignedCar);
        carRepository.save(car);
        driverRepository.save(driver);
        return "redirect:/list-cars";
    }

 
}
