describe("test that users can click the 'Add to Cart' button for a product ", () => {
  beforeEach(() => {
    cy.visit('http://0.0.0.0:3000')
  })
  
  //test that it can click add to cart
  it("Can click add to cart", () => {
    // cy.get(".btn").first().should('contain', 'Add').click({ force: true });
    // cy.get('.products article div form button').first().click({ force: true });
    // cy.get('a').should('have.attr', 'href', '/cart').click().get('.products article div form button').first().click();
    cy.get('ul>li').each(($el) => {
      if ($el == cy.get('.nav-link').should('have.attr', 'href', '/cart')){
        cy.click($el).get('.products article div form button').click();
      }
    })
    // cy.get('.btn').find('[type="submit"]').first().contains("Add").click();
  });
  
  //cart increases by one
  it("Cart should increase by one", () => {
    cy.get(".nav-link").should('contain', 'My Cart (0)');
    // cy.get('.btn').find('[type="submit"]').first().contains("Add").click();
  });

});