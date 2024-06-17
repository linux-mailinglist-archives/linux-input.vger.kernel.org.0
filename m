Return-Path: <linux-input+bounces-4380-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3A890AF7C
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 15:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DC871F209B0
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 13:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D7F1AD9C5;
	Mon, 17 Jun 2024 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbxkO72c"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEA01AED41;
	Mon, 17 Jun 2024 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630526; cv=none; b=Q6z+iA/1+wx+22dRpLQJpX6wO23fWseXHbg2uwPDZc7i3GSERFIwFv/XV65Td08oDxwacHZtPkmYvQAl0x+BNEbuEehGDrdL7+KaaRKLTqbt2puG+imTL82mSx/lwVRTmfp1IwtvdpwGP3845MuWilh2lz+LphVlJdCzNbc2ttk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630526; c=relaxed/simple;
	bh=hrFQYKSoSedno6t/TMSRyd6Lxlx09BkJvdjqaOsR+cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pW2yfLmxugoXcipB1eeYzcpLxooA7t2uasB7ls5b4yAVE31MouX3pz53A68EQasC11Mf8uBO+IOuENZOdRv9yv8V6Zl48wxfRt5cNpt62DEXzgGflRQMghiO/9senPQbfeneOiyngRxDxfXvv0Cq3mTOv5NxZWDVHhuZ8xR11lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbxkO72c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758CCC4AF49;
	Mon, 17 Jun 2024 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630526;
	bh=hrFQYKSoSedno6t/TMSRyd6Lxlx09BkJvdjqaOsR+cQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cbxkO72cYbLevNrSHoe7JacwYEJSDsRQKo2nHQVFxtd7WmtDqdnEmy4DWHTjNU12/
	 NtXv2/1eiPcCNej1pQNB7BE3FwX2tB5OBydK9UlOHyvVnfeXhpcvQSjkrD6s/hq3E1
	 +2AA7Sw+aFUzRlrzUgTLjx7XikGJe9EGDZK2N4sC+aZcoGLTXcfMW2gqJOLYFnzsPd
	 UboCAtUVhZx8LvGQqGy6/senO/4CEMFwLH2KcGWuSJSCWGTnLgDbciOuzQwthU5+e+
	 bVzZzRg5g4D8GD7y6QHzeaJp8Nvwf5PaWmQQ6C7Dsok1vVur+nCNSiC8s37C4CB8Sz
	 nYcbz6D/hUg7A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 32/44] Input: silead - Always support 10 fingers
Date: Mon, 17 Jun 2024 09:19:45 -0400
Message-ID: <20240617132046.2587008-32-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132046.2587008-1-sashal@kernel.org>
References: <20240617132046.2587008-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.5
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 38a38f5a36da9820680d413972cb733349400532 ]

When support for Silead touchscreens was orginal added some touchscreens
with older firmware versions only supported 5 fingers and this was made
the default requiring the setting of a "silead,max-fingers=10" uint32
device-property for all touchscreen models which do support 10 fingers.

There are very few models with the old 5 finger fw, so in practice the
setting of the "silead,max-fingers=10" is boilerplate which needs to
be copy and pasted to every touchscreen config.

Reporting that 10 fingers are supported on devices which only support
5 fingers doesn't cause any problems for userspace in practice, since
at max 4 finger gestures are supported anyways. Drop the max_fingers
configuration and simply always assume 10 fingers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/r/20240525193854.39130-2-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/touchscreen/silead.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 62f562ad50263..050fa9ca4ec94 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -71,7 +71,6 @@ struct silead_ts_data {
 	struct regulator_bulk_data regulators[2];
 	char fw_name[64];
 	struct touchscreen_properties prop;
-	u32 max_fingers;
 	u32 chip_id;
 	struct input_mt_pos pos[SILEAD_MAX_FINGERS];
 	int slots[SILEAD_MAX_FINGERS];
@@ -136,7 +135,7 @@ static int silead_ts_request_input_dev(struct silead_ts_data *data)
 	touchscreen_parse_properties(data->input, true, &data->prop);
 	silead_apply_efi_fw_min_max(data);
 
-	input_mt_init_slots(data->input, data->max_fingers,
+	input_mt_init_slots(data->input, SILEAD_MAX_FINGERS,
 			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED |
 			    INPUT_MT_TRACK);
 
@@ -256,10 +255,10 @@ static void silead_ts_read_data(struct i2c_client *client)
 		return;
 	}
 
-	if (buf[0] > data->max_fingers) {
+	if (buf[0] > SILEAD_MAX_FINGERS) {
 		dev_warn(dev, "More touches reported then supported %d > %d\n",
-			 buf[0], data->max_fingers);
-		buf[0] = data->max_fingers;
+			 buf[0], SILEAD_MAX_FINGERS);
+		buf[0] = SILEAD_MAX_FINGERS;
 	}
 
 	if (silead_ts_handle_pen_data(data, buf))
@@ -315,7 +314,6 @@ static void silead_ts_read_data(struct i2c_client *client)
 
 static int silead_ts_init(struct i2c_client *client)
 {
-	struct silead_ts_data *data = i2c_get_clientdata(client);
 	int error;
 
 	error = i2c_smbus_write_byte_data(client, SILEAD_REG_RESET,
@@ -325,7 +323,7 @@ static int silead_ts_init(struct i2c_client *client)
 	usleep_range(SILEAD_CMD_SLEEP_MIN, SILEAD_CMD_SLEEP_MAX);
 
 	error = i2c_smbus_write_byte_data(client, SILEAD_REG_TOUCH_NR,
-					data->max_fingers);
+					  SILEAD_MAX_FINGERS);
 	if (error)
 		goto i2c_write_err;
 	usleep_range(SILEAD_CMD_SLEEP_MIN, SILEAD_CMD_SLEEP_MAX);
@@ -591,13 +589,6 @@ static void silead_ts_read_props(struct i2c_client *client)
 	const char *str;
 	int error;
 
-	error = device_property_read_u32(dev, "silead,max-fingers",
-					 &data->max_fingers);
-	if (error) {
-		dev_dbg(dev, "Max fingers read error %d\n", error);
-		data->max_fingers = 5; /* Most devices handle up-to 5 fingers */
-	}
-
 	error = device_property_read_string(dev, "firmware-name", &str);
 	if (!error)
 		snprintf(data->fw_name, sizeof(data->fw_name),
-- 
2.43.0


