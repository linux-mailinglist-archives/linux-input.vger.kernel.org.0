Return-Path: <linux-input+bounces-5832-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1A595E1E1
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 474662826AD
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2702945003;
	Sun, 25 Aug 2024 05:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zat+6PSX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748943987D;
	Sun, 25 Aug 2024 05:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563004; cv=none; b=hes4HCnBboAnbUTJkcR+eo+HupIA62HC8TCond2dgYuzyhQZia+sJ5Rp2zzR1WXW7Gl9+vhCc6jSg6D1WSpTSZen5+DgsHklr40+pqZj099vW/Nz0862d8warMVrLW3ezNBWsmjxW0Wz7LzOZ/ME6xXj0mQnaTf5CQZcaOT6GDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563004; c=relaxed/simple;
	bh=MsMHIhrTk1gjFRMb90/7beC7gZ6Zim5csgEiyFhf9s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zi8AaMzLCWsNcVSz3XBhdx/j8CEQX/f/XDGr8lrluDB2BtTi1k5+rQxa0R2+173AGf/kAyeX3ytcBUCTxgj9OAqiSNXRZPR4rpqx6sqBjDVxx1BPLu2eJo8z4satqxAcLN3N7nouQwK2K2uDXAmC0pLozChCmGzmb5T6pFFGHIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zat+6PSX; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7141d7b270dso2511502b3a.2;
        Sat, 24 Aug 2024 22:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563002; x=1725167802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v03nlMt8wt97ucP9MgPsI2XvI1FXNf/NrpeS/5IiYv0=;
        b=Zat+6PSXFyM9m3wsyVYFvA0ghD3Cw8Gz5JcWthPVq8lL/wLawsnBmHIGDS7+IWY4gU
         M6n2CEWoS+plzEIy0VSSFlEsw43tuaFZ3xw3JIHn5HpgHh4+bERgavYFBRGfOgS8tCsg
         BnTwqKIsXfIYPEQvYJJoyaooqDjmpklJbAwTSUUezuEXgxgApbAtN5PQ5YhSKk3Y2Z9q
         L9+MwVYMuJY9XUqtIyeq0BP4bE3kLLIqUfOBm8YD9PlNxKuEqk5iyBVpGrH/S+4DO5sh
         41faqrv/tF/uDlkTjwH0U7juUf+NBPaDrsOhQLsL4M/B1sN1Cq/pJqkGXbCdcB09P3wk
         h8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563002; x=1725167802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v03nlMt8wt97ucP9MgPsI2XvI1FXNf/NrpeS/5IiYv0=;
        b=sl03y5KIWnOtaaQeS5aMSCvlBRGRJHfD2YoLgKFWOdTIoAA9o3gxLDJgt7uiCsa3kv
         T9ywtyfiaHA1m7BxfhdY4fz49vQnADkIZd7IIH0XVoRJSeGFfYq+mej/+YXXrz1bkxGl
         wvmbM5hbO0w2SF66HGVdDIivHu6Lp4i4tb37RFXnCT9qyyEGGXA9v0GMZWjg8JaHo4am
         Uu2z57iJU4VQxl51kO7SP9xS/Pr/mfel5PgnZQ5kSH3F7PgHMJHDXYRTAkE/MPL043xV
         stAFWuHhR+vJwFdyeaaCsT/j88CpZfmEF15SlP9a0oOG2NBtbLlzQwtfjgmm4GxEg8ax
         N/nw==
X-Forwarded-Encrypted: i=1; AJvYcCV0drbk26N0tJj6TUxYt3dWsGy4p3f12j1vaw0/QNFsHrSgKiUp6NyPzP8DTMsPtxKt8F9BqIB0/CR7WeE=@vger.kernel.org, AJvYcCW+hPH/KuGAw6pA15Pshxb4Z9TD/paXAUNzDXti1ZUwFG7QyvXfY7YKRqM/uTva4FHkb+Gev7XA2w9RUAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/GJGodSiYF3tG7qmwQtRBpagOZuLEGnwqS7ruP1eTnA59to2Q
	D1t2pK/mkj56QG6o5TvWNTSIc1SXIZV3njvyhuzVu4P/9ddJJeo+TNrksw==
X-Google-Smtp-Source: AGHT+IF7QoHmrLV6kSFTTdk+PD8n2j4jO61+JgdZXKp0HB/dxjAB/YizqF4tzxEjr27TgbIwya03LQ==
X-Received: by 2002:a05:6a00:1990:b0:710:7efe:a870 with SMTP id d2e1a72fcca58-71445dfe700mr6501782b3a.19.1724563001466;
        Sat, 24 Aug 2024 22:16:41 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:41 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 02/17] Input: applespi - use guard notation when acquiring spinlock
Date: Sat, 24 Aug 2024 22:16:06 -0700
Message-ID: <20240825051627.2848495-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust
by ensuring that locks are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/applespi.c | 72 ++++++++-----------------------
 1 file changed, 18 insertions(+), 54 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index cf25177b4830..501ce8154786 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -717,9 +717,7 @@ static int applespi_send_cmd_msg(struct applespi_data *applespi);
 static void applespi_msg_complete(struct applespi_data *applespi,
 				  bool is_write_msg, bool is_read_compl)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
+	guard(spinlock_irqsave)(&applespi->cmd_msg_lock);
 
 	if (is_read_compl)
 		applespi->read_active = false;
@@ -733,8 +731,6 @@ static void applespi_msg_complete(struct applespi_data *applespi,
 		applespi->cmd_msg_queued = 0;
 		applespi_send_cmd_msg(applespi);
 	}
-
-	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
 }
 
 static void applespi_async_write_complete(void *context)
@@ -888,33 +884,22 @@ static int applespi_send_cmd_msg(struct applespi_data *applespi)
 
 static void applespi_init(struct applespi_data *applespi, bool is_resume)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
+	guard(spinlock_irqsave)(&applespi->cmd_msg_lock);
 
 	if (is_resume)
 		applespi->want_mt_init_cmd = true;
 	else
 		applespi->want_tp_info_cmd = true;
 	applespi_send_cmd_msg(applespi);
-
-	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
 }
 
 static int applespi_set_capsl_led(struct applespi_data *applespi,
 				  bool capslock_on)
 {
-	unsigned long flags;
-	int sts;
-
-	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
+	guard(spinlock_irqsave)(&applespi->cmd_msg_lock);
 
 	applespi->want_cl_led_on = capslock_on;
-	sts = applespi_send_cmd_msg(applespi);
-
-	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
-
-	return sts;
+	return applespi_send_cmd_msg(applespi);
 }
 
 static void applespi_set_bl_level(struct led_classdev *led_cdev,
@@ -922,9 +907,8 @@ static void applespi_set_bl_level(struct led_classdev *led_cdev,
 {
 	struct applespi_data *applespi =
 		container_of(led_cdev, struct applespi_data, backlight_info);
-	unsigned long flags;
 
-	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
+	guard(spinlock_irqsave)(&applespi->cmd_msg_lock);
 
 	if (value == 0) {
 		applespi->want_bl_level = value;
@@ -940,8 +924,6 @@ static void applespi_set_bl_level(struct led_classdev *led_cdev,
 	}
 
 	applespi_send_cmd_msg(applespi);
-
-	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
 }
 
 static int applespi_event(struct input_dev *dev, unsigned int type,
@@ -1428,9 +1410,7 @@ static void applespi_got_data(struct applespi_data *applespi)
 	/* process packet header */
 	if (!applespi_verify_crc(applespi, applespi->rx_buffer,
 				 APPLESPI_PACKET_SIZE)) {
-		unsigned long flags;
-
-		spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
+		guard(spinlock_irqsave)(&applespi->cmd_msg_lock);
 
 		if (applespi->drain) {
 			applespi->read_active = false;
@@ -1439,8 +1419,6 @@ static void applespi_got_data(struct applespi_data *applespi)
 			wake_up_all(&applespi->drain_complete);
 		}
 
-		spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
-
 		return;
 	}
 
@@ -1573,11 +1551,10 @@ static u32 applespi_notify(acpi_handle gpe_device, u32 gpe, void *context)
 {
 	struct applespi_data *applespi = context;
 	int sts;
-	unsigned long flags;
 
 	trace_applespi_irq_received(ET_RD_IRQ, PT_READ);
 
-	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
+	guard(spinlock_irqsave)(&applespi->cmd_msg_lock);
 
 	if (!applespi->suspended) {
 		sts = applespi_async(applespi, &applespi->rd_m,
@@ -1590,8 +1567,6 @@ static u32 applespi_notify(acpi_handle gpe_device, u32 gpe, void *context)
 			applespi->read_active = true;
 	}
 
-	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
-
 	return ACPI_INTERRUPT_HANDLED;
 }
 
@@ -1819,29 +1794,21 @@ static int applespi_probe(struct spi_device *spi)
 
 static void applespi_drain_writes(struct applespi_data *applespi)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
+	guard(spinlock_irqsave)(&applespi->cmd_msg_lock);
 
 	applespi->drain = true;
 	wait_event_lock_irq(applespi->drain_complete, !applespi->write_active,
 			    applespi->cmd_msg_lock);
-
-	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
 }
 
 static void applespi_drain_reads(struct applespi_data *applespi)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
+	guard(spinlock_irqsave)(&applespi->cmd_msg_lock);
 
 	wait_event_lock_irq(applespi->drain_complete, !applespi->read_active,
 			    applespi->cmd_msg_lock);
 
 	applespi->suspended = true;
-
-	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
 }
 
 static void applespi_remove(struct spi_device *spi)
@@ -1908,21 +1875,18 @@ static int applespi_resume(struct device *dev)
 	struct spi_device *spi = to_spi_device(dev);
 	struct applespi_data *applespi = spi_get_drvdata(spi);
 	acpi_status acpi_sts;
-	unsigned long flags;
 
 	/* ensure our flags and state reflect a newly resumed device */
-	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
-
-	applespi->drain = false;
-	applespi->have_cl_led_on = false;
-	applespi->have_bl_level = 0;
-	applespi->cmd_msg_queued = 0;
-	applespi->read_active = false;
-	applespi->write_active = false;
-
-	applespi->suspended = false;
+	scoped_guard(spinlock_irqsave, &applespi->cmd_msg_lock) {
+		applespi->drain = false;
+		applespi->have_cl_led_on = false;
+		applespi->have_bl_level = 0;
+		applespi->cmd_msg_queued = 0;
+		applespi->read_active = false;
+		applespi->write_active = false;
 
-	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
+		applespi->suspended = false;
+	}
 
 	/* switch on the SPI interface */
 	applespi_enable_spi(applespi);
-- 
2.46.0.295.g3b9ea8a38a-goog


