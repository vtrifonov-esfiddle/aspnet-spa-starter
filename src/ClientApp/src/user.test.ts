jest.mock('./request');

import * as user from './user';

it('works with promises for Paul', async () => {
  expect.assertions(1);
  const response = await user.getUserName(5);
  expect(response).toEqual('Paul');
});

it('works with promises for Mark', async () => {
  expect.assertions(1);
  const response = await user.getUserName(4);
  expect(response).toEqual('Mark');
});