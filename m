Return-Path: <linux-input+bounces-4392-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A76390B347
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 17:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BB61B3CA29
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 14:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1BD1B9ADE;
	Mon, 17 Jun 2024 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPVhD/Vp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F368C1B9AD1;
	Mon, 17 Jun 2024 13:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630869; cv=none; b=ZrAJDAxmXMBZPnEHaMqyAG6gTGQW2uHUWdHxvv30UAFO7oa+KbgzL9ys/ETujOd5mPcwrFzJOwFdsLykJu73pK6PV+dgYezMWGi2LbXU/3IgLg5gShP8y+9SGBdmc3or2SfmmZO8qA7lCtBZUUTrTAF7aN3KH4JpIdAOrey5pts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630869; c=relaxed/simple;
	bh=ammvnG7uUFAATQsHx2GwECSfnAV9fnWA0Qmrc8H/Ubw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ByE3TkbU0YEj4g2eIynetDc6tk7JoVm7WXSB+uLbKuod7M/5hlm06IVEK1smmDBI4YKJzHXifhpzO3i8nlK1B6AspCDPiGPs2TiHyuIOcla+AstsD93MzIzq8/iCejCWHQg4RPU1CP20/PenJQOm7WgGZTgJ4IwlFxCc2IsQ+IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPVhD/Vp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13407C4AF1C;
	Mon, 17 Jun 2024 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630868;
	bh=ammvnG7uUFAATQsHx2GwECSfnAV9fnWA0Qmrc8H/Ubw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GPVhD/Vp1WvCTM7GBSEz0KdnBxTGTDVV3FVN2X+oPwIduz2LrEgTHqdSOMGWhot3g
	 +Y2kRRmRurfsZioRtGJukVvw16wHrzJJ96fkYVOka9VBGWIKUedhq4HuuFijVYVsvA
	 p3HJ6+q4yi8LOsPUeWKjSmD834v8KUEq7lL+X08J/kwgImOSux3aBty9tKvQM/szFX
	 I+XAoSg+sJGyoS4qFG8qi7ZiznV4Xvkr9atWhaAt1wUlaX/cPk7/dVZrxntvGivkpo
	 MIeIoGTCdN1SEsHPokzJO/lgHWW3jDA1QRS6F4l+SUfhxvTfGKGqEDDElbjQIXfeiO
	 GCvXAhw6ev49A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 6/9] Input: silead - Always support 10 fingers
Date: Mon, 17 Jun 2024 09:27:33 -0400
Message-ID: <20240617132739.2590390-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132739.2590390-1-sashal@kernel.org>
References: <20240617132739.2590390-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.278
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
index c8776146f1d1b..467feacdbd7a2 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -70,7 +70,6 @@ struct silead_ts_data {
 	struct regulator_bulk_data regulators[2];
 	char fw_name[64];
 	struct touchscreen_properties prop;
-	u32 max_fingers;
 	u32 chip_id;
 	struct input_mt_pos pos[SILEAD_MAX_FINGERS];
 	int slots[SILEAD_MAX_FINGERS];
@@ -98,7 +97,7 @@ static int silead_ts_request_input_dev(struct silead_ts_data *data)
 	input_set_abs_params(data->input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
 	touchscreen_parse_properties(data->input, true, &data->prop);
 
-	input_mt_init_slots(data->input, data->max_fingers,
+	input_mt_init_slots(data->input, SILEAD_MAX_FINGERS,
 			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED |
 			    INPUT_MT_TRACK);
 
@@ -145,10 +144,10 @@ static void silead_ts_read_data(struct i2c_client *client)
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
 
 	touch_nr = 0;
@@ -200,7 +199,6 @@ static void silead_ts_read_data(struct i2c_client *client)
 
 static int silead_ts_init(struct i2c_client *client)
 {
-	struct silead_ts_data *data = i2c_get_clientdata(client);
 	int error;
 
 	error = i2c_smbus_write_byte_data(client, SILEAD_REG_RESET,
@@ -210,7 +208,7 @@ static int silead_ts_init(struct i2c_client *client)
 	usleep_range(SILEAD_CMD_SLEEP_MIN, SILEAD_CMD_SLEEP_MAX);
 
 	error = i2c_smbus_write_byte_data(client, SILEAD_REG_TOUCH_NR,
-					data->max_fingers);
+					  SILEAD_MAX_FINGERS);
 	if (error)
 		goto i2c_write_err;
 	usleep_range(SILEAD_CMD_SLEEP_MIN, SILEAD_CMD_SLEEP_MAX);
@@ -437,13 +435,6 @@ static void silead_ts_read_props(struct i2c_client *client)
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


