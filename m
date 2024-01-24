Return-Path: <linux-input+bounces-1434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9E383B32F
	for <lists+linux-input@lfdr.de>; Wed, 24 Jan 2024 21:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D0361F232DD
	for <lists+linux-input@lfdr.de>; Wed, 24 Jan 2024 20:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C4F7E760;
	Wed, 24 Jan 2024 20:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ni1Voonn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E95134740
	for <linux-input@vger.kernel.org>; Wed, 24 Jan 2024 20:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706129292; cv=none; b=nLTuinyTewWTbxWfYFbxBwwjlq1c49qANA18cGOKLZfYuu1o13j7VAcnV2Es8Ki7jr7lV+70T7nxU+Ay4n4sC23LiqNoDmy/GhZ5kimYuUgT21is/qEz/PVFXVKfZZq6YfAc+dAzwTTqrQRyCBddpQ95w5zh3n4njRMt5jJImBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706129292; c=relaxed/simple;
	bh=IWYYgf4rbO3bkPyfQAyXXt9wb2dSZquYyHmjLLkU0R4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nADjl8WoYm/yeHryEf21lVbj7fk5oXxYYZkkpLtD9NK9jQvWKm/aX1wY8A+B29uZVST7U4XhP1ogRWVOMd69wznTbM8k6RTQ024FcJBdqMxSZQpqoOxuP0bi1dQupgmwhIumrunf7vYKEjf1874pDw0h5KuUWNeISNIhYbxXz/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ni1Voonn; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6e0cc84fe4dso3296132a34.2
        for <linux-input@vger.kernel.org>; Wed, 24 Jan 2024 12:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706129281; x=1706734081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp1FxFFoeqCuLyZKJ4b0I/MPjBEdBmWc8V7BZ2u4Mus=;
        b=ni1VoonniKTQUixo8FLnCSzZsbE1nPBBTak7SkIMqSWEDpgmp4w1/z8rGeSg6uBB8I
         vEkB/Bgj14mSlSN0MYsiAC3kd2cWiLG414AeC2jLh2SouGxfLKTRp/xIRn5OrLeIhnj5
         ommeeCLIVi3fDsi3jWQp9boIatl/gVxtlZLcycanTISRLioLTuvdXFqPiYuikAJjGtL9
         OZWe5j6YWgBzEPwXQYa6o5/LcfPgqzfQqTotFN3xiQ84w76JT2DJaIBDf270DEcEwqMD
         zVS4FP3qOuNikS36KzLl3OJ1ofWDiZCBzf29broN9rLhYzdiGgHL+O6UknkpJnrtAj9q
         Dddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706129281; x=1706734081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xp1FxFFoeqCuLyZKJ4b0I/MPjBEdBmWc8V7BZ2u4Mus=;
        b=aI5wF7p3vKesdrU6x/SOr11538NpQWGAWgNIzrxTQsVbcV9H27Bi5NXUnM210ouItD
         P0gHT3LsooV6TOFToUDsKFclSBu8uz8DUPZliftDDmcCe+11X378+W2bUcdd651NN7jr
         YvmES98/jnHBGs/elb0OEeB5Hx6kgs3d6Y4pT77Bng2dZG3CymJzl+s9X1mQcXu+f/Rt
         W3kuDN6jpOF15yDF5BQ2sp/c7sS3adivHSbNznaU5UxW0YdARwBtv5mmyZ6/UYfDb2yp
         MDT6pUblyd41PkHRYtJyVK4xogjbi1J4X1O40fzeHn4ZrC2R5YOrSk7eIoNtcRMm7BIK
         zkqA==
X-Gm-Message-State: AOJu0YziinevqvHhMQGclnDE1VUjof1ICkqUhx6BxflUF6wxcWxJt++F
	Ohxj1NfDGBskvk7A3ZmvTbWHeKuOaAkWXlysGHUpTmlhqFNcxFF5Qa99uPWS
X-Google-Smtp-Source: AGHT+IEKoaVNsaxsEm9SaJ5VETErB293M/xgxyeQSnPIqYp0rQyOc5kWQ7mrqP5DA5gTvL2OVHpwTg==
X-Received: by 2002:a9d:6456:0:b0:6e0:b719:4f68 with SMTP id m22-20020a9d6456000000b006e0b7194f68mr1830405otl.26.1706129280869;
        Wed, 24 Jan 2024 12:48:00 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id g3-20020a9d6483000000b006d7eaaa65a4sm2738403otl.71.2024.01.24.12.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 12:48:00 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-input@vger.kernel.org
Cc: contact@artur-rojek.eu,
	hdegoede@redhat.com,
	paul@crapouillou.net,
	peter.hutterer@who-t.net,
	svv@google.com,
	biswarupp@google.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4] Input: adc-joystick: Handle inverted axes
Date: Wed, 24 Jan 2024 14:47:54 -0600
Message-Id: <20240124204754.43982-1-macroalpha82@gmail.com>
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
---
Changes since V3:
 - Add include for minmax.h.
 - Use swap() instead of min_array()/max_array().
 - Dropped Ack due to change.
Changes since V2:
 - Explicitly set bool value to "true" instead of "1".
 - Split adc_joystick_invert() function definition to 2 lines.
 - Corrected changes message location.
Changes since V1:
 - Moved proposed helper for inversion from input stack to adc-joystick
   driver.

 drivers/input/joystick/adc-joystick.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
index c0deff5d4282..3b05b2e413d0 100644
--- a/drivers/input/joystick/adc-joystick.c
+++ b/drivers/input/joystick/adc-joystick.c
@@ -7,6 +7,7 @@
 #include <linux/input.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/consumer.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -18,6 +19,7 @@ struct adc_joystick_axis {
 	s32 range[2];
 	s32 fuzz;
 	s32 flat;
+	bool inverted;
 };
 
 struct adc_joystick {
@@ -29,6 +31,15 @@ struct adc_joystick {
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
@@ -38,6 +49,8 @@ static void adc_joystick_poll(struct input_dev *input)
 		ret = iio_read_channel_raw(&joy->chans[i], &val);
 		if (ret < 0)
 			return;
+		if (joy->axes[i].inverted)
+			val = adc_joystick_invert(input, i, val);
 		input_report_abs(input, joy->axes[i].code, val);
 	}
 	input_sync(input);
@@ -86,6 +99,8 @@ static int adc_joystick_handle(const void *data, void *private)
 			val = sign_extend32(val, msb);
 		else
 			val &= GENMASK(msb, 0);
+		if (joy->axes[i].inverted)
+			val = adc_joystick_invert(joy->input, i, val);
 		input_report_abs(joy->input, joy->axes[i].code, val);
 	}
 
@@ -168,6 +183,12 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
 			goto err_fwnode_put;
 		}
 
+		if (axes[i].range[0] > axes[i].range[1]) {
+			dev_dbg(dev, "abs-axis %d inverted\n", i);
+			axes[i].inverted = true;
+			swap(axes[i].range[0], axes[i].range[1]);
+		}
+
 		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
 		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
 
-- 
2.34.1


