Return-Path: <linux-input+bounces-16939-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C9D0F3DB
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 16:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 731BC30274FF
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 15:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCD9346E47;
	Sun, 11 Jan 2026 15:05:57 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA335318BAB
	for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768143957; cv=none; b=IJ6PZVcOEBLqgEoNY1bS2DOW2+i8NPE2dVEkeOrIPZ2A7ggVNCS+1v0XYRBDgSNbos0wNDqqobq64nb4hJiPXLONbStrZs13cztIRJvTtv57vL0PaxRloQx+dOU8sMG9SqcCJVWEXbVPvJ6ruL1K0jHRHVZpyqTcD3Mg6aaOtHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768143957; c=relaxed/simple;
	bh=gwjlWhZ4LBGnW8grzCKl1p8vrB/AywLKwLC7W60rBSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/+HWn2K4AioWgAyrwC/tjipJHsFbvp1ptaxpEsKcezSsyhdQkZAIxR+JH8LyszsGznpVabrrMvX1/XF3DdkO+HMSctEdsDQuM6dn8YyY46RhP+lwV4+NE0zwustSLgIuRmxpLSyMbQjvjqpG8Y/WKr6C4LKVDJo93TTedGDiTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vex0q-0004rl-OF; Sun, 11 Jan 2026 16:05:52 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Sun, 11 Jan 2026 16:05:44 +0100
Subject: [PATCH v5 1/4] firmware_loader: expand firmware error codes with
 up-to-date error
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-v6-10-topic-touchscreen-axiom-v5-1-f94e0ae266cb@pengutronix.de>
References: <20260111-v6-10-topic-touchscreen-axiom-v5-0-f94e0ae266cb@pengutronix.de>
In-Reply-To: <20260111-v6-10-topic-touchscreen-axiom-v5-0-f94e0ae266cb@pengutronix.de>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Kamel Bouhara <kamel.bouhara@bootlin.com>, 
 Marco Felsch <kernel@pengutronix.de>, Henrik Rydberg <rydberg@bitmath.org>, 
 Danilo Krummrich <dakr@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

Add FW_UPLOAD_ERR_DUPLICATE to allow drivers to inform the firmware_loader
framework that the update is not required. This can be the case if the
user provided firmware matches the current running firmware.

Sync lib/test_firmware.c accordingly.

Reviewed-by: Russ Weight <russ.weight@linux.dev>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/base/firmware_loader/sysfs_upload.c | 1 +
 include/linux/firmware.h                    | 2 ++
 lib/test_firmware.c                         | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
index c3797b93c5f5a2ecf2ae34707893c89eb7773154..9e93070b2c24179986b868a24b09cf051776c644 100644
--- a/drivers/base/firmware_loader/sysfs_upload.c
+++ b/drivers/base/firmware_loader/sysfs_upload.c
@@ -28,6 +28,7 @@ static const char * const fw_upload_err_str[] = {
 	[FW_UPLOAD_ERR_RW_ERROR]     = "read-write-error",
 	[FW_UPLOAD_ERR_WEAROUT]	     = "flash-wearout",
 	[FW_UPLOAD_ERR_FW_INVALID]   = "firmware-invalid",
+	[FW_UPLOAD_ERR_DUPLICATE]    = "firmware-duplicate",
 };
 
 static const char *fw_upload_progress(struct device *dev,
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index aae1b85ffc10e20e9c3c9b6009d26b83efd8cb24..fe7797be4c08cd62cdad9617b8f70095d5e0af2f 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -29,6 +29,7 @@ struct firmware {
  * @FW_UPLOAD_ERR_RW_ERROR: read or write to HW failed, see kernel log
  * @FW_UPLOAD_ERR_WEAROUT: FLASH device is approaching wear-out, wait & retry
  * @FW_UPLOAD_ERR_FW_INVALID: invalid firmware file
+ * @FW_UPLOAD_ERR_DUPLICATE: firmware is already up to date (duplicate)
  * @FW_UPLOAD_ERR_MAX: Maximum error code marker
  */
 enum fw_upload_err {
@@ -41,6 +42,7 @@ enum fw_upload_err {
 	FW_UPLOAD_ERR_RW_ERROR,
 	FW_UPLOAD_ERR_WEAROUT,
 	FW_UPLOAD_ERR_FW_INVALID,
+	FW_UPLOAD_ERR_DUPLICATE,
 	FW_UPLOAD_ERR_MAX
 };
 
diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index be4f93124901e5faac41f48a66dabe6da56be0ca..952ec1cb03102911dbea9abd648ab9d9e0112a46 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -1134,6 +1134,7 @@ static const char * const fw_upload_err_str[] = {
 	[FW_UPLOAD_ERR_RW_ERROR]     = "read-write-error",
 	[FW_UPLOAD_ERR_WEAROUT]	     = "flash-wearout",
 	[FW_UPLOAD_ERR_FW_INVALID]   = "firmware-invalid",
+	[FW_UPLOAD_ERR_DUPLICATE]    = "firmware-duplicate",
 };
 
 static void upload_err_inject_error(struct test_firmware_upload *tst,

-- 
2.47.3


