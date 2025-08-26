Return-Path: <linux-input+bounces-14321-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE3B366CF
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 16:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58C91580E58
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 13:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5146034F46B;
	Tue, 26 Aug 2025 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2811dIm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A09234F460;
	Tue, 26 Aug 2025 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216006; cv=none; b=cFczMkwNY9RrKgGaYbPT9ZYpYPD3k06nHZHkGcMYKQEPDfRrfp2C/rC0JtyRCxhoedr6BXqQBtwv5p6PkT6aZvXSj+jpp733bb4xoqJTFROOUe6zqYgsIcxAG+SqHwQrGy5WrJ5bBUz5X0X+uqQGh3G1hNudMyXubRjxCcfhSfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216006; c=relaxed/simple;
	bh=AAH1An4dME/NHFSM/pFOMD8DZ8SYdIRvJf7aDrJZdFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Iekk7Rwh7Ncds9cAK+wWgDuIQs7ACYJo9t9XZ2kNxVaa5nrVTtrfLdu1CUC4a6cSe7xRAMikws3MyazXHgnjtYfkbSOwGpqS/vtZMbSLK6e1zkISRefCCgMkfAo1pdzSUVKh1weyc+R95o374DFfeYCSaPcCByEdT1Bmncarj2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2811dIm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD57C4CEF1;
	Tue, 26 Aug 2025 13:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756216005;
	bh=AAH1An4dME/NHFSM/pFOMD8DZ8SYdIRvJf7aDrJZdFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B2811dImBTJdaljtQDbuVrXRMHjWETRARaTNmSFdBVZnXrswCYH8HDM/PqIitRhh2
	 w2TsJrNPctccrFK82j7bUFmzfxhVnFb+INrhy3c9xEdJOD0QJrhc6ozyMzsx9tzeGK
	 pDJtx01Puj2AbvMDkHchlfQonJeReZrnQLZbj3mElqz4Z0/ihQMJJTnhDmlvB4mwru
	 4i2D6rr4spFcYh6nSMvmTqyQpkibLFwERIGY1NtvMYeF8TBadp4c+XCczdT4a6XoVf
	 k2zZrKDbDfc/tN42LEGfIo2LEAf1DBAai8C37NXvp5pMdEhqxEYgZf213iabz3iHv8
	 Iwqw1S5h4CiGg==
From: Michael Walle <mwalle@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>
Cc: jcormier@criticallink.com,
	Job Sava <jsava@criticallink.com>,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 3/3] mfd: tps6594: Add board power-off support
Date: Tue, 26 Aug 2025 15:46:31 +0200
Message-Id: <20250826134631.1499936-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250826134631.1499936-1-mwalle@kernel.org>
References: <20250826134631.1499936-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a system level power-off handler if the "system-power-controller"
flag is set for this device in the device tree.

A power-off request is triggered by writing the TRIGGER_I2C_0 bit (which
is actually just a convention and really depends on the freely
programmable FSM).

Co-developed-by: Job Sava <jsava@criticallink.com>
Signed-off-by: Job Sava <jsava@criticallink.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
v2:
 - incoroprate feedback from Lee Jones.
 - use of_device_is_system_power_controller() instead of open coding it
 - handle errors in power_off handler
---
 drivers/mfd/tps6594-core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mfd/tps6594-core.c b/drivers/mfd/tps6594-core.c
index 9195c9059489..7127af7142f5 100644
--- a/drivers/mfd/tps6594-core.c
+++ b/drivers/mfd/tps6594-core.c
@@ -15,6 +15,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps6594.h>
@@ -688,6 +689,19 @@ static int tps6594_enable_crc(struct tps6594 *tps)
 	return ret;
 }
 
+static int tps6594_power_off_handler(struct sys_off_data *data)
+{
+	struct tps6594 *tps = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(tps->regmap, TPS6594_REG_FSM_I2C_TRIGGERS,
+				 TPS6594_BIT_TRIGGER_I2C(0), TPS6594_BIT_TRIGGER_I2C(0));
+	if (ret)
+		return notifier_from_errno(ret);
+
+	return NOTIFY_DONE;
+}
+
 int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 {
 	struct device *dev = tps->dev;
@@ -770,6 +784,12 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
 			return dev_err_probe(dev, ret, "Failed to add RTC child device\n");
 	}
 
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(tps->dev, tps6594_power_off_handler, tps);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to register power-off handler\n");
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tps6594_device_init);
-- 
2.39.5


