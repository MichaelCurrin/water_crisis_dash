#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Water dashboard main application file.
"""
from flask import Flask
from sqlalchemy import create_engine

import config
import lib


SQL_ENGINE = create_engine("sqlite:///{}".format(config.db_path))

with open(config.query_path) as f_in:
    SQL = f_in.read()

app = Flask(__name__, static_url_path='/static')


@app.route('/')
def root():
    """Web app root.

    Execute a fixed query and return the results in an HTML table form.
    """
    conn = SQL_ENGINE.connect()

    query = conn.execute(SQL)
    result = query.cursor.fetchall()

    cast_result = (
        (
            row[0],
            row[1],
            row[2],
            row[3],
            "not available" if row[4] is None else "{:,d}".format(int(row[4]))
        )
        for row in result
    )

    html = lib.build_html(
        title="CPT Water Trends",
        subtitle="Water crisis terms trending in Cape Town",
        paragraph=' Data has been scraped from the Twitter API since August'
            ' 2017 and new data is added daily. See the repo on Github as'
            ' <a href="https://github.com/MichaelCurrin/twitterverse">'
            'twitterverse</a>. '
            '<br><br> '
            'Trending topics have been filtered to terms related to the water'
            ' crisis such as dam, drought, water, crisis and day zero. '
            '<br><br> '
            'Volume is the <i>global</i> count of tweets about the topic, in'
            ' the past 24 hours, at the time the value was stored. The max'
            ' volume shown below is the highest recorded value since the start'
            ' of the available data. If not available then it was below'
            ' 10,000 tweets and therefore was too low for Twitter to make'
            ' available.',
        row_data=cast_result
    )

    return html


if __name__ == '__main__':
    app.run(port=5000, debug=True)
