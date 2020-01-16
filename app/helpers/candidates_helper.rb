module CandidatesHelper
    def sort_recruiters(recruiters,candidate)
        @sorted_recruiters = []
        @recruiters.each do |recruiter|
            matching = recruiter.skills & candidate.skills
            score = 0
            matching.each do |skill|
                if skill.skill_type == 0
                    score += 5
                elsif skill.skill_type == 1
                    score += 2
                end
            end
            @sorted_recruiters.push({score:score,recruiter:recruiter})
        end
        @sorted_recruiters.sort_by! { |r| -r[:score] }
    end
    
end
