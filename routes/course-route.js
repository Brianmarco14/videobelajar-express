import express from "express"
import CourseService from "../services/course-service.js"

const courseRoute = express.Router()
const service = new CourseService()

courseRoute.get('/', (req, res) => service.index(req, res))
courseRoute.post('/', (req, res) => service.insert(req, res))
courseRoute.get('/:id', (req, res) => service.show(req, res))
courseRoute.patch('/:id', (req, res) => service.update(req, res))
courseRoute.delete('/:id', (req, res) => service.drop(req, res))


export default courseRoute