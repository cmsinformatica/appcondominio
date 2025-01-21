// App.js
import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';

// Components
function Navbar() {
  return (
    <nav className="bg-gray-800 p-4">
      <div className="container mx-auto flex justify-between items-center">
        <Link to="/" className="text-white text-xl font-bold">Condo Manager</Link>
        <div className="space-x-4">
          <Link to="/apartments" className="text-white hover:text-gray-300">Apartments</Link>
          <Link to="/expenses" className="text-white hover:text-gray-300">Expenses</Link>
          <Link to="/payments" className="text-white hover:text-gray-300">Payments</Link>
          <Link to="/reports" className="text-white hover:text-gray-300">Reports</Link>
        </div>
      </div>
    </nav>
  );
}

// Dashboard Component
function Dashboard() {
  const [summary, setSummary] = useState({
    totalExpenses: 0,
    totalPayments: 0,
    pendingPayments: 0,
    balance: 0
  });

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Dashboard</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <div className="bg-white p-4 rounded-lg shadow">
          <h2 className="text-gray-500">Total Expenses</h2>
          <p className="text-2xl font-bold">${summary.totalExpenses}</p>
        </div>
        <div className="bg-white p-4 rounded-lg shadow">
          <h2 className="text-gray-500">Total Payments</h2>
          <p className="text-2xl font-bold">${summary.totalPayments}</p>
        </div>
        <div className="bg-white p-4 rounded-lg shadow">
          <h2 className="text-gray-500">Pending Payments</h2>
          <p className="text-2xl font-bold">${summary.pendingPayments}</p>
        </div>
        <div className="bg-white p-4 rounded-lg shadow">
          <h2 className="text-gray-500">Balance</h2>
          <p className="text-2xl font-bold">${summary.balance}</p>
        </div>
      </div>
    </div>
  );
}

// Apartments Component
function Apartments() {
  const [apartments, setApartments] = useState([]);
  const [newApartment, setNewApartment] = useState({
    number: '',
    owner: '',
    contact: '',
    size: ''
  });

  const addApartment = (e) => {
    e.preventDefault();
    setApartments([...apartments, { ...newApartment, id: Date.now() }]);
    setNewApartment({ number: '', owner: '', contact: '', size: '' });
  };

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Apartments</h1>
      
      <form onSubmit={addApartment} className="bg-white p-4 rounded-lg shadow mb-6">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          <input
            type="text"
            placeholder="Apartment Number"
            value={newApartment.number}
            onChange={(e) => setNewApartment({ ...newApartment, number: e.target.value })}
            className="border p-2 rounded"
          />
          <input
            type="text"
            placeholder="Owner Name"
            value={newApartment.owner}
            onChange={(e) => setNewApartment({ ...newApartment, owner: e.target.value })}
            className="border p-2 rounded"
          />
          <input
            type="text"
            placeholder="Contact"
            value={newApartment.contact}
            onChange={(e) => setNewApartment({ ...newApartment, contact: e.target.value })}
            className="border p-2 rounded"
          />
          <button type="submit" className="bg-blue-500 text-white p-2 rounded hover:bg-blue-600">
            Add Apartment
          </button>
        </div>
      </form>

      <div className="bg-white rounded-lg shadow overflow-hidden">
        <table className="min-w-full">
          <thead className="bg-gray-50">
            <tr>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Number</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Owner</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Contact</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-200">
            {apartments.map(apartment => (
              <tr key={apartment.id}>
                <td className="px-6 py-4">{apartment.number}</td>
                <td className="px-6 py-4">{apartment.owner}</td>
                <td className="px-6 py-4">{apartment.contact}</td>
                <td className="px-6 py-4">
                  <button className="text-red-500 hover:text-red-700">Delete</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

// Expenses Component
function Expenses() {
  const [expenses, setExpenses] = useState([]);
  const [newExpense, setNewExpense] = useState({
    description: '',
    amount: '',
    type: 'fixed',
    date: ''
  });

  const addExpense = (e) => {
    e.preventDefault();
    setExpenses([...expenses, { ...newExpense, id: Date.now() }]);
    setNewExpense({ description: '', amount: '', type: 'fixed', date: '' });
  };

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Expenses</h1>
      
      <form onSubmit={addExpense} className="bg-white p-4 rounded-lg shadow mb-6">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          <input
            type="text"
            placeholder="Description"
            value={newExpense.description}
            onChange={(e) => setNewExpense({ ...newExpense, description: e.target.value })}
            className="border p-2 rounded"
          />
          <input
            type="number"
            placeholder="Amount"
            value={newExpense.amount}
            onChange={(e) => setNewExpense({ ...newExpense, amount: e.target.value })}
            className="border p-2 rounded"
          />
          <select
            value={newExpense.type}
            onChange={(e) => setNewExpense({ ...newExpense, type: e.target.value })}
            className="border p-2 rounded"
          >
            <option value="fixed">Fixed</option>
            <option value="variable">Variable</option>
          </select>
          <button type="submit" className="bg-blue-500 text-white p-2 rounded hover:bg-blue-600">
            Add Expense
          </button>
        </div>
      </form>

      <div className="bg-white rounded-lg shadow overflow-hidden">
        <table className="min-w-full">
          <thead className="bg-gray-50">
            <tr>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Description</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Amount</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Type</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-200">
            {expenses.map(expense => (
              <tr key={expense.id}>
                <td className="px-6 py-4">{expense.description}</td>
                <td className="px-6 py-4">${expense.amount}</td>
                <td className="px-6 py-4">{expense.type}</td>
                <td className="px-6 py-4">{expense.date}</td>
                <td className="px-6 py-4">
                  <button className="text-red-500 hover:text-red-700">Delete</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

// Payments Component
function Payments() {
  const [payments, setPayments] = useState([]);
  const [newPayment, setNewPayment] = useState({
    apartment: '',
    amount: '',
    date: '',
    status: 'pending'
  });

  const addPayment = (e) => {
    e.preventDefault();
    setPayments([...payments, { ...newPayment, id: Date.now() }]);
    setNewPayment({ apartment: '', amount: '', date: '', status: 'pending' });
  };

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Payments</h1>
      
      <form onSubmit={addPayment} className="bg-white p-4 rounded-lg shadow mb-6">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          <input
            type="text"
            placeholder="Apartment"
            value={newPayment.apartment}
            onChange={(e) => setNewPayment({ ...newPayment, apartment: e.target.value })}
            className="border p-2 rounded"
          />
          <input
            type="number"
            placeholder="Amount"
            value={newPayment.amount}
            onChange={(e) => setNewPayment({ ...newPayment, amount: e.target.value })}
            className="border p-2 rounded"
          />
          <input
            type="date"
            value={newPayment.date}
            onChange={(e) => setNewPayment({ ...newPayment, date: e.target.value })}
            className="border p-2 rounded"
          />
          <button type="submit" className="bg-blue-500 text-white p-2 rounded hover:bg-blue-600">
            Record Payment
          </button>
        </div>
      </form>

      <div className="bg-white rounded-lg shadow overflow-hidden">
        <table className="min-w-full">
          <thead className="bg-gray-50">
            <tr>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Apartment</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Amount</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Date</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Status</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-200">
            {payments.map(payment => (
              <tr key={payment.id}>
                <td className="px-6 py-4">{payment.apartment}</td>
                <td className="px-6 py-4">${payment.amount}</td>
                <td className="px-6 py-4">{payment.date}</td>
                <td className="px-6 py-4">{payment.status}</td>
                <td className="px-6 py-4">
                  <button className="text-red-500 hover:text-red-700">Delete</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

// Reports Component
function Reports() {
  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Reports</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div className="bg-white p-4 rounded-lg shadow">
          <h2 className="text-xl font-bold mb-4">Monthly Summary</h2>
          {/* Add monthly summary chart here */}
        </div>
        <div className="bg-white p-4 rounded-lg shadow">
          <h2 className="text-xl font-bold mb-4">Payment Status</h2>
          {/* Add payment status chart here */}
        </div>
      </div>
    </div>
  );
}

// Main App Component
function App() {
  return (
    <Router>
      <div className="min-h-screen bg-gray-100">
        <Navbar />
        <Routes>
          <Route path="/" element={<Dashboard />} />
          <Route path="/apartments" element={<Apartments />} />
          <Route path="/expenses" element={<Expenses />} />
          <Route path="/payments" element={<Payments />} />
          <Route path="/reports" element={<Reports />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
