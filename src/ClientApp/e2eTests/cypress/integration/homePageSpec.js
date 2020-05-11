// https://docs.cypress.io/guides/getting-started/writing-your-first-test.html#Add-a-test-file
describe('aspnet-react-container home page', () => {
    it('should be accessible', () => {
      cy.visit('http://aspnet-react-cypress')
      cy.get('#root').should('be.visible')
    })    
  })