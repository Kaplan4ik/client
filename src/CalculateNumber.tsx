import axios from "axios";
import { useState } from 'react';

export const CalculateNumber = () => {
  const [number, setNumber] = useState(0);
  const [result, setResult] = useState(0);

  const onSubmit = async (event: { preventDefault: () => void; }) => {
    event.preventDefault();

    const result = await axios.post("http://localhost:4000/calculate", {
      number,
    });


    setResult(result.data.result);
  };

  return (
    <div>
      <form onSubmit={onSubmit}>
        <div className="form-group">
          <label>Enter your number</label>
          <input
            value={number}
            onChange={(e) => setNumber(Number(e.target.value))}
            className="form-control"
          />
        </div>
        <button className="btn btn-primary">Submit</button>
      </form>
      <p>Result: {result}</p>
    </div>
  )
}
