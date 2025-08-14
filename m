Return-Path: <linux-input+bounces-14005-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15232B262F7
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 12:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F7B33A5F6F
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 10:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF152C0F67;
	Thu, 14 Aug 2025 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPwwj1Cx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D9029CE6;
	Thu, 14 Aug 2025 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168000; cv=none; b=q+AySrM9IJiL0piwRRGTYIDBwtIsmIa8tnx1PtLTLZrx1aUy8yH1OMujHz3LVaG+U4hLWq7I3OeuzvZzoJNbvxVQUd0x6O/JfiemdUsoxtbwA8nic2t6rJcRK7HG28+iEActHJm995BtBlx37hE0b+GsVN4Yi7FByiTIx2+/T9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168000; c=relaxed/simple;
	bh=/VP0K+dV36q/Noqfs6oaGP/hLkmMRRjgxAKNLU0VGu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o7P7N9pz7OF+KYRMttW+1lQU+yr7tAz49Px1mEzQTamZp+MrOEFuD+5Qybh1Qsa/EDli5bmjDJlb31kfhFYN1tpX0BHOpXNbgd9b9bqHD0VQqBF4HCDJnidQ2w10iCiDrY5PjL3sslSDVKiXVI9kns/To9lA/E6w08KvhiKRsyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPwwj1Cx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b0cd668so3719045e9.3;
        Thu, 14 Aug 2025 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755167997; x=1755772797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beO1MJ8cV9CYJIvcXBnk3dXQ5BNGD8cakckjuNtn2R0=;
        b=BPwwj1CxUHOcUfYCLtOIquxvE8MRipf9ByaqDl/iJ0Zg3sQsZM68Fna3nEnYT8l/0R
         UiVyIx7NlczFNgFD9EJ3a4+LXNSf6V1jdyPwqP3aKgv88WtsGDagngRVnz/YMcWjNsby
         eCApYf5unJuDZPMQrXjfs0j/ZDIjPHt+6mZMtrPNiunsgTs1kLsj7YFi9eTFV80K98q1
         BhdockdW7iJxqpnTO/HTYiSmtHlQMrDxubNXqMw520L3Fd5T4oHh6YbYNJsyAviHMCAD
         S6CUefuTBH56FrQpsp8RIrC0WPdTcoA0qRN+8Xd+hzYXCvgEFmTys/U+phmFqo1JUr6Z
         h5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755167997; x=1755772797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beO1MJ8cV9CYJIvcXBnk3dXQ5BNGD8cakckjuNtn2R0=;
        b=M3N1LzBTq6f+djNEA7p18JtsYtcYjJNaeO5I4eBUWFWHhRzT9qoI94q9ziSt1YVCtm
         9SLxsJG4jYFcfNRSQSHe0otTJvRWQHiMxLwt0oSqHsSqCWZp1AWLErBGy6hkrjS5N3G2
         wCPTn3vCRNVJFGaKp15OtUaGXKS/gC7q3Dpm6H6wG6RMU5dlVAFXjM4HJ5o9Bf/Hs2v3
         sYp76AG9GduzhgQMBBcxeXlphFbluLbQ/PiqdTV/y+6ensqp5ata/SaFkGLvm9583wK8
         6Bc7IYMEEEeXlmoYV6ZV3xokH9TPVs7z9/f/J4obZ+nEA592q/RlgHLdW32CUKImo6Sk
         xtaQ==
X-Forwarded-Encrypted: i=1; AJvYcCURnQKRh/0MZZ9PSmBQJ2jJwdjHtiYSdDAiyYO+gOroGGxHdBUBEH/U59+yjbCGY3u2FQtZvXCucQhVTA==@vger.kernel.org, AJvYcCWk3xfZKU7DeFeEtNeUAk0BOaL4R1xbH2Ym6qvk67Y91Ykk80gzRsXEeRp15zw68hW5I3XBVEsaSDA6X/fg@vger.kernel.org
X-Gm-Message-State: AOJu0YxuGTlRpC7rp9Ag01csLf4oEVx3+RFR65qk3wg+LzkZU4lZmuAs
	PySK0iz5KDVrv2SLlYyJ6Vfx+Y15rRlTtIgGlFjTzu2prekNAxDEuHfT
X-Gm-Gg: ASbGncsJkpKF37KbHMgpCdhrPxpBAtNU3rKj4XyHCfh9yy+zSsd26UkZr+PPIC8hUJF
	G6/0updFS0zW7j85BpKT+vvXN/GF1luWJSc74RfgzY+1OMa9y7FjX332GCx6a1nsiSIiwl4vxr2
	49oqcit1iAaxg0HreUKxFOmHBXOalYQEWY1ka8Y/pT8o7SNIMNE3kXK3wTL27TsnMKfhNXmCDb+
	3ROHqG1yHY0VELEbqH5uhkAZ6EYtzMjdgCdwgUhAdp1Sf7FdvOYEz9YIMpH0b/VKw46sbZ9jz6f
	acDzlLJVY3GEG8tkNVQz1j9nIlhTFcnWM864DR4sNpPMg4qThKvKcVPFX15cPwbeZzwJi+7o+Al
	Da9bLLDcLOuJyyPE8GgDxFSRMVLTY3fonqhv0FfgJ
X-Google-Smtp-Source: AGHT+IGKYaLMIsuXixlVF8TSY5pBWecazaVLJueen9qr/fPhhKB+E12KWVw1V+okrpW91/FleImt9A==
X-Received: by 2002:a05:600c:45cd:b0:456:161c:3d77 with SMTP id 5b1f17b1804b1-45a1b649a73mr26592125e9.16.1755167997086;
        Thu, 14 Aug 2025 03:39:57 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b9132f00ecsm8214300f8f.24.2025.08.14.03.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:39:56 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	luguohong@xiaomi.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 2/2] HID: input: report battery status changes immediately
Date: Thu, 14 Aug 2025 12:39:40 +0200
Message-ID: <20250814103947.116139-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814103947.116139-1-jose.exposito89@gmail.com>
References: <20250814103947.116139-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previously, the battery status (charging/discharging) was not reported
immediately to user-space. 

For most input devices, this wasn't problematic because changing their
battery status requires connecting them to a different bus.
For example, a gamepad would report a discharging status while
connected via Bluetooth and a charging status while connected via USB.

However, certain devices are not connected or disconnected when their
battery status changes. For example, a phone battery changes its status
without connecting or disconnecting it.
In these cases, the battery status was not reported immediately to user
space.

Report battery status changes immediately to user space to support
these kinds of devices.

Fixes: a608dc1c0639 ("HID: input: map battery system charging")
Reported-by: 卢国宏 <luguohong@xiaomi.com>
Closes: https://lore.kernel.org/linux-input/aI49Im0sGb6fpgc8@fedora/T/
Tested-by: 卢国宏 <luguohong@xiaomi.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-input.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 262787e6eb20..f45f856a127f 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -609,13 +609,19 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
 	return false;
 }
 
-static void hidinput_update_battery(struct hid_device *dev, int value)
+static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
+				    int value)
 {
 	int capacity;
 
 	if (!dev->battery)
 		return;
 
+	if (hidinput_update_battery_charge_status(dev, usage, value)) {
+		power_supply_changed(dev->battery);
+		return;
+	}
+
 	if (value == 0 || value < dev->battery_min || value > dev->battery_max)
 		return;
 
@@ -642,13 +648,8 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
 {
 }
 
-static bool hidinput_update_battery_charge_status(struct hid_device *dev,
-						  unsigned int usage, int value)
-{
-	return false;
-}
-
-static void hidinput_update_battery(struct hid_device *dev, int value)
+static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
+				    int value)
 {
 }
 #endif	/* CONFIG_HID_BATTERY_STRENGTH */
@@ -1515,11 +1516,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		return;
 
 	if (usage->type == EV_PWR) {
-		bool handled = hidinput_update_battery_charge_status(hid, usage->hid, value);
-
-		if (!handled)
-			hidinput_update_battery(hid, value);
-
+		hidinput_update_battery(hid, usage->hid, value);
 		return;
 	}
 
-- 
2.50.1


