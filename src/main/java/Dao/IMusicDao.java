package Dao;

import Bean.Music;

import java.util.List;

public interface IMusicDao {
    public Music findMusicById (int id);
    public void insertMusic(Music music);
    public Music findMusicByName(String name);
    public Music findMusicBySingerName(String singerName);
    public List<Music> findAllMusic();
}
