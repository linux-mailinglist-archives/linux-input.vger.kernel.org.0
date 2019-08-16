Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E45A8FE37
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfHPIjB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:39:01 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1982 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727471AbfHPIjA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:39:00 -0400
IronPort-SDR: hWubHu6auLGcK6N4LbDE7yZ1xo4CvOgf8ipO4opVAAl28D5jJkyIyqw7xP7Uq19NH6YErmj7Ku
 AbOBNIX7yOrmu+fD41MndrbLDx3B2uhkWF4I0sXD/YzHqO6bFZCgwYJMexUwM6FoFp1QHbg3LV
 I2SItEEvpq0AagOnDAf82XeXF9w+HYYV+LZ1gpXw+DL0H5KucHvyzBFVAhIIkwVQgrjU1GaxER
 Go8lPT2yfUqKSsipuQAO9IAZIkE7zDd+T+aAmFSrmCjySMFcdSL3sH2f8bn52Rqk0b9RtaJF1D
 I/M=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484324"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:35:56 -0800
IronPort-SDR: RLpmb9MVfpAydiwFlcLgOLBYRumCb0/Vgb0tow8qsmoC5UziuHoDTmem4YB7mQ7p8iSUQDqdvo
 KCQU4NGv6fveiXK+Wrv7fbK+vXBBy7mF1OjVJC/+ra21zd58Loi5ZKIkUI+10LB8hOd/8lIVWP
 3HSheNWXZfBkTn6fbPfjIztLk7iCUbwn6PnYpxSuckwMqB8JJnqVdIdmff689Joaijka577dlw
 ZDIDPUBfWGm1RmEpR1t2OOmhZlA+bWzP5fvolOLmzNp6xQbF8kKn0UqzuplBKLIjX+TX0aSHWf
 wYs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 42/63] Input: atmel_mxt_ts: Limit the max bytes transferred in an i2c transaction
Date:   Fri, 16 Aug 2019 17:35:37 +0900
Message-ID: <20190816083558.19189-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083558.19189-1-jiada_wang@mentor.com>
References: <20190816083558.19189-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>

In mxt_process_messages_until_invalid() function, driver tries to read
all possible reportid in a single i2c transaction. Number of bytes read
is limited by the max_reportid parameter.
If the max_reportid is a very large value, then a large chunk of bytes
will be requested from the controller in a single i2c transaction.
This transaction can fail due to timeout. This is visible when the
Atmel controller is connected to the SOC via a i2c mux hardware.
New property 'atmel,mtu' is created. This property limits the maximum
number of bytes that can read/transferred in an i2c transcation

Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 .../bindings/input/atmel,maxtouch.txt         |  3 +++
 drivers/input/touchscreen/atmel_mxt_ts.c      | 26 +++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index 7afe12a93202..a7f9a8e551f7 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -45,6 +45,8 @@ Optional properties for main touchpad device:
 - atmel,gpios: Specify the GPIO input pins whose status will be read via the
     /sys/class/input/input<n>/backlight_error<x> sysfs entries.
 
+- atmel,mtu: Maximum number of bytes that can read/transferred in an i2c transaction
+
 Example:
 
 	touch@4b {
@@ -52,6 +54,7 @@ Example:
 		reg = <0x4b>;
 		interrupt-parent = <&gpio>;
 		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
+		atmel,mtu = <200>
 
 		atmel,gpios {
 			backlight_error1 {
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index c6ba061098c0..e315ad3a8d2a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -421,6 +421,7 @@ struct mxt_data {
 	unsigned long gpio_input_pin_status;
 	struct attribute_group gpio_attrs;
 	unsigned long gpio_input_pin_status_default;
+	unsigned int mtu;
 
 	bool t25_status;
 };
@@ -1522,13 +1523,30 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 	return IRQ_HANDLED;
 }
 
+static u8 mxt_max_msg_read_count(struct mxt_data *data)
+{
+	u8 count_limit = data->mtu / data->T5_msg_size;
+
+	if (!data->mtu)
+		return data->max_reportid;
+
+	if (data->mtu < data->T5_msg_size) {
+		WARN(1, "mtu set is lesser than the T5 message size\n");
+		/* Return count of 1, as fallback */
+		return 1;
+	}
+
+	return min(count_limit, data->max_reportid);
+}
+
 static int mxt_process_messages_until_invalid(struct mxt_data *data)
 {
 	struct device *dev = &data->client->dev;
 	int count, read;
-	u8 tries = 2;
+	int tries;
 
-	count = data->max_reportid;
+	count = mxt_max_msg_read_count(data);
+	tries = (data->max_reportid / count) + 1;
 
 	/* Read messages until we force an invalid */
 	do {
@@ -4290,6 +4308,10 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 			of_node_put(np_gpio);
 	}
 
+	device_property_read_u32(dev, "atmel,mtu", &data->mtu);
+	if (data->mtu)
+		dev_dbg(dev, "mtu is set as %d\n", data->mtu);
+
 	return 0;
 
 err_gpios_property_put:
-- 
2.19.2

