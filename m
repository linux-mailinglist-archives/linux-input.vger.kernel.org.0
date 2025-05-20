Return-Path: <linux-input+bounces-12481-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDA3ABE1F8
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 19:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56A557A4F68
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 17:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E52280325;
	Tue, 20 May 2025 17:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="dyCJvgSO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB38280004
	for <linux-input@vger.kernel.org>; Tue, 20 May 2025 17:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763027; cv=none; b=fYmuN9h47dA+nN+d0GYQM3exYjilwV06jX2MPCDzydNGY0vTfA86sHKQwEpMkYTM44H5UdZO89a0gpYqTJ27nlQnB8qxqoTYziy8cfFXz/1Hl2InDVmBqLAnJcbzXdvmmPPQL96sIIKLH4qyPsWyqh43L7NwygcQ15S/20ulTQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763027; c=relaxed/simple;
	bh=sl+FbGCFgUh0cLIIGBUbbIXxFtqMeN2ESuE9qcu6VlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JfxjHGTUfQDX0mt4WkT7rloAGnda/0xVOjB5lx0hscoAqeth40RlHnvyxU642RqOtqxmsQd5NmiQ7hA2vqnj7hru/XEP0l8An3UquGFrcApi7ZYHiJYytCXuccS8P5CUcxhbxiyVrojHggPBHppRFdPpMuFOSMLKoZZ6ajlBdX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=dyCJvgSO; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7caeeef95d4so608709085a.2
        for <linux-input@vger.kernel.org>; Tue, 20 May 2025 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1747763025; x=1748367825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//GTCbOPuXsQxIKhsrLq0DkXd+60Fx6SU5NzAGZER7U=;
        b=dyCJvgSOvNabDeVSA/cpiUrziq6h5fESIZFVI2oTEdcXeVEfASXEozlR/I5bTkKxBS
         uqIYuYsPBYSrNKlaGEm2PpITItY6PJduKTaTYsq/ONXPJxf9gz7fAqhYoQkVi0+TAI6R
         eGC5g0u+Z0DLHwUOezotwVa5smbFI3Q2JPMh3SJ2zu8mb9HOQ3l0mOOudDV9/BQX0JXh
         kcfR/8R9PNLmVIo1ieNVvjnMFI+vEBfAZkM+dWIC5v/1wUdAHSCMrpL292mRH8AfNkfj
         81GAsYImcI2+jejRXe9NEeApCan5xq8TPy8uMEjuRev7eQzN0kMViX2H2MQaO40PXyKh
         u60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763025; x=1748367825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//GTCbOPuXsQxIKhsrLq0DkXd+60Fx6SU5NzAGZER7U=;
        b=wM6M4WK6X7sk77tP2i1kbk2AZ2y0EYMZ/3jr7/XFX0zS/7jRWFi/pcTrO2qvtlBLMd
         qliFkD8ZxIEzEl/Sx18bibZ+3OezPvtsFZkVZG7rwRc0vvlGEjhxn0CinMvgaAv9V8bl
         N+tkdHmsupr6a1aLLGyrsZIG5DeaOaFoAw2k8jgw7pZH5V2b6Cjr/lzO5vcH5H9v5SFb
         XnZY9OvbkHXnPoREkHXud0479elziFRXeNs06KUIFabDq9f/54+UBJqTbO1tKJ5CJS9r
         M6PhN1mobM3Ng93X5O5aQ+bhv6TQljEETVwDBniI0XQKqmMzC5LOe0ZLVCdIZxYQoJh8
         wxBg==
X-Forwarded-Encrypted: i=1; AJvYcCUSP8OvdgH0oId0olyCAES8jcsgaNco0h0F5fZTbE4+G2NKJoQSzlWLa8GvgX6pX7ic/2HyQPfNKbOy1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgjj+84cI5zHkMwXOqjyaKhXXjj/yfrqNvo7VGV0t+m4OXQvzX
	EAsBiJnceaWpDj/WcbPLLsGNV3FRGTc8h1HXzr9NcVG2XsIYgp5gW+Dn3Zx51vQt/Q==
X-Gm-Gg: ASbGncv02mH+x0iWJ0MGxUbEe59esbwqsFB608zEIKtaYPsT6lySxbQPOVUPAsXcuXy
	MqfSeReiBedNyYt5LTNuXtmgJo8cAaL8GIPfM/9okeNf1XLVxNfoKV5L6qWfR4s5w3maZpnFF/0
	5Li45aWWw0zGdzAOG0RRRoZesKCUlaI3SC2QMjDkPDZZ/mZBTy9wdCpIVLk4Cfp8GDYpD2ycfRw
	sRtHKbMJ3HmY4rxRnW1+FX92vRP1xqAs8BNFK2fIN9pYSYzsRZlKw0OnbuCvL8yPQ6v9gbBgrOn
	PG2eRmXZG5Ga+TdrEW0bhQor78K/sE2w3BfOUpxBqdewtc5J2kg2x28k0FjYgzn4yqwU4syNJI9
	DDZ8ypQvdLYf5W2fu00aBZ/WEHg==
X-Google-Smtp-Source: AGHT+IE36N4uKMHVtNBPowo41ka8uj65GwK1GS5fqiXZBuL6KOO85LIE4flCa2HGG7jSc88SE3U9hA==
X-Received: by 2002:a05:620a:459f:b0:7ca:f349:4265 with SMTP id af79cd13be357-7cd4670aa2emr2553493585a.4.1747763024810;
        Tue, 20 May 2025 10:43:44 -0700 (PDT)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-494ae528553sm72660101cf.68.2025.05.20.10.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:43:44 -0700 (PDT)
From: Job Sava <jsava@criticallink.com>
Date: Tue, 20 May 2025 13:43:38 -0400
Subject: [PATCH 3/3] mfd: tps6594: Adds support for powering off the PMIC
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250520-linux-stable-tps6594-pwrbutton-v1-3-0cc5c6e0415c@criticallink.com>
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
In-Reply-To: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julien Panis <jpanis@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, jcormier@criticallink.com, 
 Job Sava <jsava@criticallink.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763020; l=2125;
 i=jsava@criticallink.com; s=20250404; h=from:subject:message-id;
 bh=sl+FbGCFgUh0cLIIGBUbbIXxFtqMeN2ESuE9qcu6VlQ=;
 b=t9jR0ycbMi8aS67LKhkQypLvnJEh1eq1pSrZmuqhqR5yEv0sWC7On47ka8pQvbhOZbIfdEHhv
 i8mimht0nRfCFTDPiYI9/CSsHw8SJwGMPoMoLRk6RWyTZ95uOeiLpIP
X-Developer-Key: i=jsava@criticallink.com; a=ed25519;
 pk=DPPriJ+pziqtCZ0EIomf/hKU23s5T1u4WOQaT8BpQSw=

When the FSM_I2C_TRIGGER register's bit 0 is set it triggers TRIGGER_I2C_0
and the PMIC is transitioned to the STANDBY state
(table 6-18: SLVSGG7 – DECEMBER 2023).

An ON request is required to transition from STANDBY to ACTIVE.

Signed-off-by: Job Sava <jsava@criticallink.com>
---
 drivers/mfd/tps6594-core.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mfd/tps6594-core.c b/drivers/mfd/tps6594-core.c
index 1b0b3d1bf6c4..f4c434c0d87a 100644
--- a/drivers/mfd/tps6594-core.c
+++ b/drivers/mfd/tps6594-core.c
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps6594.h>
@@ -615,6 +616,19 @@ static int tps6594_enable_crc(struct tps6594 *tps)
 	return ret;
 }
 
+static int tps6594_soft_shutdown(struct tps6594 *tps)
+{
+	return regmap_update_bits(tps->regmap, TPS6594_REG_FSM_I2C_TRIGGERS,
+				TPS6594_BIT_TRIGGER_I2C(0),
+				TPS6594_BIT_TRIGGER_I2C(0));
+}
+
+static int tps6594_power_off_handler(struct sys_off_data *data)
+{
+	tps6594_soft_shutdown(data->cb_data);
+	return NOTIFY_DONE;
+}
+
 int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 {
 	struct device *dev = tps->dev;
@@ -623,6 +637,7 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 	const struct mfd_cell *cells;
 	int n_cells;
 	bool pwr_button;
+	bool system_power_controller;
 
 	if (enable_crc) {
 		ret = tps6594_enable_crc(tps);
@@ -681,6 +696,15 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 			return dev_err_probe(dev, ret, "Failed to add RTC child device\n");
 	}
 
+	system_power_controller = of_property_read_bool(dev->of_node, "system-power-controller");
+	if (system_power_controller) {
+		ret = devm_register_power_off_handler(tps->dev,
+								tps6594_power_off_handler,
+								tps);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to register power-off handler\n");
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tps6594_device_init);

-- 
2.43.0


