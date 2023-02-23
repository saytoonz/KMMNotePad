package com.saytoonz.kmmnotepad.di

import com.saytoonz.kmmnotepad.data.local.DatabaseDriverFactory
import com.saytoonz.kmmnotepad.data.note.SqlDelightNoteDataSource
import com.saytoonz.kmmnotepad.database.NoteDatabase
import com.saytoonz.kmmnotepad.domain.note.NoteDataSource

class DatabaseModule {

    private val factory by lazy { DatabaseDriverFactory() }
    val noteDataSource: NoteDataSource by lazy {
        SqlDelightNoteDataSource(NoteDatabase(factory.createDriver()))
    }
}