Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 117591884FE
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 14:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgCQNMK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Mar 2020 09:12:10 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.114]:38498 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726187AbgCQNMJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Mar 2020 09:12:09 -0400
Received: from [100.113.4.131] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.eu-central-1.aws.symcld.net id B2/09-40261-5ACC07E5; Tue, 17 Mar 2020 13:12:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRWlGSWpSXmKPExsVy8MN7Xd0lZwr
  iDBrmmFjMOd/CYjH/yDlWi8OLXjBaNC9ez2Zx/+tRRoubn76xWlzeNYfNon3jbFaLpdcvMlm8
  /9TJZNG69wi7xf89O9gtfu6ax2Jxe+JkRgc+jzXz1jB6bFl5k8lj56y77B6bVnWyedy5tofNY
  //cNewe/X8NPD5vkgvgiGLNzEvKr0hgzZh06SVTwRf2imvn1jA2ML5n7WLk4hASWMsoMWfBF6
  YuRk4gp1JiUf8bVhCbV8BUYuaqB2BxNgEdiUcz14PZLAKqEps2LWQHsYUFrCTubd7NBDJIROA
  ks0Tnva8sIA6zwDRGiT0fDzNDTBKUODnzCQuIzSwgIXHwxQtmiG1aEufWrGKcwMg9C0nZLCRl
  CxiZVjFaJhVlpmeU5CZm5ugaGhjoGhoa65rqGhpb6iVW6SbppZbqJqfmlRQlAmX1EsuL9Yorc
  5NzUvTyUks2MQIDP6WQtXsH46e17/UOMUpyMCmJ8gbPKYgT4kvKT6nMSCzOiC8qzUktPsQow8
  GhJMGreRooJ1iUmp5akZaZA4xCmLQEB4+SCG/3KaA0b3FBYm5xZjpE6hSjLsf193uXMgux5OX
  npUqJ8y4HKRIAKcoozYMbAUsIlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ87aAXMKTmVcC
  t+kV0BFMQEdUbMgHOaIkESEl1cDEzJsSdT/tAoOMwOaAF53aD37cjz2zX/Wuaq4Y+w0jXZ1/+
  +umMB7v+W+aG+kvovD89N9Jl5nmLWlhmi0kYnrfsTcvOPv0RWHDL44tm3iVVYRntGxcuLr44N
  PGi/PLX5acb7g2a8q7k0GfFxRobp1WGrx0ao67+PZz93/Jbjj1vLfmdF1iYMGlprVyXk+tA6X
  0n29YUle2aefazVX2R8+7Br8yE+4vqOoIl1BctC7nkJ5S813WSZf7Gl35H20RamXVOXyv8KB3
  jDW/2pU9mtlPlpxYJCkkt/POg4Kmj5Pq5cOyltZcESlSi5x9rWMO95G07MJaU+Vrq3ef7OvVD
  Y3tT1WubL4aZZsT35H4IEiJpTgj0VCLuag4EQAutONZgwMAAA==
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-18.tower-246.messagelabs.com!1584450724!1103421!1
X-Originating-IP: [193.240.239.45]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9017 invoked from network); 17 Mar 2020 13:12:04 -0000
Received: from unknown (HELO NB-EX-CASHUB01.diasemi.com) (193.240.239.45)
  by server-18.tower-246.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 17 Mar 2020 13:12:04 -0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Tue, 17 Mar 2020 14:12:03 +0100
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 E050913F671; Tue, 17 Mar 2020 22:12:01 +0900 (KST)
Message-ID: <cover.1584445730.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Tue, 17 Mar 2020 20:48:50 +0900
Subject: [PATCH V11 0/3]  da7280: haptic driver submission
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
 drivers/input/misc/da7280.c                        | 1898 ++++++++++++++++++++
 5 files changed, 2023 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for PATCH V11

