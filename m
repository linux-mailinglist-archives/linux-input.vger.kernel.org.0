Return-Path: <linux-input+bounces-8154-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B469D3086
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 23:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC9B71F21E38
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 22:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E8B1D3566;
	Tue, 19 Nov 2024 22:34:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069F1D3565
	for <linux-input@vger.kernel.org>; Tue, 19 Nov 2024 22:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732055646; cv=none; b=iMGk2aY3oOA57MvpoYk/m8u8+4ldjoQjdXp/7TDPWkrfPh4+JU9yLUcFIpaM+inwq0rN050CKeFX9qJHEO7iq0g7T7v1mzooGKqlOxH8aN8/UwofUf33HP3S0P+5F1g+SsTojn0YpN6Wes53U8/555IHshGY56nEtrWZkg2FKQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732055646; c=relaxed/simple;
	bh=XsoLkw4+T7bCU2TKCMU1O3jt/Rbh8nGvFJ2vrAS9LBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pkka3zZVgU88rElL9BB9kzM2x2D8na0nJD+1T6UoDkKFpyjYRB5HnZodd+nu9aMZqpsQuLAC+JHSBN30GWIv3KT+MCg7blei9QAvp/nsF7Q5A0sO8Q9Au7rPLzRHSN/0fBJcW0K2q8k3TP+zKrK79bxMSvS5+s2r05Mb+U7dVkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1tDWnF-0002gF-4s; Tue, 19 Nov 2024 23:33:57 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 19 Nov 2024 23:33:50 +0100
Subject: [PATCH 1/5] firmware_loader: expand firmware error codes with skip
 error
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-v6-10-topic-touchscreen-axiom-v1-1-6124925b9718@pengutronix.de>
References: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
In-Reply-To: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
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
 Danilo Krummrich <dakr@redhat.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

Add FW_UPLOAD_ERR_SKIP to allow drivers to inform the firmware_loader
framework that the update is not required. This can be the case if the
user provided firmware matches the current running firmware.

Sync lib/test_firmware.c file accordingly.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/base/firmware_loader/sysfs_upload.c | 1 +
 include/linux/firmware.h                    | 2 ++
 lib/test_firmware.c                         | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
index 829270067d16..b3cbe5b156e3 100644
--- a/drivers/base/firmware_loader/sysfs_upload.c
+++ b/drivers/base/firmware_loader/sysfs_upload.c
@@ -28,6 +28,7 @@ static const char * const fw_upload_err_str[] = {
 	[FW_UPLOAD_ERR_RW_ERROR]     = "read-write-error",
 	[FW_UPLOAD_ERR_WEAROUT]	     = "flash-wearout",
 	[FW_UPLOAD_ERR_FW_INVALID]   = "firmware-invalid",
+	[FW_UPLOAD_ERR_SKIP]         = "skip",
 };
 
 static const char *fw_upload_progress(struct device *dev,
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index aae1b85ffc10..46d2192b733a 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -29,6 +29,7 @@ struct firmware {
  * @FW_UPLOAD_ERR_RW_ERROR: read or write to HW failed, see kernel log
  * @FW_UPLOAD_ERR_WEAROUT: FLASH device is approaching wear-out, wait & retry
  * @FW_UPLOAD_ERR_FW_INVALID: invalid firmware file
+ * @FW_UPLOAD_ERR_SKIP: firmware is already up to date, skip update
  * @FW_UPLOAD_ERR_MAX: Maximum error code marker
  */
 enum fw_upload_err {
@@ -41,6 +42,7 @@ enum fw_upload_err {
 	FW_UPLOAD_ERR_RW_ERROR,
 	FW_UPLOAD_ERR_WEAROUT,
 	FW_UPLOAD_ERR_FW_INVALID,
+	FW_UPLOAD_ERR_SKIP,
 	FW_UPLOAD_ERR_MAX
 };
 
diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index bcb32cbff188..6715eac10c6b 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -1133,6 +1133,7 @@ static const char * const fw_upload_err_str[] = {
 	[FW_UPLOAD_ERR_RW_ERROR]     = "read-write-error",
 	[FW_UPLOAD_ERR_WEAROUT]	     = "flash-wearout",
 	[FW_UPLOAD_ERR_FW_INVALID]   = "firmware-invalid",
+	[FW_UPLOAD_ERR_SKIP]         = "skip",
 };
 
 static void upload_err_inject_error(struct test_firmware_upload *tst,

-- 
2.39.5


