SELECT mx.elf_1_id, mn.elf_2_id, mx.primary_skill AS shared_skill
FROM
(
  -- Find the elf with the maximum experience per skill, tie broken by smallest elf_id
  SELECT q.primary_skill, MIN(q.elf_id) AS elf_1_id
  FROM (
    SELECT we.primary_skill, we.elf_id
    FROM workshop_elves we
    JOIN (
      SELECT primary_skill, MAX(years_experience) AS max_exp
      FROM workshop_elves
      GROUP BY primary_skill
    ) mxp ON we.primary_skill = mxp.primary_skill
       AND we.years_experience = mxp.max_exp
  ) q
  GROUP BY q.primary_skill
) mx
JOIN
(
  -- Find the elf with the minimum experience per skill, tie broken by smallest elf_id
  SELECT q.primary_skill, MIN(q.elf_id) AS elf_2_id
  FROM (
    SELECT we.primary_skill, we.elf_id
    FROM workshop_elves we
    JOIN (
      SELECT primary_skill, MIN(years_experience) AS min_exp
      FROM workshop_elves
      GROUP BY primary_skill
    ) mnp ON we.primary_skill = mnp.primary_skill
       AND we.years_experience = mnp.min_exp
  ) q
  GROUP BY q.primary_skill
) mn USING (primary_skill)
WHERE mx.elf_1_id <> mn.elf_2_id
ORDER BY shared_skill, elf_1_id, elf_2_id;
