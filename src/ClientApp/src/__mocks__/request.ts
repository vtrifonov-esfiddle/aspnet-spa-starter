import { IUser } from '../user';

const users = {
    4: {name: 'Mark'} as IUser,
    5: {name: 'Paul'} as IUser,
  };
  
  export default function request(url) {
    return new Promise((resolve, reject) => {
      const userID = parseInt(url.substr('/users/'.length), 10);
       process.nextTick(() =>
        (users[userID]
          ? resolve(users[userID])
          : reject({
              error: 'User with ' + userID + ' not found.',
            })
      ));
    });
  }