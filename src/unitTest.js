exports.default = {
    plustwo: (x, y) => {
      return parseInt(x) + parseInt(y) + 2;
    },
    plus: (x, y) => {
      return parseInt(x) + parseInt(y);
    },
    minus: (x, y) => {
      return parseInt(x) - parseInt(y);
    },
    multiply: (x, y) => {
      return parseInt(x) * parseInt(y);
    },
    devide: (x, y) => {
      if (y == 0) return 0;
      else return parseInt(x) / parseInt(y);
    }
  };
  