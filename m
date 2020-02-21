Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E51916755A
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2020 09:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388379AbgBUIZg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Feb 2020 03:25:36 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.66]:58144 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388779AbgBUIZR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Feb 2020 03:25:17 -0500
Received: from [100.112.198.146] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 97/DA-44550-AE39F4E5; Fri, 21 Feb 2020 08:25:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRWlGSWpSXmKPExsVy8MN7Xd1Xk/3
  jDKZtlbKYc76FxWL+kXOsFocXvWC0aF68ns3i/tejjBY3P31jtbi8aw6bRfvG2awWS69fZLJ4
  /6mTyaJ17xF2i/97drBb/Nw1j8Xi9sTJjA58HmvmrWH02LLyJpPHzll32T02repk87hzbQ+bx
  /65a9g9+v8aeHzeJBfAEcWamZeUX5HAmrHoRTdzwQf2isuXJrI3ML5m7WLk4hASWMsosXvZLe
  YuRg4gp1Ji3k2hLkZODl4BU4ndX6+wgthsAjoSj2auZwKxWQRUJQ49v84CYgsLWEpsabnHCDJ
  HROAks0Tnva8sIA6zwDRGiT0fDzNDTBKUODnzCVgHs4CExMEXL8DiQgJaEufWrGKcwMg9C0nZ
  LCRlCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6RpamukaGpvrJVbpJumlluqWpxaX6BrqJZYX6
  xVX5ibnpOjlpZZsYgQGfUrBkc4djL/XvNc7xCjJwaQkyqvY5x8nxJeUn1KZkVicEV9UmpNafI
  hRhoNDSYL32QSgnGBRanpqRVpmDjACYdISHDxKIryOvUBp3uKCxNzizHSI1ClGXY7r7/cuZRZ
  iycvPS5US522dBFQkAFKUUZoHNwKWDC4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub9MRFo
  Ck9mXgncpldARzABHfFe2AfkiJJEhJRUA1MHn8fM4xI328QO6/TO+z+zM9DHfsV1yxWzNuTPW
  84i9yKj9PIckZfsm0+k8/98e9n1lIrTOpm64AO7rHiff2s2u724Qv+jYc7sgpCOmzw341/L+E
  zpEkx0da57Uzj/RHHMVtVmabZewX0+cmp/s79MYZ1kFbl+pYeFbMOFnub6yVlm0xZL26jlizI
  4lc77/mMbU2tZ7ayF1hPvmyV9ieBTkbF9x5+vGOIwYY9jkrlPZm7hhLYbkTO1Tje8a51fMmeu
  8DulS/1VPE3196dPDmKKF/fu/fkwV6BOYoHQ2zTfHfyGjHPZ41JZO4IMSnZuso3ZsEnnf7be6
  u4JGx+sic1ckstybGPWn5ee2QHflViKMxINtZiLihMBB91GJ4EDAAA=
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-15.tower-288.messagelabs.com!1582273513!731327!2
X-Originating-IP: [193.240.239.45]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22386 invoked from network); 21 Feb 2020 08:25:14 -0000
Received: from unknown (HELO NB-EX-CASHUB01.diasemi.com) (193.240.239.45)
  by server-15.tower-288.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 21 Feb 2020 08:25:14 -0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Fri, 21 Feb 2020 09:25:13 +0100
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 7701813F671; Fri, 21 Feb 2020 17:25:11 +0900 (KST)
Message-ID: <cover.1582270025.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Fri, 21 Feb 2020 16:27:05 +0900
Subject: [PATCH V9 0/3]  da7280: haptic driver submission
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

[PATCH V9 1/3] MAINTAINERS file update for DA7280
[PATCH V9 2/3] DA7280 DT Binding
[PATCH V9 3/3] DA7280 Driver

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
 drivers/input/misc/da7280.c                        | 1880 ++++++++++++++++++++
 5 files changed, 2005 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for PATCH V9

