Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF809400FAD
	for <lists+linux-input@lfdr.de>; Sun,  5 Sep 2021 14:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbhIEMq4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Sep 2021 08:46:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36144 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231622AbhIEMq4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 5 Sep 2021 08:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630845952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PSiER7bR81jADerb7+Aj7QYAN/BXRir1S8j5DLpfpE8=;
        b=OjL5+4JqfshlUzywkyWp5SoywLnhRmZwWseIRj6kQ/qKLc4oVBU71/3Xts0cSR24/1kXRV
        BXB71znBcveaWuThJaXg83dIgQPO6Uk8zgJks4z1MHQxEiNwq6/+J9MO/49LPnGIZnunCm
        kbU/mstsvESyYXfTkTj9zgRy9myCtto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-9iEJJE9ZN4yc0FjYTZwUJA-1; Sun, 05 Sep 2021 08:45:51 -0400
X-MC-Unique: 9iEJJE9ZN4yc0FjYTZwUJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BDE85132;
        Sun,  5 Sep 2021 12:45:50 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.34])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 724445C1A3;
        Sun,  5 Sep 2021 12:45:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH regression fix 2/2] Input: silead - Add pen support
Date:   Sun,  5 Sep 2021 14:45:47 +0200
Message-Id: <20210905124547.31567-2-hdegoede@redhat.com>
In-Reply-To: <20210905124547.31567-1-hdegoede@redhat.com>
References: <20210905124547.31567-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Silead touchscreens have support for an active (battery powered)
pen, add support for this.

So far pen-support has only been seen on X86/ACPI (non devicetree) devs,
IOW it is not used in actual devicetree files. The devicetree-bindings
maintainers have requested properties like these to not be added to the
devicetree-bindings, so the new properties are deliberately not added
to the existing silead devicetree-bindings documentation.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/silead.c | 104 +++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index caa25af53e6e..8b51ce15632e 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -67,6 +67,7 @@ struct silead_ts_data {
 	struct i2c_client *client;
 	struct gpio_desc *gpio_power;
 	struct input_dev *input;
+	struct input_dev *pen_input;
 	struct regulator_bulk_data regulators[2];
 	char fw_name[64];
 	struct touchscreen_properties prop;
@@ -77,6 +78,11 @@ struct silead_ts_data {
 	int id[SILEAD_MAX_FINGERS];
 	u32 efi_fw_min_max[4];
 	bool efi_fw_min_max_set;
+	bool pen_supported;
+	bool pen_down;
+	u32 pen_x_res;
+	u32 pen_y_res;
+	int pen_up_count;
 };
 
 struct silead_fw_data {
@@ -144,6 +150,45 @@ static int silead_ts_request_input_dev(struct silead_ts_data *data)
 	error = input_register_device(data->input);
 	if (error) {
 		dev_err(dev, "Failed to register input device: %d\n", error);
+			return error;
+	}
+
+	return 0;
+}
+
+static int silead_ts_request_pen_input_dev(struct silead_ts_data *data)
+{
+	struct device *dev = &data->client->dev;
+	int error;
+
+	if (!data->pen_supported)
+		return 0;
+
+	data->pen_input = devm_input_allocate_device(dev);
+	if (!data->pen_input)
+		return -ENOMEM;
+
+	input_set_abs_params(data->pen_input, ABS_X, 0, 4095, 0, 0);
+	input_set_abs_params(data->pen_input, ABS_Y, 0, 4095, 0, 0);
+	input_set_capability(data->pen_input, EV_KEY, BTN_TOUCH);
+	input_set_capability(data->pen_input, EV_KEY, BTN_TOOL_PEN);
+	/*
+	 * We never report BTN_STYLUS but userspace want to see this in order
+	 * for the device to be recognized as a pen / drawing-tablet.
+	 */
+	input_set_capability(data->pen_input, EV_KEY, BTN_STYLUS);
+	set_bit(INPUT_PROP_DIRECT, data->pen_input->propbit);
+	touchscreen_parse_properties(data->pen_input, false, &data->prop);
+	input_abs_set_res(data->pen_input, ABS_X, data->pen_x_res);
+	input_abs_set_res(data->pen_input, ABS_Y, data->pen_y_res);
+
+	data->pen_input->name = SILEAD_TS_NAME " pen";
+	data->pen_input->phys = "input/pen";
+	data->input->id.bustype = BUS_I2C;
+
+	error = input_register_device(data->pen_input);
+	if (error) {
+		dev_err(dev, "Failed to register pen input device: %d\n", error);
 		return error;
 	}
 
@@ -161,6 +206,45 @@ static void silead_ts_set_power(struct i2c_client *client,
 	}
 }
 
+static bool silead_ts_handle_pen_data(struct silead_ts_data *data, u8 *buf)
+{
+	u8 *coord = buf + SILEAD_POINT_DATA_LEN;
+	struct input_mt_pos pos;
+
+	if (!data->pen_supported || buf[2] != 0x00 || buf[3] != 0x00)
+		return false;
+
+	if (buf[0] == 0x00 && buf[1] == 0x00 && data->pen_down) {
+		data->pen_up_count++;
+		if (data->pen_up_count == 6) {
+			data->pen_down = false;
+			goto sync;
+		}
+		return true;
+	}
+
+	if (buf[0] == 0x01 && buf[1] == 0x08) {
+		touchscreen_set_mt_pos(&pos, &data->prop,
+			get_unaligned_le16(&coord[SILEAD_POINT_X_OFF]) & 0xfff,
+			get_unaligned_le16(&coord[SILEAD_POINT_Y_OFF]) & 0xfff);
+
+		input_report_abs(data->pen_input, ABS_X, pos.x);
+		input_report_abs(data->pen_input, ABS_Y, pos.y);
+
+		data->pen_up_count = 0;
+		data->pen_down = true;
+		goto sync;
+	}
+
+	return false;
+
+sync:
+	input_report_key(data->pen_input, BTN_TOOL_PEN, data->pen_down);
+	input_report_key(data->pen_input, BTN_TOUCH, data->pen_down);
+	input_sync(data->pen_input);
+	return true;
+}
+
 static void silead_ts_read_data(struct i2c_client *client)
 {
 	struct silead_ts_data *data = i2c_get_clientdata(client);
@@ -183,6 +267,9 @@ static void silead_ts_read_data(struct i2c_client *client)
 		buf[0] = data->max_fingers;
 	}
 
+	if (silead_ts_handle_pen_data(data, buf))
+		goto sync; /* Pen is down, release all previous touches */
+
 	touch_nr = 0;
 	bufp = buf + SILEAD_POINT_DATA_LEN;
 	for (i = 0; i < buf[0]; i++, bufp += SILEAD_POINT_DATA_LEN) {
@@ -225,6 +312,7 @@ static void silead_ts_read_data(struct i2c_client *client)
 			data->pos[i].y, data->id[i], data->slots[i]);
 	}
 
+sync:
 	input_mt_sync_frame(input);
 	input_report_key(input, KEY_LEFTMETA, softbutton_pressed);
 	input_sync(input);
@@ -356,6 +444,14 @@ static int silead_ts_load_fw(struct i2c_client *client)
 						       ARRAY_SIZE(data->efi_fw_min_max));
 		if (!error)
 			data->efi_fw_min_max_set = true;
+
+		/* The EFI (platform) embedded fw does not have pen support */
+		if (data->pen_supported) {
+			dev_warn(dev, "Warning loading '%s' from filesystem failed, using EFI embedded copy.\n",
+				 data->fw_name);
+			dev_warn(dev, "Warning pen support is known to be broken in the EFI embedded fw version\n");
+			data->pen_supported = false;
+		}
 	}
 
 	fw_size = fw->size / sizeof(*fw_data);
@@ -513,6 +609,10 @@ static void silead_ts_read_props(struct i2c_client *client)
 			 "silead/%s", str);
 	else
 		dev_dbg(dev, "Firmware file name read error. Using default.");
+
+	data->pen_supported = device_property_read_bool(dev, "silead,pen-supported");
+	device_property_read_u32(dev, "silead,pen-resolution-x", &data->pen_x_res);
+	device_property_read_u32(dev, "silead,pen-resolution-y", &data->pen_y_res);
 }
 
 #ifdef CONFIG_ACPI
@@ -625,6 +725,10 @@ static int silead_ts_probe(struct i2c_client *client,
 	if (error)
 		return error;
 
+	error = silead_ts_request_pen_input_dev(data);
+	if (error)
+		return error;
+
 	error = devm_request_threaded_irq(dev, client->irq,
 					  NULL, silead_ts_threaded_irq_handler,
 					  IRQF_ONESHOT, client->name, data);
-- 
2.31.1

