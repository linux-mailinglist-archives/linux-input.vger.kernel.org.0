Return-Path: <linux-input+bounces-4422-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3390CEF4
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 15:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 063642824A4
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 13:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA291BD919;
	Tue, 18 Jun 2024 12:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugpXHj+r"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2CC1BD90E;
	Tue, 18 Jun 2024 12:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714608; cv=none; b=MJGviV1Hx2upl/Vp+R08LQQUvP7EF3OnNqWJB9Nzf4hv2HB8HIimhM/7jXgKtLBq32aMby5IAw/qGLw06iz8RYQdLKegqkeJYFwRUhDLKvy0cACZl+KpgcGHOA2+1Us5sOkMBdrujCqyXjenv1hA/9b717yFoPcOsaZhbwHLc0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714608; c=relaxed/simple;
	bh=LT0e38FDAzuCEIXjVCqLuyoMGXGIH5huwYm8ySJ7Avw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rh2IY9X3A4sMfgriPxZzptAvLTyrF+aeikeOgfRnQiO+mX17s+OXXVwcmpGtxVXTU4LeMdG333X3xkX4j7opSTOppeh16mIKHHHWCpelOrLK4NubbUtIsN6TJEX6/YHvXTyd9/0/nJPsk+rNhGFJP/Pyyc+RqUqCzmP5sXGuCnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugpXHj+r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5222C3277B;
	Tue, 18 Jun 2024 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714608;
	bh=LT0e38FDAzuCEIXjVCqLuyoMGXGIH5huwYm8ySJ7Avw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ugpXHj+rfCjLnN3BKsxID8UON1ZOiSlgQ7hwcTHcPbEFfk1xJQbtoYkcY9M14WVFU
	 KYWcIxnkk9mHFidwKuEFVBz5j8DZiEqWPoFfY0+TUJMtugMwMkeAXgcIlWAgsfaprJ
	 sRzgWN8mPshGGU7iP21Aw2rumnG7cUCWjFdrVT2yP3az0kYhgy2GzW2G6oYoweSAOn
	 UwCt8kGIbVCwSwYnC8jXnF7xEmJO/tf+IrLd/VPTZfPnTPUIbtVR8HogeGuqccy7eP
	 g7kum/9KftRQL+eEg4PuH+m5Bt11KvD04nR22BIyM+zq07R05kEGBnTlv26XtLFpnL
	 h9oyJMGetHKSQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 6/9] Input: silead - Always support 10 fingers
Date: Tue, 18 Jun 2024 08:43:12 -0400
Message-ID: <20240618124318.3304798-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618124318.3304798-1-sashal@kernel.org>
References: <20240618124318.3304798-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.316
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
index a787a6aefc69f..78f08ca3f8442 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -78,7 +78,6 @@ struct silead_ts_data {
 	struct regulator_bulk_data regulators[2];
 	char fw_name[64];
 	struct touchscreen_properties prop;
-	u32 max_fingers;
 	u32 chip_id;
 	struct input_mt_pos pos[SILEAD_MAX_FINGERS];
 	int slots[SILEAD_MAX_FINGERS];
@@ -106,7 +105,7 @@ static int silead_ts_request_input_dev(struct silead_ts_data *data)
 	input_set_abs_params(data->input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
 	touchscreen_parse_properties(data->input, true, &data->prop);
 
-	input_mt_init_slots(data->input, data->max_fingers,
+	input_mt_init_slots(data->input, SILEAD_MAX_FINGERS,
 			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED |
 			    INPUT_MT_TRACK);
 
@@ -153,10 +152,10 @@ static void silead_ts_read_data(struct i2c_client *client)
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
@@ -208,7 +207,6 @@ static void silead_ts_read_data(struct i2c_client *client)
 
 static int silead_ts_init(struct i2c_client *client)
 {
-	struct silead_ts_data *data = i2c_get_clientdata(client);
 	int error;
 
 	error = i2c_smbus_write_byte_data(client, SILEAD_REG_RESET,
@@ -218,7 +216,7 @@ static int silead_ts_init(struct i2c_client *client)
 	usleep_range(SILEAD_CMD_SLEEP_MIN, SILEAD_CMD_SLEEP_MAX);
 
 	error = i2c_smbus_write_byte_data(client, SILEAD_REG_TOUCH_NR,
-					data->max_fingers);
+					  SILEAD_MAX_FINGERS);
 	if (error)
 		goto i2c_write_err;
 	usleep_range(SILEAD_CMD_SLEEP_MIN, SILEAD_CMD_SLEEP_MAX);
@@ -445,13 +443,6 @@ static void silead_ts_read_props(struct i2c_client *client)
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


