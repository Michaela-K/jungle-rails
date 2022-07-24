describe("test that users can click the 'Add to Cart' button for a product on the home page", () => {
  beforeEach(() => {
    cy.visit('http://0.0.0.0:3000')
  })
  
  //test that it can click add to cart
  it("Can click add to cart and the cart should increase by one", () => {
    cy.get('.container .products article div form').find('.btn').first().debug().click({force: true});
    cy.get(".end-0 .nav-link").should('contain', 'My Cart (1)');

  });
});