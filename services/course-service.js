import { create, getAll, getById, remove } from "../utils/db.js";

export default class CourseService {
    async index(req, res) {
        try {
            const data = await getAll('kelas')
            res.json(data)
        } catch (error) {
            res.status(500).json({ error: error.message })
        }
    }

    async show(req, res) {
        try {
            const { id } = req.params
            const data = await getById('kelas', id)
            res.json(data)
        } catch (error) {
            res.status(500).json({ error: error.message })
        }
    }
    
    async insert(req, res) {
        try {
            const body = req.body
            const data = await create('kelas', body)
            res.json(data)
        } catch (error) {
            res.status(500).json({ error: error.message })
        }
    }
    
    async update(req, res) {
        try {
            const { id } = req.params
            const body = req.body
            const data = await edit('kelas', body, id)
            res.json(data)
        } catch (error) {
            res.status(500).json({ error: error.message })
        }
    }

    async drop(req, res) {
        try {
            const { id } = req.params
            const data = await remove('kelas', id)
            res.json(data)
        } catch (error) {
            res.status(500).json({ error: error.message })
        }
    }

    
}