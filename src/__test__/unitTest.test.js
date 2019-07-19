const calculate = require("../unitTest").default;

describe("Test Calculator", function() {
  describe("functions plus two", function() {
    it("1 + 1 should be 4", function() {
      expect(calculate.plustwo(1, 1)).toBe(4);
    });
  });

  describe("functions plus", function() {
    it("1 + 1 should be 2", function() {
      expect(calculate.plus(1, 1)).toBe(2);
    });
  });

  describe("functions minus", function() {
    it("1 - 1 should be 0", function() {
      expect(calculate.minus(1, 1)).toBe(0);
    });
  });

  describe("functions multiply", function() {
    it("1 * 1 should be 1", function() {
      expect(calculate.multiply(1, 1)).toBe(1);
    });
  });

  describe("functions devide", function() {
    it("1 / 1 should be 1", function() {
      expect(calculate.devide(1, 1)).toBe(1);
    });
  });

  describe("functions devide by zero", function() {
    it("1 / 0 should be 0", function() {
      expect(calculate.devide(1, 0)).toBe(0);
    });
  });
});
