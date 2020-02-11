Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEBC15885F
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2020 03:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbgBKCn2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Feb 2020 21:43:28 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.2]:36438 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727747AbgBKCn1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Feb 2020 21:43:27 -0500
Received: from [100.112.192.239] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.eu-west-1.aws.symcld.net id B5/1B-51549-AC4124E5; Tue, 11 Feb 2020 02:43:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRWlGSWpSXmKPExsVy8MN7Xd1TIk5
  xBm9ec1jMOd/CYjH/yDlWi8OLXjBaNC9ez2Zx/+tRRoubn76xWlzeNYfNon3jbFaLpdcvMlm8
  /9TJZNG69wi7xf89O9gtfu6ax2Jxe+JkRgc+jzXz1jB6bFl5k8lj56y77B6bVnWyedy5tofNY
  //cNewe/X8NPD5vkgvgiGLNzEvKr0hgzTi46ztLwQuOiivNJxgbGA+wdTFycQgJrGWUWH7zMF
  MXIyeQUynxd9odRhCbV8BUYsnujawgNpuAjsSjmevBalgEVCUuTvwFFhcWcJD4eWwxO8ggEYG
  TzBKd976ygDjMAtMYJfZ8PMwMMUlQ4uTMJywgNrOAhMTBFy+YIbZpSZxbs4pxAiP3LCRls5CU
  LWBkWsVonlSUmZ5RkpuYmaNraGCga2hopGtoaaRrYq6XWKWbqJdaqlueWlyia6iXWF6sV1yZm
  5yTopeXWrKJERj0KQUH9Hcw/lrzXu8QoyQHk5Io74bDjnFCfEn5KZUZicUZ8UWlOanFhxhlOD
  iUJHivCTvFCQkWpaanVqRl5gAjECYtwcGjJMLrCpLmLS5IzC3OTIdInWLU5bj+fu9SZiGWvPy
  8VClx3okgRQIgRRmleXAjYMngEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXl+QKTyZeSVw
  m14BHcEEdMR1EweQI0oSEVJSDUzV7lMZw6e0e1TNuR530IHNdrGCrvKLQ9ckzE0nbQs89a9nx
  maNa6bnzvMydDX/0Enx3BNqJeBRU/17yZaiSKf4+ffv3L34ae9Ohy5jW/FHqjapvusPLZT0zZ
  BUUyt0ftdv0R/h2PP8r1J9mZXd1s/c+3ek7f2+b+c9vkVvDR/J71/d621ilBrsGlXjssRC8oz
  Npnd8rOeuHBN80CrZGGfkubeW899d3emWfGqrXlbr9Ez56avZmH1A8+q3RSLXFoXE7N711mvd
  kYqQGxdFDra6bTu69kVpYv4Oc7GW6qvV0Zt3yFmX7rSe+GGz8/w5+muZXkV8kMi+X5WU2TrN8
  Vwr548FfX03QnQcltyMPqXEUpyRaKjFXFScCABS5bYCgQMAAA==
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-15.tower-262.messagelabs.com!1581389001!1529582!2
X-Originating-IP: [193.240.239.45]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6598 invoked from network); 11 Feb 2020 02:43:22 -0000
Received: from unknown (HELO NB-EX-CASHUB01.diasemi.com) (193.240.239.45)
  by server-15.tower-262.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 11 Feb 2020 02:43:22 -0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 11 Feb 2020 03:43:20 +0100
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 24D7413F671; Tue, 11 Feb 2020 11:43:19 +0900 (KST)
Message-ID: <cover.1581383604.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Tue, 11 Feb 2020 10:13:24 +0900
Subject: [RESEND PATCH V8 0/3]  da7280: haptic driver submission
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

[PATCH V8 1/3] MAINTAINERS file update for DA7280
[PATCH V8 2/3] DA7280 DT Binding
[PATCH V8 3/3] DA7280 Driver

This patch applies against linux-next and v5.5

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
 drivers/input/misc/da7280.c                        | 1688 ++++++++++++++++++++
 drivers/input/misc/da7280.h                        |  412 +++++
 6 files changed, 2225 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c
 create mode 100644 drivers/input/misc/da7280.h

-- 
end-of-patch for RESEND PATCH V8

