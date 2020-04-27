Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D161B9768
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 08:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgD0G0h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 02:26:37 -0400
Received: from mail1.bemta25.messagelabs.com ([46.226.52.115]:51656 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726651AbgD0G0g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 02:26:36 -0400
Received: from [100.112.197.243] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.eu-west-1.aws.symcld.net id D7/35-51957-61B76AE5; Mon, 27 Apr 2020 06:26:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRWlGSWpSXmKPExsVy8MN7XV2x6mV
  xBte+S1vMOd/CYjH/yDlWi8OLXjBaNC9ez2Zx/+tRRoubn76xWlzeNYfNon3jbFaLpdcvMlm8
  /9TJZNG69wi7xf89O9gtfu6ax2Jxe+JkRgc+jzXz1jB6bFl5k8lj56y77B6bVnWyedy5tofNY
  //cNewe/X8NPD5vkgvgiGLNzEvKr0hgzZj7ejpjwX/2iv4b/9gaGH+ydjFycQgJrGWU2LBoC5
  DDCeRUSnRd/sQGYvMKmEpcvbqbCcRmE9CReDRzPZjNIqAq8e3iLnYQW1jAUWLZhM9gg0QETjJ
  LdN77ygLiMAtMY5TY8/EwM8QkQYmTM5+wgNjMAhISB1+8YIbYpiVxbs0qxgmM3LOQlM1CUraA
  kWkVo0VSUWZ6RkluYmaOrqGBga6hoZGuoaW5rqGZiV5ilW6SXmqpbnlqcYmuoV5iebFecWVuc
  k6KXl5qySZGYNinFBxdsoNx2/L3eocYJTmYlER59WKXxQnxJeWnVGYkFmfEF5XmpBYfYpTh4F
  CS4H1dCZQTLEpNT61Iy8wBxiBMWoKDR0mEtxQkzVtckJhbnJkOkTrFqMtx/f3epcxCLHn5eal
  S4rzKVUBFAiBFGaV5cCNg6eASo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeSSCreDLzSuA2
  vQI6ggnoiCr5xSBHlCQipKQamIxUatq3Tzr7Y18F9wnBZ7uSem/MX3trYTHjjAer/Z/I5wV/6
  3K6UXX4o+3VT0ybrRq+FplHirfNMQ2y2tq6nWXT3Jrdtjw3n0zatWFHxQ6RLqtly8JNpqQd1S
  2aHshiIHj9nnB7X2Bk3P/v1Y0/J3dOKuv6H1eieffQ/M9ODzQn+Jq+vMvuv9F5vtS0OR05Ko1
  zTi7+O0HoaX6wSMyhwvxzYefvZN9d1eYwJfqnjkD4lLwwNWc5yRnVDxsN/F2UlY+sm/6qWOn8
  hwvsE6rveKXoizwMWzP7w7MNrnw+i05p89/5tHhZ47uenSkZ8v83Smjmnyt2KlN7tFOpo/Z27
  qnLQq/v3ZP5llDOPSvoapQSS3FGoqEWc1FxIgChYdtdggMAAA==
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-19.tower-292.messagelabs.com!1587968789!3549008!2
X-Originating-IP: [193.240.239.45]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23390 invoked from network); 27 Apr 2020 06:26:30 -0000
Received: from unknown (HELO NB-EX-CASHUB01.diasemi.com) (193.240.239.45)
  by server-19.tower-292.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 27 Apr 2020 06:26:30 -0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Mon, 27 Apr 2020 08:26:29 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 DB61C13F671; Mon, 27 Apr 2020 15:26:27 +0900 (KST)
Message-ID: <cover.1587949032.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Mon, 27 Apr 2020 09:57:12 +0900
Subject: [RESEND PATCH V11 0/3]  da7280: haptic driver submission
To:     "David S. Miller" <davem@davemloft.net>,
        Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Support Opensource <support.opensource@diasemi.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH V11 1/3] MAINTAINERS file update for DA7280
[PATCH V11 2/3] DA7280 DT Binding
[PATCH V11 3/3] DA7280 Driver

This patch applies against linux-next and v5.7-rc2

Thank you,
Roy Im, Dialog Semiconductor Ltd.

Roy Im (3):
  MAINTAINERS: da7280 updates to the Dialog Semiconductor search terms
  dt-bindings: input: Add document bindings for DA7280
  Input: new da7280 haptic driver

 .../devicetree/bindings/input/dlg,da7280.txt       |  109 ++
 MAINTAINERS                                        |    2 +
 drivers/input/misc/Kconfig                         |   13 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/da7280.c                        | 1898 ++++++++++++++++++++
 5 files changed, 2023 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for RESEND PATCH V11

