Return-Path: <linux-input+bounces-4388-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D89390B0B3
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 16:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A641F2806F
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 14:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032901891B0;
	Mon, 17 Jun 2024 13:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDwU64Zt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5441891AA;
	Mon, 17 Jun 2024 13:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630745; cv=none; b=DBzITUTN7O4LOsWCqZWthvHqtnvCUwX3Tk/Sj0iFVvOqWahcAR4n66N+v9M5SCRGiT2yJk+zerRJU4JVZjeaQdnVEQ3z5xx+yPmeKsZUlX/iUFGpNP9fTqGpftPKotQ2ObM3eVTuk18VAiZIF9hG+g+Xanz3Qve8BJTYpy6rZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630745; c=relaxed/simple;
	bh=7mpqN72nmQYbqkoHQDnypAYa/RZDGpRaZ0+DRZfej10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJJxjuc3aybGEm8CeTNQtAqF/EWT98AQ8WdiUTd3P2O9q0ZhDo8gvzGAgZ9tTNOMbggvAEbG9WrZmbzj3MNVX/ZE8fT8tafOiE9ATg4gk+hbWYqH5Pxdu5OF7fMK6d/5HCU5pTcgtfmmUGj8IfznNsj1CHeem0SuJ+58pJiY+Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDwU64Zt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECE7C2BD10;
	Mon, 17 Jun 2024 13:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630745;
	bh=7mpqN72nmQYbqkoHQDnypAYa/RZDGpRaZ0+DRZfej10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eDwU64Zte/0eMinDVB+rIiwmyOL9fQHKM8fQAC3YSnkrnW+03Vm7oyGlaooG1kJwZ
	 MhDoH+wbjg1mUU8qiUd0oPiIf0Ob7JoBh3SYtAJuuB5W0oBp+zLECltWFze+phg2NE
	 rZushANqQy9AlZ0tc+xcRXJX9GdFKBGAwTN3KsLXBb1jcHyfbtS2SLPIwhdvpaFVqf
	 vMUbH3o3njFoJGiLZ1TZIKCzUj7x9iNSDxvpk8D6RYX5JQw6xp1wGAlENhx7bSKQsN
	 zdyfH7FxDTONiHHmBo0JxJyArZ1xSZoIHpwrWDBiHeKXoKKvpFyrCSO/LHd90ulXob
	 bgOvJhaMUQQZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 23/29] Input: silead - Always support 10 fingers
Date: Mon, 17 Jun 2024 09:24:27 -0400
Message-ID: <20240617132456.2588952-23-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132456.2588952-1-sashal@kernel.org>
References: <20240617132456.2588952-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.94
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
index 3eef8c01090fd..30e15b6a93574 100644
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


