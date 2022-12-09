SELECT f.model, f.brand, f.company, c.acquisition,c.license_plate, c.color, c.nkilometers,p.insuranceCompany,c.npolicy 
FROM practica_dll.fleet f, practica_dll.poliza p, practica_dll.car c
WHERE  f.idfleet = c.idfleet and p.idpoliza = c.idpoliza 
  