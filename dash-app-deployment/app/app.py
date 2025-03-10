import dash
from dash import html, dcc
import plotly.express as px
import pandas as pd

# Sample data
df = px.data.gapminder()

app = dash.Dash(__name__)

app.layout = html.Div(children=[
    html.H1("Dash App Deployment"),
    dcc.Graph(
        id="example-graph",
        figure=px.scatter(df, x="gdpPercap", y="lifeExp", color="continent", size="pop", log_x=True)
    )
])

if __name__ == "__main__":
    app.run_server(host="0.0.0.0", port=8050)