import mysql from "mysql2"
import dotenv from "dotenv"

dotenv.config()

const pool = mysql.createPool({
    host: process.env.DB_HOST || "localhost",
    user: process.env.DB_USER || "root",
    password: process.env.DB_PASSWORD || "",
    database: process.env.DB_NAME || "videobelajar"
}).promise()

export const getAll = async(table) => {
    const sql = `SELECT * FROM ${table}`
    const [results] = await pool.query(sql)
    return results
}

export const getById = async(table, id) => {
    const sql = `SELECT * FROM ${table} WHERE id = ?`
    const [results] = await pool.query(sql, [id])
    return results[0]
}

export const create = async(table, data) => {
    const sql = `INSERT INTO ${table} SET = ?`
    const [results] = await pool.query(sql, [data])
    return getById(results.insertId)
}

export const edit = async(table, data, id) => {
    const sql = `UPDATE ${table} SET = ? WHERE id = ?`
    const [results] = await pool.query(sql, [data, id])
    return getById(results.insertId)
}

export const remove = async(table, id) => {
    const sql = `DELETE FROM ${table} WHERE id = ?`
    const [results] = await pool.query(sql, [id])
    return getById(results.insertId)
    
}


