// test/app.test.js
const request = require('supertest');
const app = require('../app');

describe('GET /', () => {
  it('should return "Hello, world!"', async () => {
    const response = await request(app).get('/');
    expect(response.text).toBe('Hello, world!');
    expect(response.status).toBe(200);
  });
});
