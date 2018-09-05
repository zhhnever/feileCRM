package com.blacksheep.mtm.pojo.manager;

import java.util.Date;

public class TbReserveCommentWithBLOBs extends TbReserveComment {
    private String comment;

    private String classContent;

    private String classQuestion;

    private String work;

    public TbReserveCommentWithBLOBs(Integer id, Integer reserveId, Integer commentStars, Date createStamp, Date updateStamp, String comment, String classContent, String classQuestion, String work) {
        super(id, reserveId, commentStars, createStamp, updateStamp);
        this.comment = comment;
        this.classContent = classContent;
        this.classQuestion = classQuestion;
        this.work = work;
    }

    public TbReserveCommentWithBLOBs() {
        super();
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public String getClassContent() {
        return classContent;
    }

    public void setClassContent(String classContent) {
        this.classContent = classContent == null ? null : classContent.trim();
    }

    public String getClassQuestion() {
        return classQuestion;
    }

    public void setClassQuestion(String classQuestion) {
        this.classQuestion = classQuestion == null ? null : classQuestion.trim();
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work == null ? null : work.trim();
    }
}