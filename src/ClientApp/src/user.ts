import request from './request';
import { string } from 'prop-types';

export interface IUser {
  name: string;
}

export function getUserName(userID) {
  return request('/users/' + userID).then((user: IUser) => user.name);
}