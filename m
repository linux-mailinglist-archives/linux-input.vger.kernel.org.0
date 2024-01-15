Return-Path: <linux-input+bounces-1252-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E082E0A4
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 20:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87DEC1C20E7F
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 19:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E661D18B09;
	Mon, 15 Jan 2024 19:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLj0GxhO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E56D18B06
	for <linux-input@vger.kernel.org>; Mon, 15 Jan 2024 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-204235d0913so5702481fac.1
        for <linux-input@vger.kernel.org>; Mon, 15 Jan 2024 11:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705346877; x=1705951677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1G7YsSZz0CN9krRgvjglwqVS0MSdhGltg2BK+fTJckU=;
        b=hLj0GxhO/z/CDWUm1F+eO/hw+7h8mdpuBnmPCL7uUWTV59Z30RsBfIctRDhUxTqeLq
         +6qUg9ximM6pnFDqzpvOj0/C4s28g6vwhx0FOIq5c0X9rPdikdJ8WPyNoin84TDIMHPb
         +fRk3xsCEROm9hiATdEYM+2ArbBDyrI0+bBVbqSsow1Edg0tAsEEgi0st0v0unb8XKFG
         63lgg49rR+ml+2y3MHCIKJ6DQ5EdQEAk5yi1ff2fqd4EiAmXHW8Zw8yrNl1/ihRmO5Wv
         Aj7YkStY2GURW+bFtNfnI5bXY4UyLWQyMZ/1G2ApVo6tv+pmeBpnWpxZ8L4qL/PFqzEU
         gylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705346877; x=1705951677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1G7YsSZz0CN9krRgvjglwqVS0MSdhGltg2BK+fTJckU=;
        b=VFqx96A0LNTdMCQV9dKVVFMVDT/aGlxYbw4VQVa56bE9hFjipNqss8tS6338m9CJMh
         KxT6mam2K13TSy+kJn0elch7DkHnse816TeWbeR96MaEu0IEetGkGmtK19kCppUiEQBG
         mfr6ZgrG4SQ+MkuxAgnms3VM4aJ600HjuJRM2Rgoumco/NNdCoO9FTcX3GuZdBMcLHse
         CL+dumz+QDI0iBKZVSNJ/EXtgDk6UCWbiS8kpKfyCgawzYb1/7m+2GYrcCZn/I5+y7Nu
         aVyD3gBJrux4YdLLYd5pIysbnlrVSlB2juX5O/02y9V+EvDoZAeziNIxcX3MM9KhQOJM
         56ug==
X-Gm-Message-State: AOJu0Yx24pm98Z15APwQu5ywAzd/NfUDZVI4KE0bg8CLw6yLiJdYh83T
	N5eXlvNHYgIujouKOilbjX6aqI/7wpExwQ==
X-Google-Smtp-Source: AGHT+IFfFg1zPYzdqgTt7Nw9QOPw8AtWuKm4y4o7JHVZjjelPxUT4pkF+JbKk+QhPMeNZ5qwzvNpYw==
X-Received: by 2002:a05:6871:5cd:b0:204:4112:feda with SMTP id v13-20020a05687105cd00b002044112fedamr8097054oan.17.1705346877190;
        Mon, 15 Jan 2024 11:27:57 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id d7-20020a9d5e07000000b006dbf5ca14b9sm1645305oti.47.2024.01.15.11.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 11:27:56 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-input@vger.kernel.org
Cc: contact@artur-rojek.eu,
	dmitry.torokhov@gmail.com,
	hdegoede@redhat.com,
	paul@crapouillou.net,
	peter.hutterer@who-t.net,
	svv@google.com,
	biswarupp@google.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v3] Input: adc-joystick: Handle inverted axes
Date: Mon, 15 Jan 2024 13:27:52 -0600
Message-Id: <20240115192752.266367-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

When one or more axes are inverted, (where min > max), normalize the
data so that min < max and invert the values reported to the input
stack.

This ensures we can continue defining the device correctly in the
device tree while not breaking downstream assumptions that min is
always less than max.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Artur Rojek <contact@artur-rojek.eu>
---
Changes since V2:
 - Explicitly set bool value to "true" instead of "1".
 - Split adc_joystick_invert() function definition to 2 lines.
 - Corrected changes message location.
Changes since V1:
 - Moved proposed helper for inversion from input stack to adc-joystick
   driver.

 drivers/input/joystick/adc-joystick.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
index c0deff5d4282..6b155e614b5a 100644
--- a/drivers/input/joystick/adc-joystick.c
+++ b/drivers/input/joystick/adc-joystick.c
@@ -18,6 +18,7 @@ struct adc_joystick_axis {
 	s32 range[2];
 	s32 fuzz;
 	s32 flat;
+	bool inverted;
 };
 
 struct adc_joystick {
@@ -29,6 +30,15 @@ struct adc_joystick {
 	bool polled;
 };
 
+static int adc_joystick_invert(struct input_dev *dev,
+			       unsigned int axis, int val)
+{
+	int min = dev->absinfo[axis].minimum;
+	int max = dev->absinfo[axis].maximum;
+
+	return (max + min) - val;
+}
+
 static void adc_joystick_poll(struct input_dev *input)
 {
 	struct adc_joystick *joy = input_get_drvdata(input);
@@ -38,6 +48,8 @@ static void adc_joystick_poll(struct input_dev *input)
 		ret = iio_read_channel_raw(&joy->chans[i], &val);
 		if (ret < 0)
 			return;
+		if (joy->axes[i].inverted)
+			val = adc_joystick_invert(input, i, val);
 		input_report_abs(input, joy->axes[i].code, val);
 	}
 	input_sync(input);
@@ -86,6 +98,8 @@ static int adc_joystick_handle(const void *data, void *private)
 			val = sign_extend32(val, msb);
 		else
 			val &= GENMASK(msb, 0);
+		if (joy->axes[i].inverted)
+			val = adc_joystick_invert(joy->input, i, val);
 		input_report_abs(joy->input, joy->axes[i].code, val);
 	}
 
@@ -168,11 +182,17 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
 			goto err_fwnode_put;
 		}
 
+		if (axes[i].range[0] > axes[i].range[1]) {
+			dev_dbg(dev, "abs-axis %d inverted\n", i);
+			axes[i].inverted = true;
+		}
+
 		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
 		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
 
 		input_set_abs_params(joy->input, axes[i].code,
-				     axes[i].range[0], axes[i].range[1],
+				     min_array(axes[i].range, 2),
+				     max_array(axes[i].range, 2),
 				     axes[i].fuzz, axes[i].flat);
 		input_set_capability(joy->input, EV_ABS, axes[i].code);
 	}
-- 
2.34.1


