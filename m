Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45C45192A0E
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbgCYNgV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:36:21 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:4463 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727527AbgCYNgV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:21 -0400
IronPort-SDR: n5it16xm7AlWaGv8yUFyoUTM2G/J1R3jL3K4GzA4Pt3XFTxmhSuSJUX5utTxlyItgehXtxDUPk
 DsewGhdUcLYmO//X/S+LZKxMYgg+A/ak6PUViCHalNVaAGAnBYT21OZi/+TWuKnl3XkbISaOiK
 0slDiQhWKccFcYQqd6iWM9wNswnQRLyGjIK2rIWWtQ67QSqdcSkhfN1SWc3zkIUAam0+deSw3K
 ytVWtTOov21Ud6quNWybUT/g/zuIq3QLqdy+Qss2sWpf2Zt2GovylaIFJFExu5pOA7Hp2MKRt7
 Fvo=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="49060146"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:36:20 -0800
IronPort-SDR: WjqxMpeDrLHa/prPGolS+nmNCA4g1SXATuVL+LdG3vlkonWOjEsRxpq5+Q+qJckV/8QGPTvMKp
 2c77LFQRaOONe5+nY7GnUuJlUBjj8P2d8C04fEw7tIRbbT1n3WY76qOd0tb5gX7SAhq7siqbUj
 kEp6gpka/lw+P/OpBckgmeGwnwteAgBjKwJR3+yqRLTYO2e9m70vnFDfmkyzKctK7eXvaZxZqT
 zVzwxFbBCt5YTSbUdMy4L/H/ON26JLI7PQugkWi8/iM6Db0qeLoCAZSZp4sVyRtcGvwoshhC2Z
 P2w=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 40/55] input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel touch panel controller in detachable displays.
Date:   Wed, 25 Mar 2020 06:33:19 -0700
Message-ID: <20200325133334.19346-41-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: keerthikumarp <Keerthikumar.Padmanabha@in.bosch.com>

In case of attached display, the touchpanel reset is controlled
via imx gpio's from  atmel driver and the delay between
touchpanel reset and the time at which the chip becomes capable to
communicate with the host processor, has be taken care.

However in case of detachable displays, the touchpanel reset is
controlled via a deserializer gpio which is triggered just before
the atmel driver is probed.The delay between touchpanel reset and
the time at which the chip becomes capable to communicate (as
specified in datasheet) was not being accounted for. This patch
introduces that delay.

Signed-off-by: keerthikumarp <Keerthikumar.Padmanabha@in.bosch.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index cfeeacdd4084..fb7cd06cab53 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4118,6 +4118,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_GPIO_TIME);
 		gpiod_set_value(data->reset_gpio, 1);
 		msleep(MXT_RESET_INVALID_CHG);
+	} else {
+		dev_dbg(&client->dev,
+			"atmel reset pin not found in device tree");
+		msleep(MXT_RESET_TIME);
 	}
 
 	error = mxt_initialize(data);
-- 
2.17.1

