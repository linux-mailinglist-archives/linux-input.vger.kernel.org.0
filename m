Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA7B419943B
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730913AbgCaKx2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:53:28 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730426AbgCaKx2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:53:28 -0400
IronPort-SDR: 6/0j/f/+9NchP81t2XhkzmxWKBRblQHwrv/Ngk3HUjVdI4IUDfrzsWTbfFhZlnUTw01Dr+Mt3L
 lUj2deaTLNTIdMmKalu+Vpxo1oe6G7mMP9Z46BY/H6K7Fb3IW9AyToFM4Z59mMcvVz0MJs8NyD
 vviEjLCYmCUu674qbv7yL2c+g8tj9RiX9wcj4jN1ROnBc66oE5LkNeTE8MPHQtHkrCcB17wj6A
 eGU0s5IAe8WsJ8tNUiwbixlglP5XaAzfhVX8KhbnMPTS6wC9e/bVJk6S6LviwbKJ7bDC9hhbEf
 0fg=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330824"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:53:27 -0800
IronPort-SDR: uSsoBXL1GYn/EeL2k5Om+kok4Fo2TiN7Qh+W3TdJb74RcHLdkvNF+iWEuioIVUYEZw0Q7ol8p6
 kSgKkFb91l9GZ0beflbR0RP6h6iVDuEn3JC2MbZ1fNwIXztPrwUd67wk1I2ECbLm81cN26g3Za
 KLOtz26Mm+adwdVAt2eTAtx896hNSC408cKK12YNdtChWfCn4zSITsDAE78rS1OSsazubsd+yM
 fhC7L2+BxStAf6CxpTXSFeHSLeeBxqNB4y/ML3OBvg9gYYiB67e6XsdISBqUX/alKTc0si+SGZ
 hRU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 40/55] input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel touch panel controller in detachable displays.
Date:   Tue, 31 Mar 2020 03:50:36 -0700
Message-ID: <20200331105051.58896-41-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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

