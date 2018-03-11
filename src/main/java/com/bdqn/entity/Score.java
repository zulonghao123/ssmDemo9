package com.bdqn.entity;

/**
 * Created by 祖龙浩 on 2018/3/7.
 */
public class Score {
    private Integer id;
    private Double score;
    private Student student;
    private Course course;

    public Score() {
    }

    public Score(Integer id, Double score, Student student, Course course) {
        this.id = id;
        this.score = score;
        this.student = student;
        this.course = course;
    }

    @Override
    public String toString() {
        return "Score{" +
                "id=" + id +
                ", score=" + score +
                ", student=" + student +
                ", course=" + course +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}
