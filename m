Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740BD459721
	for <lists+linux-input@lfdr.de>; Mon, 22 Nov 2021 23:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbhKVWJw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Nov 2021 17:09:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31244 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231256AbhKVWJv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Nov 2021 17:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637618804;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JFuwR2SJpj+hxQZMwuKtFljRDAmDD71vocdIjnu+A1Y=;
        b=Ab3NbzCy/gWabz1gTIcvBUWX789KEMb3OXPhdwnaSsn/WfT2+B6IMxQSZcnPGJW3vgq0vZ
        Y2E1iP7leFJ3YTyOVUV2oOzgmY1jmpwCkxJJ1ZRTWGa5yOBCQeGYxn6XBXUUA/WdipPWh7
        9KoLiKr/apWAVVCBUHsKjkLXLUClVR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-Tsy6fUspP8KMwURCwpNcrg-1; Mon, 22 Nov 2021 17:06:41 -0500
X-MC-Unique: Tsy6fUspP8KMwURCwpNcrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5418C10144E3;
        Mon, 22 Nov 2021 22:06:40 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.226])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 890E657CD3;
        Mon, 22 Nov 2021 22:06:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 1/2] Input: silead - Add support for EFI-embedded fw using different min/max coordinates
Date:   Mon, 22 Nov 2021 23:06:36 +0100
Message-Id: <20211122220637.11386-2-hdegoede@redhat.com>
In-Reply-To: <20211122220637.11386-1-hdegoede@redhat.com>
References: <20211122220637.11386-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Unfortunately, at the time of writing this commit message, we have been
unable to get permission from Silead, or from device OEMs, to distribute
the necessary Silead firmware files in linux-firmware.

On a whole bunch of devices the UEFI BIOS code contains a touchscreen
driver, which contains an embedded copy of the firmware. The fw-loader
code has a "platform" fallback mechanism, which together with info on the
firmware from drivers/platform/x86/touchscreen_dmi.c will use the firmware
from the UEFI driver when the firmware is missing from /lib/firmware. This
makes the touchscreen work OOTB without users needing to manually download
the firmware.

The firmware bundled with the original Windows/Android is usually newer
then the firmware in the UEFI driver and it is better calibrated. This
better calibration can lead to significant differences in the reported
min/max coordinates.

Add support for a new (optional) "silead,efi-fw-min-max" property which
provides a set of alternative min/max values to use for the x/y axis when
the EFI embedded firmware is used.

The new property is only used on (x86) devices which do not use devicetree,
IOW it is not used in actual devicetree files. The devicetree-bindings
maintainers have requested properties like these to not be added to the
devicetree-bindings, so the new property is deliberately not added to the
existing silead devicetree-bindings documentation.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/silead.c | 73 ++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 1ee760bac0cf..caa25af53e6e 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -75,6 +75,8 @@ struct silead_ts_data {
 	struct input_mt_pos pos[SILEAD_MAX_FINGERS];
 	int slots[SILEAD_MAX_FINGERS];
 	int id[SILEAD_MAX_FINGERS];
+	u32 efi_fw_min_max[4];
+	bool efi_fw_min_max_set;
 };
 
 struct silead_fw_data {
@@ -82,6 +84,35 @@ struct silead_fw_data {
 	u32 val;
 };
 
+static void silead_apply_efi_fw_min_max(struct silead_ts_data *data)
+{
+	struct input_absinfo *absinfo_x = &data->input->absinfo[ABS_MT_POSITION_X];
+	struct input_absinfo *absinfo_y = &data->input->absinfo[ABS_MT_POSITION_Y];
+
+	if (!data->efi_fw_min_max_set)
+		return;
+
+	absinfo_x->minimum = data->efi_fw_min_max[0];
+	absinfo_x->maximum = data->efi_fw_min_max[1];
+	absinfo_y->minimum = data->efi_fw_min_max[2];
+	absinfo_y->maximum = data->efi_fw_min_max[3];
+
+	if (data->prop.invert_x) {
+		absinfo_x->maximum -= absinfo_x->minimum;
+		absinfo_x->minimum = 0;
+	}
+
+	if (data->prop.invert_y) {
+		absinfo_y->maximum -= absinfo_y->minimum;
+		absinfo_y->minimum = 0;
+	}
+
+	if (data->prop.swap_x_y) {
+		swap(absinfo_x->minimum, absinfo_y->minimum);
+		swap(absinfo_x->maximum, absinfo_y->maximum);
+	}
+}
+
 static int silead_ts_request_input_dev(struct silead_ts_data *data)
 {
 	struct device *dev = &data->client->dev;
@@ -97,6 +128,7 @@ static int silead_ts_request_input_dev(struct silead_ts_data *data)
 	input_set_abs_params(data->input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
 	input_set_abs_params(data->input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
 	touchscreen_parse_properties(data->input, true, &data->prop);
+	silead_apply_efi_fw_min_max(data);
 
 	input_mt_init_slots(data->input, data->max_fingers,
 			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED |
@@ -282,17 +314,48 @@ static int silead_ts_load_fw(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct silead_ts_data *data = i2c_get_clientdata(client);
-	unsigned int fw_size, i;
-	const struct firmware *fw;
+	const struct firmware *fw = NULL;
 	struct silead_fw_data *fw_data;
+	unsigned int fw_size, i;
 	int error;
 
 	dev_dbg(dev, "Firmware file name: %s", data->fw_name);
 
-	error = firmware_request_platform(&fw, data->fw_name, dev);
+	/*
+	 * Unfortunately, at the time of writing this comment, we have been unable to
+	 * get permission from Silead, or from device OEMs, to distribute the necessary
+	 * Silead firmware files in linux-firmware.
+	 *
+	 * On a whole bunch of devices the UEFI BIOS code contains a touchscreen driver,
+	 * which contains an embedded copy of the firmware. The fw-loader code has a
+	 * "platform" fallback mechanism, which together with info on the firmware
+	 * from drivers/platform/x86/touchscreen_dmi.c will use the firmware from the
+	 * UEFI driver when the firmware is missing from /lib/firmware. This makes the
+	 * touchscreen work OOTB without users needing to manually download the firmware.
+	 *
+	 * The firmware bundled with the original Windows/Android is usually newer then
+	 * the firmware in the UEFI driver and it is better calibrated. This better
+	 * calibration can lead to significant differences in the reported min/max
+	 * coordinates.
+	 *
+	 * To deal with this we first try to load the firmware without "platform"
+	 * fallback. If that fails we retry with "platform" fallback and if that
+	 * succeeds we apply an (optional) set of alternative min/max values from the
+	 * "silead,efi-fw-min-max" property.
+	 */
+	error = firmware_request_nowarn(&fw, data->fw_name, dev);
 	if (error) {
-		dev_err(dev, "Firmware request error %d\n", error);
-		return error;
+		error = firmware_request_platform(&fw, data->fw_name, dev);
+		if (error) {
+			dev_err(dev, "Firmware request error %d\n", error);
+			return error;
+		}
+
+		error = device_property_read_u32_array(dev, "silead,efi-fw-min-max",
+						       data->efi_fw_min_max,
+						       ARRAY_SIZE(data->efi_fw_min_max));
+		if (!error)
+			data->efi_fw_min_max_set = true;
 	}
 
 	fw_size = fw->size / sizeof(*fw_data);
-- 
2.33.1

