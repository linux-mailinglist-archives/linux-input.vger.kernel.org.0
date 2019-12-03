Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA8D81122BA
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2019 07:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfLDGCF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 01:02:05 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.114]:61555 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726217AbfLDGCF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Dec 2019 01:02:05 -0500
Received: from [85.158.142.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 3E/CD-12313-7DB47ED5; Wed, 04 Dec 2019 06:01:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsVy8IPnUd3r3s9
  jDU5u17GYf+Qcq8XhRS8YLW5++sZqcXnXHDaLpdcvMlm07j3C7sDmsWbeGkaPnbPusntsWtXJ
  5vF5k1wASxRrZl5SfkUCa8a92x4FDzkqOjpWMTYw7mLrYuTiEBJYxyjxdO9G9i5GTiCnQuLsx
  otsIDavgKnEpg/rwWw2AR2JRzPXM4HYLAIqEh9bTzKC2MIClhLTZswEi4sIBEk8fnSWBWQos8
  BuRokPFw4wQwwSlDg58wkLiM0sICFx8MULZohlWhLn1qwCGyQhYC8x/f1VoDgHkK0v0XgsFiJ
  sKPF91jcWCNtcYte660wTGPlnIZk6C8nUBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2NdU11jQyM
  9RKrdJP0Ukt1k1PzSooSgbJ6ieXFesWVuck5KXp5qSWbGIHBnVLIenoH46xPb/UOMUpyMCmJ8
  m5+/CxWiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvlefzWCHBotT01Iq0zBxgpMGkJTh4lER4Gb
  yA0rzFBYm5xZnpEKlTjIpS4rwcIAkBkERGaR5cGyy6LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhT
  nYFQS5lUCmcKTmVcCN/0V0GImoMUHKp+BLC5JREhJNTCJH1uUdP2FyDbmnVKvWitnPWxY9oj9
  /flvzGcjWis4uwye9L+5z9TSKpSqIa/xd/bXrNT5u+cHcL4SuBdYGhZ/+ZROsEznDbFLT7vDz
  +xKOfDf9XR//L9HMl5NibbVdXM7AzdN1FNvCgrSv/U1545LXu9O8fy5s1iFlpgWab3/8Kz/5O
  OU6V1nNycc4uD9y+cyiXFvRJVN7ExN/xOhvz+dXnwx7wZXQp4o64GVNYcZYuZsffnpygeJLV2
  7nY2WPTVhT7ky9+7/zupO9wVRu8/uv2605OepUJm5rJpn6k9rZpl3fvCOn/TkVehZo8o9mZe4
  qyME8vY7tboeX7y16pPbBI1Frj+046p8V0vuvxyvxFKckWioxVxUnAgAqPSQVWkDAAA=
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-10.tower-246.messagelabs.com!1575439318!946274!3
X-Originating-IP: [193.240.73.197]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30550 invoked from network); 4 Dec 2019 06:01:59 -0000
Received: from unknown (HELO sw-ex-cashub01.diasemi.com) (193.240.73.197)
  by server-10.tower-246.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 4 Dec 2019 06:01:59 -0000
Received: from swsrvapps-01.diasemi.com (10.20.28.141) by
 SW-EX-CASHUB01.diasemi.com (10.20.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 4 Dec 2019 06:01:56 +0000
Received: by swsrvapps-01.diasemi.com (Postfix, from userid 22266)      id
 19B833FB8D; Tue,  3 Dec 2019 07:11:54 +0000 (GMT)
Message-ID: <cover.1575344415.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Tue, 3 Dec 2019 12:40:15 +0900
Subject: [PATCH V8 0/3]  da7280: haptic driver submission
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Support Opensource <support.opensource@diasemi.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-ServerInfo: sw-ex-cashub01.diasemi.com, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 04/12/2019 05:22:00
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
end-of-patch for PATCH V8

