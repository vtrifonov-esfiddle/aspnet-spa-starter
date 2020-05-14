// https://docs.cypress.io/guides/getting-started/writing-your-first-test.html#Add-a-test-file
describe('aspnet-react-container home page', () => {
    it('should be accessible', () => {
      cy.visit('/')
      cy.get('#root').should('be.visible')
    })    
  })