Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D91817B2B4
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 01:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgCFARA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 19:17:00 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1]:57677 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726317AbgCFARA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Mar 2020 19:17:00 -0500
Received: from [100.113.1.43] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.eu-central-1.aws.symcld.net id C6/C5-28499-576916E5; Fri, 06 Mar 2020 00:16:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRWlGSWpSXmKPExsVy8MN7Xd3SaYl
  xBqv6+SzmnG9hsZh/5ByrxeFFLxgtmhevZ7O4//Uoo8XNT99YLS7vmsNm0b5xNqvF0usXmSze
  f+pksmjde4Td4v+eHewWP3fNY7G4PXEyowOfx5p5axg9tqy8yeSxc9Zddo9NqzrZPO5c28Pms
  X/uGnaP/r8GHp83yQVwRLFm5iXlVySwZhzbfJax4At7xf5jnUwNjO9Zuxi5OIQE1jBKLDn5na
  WLkRPIqZTY+u05I4jNK2AqMePxEjCbTUBH4tHM9UwgNouAisS0M/fB6oUFrCTubGgGGyQicJJ
  ZovPeVxYQh1lgGqPEno+HmSEmCUqcnPkErINZQELi4IsXzBDbtCTOrVnFOIGRexaSsllIyhYw
  Mq1itEwqykzPKMlNzMzRNTQw0DU0NNYFkkZmeolVuol6qaW6yal5JUWJQFm9xPJiveLK3OScF
  L281JJNjMDATylkqNvB+GfNe71DjJIcTEqivDviE+OE+JLyUyozEosz4otKc1KLDzHKcHAoSf
  BaTwHKCRalpqdWpGXmAKMQJi3BwaMkwhs9FSjNW1yQmFucmQ6ROsWoy3H9/d6lzEIsefl5qVL
  ivKkgRQIgRRmleXAjYAnhEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXm+QS3gy80rgNr0C
  OoIJ6Ij7d+JBjihJREhJNTDZydlM7Z63IW3tSQbjpS1Hbf2sJNo6z5fwHFTNX5oel+WmeulGV
  Z7r1Fh/T96j18Q4HARjbFNPLz+dIFGZ9T9k3+2tiZffezW/+7DV6Kf6ma0F01x7J2TESbmE2B
  7jZLrU03pT5+SKpPyVJ2c9eX221rq4Vl94hegW6+NiV0o+l/ZbzE54+vBK1KNVSo7z8q38GJo
  lz7WUv82NVzVs/8TMlKxWtEplK9NhkWnSdyaXscxV/5m++Hxc6YMmu3n/7izTuXX2QPz9E/9u
  3AtZtpbhi/Cv7Madsxs+zP9buq5117aaxeyPAs9clf15JCwk8uKJf4ofXKa63tdYIuQRZNk29
  8XsytUV7YuFOPb3ZvMqsRRnJBpqMRcVJwIAriHUA4MDAAA=
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-31.tower-229.messagelabs.com!1583453812!553913!1
X-Originating-IP: [193.240.239.45]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9156 invoked from network); 6 Mar 2020 00:16:53 -0000
Received: from unknown (HELO NB-EX-CASHUB01.diasemi.com) (193.240.239.45)
  by server-31.tower-229.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 6 Mar 2020 00:16:53 -0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Fri, 6 Mar 2020 01:16:51 +0100
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 4FEDE13F671; Fri,  6 Mar 2020 09:16:50 +0900 (KST)
Message-ID: <cover.1583425388.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Fri, 6 Mar 2020 01:23:08 +0900
Subject: [PATCH V10 0/3]  da7280: haptic driver submission
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

[PATCH V10 1/3] MAINTAINERS file update for DA7280
[PATCH V10 2/3] DA7280 DT Binding
[PATCH V10 3/3] DA7280 Driver

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
 drivers/input/misc/da7280.c                        | 1892 ++++++++++++++++++++
 5 files changed, 2017 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da7280.txt
 create mode 100644 drivers/input/misc/da7280.c

-- 
end-of-patch for PATCH V10

