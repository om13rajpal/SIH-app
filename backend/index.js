const express = require("express");
const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");
const cors = require('cors');


const app = express();

app.use(cors());
app.use(express.json());

mongoose
  .connect("mongodb://localhost:27017/drdo")
  .then(() => {
    console.log("Connected to database");
  })
  .catch((err) => {
    console.log("Connection failed");
  });

const userSchema = new mongoose.Schema({
  email: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
});

const userModel = mongoose.model("user", userSchema);

function generateToken(tokenData, secretKey, expiresIn) {
  return jwt.sign(tokenData, secretKey, { expiresIn: expiresIn });
}

app.post("/register", async (req, res) => {
  const { email, password } = req.body;
  const user = new userModel({ email, password });

  const response = await user.save();

  const tokenData = {
    email: email,
  };

  const token = generateToken(tokenData, "lol", "1h");

  res.json({
    status: true,
    token: token,
  });
});

app.post("/login", async (req, res) => {
  const { email, password } = req.body;
  

  try {
    const user = await userModel.findOne({ email });

    if (!user) {
      return res.json({ status: false, message: "User not found" });
    }

    if (user.password === password) {
      const tokenData = { email: email };
      const token = generateToken(tokenData, "lol", "1h");
      return res.json({ status: true, token: token });
    } else {
      return res.json({ status: false, message: "Incorrect password" });
    }
  } catch (error) {
    console.error("Error during login:", error);
    return res
      .status(500)
      .json({ status: false, message: "Internal Server Error" });
  }
});

app.listen(3000);
