import express from "express"
import courseRoute from "./routes/course-route.js"

const app = express()

app.use(express.json());
app.use('/course', courseRoute)

app.listen(8000, () => {
    console.log("serves is running in port 8000");
})