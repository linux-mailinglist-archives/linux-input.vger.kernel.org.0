Return-Path: <linux-input+bounces-8483-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6661B9EBB66
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 22:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B237018806CC
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 21:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DF822D4CA;
	Tue, 10 Dec 2024 21:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6ZQaCti"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BD41BD9E9
	for <linux-input@vger.kernel.org>; Tue, 10 Dec 2024 21:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733864468; cv=none; b=t2xq2GCmMkTXEnxceSO7XUpofNF8wGgRL59Hh+JVqpMd68P5PIiIfExW+Z+WwqFLamua9d7Iw9Z6aZEGDzpt0SPtePKlvVtCBsW5LW/ybgyvVOJjAGVx0HnSG7ir8b95fPIpOt1yNXyS6VtImeGCPuggL8Q8ApiRgCrs+Zjssj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733864468; c=relaxed/simple;
	bh=kn2zLn6+c4GewCdeZl3qVtflE53ih10wTlFJk59NyNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeiIjpMkXFcNTCKi3Hfk0bMyCdqukuxrA3Edz41w8CnDLK3gh3bUO+tfD32l/VYE/FQ/Vs8bk9aVMIO5UnbggRDgsGGDytB43j87FHRyNobuNiOJkovVoetiIl7haTdufDaobiiamCMy/ED1koNv/gmuocXMWJoN0QOx69wg0ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6ZQaCti; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216426b0865so26097265ad.0
        for <linux-input@vger.kernel.org>; Tue, 10 Dec 2024 13:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864466; x=1734469266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jRpN9f+Qwyf6/7hWUZysB3z1EtHm0ttDZm4S3DjEg7k=;
        b=f6ZQaCtiQ91pIpxbG7G1firiYgY3/9PJFfmcoLeiSEppywFOzacEY3ThemTDdhEQ34
         0Smj6EaRWyOQ7Bgz1r6GBFaxwP03hkYgtwOc8wizkPBl6K8VWqjqhINzEeRutJotPYlS
         0bXWybcomeEPD0r1+9anbn8RZFUBVP8XQN4iF1/SMCR5T+r/INSkLqc1QbRIlfd6PQDF
         vpBkNoVJkd0RqVQi2XyB0t6aY/iCJcuJ1qXK4+/VN6THqsUaas5/84reX3RUPsqowO9s
         46RK425MW5ek37NOX7prCE6w68byjqh2NKtsXR5gE2GSWiggkbmiddnmJQK7ppPFmsar
         /xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864466; x=1734469266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRpN9f+Qwyf6/7hWUZysB3z1EtHm0ttDZm4S3DjEg7k=;
        b=HecM1FNTVoCe1+9DW2WUdl4yaxaAi84bSB0LSmAqqw6flC98Gm6yk43+8RMXZHwEvs
         6Oj5KwXDt+c0wP6AXUm5Mm/UMya+klSR4TSeGrNvEn34b8maL0MXeY68HfhaMdwTS/3l
         ZFQRDhMnWJBUr59kTsmu5hU00af6Q3Y4yHhJD8E8K3HK0YSCHHbwKvbxhy3KdHIes/Fa
         tRM91gMBh26yxkzhZwfTVV/nbfygGHQXQMp74VlHcS1G2LnOzcWNI2xMONBjXdhOotFW
         GV3BNsoiy857j5yeI4RuSBwLS4wFZNnatW7t/+Ob8FcQByAWg2duFzS7sgdEItb2xb+U
         t+cA==
X-Gm-Message-State: AOJu0YyP81CGVvo/+qQik9LqIBbwsAFjJUHNJs04amelGJ3+egvLvjDy
	SGGEaQOpnlJU2SgKhPE8y8C3kvYkF+mcKzTN13OTmvm0xgDSufEyuXHOeQ==
X-Gm-Gg: ASbGnctlx2P8BWE7DqarAPx0+olJXy7v6d1rzgzL0KNOXYKKwd7fLfZlDhwF4eMfGkf
	GfaoPxLecwzT7E25N/aIMsbBmHN3VcfslCNuGAT/GffzrgDdPIh6SnP6chmguwnWkELYlGS1+C0
	7r565ZcDsCvwjQ0C0zLE4anwTJNa9pLYerCCt4jq/wilxhUygY/rMBL/Ex8T4OtEZI6v1urjbga
	ZDynQE1wf7YHadC2WfbbsI2zpXffbaucACruEFubJ2sBVCfte5LqJy97f+9P+lQyjfOs1Y+SAV3
	F8L8OuK1mZSIC0jX8WKdHo99
X-Google-Smtp-Source: AGHT+IH1qspQ1G8ufNdeBSxAMd1atHQcdGJC8h/Vw1FNVMgQXnn53x20gbDlPlI4tx/FNvBJwN4Hzw==
X-Received: by 2002:a17:902:e848:b0:212:6011:594a with SMTP id d9443c01a7336-21778393aa4mr8269675ad.3.1733864465413;
        Tue, 10 Dec 2024 13:01:05 -0800 (PST)
Received: from localhost.localdomain (75-164-192-68.ptld.qwest.net. [75.164.192.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2164419d02dsm45530625ad.268.2024.12.10.13.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:01:04 -0800 (PST)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Erin Skomra <skomra@gmail.com>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH 1/2] HID: wacom: Improve behavior of non-standard LED brightness values
Date: Tue, 10 Dec 2024 13:00:58 -0800
Message-ID: <20241210210059.87780-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

Assigning a non-standard brightness value to an LED can cause the value
to slowly drift downward over time as the effects of integer division
accumulate. Each time that an LED is triggered, a series of set and get
calls occur. For example, if we assume a tablet with max_hlv = 100, then
when brightness is set to "200" through sysfs, the hlv value written to
hardware will be `200*100/255 = 78`. If the LED trigger is later activated,
the hlv value will be used to determine the brightness: `78*255/100 = 198`.
This lower brightness then used to set the brightness of the next LED.
However, `198*100/255 = 77`, so the next LED ends up slightly dimmer.
Each subsequent trigger activation will cause the brightness to continue
drifting down until we reach a point where the result of integer divsion
does not introduce any new error.

This commit corrects the issue by being more careful about how we handle
scaling between the two ranges (0..max_{h,l}lv) and (0..LED_FULL).

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom.h     | 8 ++++++++
 drivers/hid/wacom_sys.c | 8 ++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/wacom.h b/drivers/hid/wacom.h
index 6f1443999d1d9..1deacb4568cb9 100644
--- a/drivers/hid/wacom.h
+++ b/drivers/hid/wacom.h
@@ -218,6 +218,14 @@ static inline __u32 wacom_s32tou(s32 value, __u8 n)
 	return value & (1 << (n - 1)) ? value & (~(~0U << n)) : value;
 }
 
+static inline u32 wacom_rescale(u32 value, u32 in_max, u32 out_max)
+{
+	if (in_max == 0 || out_max == 0)
+		return 0;
+	value = clamp(value, 0, in_max);
+	return DIV_ROUND_CLOSEST(value * out_max, in_max);
+}
+
 extern const struct hid_device_id wacom_ids[];
 
 void wacom_wac_irq(struct wacom_wac *wacom_wac, size_t len);
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 34428349fa311..5689bb6fcb264 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1302,10 +1302,10 @@ enum led_brightness wacom_leds_brightness_get(struct wacom_led *led)
 	struct wacom *wacom = led->wacom;
 
 	if (wacom->led.max_hlv)
-		return led->hlv * LED_FULL / wacom->led.max_hlv;
+		return wacom_rescale(led->hlv, wacom->led.max_hlv, LED_FULL);
 
 	if (wacom->led.max_llv)
-		return led->llv * LED_FULL / wacom->led.max_llv;
+		return wacom_rescale(led->llv, wacom->led.max_llv, LED_FULL);
 
 	/* device doesn't support brightness tuning */
 	return LED_FULL;
@@ -1337,8 +1337,8 @@ static int wacom_led_brightness_set(struct led_classdev *cdev,
 		goto out;
 	}
 
-	led->llv = wacom->led.llv = wacom->led.max_llv * brightness / LED_FULL;
-	led->hlv = wacom->led.hlv = wacom->led.max_hlv * brightness / LED_FULL;
+	led->llv = wacom->led.llv = wacom_rescale(brightness, LED_FULL, wacom->led.max_llv);
+	led->hlv = wacom->led.hlv = wacom_rescale(brightness, LED_FULL, wacom->led.max_hlv);
 
 	wacom->led.groups[led->group].select = led->id;
 
-- 
2.47.1


