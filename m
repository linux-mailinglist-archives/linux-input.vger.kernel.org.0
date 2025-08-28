Return-Path: <linux-input+bounces-14370-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A88EB3971D
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 10:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 454DA3BDE59
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 08:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904222EA480;
	Thu, 28 Aug 2025 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQSMF8Ye"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688582E9EBC;
	Thu, 28 Aug 2025 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756370186; cv=none; b=M8H56RZoKyXPpLP9yED3F3LtDQtEqY6a/VoGavczUbBZw1Z4MHpM1gsC6odT+hiXkrnMki98RjZ7Cxy+VA/QRJAlpXvAhRPPrYR6qfNiti95/yHIBAewI15t5+NkDxTn0qUOpgCpG87aRoEfpRFdMaNKhYH1hQ13TlNC76BBfVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756370186; c=relaxed/simple;
	bh=L7Q9TbH/0DX4u/R/uTZamjkDHj+Sc2Dz1GcHwTUoUMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzdzgPzS68NcjS17G/Gzs4iTWbfwSoxTX15gdhKykW4W2z62BEET0Q4zuip2TkxsFLLrsQrmziyecWTQUnKSAOBnYDbA2kXHifqFbuUAg9Pre039l44PSes7IV9jWquy+VeQN0ji1QOGIyPDRhPSPX4QiNPJqOxLETUQT3n5GcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQSMF8Ye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9A3C4CEF5;
	Thu, 28 Aug 2025 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756370186;
	bh=L7Q9TbH/0DX4u/R/uTZamjkDHj+Sc2Dz1GcHwTUoUMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YQSMF8Ye4156PWX37UvbSty5p977foznI8I+/9rJAVNp4q5oCA7yEnAMd5+bJr8Bo
	 sSjoYUyjf0hSRINriVOAlS7y6acobmEYOpVHtgIAQtBa9bJLzUxhwE1+AfptopZPMC
	 a+U1RFbFNZlM0gmOciKM0lsul/Y9bYXKwvbi/2R0G/65hFCpsiG3Y1OyfNpCKkjo6Y
	 x6fJgyQ1vXyvdH2iFNIGi0kgViTN7F6J3NQ8slI1jjvXcBj1As7iC8YR3DpsxOm3wg
	 xMxHr17XibwYeIUPkna9dm3hocyFXqolOZrfTUU0mm7fk/Ebxxe3JiUU60F2TBDee2
	 lJa3ZdmhBErNw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 4/5] platform/chrome: cros_ec: Add a flag to track registration state
Date: Thu, 28 Aug 2025 08:36:00 +0000
Message-ID: <20250828083601.856083-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
In-Reply-To: <20250828083601.856083-1-tzungbi@kernel.org>
References: <20250828083601.856083-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a `registered` flag to the `struct cros_ec_device` to allow
callers to determine if the device has been fully registered and is
ready for use.

This is a preparatory step to prevent race conditions where other drivers
might try to access the device before it is fully registered or after
it has been unregistered.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec.c           |  7 +++++++
 drivers/platform/chrome/cros_ec_proto.c     | 15 +++++++++++++++
 include/linux/platform_data/cros_ec_proto.h |  4 ++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 61bcef8741db..1da79e3d215b 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -9,6 +9,7 @@
  * battery charging and regulator control, firmware update.
  */
 
+#include <linux/cleanup.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -316,6 +317,9 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 			goto exit;
 	}
 
+	scoped_guard(mutex, &ec_dev->lock)
+		ec_dev->registered = true;
+
 	dev_info(dev, "Chrome EC device registered\n");
 
 	/*
@@ -343,6 +347,9 @@ EXPORT_SYMBOL(cros_ec_register);
  */
 void cros_ec_unregister(struct cros_ec_device *ec_dev)
 {
+	scoped_guard(mutex, &ec_dev->lock)
+		ec_dev->registered = false;
+
 	if (ec_dev->mkbp_event_supported)
 		blocking_notifier_chain_unregister(&ec_dev->event_notifier,
 						   &ec_dev->notifier_ready);
diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 3e94a0a82173..1d8d9168ec1a 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -3,6 +3,7 @@
 //
 // Copyright (C) 2015 Google, Inc
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/limits.h>
@@ -1153,5 +1154,19 @@ int cros_ec_get_cmd_versions(struct cros_ec_device *ec_dev, u16 cmd)
 }
 EXPORT_SYMBOL_GPL(cros_ec_get_cmd_versions);
 
+/**
+ * cros_ec_device_registered - Return if the ec_dev is registered.
+ *
+ * @ec_dev: EC device
+ *
+ * Return: true if registered.  Otherwise, false.
+ */
+bool cros_ec_device_registered(struct cros_ec_device *ec_dev)
+{
+	guard(mutex)(&ec_dev->lock);
+	return ec_dev->registered;
+}
+EXPORT_SYMBOL_GPL(cros_ec_device_registered);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("ChromeOS EC communication protocol helpers");
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 4d96cffbb9e3..de14923720a5 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -128,6 +128,7 @@ struct cros_ec_command {
  * @dout_size: Size of dout buffer to allocate (zero to use static dout).
  * @wake_enabled: True if this device can wake the system from sleep.
  * @suspended: True if this device had been suspended.
+ * @registered: True if this device had been registered.
  * @cmd_xfer: Send command to EC and get response.
  *            Returns the number of bytes received if the communication
  *            succeeded, but that doesn't mean the EC was happy with the
@@ -186,6 +187,7 @@ struct cros_ec_device {
 	int dout_size;
 	bool wake_enabled;
 	bool suspended;
+	bool registered;
 	int (*cmd_xfer)(struct cros_ec_device *ec,
 			struct cros_ec_command *msg);
 	int (*pkt_xfer)(struct cros_ec_device *ec,
@@ -278,6 +280,8 @@ int cros_ec_cmd_readmem(struct cros_ec_device *ec_dev, u8 offset, u8 size, void
 
 int cros_ec_get_cmd_versions(struct cros_ec_device *ec_dev, u16 cmd);
 
+bool cros_ec_device_registered(struct cros_ec_device *ec_dev);
+
 /**
  * cros_ec_get_time_ns() - Return time in ns.
  *
-- 
2.51.0.268.g9569e192d0-goog


