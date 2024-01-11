Return-Path: <linux-input+bounces-1215-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD982B6F6
	for <lists+linux-input@lfdr.de>; Thu, 11 Jan 2024 23:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FCEF1F257B7
	for <lists+linux-input@lfdr.de>; Thu, 11 Jan 2024 22:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC6358211;
	Thu, 11 Jan 2024 22:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ys2b9q+x"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A229F5820D
	for <linux-input@vger.kernel.org>; Thu, 11 Jan 2024 22:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-205f223639fso3459544fac.2
        for <linux-input@vger.kernel.org>; Thu, 11 Jan 2024 14:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705010623; x=1705615423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ny1O22scj7yyurpBziyhmRkqeBcEhatzHZFKPveBnIA=;
        b=Ys2b9q+x0IwHlvJbfQhiTMMuvcO0kXZgDEPzXIxX+LLCIqyZBRCfZ8UsW7Aj+kKC6h
         G2olZObHOQuefXUvs0fKL9+95jfig/ebWP9icurSRqai+8T2PDJoS1/F/Fk0B+BerGi0
         38J6iQ53VJwFTePg++o0HL9yq1J2JRTrs3ElCvAl2ArsXsRNqf1vRP0lbjxuaVpncxPX
         HEFbWK1xHJG/ddgJF6Qem9fdy8M/9pgQv6+daWCOa8xhgcEdiV+g1VcIPgU52WbPstad
         4ESWnVNHyPZ76w2pBAG5lLsyo63L3Io0NbO5NlFpoNrehb/8JVdq3rl8wJz3LHEyJ06R
         w3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705010623; x=1705615423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ny1O22scj7yyurpBziyhmRkqeBcEhatzHZFKPveBnIA=;
        b=idwjB/yXVIhw4QEHT+jEDjYPLhGVMTB9BzIadohqt8+Ok/p5I+sD2rxZ9VQ8oseb9w
         HRhzUspXYEAZDo/3QXWoZkNu5RyimeeNKJ8Z++Vow7qdOVkwewZzC4aaS1pZ4W0KSD4i
         XO1qvANhASjDsreKtAFpl6L7nIDPwJ6ZySIPXLTg8rHDngsjZx5re2WKHveP7hzpgWTO
         TLrOnIqwzelFp6PwJAo1ymJisFXebKL4LDyN02iaZwThbKveLx/yr/EnHCbxIK1VCua8
         DSKreUUF4S46sOj5AkiXvuNrGL5UECiGTulotlwgds/twmeKHGGmgnsQTNS6Ucnj5VwK
         IrEw==
X-Gm-Message-State: AOJu0YzHphVjUrvxRWzaU4zyzPbbhX14yC/nylBSyHovxHrCLBLBSMY8
	9SWpvkm86rvR/p4PpUt6LjX2kj0oicVLOQ==
X-Google-Smtp-Source: AGHT+IEAf8EQyhAxXt7s+JDv9Go9SlMmgV2wXOeoy10V53yGt+b8F0tiTwGeZgddFAEGwRhdI+9vrQ==
X-Received: by 2002:a05:6871:410b:b0:204:3793:27e8 with SMTP id la11-20020a056871410b00b00204379327e8mr490112oab.58.1705010623517;
        Thu, 11 Jan 2024 14:03:43 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id d6-20020a9d51c6000000b006dc81d1d203sm319909oth.73.2024.01.11.14.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 14:03:43 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	hdegoede@redhat.com,
	paul@crapouillou.net,
	peter.hutterer@who-t.net,
	svv@google.com,
	biswarupp@google.com,
	contact@artur-rojek.eu,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2] Input: adc-joystick: Handle inverted axes
Date: Thu, 11 Jan 2024 16:03:33 -0600
Message-Id: <20240111220333.66060-1-macroalpha82@gmail.com>
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

Changes since V1:
 - Moved proposed helper for inversion from input stack to adc-joystick
   driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/input/joystick/adc-joystick.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
index c0deff5d4282..46197ebd3564 100644
--- a/drivers/input/joystick/adc-joystick.c
+++ b/drivers/input/joystick/adc-joystick.c
@@ -18,6 +18,7 @@ struct adc_joystick_axis {
 	s32 range[2];
 	s32 fuzz;
 	s32 flat;
+	bool inverted;
 };
 
 struct adc_joystick {
@@ -29,6 +30,14 @@ struct adc_joystick {
 	bool polled;
 };
 
+static int adc_joystick_invert(struct input_dev *dev, unsigned int axis, int val)
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
@@ -38,6 +47,8 @@ static void adc_joystick_poll(struct input_dev *input)
 		ret = iio_read_channel_raw(&joy->chans[i], &val);
 		if (ret < 0)
 			return;
+		if (joy->axes[i].inverted)
+			val = adc_joystick_invert(input, i, val);
 		input_report_abs(input, joy->axes[i].code, val);
 	}
 	input_sync(input);
@@ -86,6 +97,8 @@ static int adc_joystick_handle(const void *data, void *private)
 			val = sign_extend32(val, msb);
 		else
 			val &= GENMASK(msb, 0);
+		if (joy->axes[i].inverted)
+			val = adc_joystick_invert(joy->input, i, val);
 		input_report_abs(joy->input, joy->axes[i].code, val);
 	}
 
@@ -168,11 +181,17 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
 			goto err_fwnode_put;
 		}
 
+		if (axes[i].range[0] > axes[i].range[1]) {
+			dev_dbg(dev, "abs-axis %d inverted\n", i);
+			axes[i].inverted = 1;
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


