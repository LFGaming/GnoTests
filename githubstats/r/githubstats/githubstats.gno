package githubstats

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"
	"std"
)

type GitHubUser struct {
	Login       string `json:"login"`
	PublicRepos int    `json:"public_repos"`
	Followers   int    `json:"followers"`
	Following   int    `json:"following"`
}

// Are Api calls possible in gno?
func GetGitHubStats(username string) (*GitHubUser, error) {
	url := fmt.Sprintf("https://api.github.com/users/%s", username)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	var user GitHubUser
	err = json.NewDecoder(resp.Body).Decode(&user)
	if err != nil {
		return nil, err
	}

	return &user, nil
}

func Render(username string) string {
	var b bytes.Buffer

	user, err := GetGitHubStats(username)
	if err != nil {
		return "Error fetching GitHub data"
	}

	b.WriteString("# GitHub User Statistics\n\n")
	b.WriteString(fmt.Sprintf("## %s\n", user.Login))
	b.WriteString(fmt.Sprintf("- **Public Repositories:** %d\n", user.PublicRepos))
	b.WriteString(fmt.Sprintf("- **Followers:** %d\n", user.Followers))
	b.WriteString(fmt.Sprintf("- **Following:** %d\n", user.Following))

	return b.String()
}
