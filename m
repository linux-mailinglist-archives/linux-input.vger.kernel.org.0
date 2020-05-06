Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E0B1C8DFE
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 16:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgEGOLF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 10:11:05 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1]:30358 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728103AbgEGOLE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 10:11:04 -0400
Received: from [100.113.2.173] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.eu-central-1.aws.symcld.net id ED/3D-08563-4F614BE5; Thu, 07 May 2020 14:11:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRWlGSWpSXmKPExsVy8MN7Xd0vYlv
  iDK7+ELSYc76FxWL+kXOsFocXvWC0aF68ns3i/tejjBY3P31jtbi8aw6bRfvG2awWS69fZLJ4
  /6mTyaJ17xF2i/97drBb/Nw1j8Xi9sTJjA58HmvmrWH02LLyJpPHzll32T02repk87hzbQ+bx
  /65a9g9+v8aeHzeJBfAEcWamZeUX5HAmvF/XSdrwQ/2ioeHOlkaGD+zdjFycQgJrGGU2P1kD0
  sXIyeQUymxYcUsoAQHB6+AqcTj2WUgYTYBHYlHM9czgdgsAioSN/4eBrOFBawkPl+czAYyR0T
  gJLNE572vLCAOs8A0Rok9Hw8zg1TxCghKnJz5BGwBs4CExMEXL5ghlmlJnFuzinECI/csJGWz
  kJQtYGRaxWiZVJSZnlGSm5iZo2toYKBraGisa6hrZGCil1ilm6iXWqqbnJpXUpQIlNVLLC/WK
  67MTc5J0ctLLdnECAz7lELGMzsYdy1/r3eIUZKDSUmUd8nnzXFCfEn5KZUZicUZ8UWlOanFhx
  hlODiUJHj3i2yJExIsSk1PrUjLzAHGIExagoNHSYTXGhiHQrzFBYm5xZnpEKlTjLoc19/vXco
  sxJKXn5cqJc6bCVIkAFKUUZoHNwKWDi4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuY9Kgo0
  hSczrwRu0yugI5iAjvj8aRPIESWJCCmpBqb0TXyvNzscjljso8p4U8bh0GkXp3SuXzGFFX/6d
  x2pEdka+zEiZ15V9ES3yAKPjGdHU3/vifrB0d1nUXH6BcMuzRbf1mamqffeil6JnmIip9N/LH
  V7ga6nqm1MrPPEvbynLqy8qeZ89OCWxbXMB1I/CEw+UmKbn/7+0tvO99eEdBbOqymeccUiy2/
  lbo1+9qge69xyV7NNWf/YXJftOi68+Xja9OpXghWhG9WmH3x279xmyWNTNkwqvRT5YGGyZPSt
  ON01G5UnRLAf+K/6fr8yy+4d4tHN1XFSp9dkvl9pFtjbZxX2wHtXjfVssUP2co+jZ0xQ/RapM
  iXUxmwWu6Huwj9rWdY+Oehq6XBCaqUSS3FGoqEWc1FxIgC9hAYEggMAAA==
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-19.tower-223.messagelabs.com!1588860659!2836654!2
X-Originating-IP: [193.240.239.45]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13072 invoked from network); 7 May 2020 14:11:00 -0000
Received: from unknown (HELO NB-EX-CASHUB01.diasemi.com) (193.240.239.45)
  by server-19.tower-223.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 7 May 2020 14:11:00 -0000
Received: from krsrvapps-03.diasemi.com (10.95.17.51) by
 NB-EX-CASHUB01.diasemi.com (10.1.16.140) with Microsoft SMTP Server id
 14.3.468.0; Thu, 7 May 2020 16:10:58 +0200
Received: by krsrvapps-03.diasemi.com (Postfix, from userid 22266)      id
 1660413F671; Thu,  7 May 2020 23:10:57 +0900 (KST)
Message-ID: <cover.1588781316.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Thu, 7 May 2020 01:08:36 +0900
Subject: [PATCH V13 0/3]  da7280: haptic driver submission
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
end-of-patch for PATCH V13

