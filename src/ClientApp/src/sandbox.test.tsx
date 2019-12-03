import { render, unmountComponentAtNode } from "react-dom";
import React from "react";
import { act } from "react-dom/test-utils";

import { Sandbox } from "./sandbox";

let container = null;
beforeEach(() => {
  // setup a DOM element as a render target
  container = document.createElement("div");
  document.body.appendChild(container);
});

afterEach(() => {
  // cleanup on exiting
  unmountComponentAtNode(container);
  container.remove();
  container = null;
});

test('Sandbox compile no param', () => {
  act(() => {
      render(<Sandbox name="" />, container);
  });
  expect(container.textContent).toBe("Sandbox no props.name");
});

test('Sandbox compile with test param', () => {
    act(() => {
        render(<Sandbox name="Test" />, container);
    });
    expect(container.textContent).toBe("Sandbox Test");
});

test('Sandbox compile with test param 2', () => {
  act(() => {
      const inputParam = "js param"
      render(<Sandbox name={inputParam} />, container);
  });
  expect(container.textContent).toBe("Sandbox js param");
});