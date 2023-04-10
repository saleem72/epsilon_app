package com.example.epsilon_app

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.runBlocking
import java.sql.ResultSet
import java.sql.ResultSetMetaData
import java.sql.Statement

class SqlExecuter {
    /*
    fun <P, R> CoroutineScope.executeAsyncTask(
        onPreExecute: () -> Unit,
        doInBackground: suspend (suspend (P) -> Unit) -> R,
        onPostExecute: (R) -> Unit,
        onProgressUpdate: (P) -> Unit
    ) = launch {
        onPreExecute()

        val result = withContext(Dispatchers.IO) {
            doInBackground {


                withContext(Dispatchers.Main) { onProgressUpdate(it) }
                var connection = ConnectionManager().connectionClass(
                    host,port,database,username,password
                )

                if (connection != null) {
                    val statement: Statement = connection.createStatement()
                    val resultSet: ResultSet = statement.executeQuery(query)
                    val records =  kotlin.collections.ArrayList<HashMap<String, String>>()
                    if (resultSet != null) {
                        val md: ResultSetMetaData = resultSet.metaData
                        val columns: Int = md.columnCount

                        while (resultSet.next()) {
                            val row = HashMap<String, String>(columns)
                            for (i in 1..columns) {
                                row[md.getColumnName(i)] = resultSet.getString(i)
                                if (resultSet.wasNull()) {
                                    row[md.getColumnName(i)] = ""
                                }
                            }
                            records.add(row)
                        }

                    }
                    return@doInBackground records
                }


            }
        }
        onPostExecute(result)
    }
    */

    fun execute(
        host: String,
        port: String,
        database: String,
        username: String,
        password: String,
        query: String
    ) :ArrayList<HashMap<String, String>> {

        var records: ArrayList<HashMap<String, String>>
        runBlocking(Dispatchers.IO) {
            val gettingRecords = async { executeStatement(host, port, database, username, password, query) }
            val someThing = runBlocking<ArrayList<HashMap<String, String>>>{
                records = gettingRecords.await()
                return@runBlocking records
            }

            records = someThing
        }
        return records

    }

    fun checkConnection(
        host: String,
        port: String,
        database: String,
        username: String,
        password: String
    ) :Boolean {
        var result: Boolean
        runBlocking(Dispatchers.IO) {
            val gettingRecords = async { executeChecking(host, port, database, username, password) }
            val someThing = runBlocking<Boolean>{
                result = gettingRecords.await()
                return@runBlocking result
            }
            result = someThing
        }


        return result

    }

    private fun executeChecking(
        host: String,
        port: String,
        database: String,
        username: String,
        password: String
    ) : Boolean {
        var  result = false
        val connection = ConnectionManager().connectionClass(
            host,port,database,username,password
        )
        if (connection != null) {
            result = true;
        }
        connection?.close();

        return result;
    }

    private fun executeStatement (
        host: String,
        port: String,
        database: String,
        username: String,
        password: String,
        query: String
    ) : ArrayList<HashMap<String, String>> {
        val connection = ConnectionManager().connectionClass(
            host,port,database,username,password
        )


        val records =  ArrayList<HashMap<String, String>>()

        if (connection != null) {
            val statement: Statement = connection.createStatement()
            val resultSet: ResultSet = statement.executeQuery(query)
            if (resultSet != null) {
                val md: ResultSetMetaData = resultSet.metaData
                val columns: Int = md.columnCount
                while (resultSet.next()) {
                    val row = HashMap<String, String>(columns)
                    for (i in 1..columns) {
                        if (resultSet.getString(i) != null) {
                            row[md.getColumnName(i)] = resultSet.getString(i)
                        } else {
                            row[md.getColumnName(i)] = ""
                        }

//                        row[md.getColumnName(i)] = (resultSet.getString(i) ?: "")
//                        if (resultSet.wasNull()) {
//                            row[md.getColumnName(i)] = ""
//                        }

                    }

                    records.add(row)
                }

            }

        }
        connection?.close()
        return records
    }
}