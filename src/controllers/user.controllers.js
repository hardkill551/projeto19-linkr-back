import { getUserDB, getUserRepository, insertUser } from "../repositories/user.repository.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import { insertSession } from "../repositories/sessions.repository.js";

export async function getUser(req, res){
    const {letters} = req.params;
    try{
        const users = await getUserDB(letters);
        res.send(users.rows)
    }catch (err) {
        res.status(500).send(err.message);
    }
}


export async function signUp(req, res) {
    const { name, email, password, picture } = req.body;
  
    try {
      const result = await getUserRepository(email);
      if (result.rowCount !== 0) return res.status(409).send("Email já cadastrado!");
      const criptPass = bcrypt.hashSync(password, 10);
      await insertUser(name, email, criptPass, picture);
      res.sendStatus(201);
    } catch (err) {
      res.status(500).send(err.message);
    }
  }
  

  export async function signIn(req, res) {
    const { email, password } = req.body;
    
    try {
      const user = await getUserRepository(email);
      if(user.rowCount !== 1 ) return res.status(401).send("Informações incorretas")
      const valid = bcrypt.compareSync(password, user.rows[0].password);
      if (!valid) return res.status(401).send("Informações incorretas");
      const secretKey = process.env.SECRET_KEY;
      const token = jwt.sign(user.rows[0].id, secretKey);
      await insertSession(token, user.rows[0].id)
      res.status(200).send({ token: token });
    } catch (err) {
      res.status(500).send(err);
    }
  }

  export async function confirmSession(req, res) {
      res.status(200).send("usuario já logado!");
  }