Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 940381A3DFD
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 04:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgDJCHo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 22:07:44 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.115]:32506 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726678AbgDJCHo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Apr 2020 22:07:44 -0400
Received: from [100.113.5.56] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.eu-central-1.aws.symcld.net id E1/F6-46409-AE4DF8E5; Fri, 10 Apr 2020 02:07:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRWlGSWpSXmKPExsVy8MN7Xd2XV/r
  jDF51GlnMOd/CYjH/yDlWi8OLXjBaNC9ez2Zx/+tRRoubn76xWlzeNYfNon3jbFaLpdcvMlm8
  /9TJZNG69wi7xf89O9gtfu6ax2Jxe+JkRgc+jzXz1jB6bFl5k8lj56y77B6bVnWyedy5tofNY
  //cNewe/X8NPD5vkgvgiGLNzEvKr0hgzdj96yFbQQtHxYbvH5kaGP+xdjFycQgJrGWU+H6xnb
  2LkRPIqZS4ePwtYxcjBwevgKnE8zXOIGE2AR2JRzPXM4HYLAIqEo1NN5lBbGEBR4llEz6DzRE
  ROM0s8a79PBuIwywwjVFiz8fDYFW8AoISJ2c+YQGxmQUkJA6+eMEMsUxL4tyaVYwTGLlnISmb
  haRsASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0NjXRNdC3O9xCrdJL3UUt3k1LySokSgpF5iebFec
  WVuck6KXl5qySZGYNCnFLKE72Dcufy93iFGSQ4mJVFeYWA8CPEl5adUZiQWZ8QXleakFh9ilO
  HgUJLgLbgMlBMsSk1PrUjLzAFGIExagoNHSYTXEqSVt7ggMbc4Mx0idYpRl+P6+71LmYVY8vL
  zUqXEeYNAZgiAFGWU5sGNgCWDS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeQ0uAU3hycwr
  gdv0CugIJqAjDoeDHVGSiJCSamCa3aLcu67nhf0qObklc3y42W9eOLxm6+H3X5+90Pnl13m8+
  c1D+bkyXzc8zyyb8XTZvTWSi8rWvBC2MIhOX9Mo4yjutOMHM8tSSxF1k8/9fBO/TYyOPnaEc7
  1Wsce8KPGa+IbIW82H7Vz/H7Zf17tFc1ak8cJr1wSLhG91f7RIvv+hqetUWbazes+2X8ICos9
  tj3orBm8M+tVSx1sVUJ/Rfaxf5Ky9+eJN1kzlpzNOXDuyfsciu9XVk2Tt317pO3CB06ejME5z
  /k/FslmWE+5tPx9TlV6bvppr7prurON+UzeZ2e/VfG/X43hQoDKD+82/2TzvTvxXCVz3uihyi
  4PSqRKmk9d36p85s+riEu0oJZbijERDLeai4kQATqy8g4EDAAA=
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-24.tower-239.messagelabs.com!1586484457!2817432!1
X-Originating-IP: [193.240.239.45]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26322 invoked from network); 10 Apr 2020 02:07:37 -0000
Received: from unknown (HELO NB-EX-CASHUB01.diasemi.com) (193.240.239.45)
  by server-24.tower-239.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 10 Apr 2020 02:07:37 -0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Fri, 10 Apr 2020 04:07:35 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 7B9F213F671; Fri, 10 Apr 2020 11:07:34 +0900 (KST)
Message-ID: <cover.1586439647.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Thu, 9 Apr 2020 22:40:47 +0900
Subject: [RESEND PATCH V11 0/3]  da7280: haptic driver submission
To:     "David S. Miller" <davem@davemloft.net>,
        Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Mauro Carvalho Chehab" <mchehab+samsung@kernel.org>,
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

This patch applies against linux-next and next-20200408

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

