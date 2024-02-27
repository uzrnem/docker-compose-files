# penpot start with docker
penpot $ docker-compose -f docker-penpot.yml up -d

# in docker
backend $ ./manage.py create-profile -n "Penpot" -e "myemail@gmail.com"

PSQL $ update profile set props='{"~:nudge": {"~:big": 10, "~:small": 1}, "~:newsletter-news": false, "~:viewed-tutorial?": false, "~:onboarding-viewed": true, "~:newsletter-updates": false, "~:viewed-walkthrough?": false, "~:onboarding-questions": {"~:role": "developer", "~:planning": "start-to-work-on-my-project", "~:team-size": "personal-project", "~:experience-design-tool": "never-used-a-tool", "~:experience-branding-illustrations-marketing-pieces": "none", "~:experience-interface-design-visual-assets-design-systems": "none", "~:experience-interface-wireframes-user-journeys-flows-navigation-trees": "a-lot"}, "~:release-notes-viewed": "1.19", "~:onboarding-questions-answered": true}' where email = 'uzrnem@gmail.com';
