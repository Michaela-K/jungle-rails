describe('users can navigate from the home page to the product detail page by clicking on a product', () => {
  beforeEach(() => {
    cy.visit('http://0.0.0.0:3000')
  })

  it("Navigate to the products page", () => {
    cy.get('[alt="Eesrorn"]').click();
  });

});