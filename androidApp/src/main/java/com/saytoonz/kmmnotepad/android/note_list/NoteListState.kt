package com.saytoonz.kmmnotepad.android.note_list

import com.saytoonz.kmmnotepad.domain.note.Note

data class NoteListState(
    val notes: List<Note> = emptyList(),
    val searchText: String = "",
    val isSearchActive: Boolean = false
)
