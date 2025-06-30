Return-Path: <linux-input+bounces-13195-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89BAED9A3
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 12:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28A6D189AC35
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 10:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9088525A2B4;
	Mon, 30 Jun 2025 10:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="QWENp+4+"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D406259C85;
	Mon, 30 Jun 2025 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278801; cv=pass; b=rmpQVsX2vUFj/aG21tii7gwsd/wj9M0IOD5RBBM1tf/VUvNbvqTS1HUzuuy+qOjxE2wzKZ8eqetbn6ZtovBBqdxdLz7B6nfZWkRW2DVKYAzPHUZyQ23xhmyxsyPmsq+3LHOz4PUS5arPUlP908zoPHNiSVVmtyDZ1SFcbJDT41w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278801; c=relaxed/simple;
	bh=4eyvv0/2giuD4Q5COyMgr9Lxtd2J8gTHuQte5/vtILk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h0MAqK/XM3Ir498PcyXeB0ehWvFOnTu9RxHSUzRnsGHSxmdTQrhZ5Lg4RRoK7/v804odvgsc9eFHZVnHces3fSz8Tj1CB9D999T0uGyFGNxVHU1sPWWgnxbhQctAzZoU+oB6AVCoQuZXoKAZgZ1RKw2vjvHZDL/GzKLia3Djqy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=QWENp+4+; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1751278780; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jROBuHf0xcyCm8EJp0YEPAO+1wuYvGA9BllRQAAUkju9dEqdDp+Y7iqHrhFGZ3tSTrirfTL9tkOUeJiaXHcahDeCqtDRU5Nw5b+POayxdC4em5heAPSG9Nc9HC27MHuzPtZLe5LLw7tnic5QeI4ehOQVXizfFO1Z49sJH+yU1Fc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751278780; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WFu69/QqOwnD97nGaVd7ct9S+S2KCBb9pcd5mzHtYXU=; 
	b=IdPK/3CstqL1VXykLEs1XNKwqW+rvCR1HCXkFSecOUhJrInAs8oJr4Gpj0NJAag3/ia+vz4938QQfs/Uw6I7Bx8JTYs71GBsWNdgiae6b+WAGkjHGBPxiOhYnexT3hBUEA5uNeuwngNQSNeqDwof0Bm0r93aGKdR/+a3M+7GgUU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751278780;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=WFu69/QqOwnD97nGaVd7ct9S+S2KCBb9pcd5mzHtYXU=;
	b=QWENp+4+IXgftLgYRZiqAOgSZ3OgoNfMGaioQ8KyiFl5u5OC9QYfICWpNR/acv0i
	rmmESTZ9QacXO9I717FwdAuaydQXLA9hW1rNZ40VlfhiXkmJUKV9R1S5bfFTOkfWJf6
	Aah1b/NA168jbH/JCokQ0M5mrKmwhu03nhFYg1Po=
Received: by mx.zohomail.com with SMTPS id 1751278778027201.13477834233447;
	Mon, 30 Jun 2025 03:19:38 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 30 Jun 2025 12:19:25 +0200
Subject: [PATCH 2/4] Input: adc-keys - support types that aren't just
 keyboard keys
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-rock4d-audio-v1-2-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
In-Reply-To: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

Instead of doing something like what gpio-keys is doing, adc-keys
hardcodes that all keycodes must be of type EV_KEY.

This limits the usefulness of adc-keys, and overcomplicates the code
with manual bit-setting logic.

Instead, refactor the code to read the linux,input-type fwnode property,
and get rid of the custom bit setting logic, replacing it with
input_set_capability instead. input_report_key is replaced with
input_event, which allows us to explicitly pass the type.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/input/keyboard/adc-keys.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adc-keys.c b/drivers/input/keyboard/adc-keys.c
index f1753207429db02ce6510e5ec0da9b24d9edb61d..339dd4d4a0842108da2c6136b1e0098cd1f6a3cd 100644
--- a/drivers/input/keyboard/adc-keys.c
+++ b/drivers/input/keyboard/adc-keys.c
@@ -19,12 +19,14 @@
 struct adc_keys_button {
 	u32 voltage;
 	u32 keycode;
+	u32 type;
 };
 
 struct adc_keys_state {
 	struct iio_channel *channel;
 	u32 num_keys;
 	u32 last_key;
+	u32 last_type;
 	u32 keyup_voltage;
 	const struct adc_keys_button *map;
 };
@@ -35,6 +37,7 @@ static void adc_keys_poll(struct input_dev *input)
 	int i, value, ret;
 	u32 diff, closest = 0xffffffff;
 	int keycode = 0;
+	u32 type = EV_KEY;
 
 	ret = iio_read_channel_processed(st->channel, &value);
 	if (unlikely(ret < 0)) {
@@ -46,6 +49,7 @@ static void adc_keys_poll(struct input_dev *input)
 			if (diff < closest) {
 				closest = diff;
 				keycode = st->map[i].keycode;
+				type = st->map[i].type;
 			}
 		}
 	}
@@ -54,13 +58,14 @@ static void adc_keys_poll(struct input_dev *input)
 		keycode = 0;
 
 	if (st->last_key && st->last_key != keycode)
-		input_report_key(input, st->last_key, 0);
+		input_event(input, st->last_type, st->last_key, 0);
 
 	if (keycode)
-		input_report_key(input, keycode, 1);
+		input_event(input, type, keycode, 1);
 
 	input_sync(input);
 	st->last_key = keycode;
+	st->last_type = type;
 }
 
 static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
@@ -93,6 +98,10 @@ static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
 			return -EINVAL;
 		}
 
+		if (fwnode_property_read_u32(child, "linux,input-type",
+					     &map[i].type))
+			map[i].type = EV_KEY;
+
 		i++;
 	}
 
@@ -156,9 +165,8 @@ static int adc_keys_probe(struct platform_device *pdev)
 	input->id.product = 0x0001;
 	input->id.version = 0x0100;
 
-	__set_bit(EV_KEY, input->evbit);
 	for (i = 0; i < st->num_keys; i++)
-		__set_bit(st->map[i].keycode, input->keybit);
+		input_set_capability(input, st->map[i].type, st->map[i].keycode);
 
 	if (device_property_read_bool(dev, "autorepeat"))
 		__set_bit(EV_REP, input->evbit);

-- 
2.50.0


