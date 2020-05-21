Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80F41DCCE8
	for <lists+linux-input@lfdr.de>; Thu, 21 May 2020 14:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbgEUMaD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 May 2020 08:30:03 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.66]:52187 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728041AbgEUMaD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 May 2020 08:30:03 -0400
Received: from [100.112.199.17] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 8C/FC-40649-74476CE5; Thu, 21 May 2020 12:29:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRWlGSWpSXmKPExsVy8MN7XV33kmN
  xBlfvqFrMOd/CYjH/yDlWi8OLXjBaNC9ez2Zx/+tRRoubn76xWlzeNYfNon3jbFaLpdcvMlm8
  /9TJZNG69wi7xf89O9gtfu6ax2Jxe+JkRgc+jzXz1jB6bFl5k8lj56y77B6bVnWyedy5tofNY
  //cNewe/X8NPD5vkgvgiGLNzEvKr0hgzejZdICt4D97xbVDb1kaGH+ydjFycQgJrGWUmNj4DM
  jhAHIqJbasCOpi5OTgFTCVODjpPCuIzSagI/Fo5nomEJtFQFXiQNtrdhBbWMBRonfmAmaQOSI
  CJ5klOu99ZQFxmAWmMUrs+XiYGWKSoMTJmU9YQGxmAQmJgy9egMWFBLQkzq1ZxTiBkXsWkrJZ
  SMoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTSNbQ00zU0NtdLrNJN0kst1S1PLS7RNdRLLC/WK
  67MTc5J0ctLLdnECAz6lIIjnTsYf695r3eIUZKDSUmU94D/sTghvqT8lMqMxOKM+KLSnNTiQ4
  wyHBxKErz5xUA5waLU9NSKtMwcYATCpCU4eJREeDcVAaV5iwsSc4sz0yFSpxh1Oa6/37uUWYg
  lLz8vVUqcVxJkhgBIUUZpHtwIWDK4xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYNwNkCk9m
  XgncpldARzABHSF97BDIESWJCCmpBqa8onVPVqk0eM3+YtMqMy/gzspANt609sIvV60efddMr
  T7jPEnG4PRsF+YlCf2CWxadF2TNahbpql6QEfy0/+/z99f9S/tvcn49lfv6WZXWD51C3kjJjz
  v9hPZt3f70f5ulTv/8D93qrZtuPGpzf/cjX3VmcKdcQnZA9gS2+z9FMru3LroeObn0rdijN6d
  ubOsVzLrkm7KxourDxRnsew68jtZxyqrZu56X30Qk+MXyzN0Rh/ySNUrvnrhoIs55PqFoaljL
  k677HZUCe/WiXz10Xvxp0QunC7GbDm+7fd/scVkiS9ituVsnup8/omcn3tBnuXSv2nkLl4UzD
  wrqLn6wk9tM7LBZVmeDVitr7mQlluKMREMt5qLiRABrzc0mgQMAAA==
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-21.tower-282.messagelabs.com!1590064199!5520835!1
X-Originating-IP: [193.240.239.45]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26010 invoked from network); 21 May 2020 12:29:59 -0000
Received: from unknown (HELO NB-EX-CASHUB01.diasemi.com) (193.240.239.45)
  by server-21.tower-282.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 21 May 2020 12:29:59 -0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Thu, 21 May 2020 14:29:57 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 8296D13F671; Thu, 21 May 2020 21:29:55 +0900 (KST)
Message-ID: <cover.1590053093.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Thu, 21 May 2020 18:24:53 +0900
Subject: [RESEND PATCH V13 0/3]  da7280: haptic driver submission
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

[PATCH V13 1/3] MAINTAINERS file update for DA7280
[PATCH V13 2/3] DA7280 DT Binding
[PATCH V13 3/3] DA7280 Driver

This patch applies against linux-next and v5.7-rc4

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
end-of-patch for RESEND PATCH V13

