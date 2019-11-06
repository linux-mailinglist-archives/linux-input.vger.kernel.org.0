Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2FBF0FC5
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731857AbfKFHFK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:05:10 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:8786 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731000AbfKFHEM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:04:12 -0500
IronPort-SDR: dRB2aqNO4j5397tx1Bk5irvsFEsiqpsbe0pR0rAIW3u73gBKQNFp4QpeCardAukp6XPc4Wo+e1
 2JYL0uQSYLCb6AAlIFNLNqrYFED6xKkjGvGmbmJ5unYmjYQjGFCN4JLAlhjbeBo3wr3RSP4P6/
 2ZXF4dJHgZHte0ZDNYA9M+9Z1x5b912g7vW2uoN9TZHORS7sZkf/SGtPdsBrfHqypEA1xQlAi7
 s/Z3vrewf+ahv5/qt0hlOrFuTQuzTRf89aq5C9uytF9O/XYPl8TNdOuJct0vl4FDmxhzrWm0Eh
 /VU=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42908660"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:04:02 -0800
IronPort-SDR: XK5BxMdEY0Lozxy2SWgAp5XMZTXUdo8mJ3s3hv+3J3qErXV17i+SRoj8ok6Htf2KX9A6GM40Zz
 NM75U8onkHuepN0ZcZ4RSc0cNIE6xFt7XV2wdIy0MJ1bLcgJJZxaiiOeAm90/okERPQfHAY1CW
 rX5oo341X5h7ecjdYm062T4Saapp3z7qGXIBbCGYuujjFrCkWqjRxdmjhTYfu3MVuX7QKpklk7
 MporTs+JqRSFefV5sT7svd7fvHFn+E6wc8LaGTzo3HsIMJ5RhCQj9vyxbpInigzqv8UUeVOOaH
 VaE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 34/48] input: atmel_mxt_ts: Add Missing Delay for reset handling of Atmel touch panel controller in detachable displays.
Date:   Wed, 6 Nov 2019 16:01:32 +0900
Message-ID: <20191106070146.18759-35-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
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
index f357d353447f..835cc7a29c2f 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4112,6 +4112,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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

