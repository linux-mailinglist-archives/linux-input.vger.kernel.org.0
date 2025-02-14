Return-Path: <linux-input+bounces-10066-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B2BA368C1
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 23:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F4223AEFC5
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 22:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3557A1DF98F;
	Fri, 14 Feb 2025 22:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIcFB5dA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F6D1C84AC;
	Fri, 14 Feb 2025 22:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739573921; cv=none; b=K4My74Eb+Lwsgx1lYNwHui7m27sf+PHpvNYhlz1K/l8kHOK1F/4e0qh/8V33QzmyGocCrxM0DdSejhopSe3dzEqhD4nVmldmyBaEo1yPxBeOtNOtpDhXh323ndaDkQvoGpNIAEPYy+bXeViT3j57k47aDJjt7dUnpshhIT+FOp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739573921; c=relaxed/simple;
	bh=Uv2+qoWHZazMhGPo++YKyzl3JiCBUWbfkXIMdaOlN/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlvKiaWydgN+l/udS16OrwbC9nZyUwFBKpJ6TriKJPFt0jfmtM5Lwipp4gcXdz4Us9808QqEYCDStgcx28mMLoulPV9cO/UYnjqJGKIP8X6dbm5Bu6LjSS1mVCj6WbYBbMLsZSVTfllVwyb5M8/gzP8dcQOMxGNET1/1ggyXE8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIcFB5dA; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-8555e673b2bso86425339f.0;
        Fri, 14 Feb 2025 14:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739573918; x=1740178718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=parlQYritnEO96olPuywvnqmzI08Waet3YIQGkgB0FQ=;
        b=gIcFB5dAKxf6JPRqlc8ByhKYFDjTC/Jyhpaec0skrHLC5gG+3bKOoQeS0WBrBN3Xi5
         iGP1jTfN6GkWvgotb3k9OW448fedK9S7AAnjJb2guA+6VdQq1JRZst3mHbbXeFVk2gNK
         RNekJDPRDcckEvFyUceeHJlEZwYy9zMVfcUmyRbM/NQVi9tPN2Z5C/ThNOHGCgP4fvZE
         YMr/rjdMT2lu6klKCcbSIfW/xWiC0LfhcpHpzvo9Z6dCi1Dk5hNBDD7U/BaYe7D3mAtt
         DMCqWHhrmbEPMjykmBlVvfl35rrQoP6+qNJnwCwJs4eirOPqfiIYeQ3oWIArcng7i/bB
         WloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739573918; x=1740178718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=parlQYritnEO96olPuywvnqmzI08Waet3YIQGkgB0FQ=;
        b=Yhrp6iF5jsCb95/euh9ZQgY6+G4zwKejw6ugXjfACPxVIMieXLJnjVLnEcOnXJDHOl
         fT/v8EphJPAYlOA1eky+COIhgkNTxrOfDFCU58s1LnVrFCydlUBQXeTCshHw9tOuOb0h
         sMzlEOCS/J2dnY5nIEen45EWBuMPy5m1yNRP4OMVCgg/fHT9LVziqfdDNErFGJPa/ct5
         Unz4lslbpG/ovBqheT7eV5AX+ALQpOwwSUYkCcCiMJMdyONMHVduieenUxwxiGEnCX6i
         rh6eG//YjgFI1KWS9fnWFEv6x/ARXODPCWECtbFj/mwkK1FwPAHAIK4AccVP68LqyiOg
         NiYg==
X-Forwarded-Encrypted: i=1; AJvYcCUB0rEptniRl9KUrWA3dUlxvAOD1knAiBH1Sa78YOAM8KEshVcBllDYWKMsdykKWBnyLgeirCEJY6q7gxmo@vger.kernel.org, AJvYcCXFgqo8b/b4ZmHkdWOLjiCmPobV5adpcy0+P2MD4/DoJS2cO+X3kDMVmIn2eztF/0B1MKv1NGT+N8R4qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk2/yQEPzjoz0LNHW+MX1ErxI9PQujH8+4IbN+0YnwvKUCv+jl
	SHPbtb0+IAqR8lm/iZrga/mCQwqeXw9VdqHrBWSkfySPly61541ENGvAWKL3
X-Gm-Gg: ASbGncseXsl9a21X2WitWP+oGYEW3BN7IK44g81TTc1W0BwyC65QWEX8m2GAnOBFVG0
	RDG+lK2b05PZVdKtOBID2PH95Z0F1vuPm07AURXudKvlnfgBcWLLum1HEZrmHntpBkag598Zgle
	27Ai1juP4fCnaRHWuyZWEw7oxvnCOxI+j0z2th+SDxYJnAa8OqewbO/RD+gRmcUVEe7dCfCKDbZ
	bcjUniTQPUUYBRwkIRvahxTubueie2Gg2pME1ZJYwqMzHbj82fkIZmLlnO7N+RkCh8Yu+NgeLDz
	fnGkQ3f34gL3lqxOPYy9ctV6l6dsQte4
X-Google-Smtp-Source: AGHT+IGdaqktlFJlAy0DDnW//JJJf1sU4q4fe8jpsOEo4kdHxYSQko8YmKLzuC1HMZsYLrK5pEp/2A==
X-Received: by 2002:a5e:980d:0:b0:83a:943d:a280 with SMTP id ca18e2360f4ac-855651b8417mr598288439f.1.1739573918515;
        Fri, 14 Feb 2025 14:58:38 -0800 (PST)
Received: from localhost.localdomain ([2600:6c98:a500:7a:550d:571:19dc:c1fa])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ed28149286sm1007804173.25.2025.02.14.14.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 14:58:37 -0800 (PST)
From: Noa <coolreader18@gmail.com>
To: djogorchock@gmail.com
Cc: coolreader18@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: nintendo: enable HW LED blinking
Date: Fri, 14 Feb 2025 16:58:26 -0600
Message-ID: <20250214225826.154144-1-coolreader18@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CAEVj2t=mHasbuve8cwWpuPRsN=Wvsfrf+u5hLP_16GR3XqkMfg@mail.gmail.com>
References: <CAEVj2t=mHasbuve8cwWpuPRsN=Wvsfrf+u5hLP_16GR3XqkMfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated with proper commit title and clearer constant names.

Signed-off-by: Noa <coolreader18@gmail.com>
---
 drivers/hid/hid-nintendo.c | 45 ++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 11ac246176ae..f4cdd35eef2a 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2183,14 +2183,13 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	return 0;
 }
 
-/* Because the subcommand sets all the leds at once, the brightness argument is ignored */
-static int joycon_player_led_brightness_set(struct led_classdev *led,
-					    enum led_brightness brightness)
+/* Update the on/flash status of the leds according to their led_classdev fields */
+static int joycon_update_player_leds(struct device *dev)
 {
-	struct device *dev = led->dev->parent;
 	struct hid_device *hdev = to_hid_device(dev);
 	struct joycon_ctlr *ctlr;
 	int val = 0;
+	int flash = 0;
 	int i;
 	int ret;
 
@@ -2200,16 +2199,47 @@ static int joycon_player_led_brightness_set(struct led_classdev *led,
 		return -ENODEV;
 	}
 
-	for (i = 0; i < JC_NUM_LEDS; i++)
-		val |= ctlr->leds[i].brightness << i;
+	for (i = 0; i < JC_NUM_LEDS; i++) {
+		if (ctlr->leds[i].blink_delay_on || ctlr->leds[i].blink_delay_off)
+			flash |= 1 << i;
+		else if (ctlr->leds[i].brightness)
+			val |= 1 << i;
+	}
 
 	mutex_lock(&ctlr->output_mutex);
-	ret = joycon_set_player_leds(ctlr, 0, val);
+	ret = joycon_set_player_leds(ctlr, flash, val);
 	mutex_unlock(&ctlr->output_mutex);
 
 	return ret;
 }
 
+static int joycon_player_led_brightness_set(struct led_classdev *led,
+					    enum led_brightness brightness)
+{
+	led->brightness = brightness;
+
+	if (!brightness)
+		led->blink_delay_on = led->blink_delay_off = 0;
+
+	return joycon_update_player_leds(led->dev->parent);
+}
+
+/* the blink period of the leds can't be changed, and is always these values */
+static const JC_LED_BLINK_DELAY_ON_MS = 500;
+static const JC_LED_BLINK_DELAY_OFF_MS = 200;
+/* the different leds on a joycon can't actually be set to hw blink independently
+ * of each other, since they all use the same one subcommand, so this function
+ * actually resets the cycle of all the leds */
+static int joycon_player_led_blink_set(struct led_classdev *led,
+				     unsigned long *delay_on,
+				     unsigned long *delay_off)
+{
+	led->blink_delay_on = *delay_on = JC_LED_BLINK_DELAY_ON_MS;
+	led->blink_delay_off = *delay_off = JC_LED_BLINK_DELAY_OFF_MS;
+
+	return joycon_update_player_leds(led->dev->parent);
+}
+
 static int joycon_home_led_brightness_set(struct led_classdev *led,
 					  enum led_brightness brightness)
 {
@@ -2268,6 +2298,7 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 		led->max_brightness = 1;
 		led->brightness_set_blocking =
 					joycon_player_led_brightness_set;
+		led->blink_set = joycon_player_led_blink_set;
 		led->flags = LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
 
 		led_val |= joycon_player_led_patterns[player_led_pattern][i] << i;
-- 
2.48.1


