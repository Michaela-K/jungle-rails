describe('visiting the home page test', () => {
  beforeEach(() => {
    cy.visit('http://0.0.0.0:3000/products')
  })

  it('displays the home page', () => {
    cy.get('.products').should('be.visible')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

});

// bin/rails cypress:run cypress/integration/home.spec.js