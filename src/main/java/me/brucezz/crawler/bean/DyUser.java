package me.brucezz.crawler.bean;

public class DyUser {
    public int uid;
    public String nickname;//昵称
    public String avatar;//头像
    public int gender;//性别
    public int is_follow;
    public String summary;
    public int group_id;
    public String group_name;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getIs_follow() {
        return is_follow;
    }

    public void setIs_follow(int is_follow) {
        this.is_follow = is_follow;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public int getGroup_id() {
        return group_id;
    }

    public void setGroup_id(int group_id) {
        this.group_id = group_id;
    }

    public String getGroup_name() {
        return group_name;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }

    public String getP_group_name() {
        return p_group_name;
    }

    public void setP_group_name(String p_group_name) {
        this.p_group_name = p_group_name;
    }

    public int getP_group_id() {
        return p_group_id;
    }

    public void setP_group_id(int p_group_id) {
        this.p_group_id = p_group_id;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public long getFu_num() {
        return fu_num;
    }

    public void setFu_num(long fu_num) {
        this.fu_num = fu_num;
    }

    public long getFg_num() {
        return fg_num;
    }

    public void setFg_num(long fg_num) {
        this.fg_num = fg_num;
    }

    public long getFans_num() {
        return fans_num;
    }

    public void setFans_num(long fans_num) {
        this.fans_num = fans_num;
    }

    public long getFeed_num() {
        return feed_num;
    }

    public void setFeed_num(long feed_num) {
        this.feed_num = feed_num;
    }

    public boolean isIs_anchor() {
        return is_anchor;
    }

    public void setIs_anchor(boolean is_anchor) {
        this.is_anchor = is_anchor;
    }

    public boolean isSelf() {
        return self;
    }

    public void setSelf(boolean self) {
        this.self = self;
    }

    public int getGroup_level() {
        return group_level;
    }

    public void setGroup_level(int group_level) {
        this.group_level = group_level;
    }

    public String getGroup_title() {
        return group_title;
    }

    public void setGroup_title(String group_title) {
        this.group_title = group_title;
    }

    public String p_group_name;
    public int p_group_id;
    public int level;
    public long fu_num;
    public long fg_num;
    public long fans_num;
    public long feed_num;
    public boolean is_anchor;
    public boolean self;
    public int group_level;
    public String group_title;

    @Override
    public String toString() {
        return  this.uid+"`"+this.nickname+"`"+this.avatar+"`"+this.gender+"`"+this.is_follow+"`"+
                this.summary+"`"+this.group_id+"`"+this.group_name+"`"+this.p_group_name+"`"+this.p_group_id+"`"+
                this.level+"`"+this.fu_num+"`"+this.fg_num+"`"+this.fans_num+"`"+this.feed_num+"`"+this.is_anchor+"`"+
                this.self+"`"+this.group_level+"`"+this.group_title;
    }
}
