SELECT
    st.student_id,
    st.student_name,
    su.subject_name,
    COUNT(ex.subject_name) AS attended_exams
FROM Students st
CROSS JOIN Subjects su
LEFT JOIN Examinations ex ON
    ex.student_id = st.student_id AND
    ex.subject_name = su.subject_name
GROUP BY st.student_id, st.student_name, su.subject_name
