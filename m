Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1988C127753
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2019 09:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbfLTImz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Dec 2019 03:42:55 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1]:38043 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727188AbfLTImz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Dec 2019 03:42:55 -0500
Received: from [85.158.142.98] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 2A/D8-12484-B898CFD5; Fri, 20 Dec 2019 08:42:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRWlGSWpSXmKPExsVy8IPnUd2uzj+
  xBrM7LSzmnG9hsZh/5ByrxeFFLxgtmhevZ7O4//Uoo8XNT99YLS7vmsNm0b5xNqvF0usXmSze
  f+pksmjde4Td4v+eHewWP3fNY7G4PXEyowOfx5p5axg9tqy8yeSxc9Zddo9NqzrZPO5c28Pms
  X/uGnaP/r8GHp83yQVwRLFm5iXlVySwZqy49Y2p4AVHxelLx5kbGA+wdTFycQgJrGeUuPl8Dp
  DDCeRUSHSdvsIIYvMKmErsW7KPGcRmE9CReDRzPROIzSKgKvGmdQKYLSzgIPHz2GJ2kEEiAle
  YJZ683sUM4jALTGOU2PPxMDPEJEGJkzOfsIDYzAISEgdfvGCG2KYlcW7NKrBtEgL2EtPfXwWK
  cwDZ+hKNx2IhwoYS32d9Y4GwzSVuPlvONoGRfxaSqbOQTF3AyLSK0SKpKDM9oyQ3MTNH19DAQ
  NfQ0FjXWNfMUC+xSjdRL7VUNzk1r6QoESipl1herFdcmZuck6KXl1qyiREYVSmFzLY7GM++f6
  t3iFGSg0lJlDfJ/0+sEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnexjagnGBRanpqRVpmDjDCYdI
  SHDxKIrzW7UBp3uKCxNzizHSI1ClGXY7r7/cuZRZiycvPS5US510CUiQAUpRRmgc3ApZsLjHK
  SgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5o0GmcKTmVcCt+kV0BFMQEdwaP4COaIkESEl1cA06
  Yu7S/nVsxvYVzHXfePsvRAfHxHgmqxxmlO+afKrwKzdB354LT+b0vjQPGf+on37lVeovf/jMN
  vonNHyW5svcs1n8Xlr/S94/zMp+Z28cyfWfUvJ+8THejmRt+6PaiHDcmOFCw2X4ndwbrnZ1nt
  NVLV1io7X34NhBitNP0r1q01NtjQwl03U3uDHdqj5wKQS8ZBT544euzrfcn5V0jPpQ3MWu688
  1pVz/rTFR8kZs4QOLt2ezpDlyr393pkZk3a965ws2z45qUXo/slmw5c+ZaHXlyiYzL8T+IjJo
  c0o5N/ODp0spwtyb9nifn/50SdstJIlIrL82I8Y4QpFhivfX0c+DOWp2Hh2YcuUtzOilViKMx
  INtZiLihMBQA+pY7EDAAA=
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-11.tower-223.messagelabs.com!1576831370!805441!1
X-Originating-IP: [193.240.73.197]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24232 invoked from network); 20 Dec 2019 08:42:50 -0000
Received: from unknown (HELO sw-ex-cashub01.diasemi.com) (193.240.73.197)
  by server-11.tower-223.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 20 Dec 2019 08:42:50 -0000
Received: from swsrvapps-01.diasemi.com (10.20.28.141) by
 SW-EX-CASHUB01.diasemi.com (10.20.16.140) with Microsoft SMTP Server id
 14.3.468.0; Fri, 20 Dec 2019 08:42:43 +0000
Received: by swsrvapps-01.diasemi.com (Postfix, from userid 22266)      id
 A5B643FB8D; Fri, 20 Dec 2019 08:42:43 +0000 (GMT)
Message-ID: <cover.1576830367.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Fri, 20 Dec 2019 17:26:07 +0900
Subject: [RESEND PATCH V8 0/3]  da7280: haptic driver submission
To:     "David S. Miller" <davem@davemloft.net>,
        Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-ServerInfo: sw-ex-cashub01.diasemi.com, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 20/12/2019 06:45:00
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Dialog DA7280 Haptic driver IC.

In this patch set the following is provided:

[PATCH V8 1/3] MAINTAINERS file update for DA7280
[PATCH V8 2/3] DA7280 DT Binding
[PATCH V8 3/3] DA7280 Driver

This patch applies against linux-next and v5.4

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
 drivers/input/misc/da7280.c                        | 1683 ++++++++++++++++++++
 drivers/input/misc/da7280.h                        |  412 +++++
 6 files changed, 2220 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c
 create mode 100644 drivers/input/misc/da7280.h

-- 
end-of-patch for RESEND PATCH V8

