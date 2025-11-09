import { Hono } from "hono";

const app = new Hono();
const port = process.env.PORT || 8080;

app.get('/', (c) => c.text('Hello Hono!'));

app.listen(port, () => console.log(`Server running on port ${port}`));

