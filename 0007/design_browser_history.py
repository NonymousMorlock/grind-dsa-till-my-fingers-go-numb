class BrowserHistory:

    def __init__(self, homepage: str):
        self.home_page: Page = Page(url=homepage, index=0)
        self.current_page: Page = self.home_page

    def visit(self, url: str) -> None:
        new_page = Page(url=url, index=self.current_page.index + 1)
        self.current_page.next = new_page
        new_page.prev = self.current_page
        self.current_page = new_page

    def back(self, steps: int) -> str:
        if steps >= self.current_page.index:
            self.current_page = self.home_page
            return self.home_page.url
        for i in range(steps):
            self.current_page = self.current_page.prev
        return self.current_page.url

    def forward(self, steps: int) -> str:
        while steps > 0 and self.current_page.next:
            self.current_page = self.current_page.next
            steps -= 1
        return self.current_page.url


class Page:
    def __init__(self, url: str, index: int):
        self.url = url
        self.index = index
        self.prev = None
        self.next = None

    def __repr__(self) -> str:
        return f'Page(url:{self.url}, index:{self.index}, prev:{self.prev.url if self.prev else None}, next:{self.next.url if self.next else None})'

# Your BrowserHistory object will be instantiated and called as such:
# obj = BrowserHistory(homepage)
# obj.visit(url)
# param_2 = obj.back(steps)
# param_3 = obj.forward(steps)