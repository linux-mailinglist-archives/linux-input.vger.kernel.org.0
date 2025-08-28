Return-Path: <linux-input+bounces-14369-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDF4B3971C
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 10:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B78817FE53
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 08:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699F52E2DDA;
	Thu, 28 Aug 2025 08:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riXiJY4P"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A642E22B1;
	Thu, 28 Aug 2025 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756370185; cv=none; b=LBtpm3zoIDS+LGWwLHAxprWI0rssCGi+rYvezpVTSrCJ5pu870Ew8Po9wKHt7ruVUPvMKPC68Tc3Q1o7A5mJPESdQw0F+p1PlxrB1QCl+WGPoIPX7nFZJNzmjE+6MMrE/BubHSzQ4F9aHWwrwgxQaT5HweuaQGeYe1ZF1G3Q4yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756370185; c=relaxed/simple;
	bh=RZMfJS0fxlAHktnvTbmORfQTe/0tvjXlpATn5ii3b+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mqytEQMEjqPOgXkcHkFiJNLYGfFzRhxcU+z3V1QnxzgIKZL1+sBLIA1koTScGoMI6XN4OjjdAeJNIgmqJoTUM/FG+JuOP/UdJnCsWXNIoUudd+6NeV2qiUrRk3OnIeRi8R4j0MR5ItlQs4IIBq9c67qQijJzO9xM/myQ99FTTaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riXiJY4P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5596C4CEF6;
	Thu, 28 Aug 2025 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756370184;
	bh=RZMfJS0fxlAHktnvTbmORfQTe/0tvjXlpATn5ii3b+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=riXiJY4PVt9rkx4nOjMPobyJ35EAl1XRKb5eBaMjie2tFixy6yyr09qQQm7iGJsiT
	 MfVG/gwG+vLPUGO34vcSeo2fuE3lsRVNIL9LDi4qGW6xCBx2emPNQ1SHpmklIP0ZfF
	 YMRwaqP/kmAk6xywtyvh0VWoI0L9jn9+idxwXZWWCy58puekCXntubpSAaQrjtH7+a
	 21aB0QCxhbZAQaPTj+USqW7+cCOr42l67J9pPWNVKWJeCAEUYh0tJboUyITIxWwmEz
	 nu5bgV6ox4qO7cJ7nrvSw7Ff4dTD37bRI66cW+WvzSqXdEAjKfXLYRiYh9f8YFVlW9
	 9TQRWeDmm7Opw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 3/5] platform/chrome: cros_ec: Separate initialization from cros_ec_register()
Date: Thu, 28 Aug 2025 08:35:59 +0000
Message-ID: <20250828083601.856083-4-tzungbi@kernel.org>
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

Move the initialization of the `struct cros_ec_device` from
cros_ec_register() into cros_ec_device_alloc().

This decouples device initialization from registration.  By doing so,
the per-device lock is now available immediately after allocation,
allowing it to be used safely even before the device is fully
registered.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec.c | 57 ++++++++++++++++---------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index da049068b6e9..61bcef8741db 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -30,6 +30,14 @@ static struct cros_ec_platform pd_p = {
 	.cmd_offset = EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX),
 };
 
+static void cros_ec_device_free(void *data)
+{
+	struct cros_ec_device *ec_dev = data;
+
+	mutex_destroy(&ec_dev->lock);
+	lockdep_unregister_key(&ec_dev->lockdep_key);
+}
+
 struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
 {
 	struct cros_ec_device *ec_dev;
@@ -45,7 +53,28 @@ struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
 			    sizeof(struct ec_params_rwsig_action) +
 			    EC_MAX_REQUEST_OVERHEAD;
 
+	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
+	if (!ec_dev->din)
+		return NULL;
+
+	ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
+	if (!ec_dev->dout)
+		return NULL;
+
 	ec_dev->dev = dev;
+	ec_dev->max_response = sizeof(struct ec_response_get_protocol_info);
+	ec_dev->max_request = sizeof(struct ec_params_rwsig_action);
+	ec_dev->suspend_timeout_ms = EC_HOST_SLEEP_TIMEOUT_DEFAULT;
+
+	BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->event_notifier);
+	BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->panic_notifier);
+
+	lockdep_register_key(&ec_dev->lockdep_key);
+	mutex_init(&ec_dev->lock);
+	lockdep_set_class(&ec_dev->lock, &ec_dev->lockdep_key);
+
+	if (devm_add_action_or_reset(dev, cros_ec_device_free, ec_dev))
+		return NULL;
 
 	return ec_dev;
 }
@@ -200,29 +229,7 @@ static int cros_ec_ready_event(struct notifier_block *nb,
 int cros_ec_register(struct cros_ec_device *ec_dev)
 {
 	struct device *dev = ec_dev->dev;
-	int err = 0;
-
-	BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->event_notifier);
-	BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->panic_notifier);
-
-	ec_dev->max_request = sizeof(struct ec_params_hello);
-	ec_dev->max_response = sizeof(struct ec_response_get_protocol_info);
-	ec_dev->max_passthru = 0;
-	ec_dev->ec = NULL;
-	ec_dev->pd = NULL;
-	ec_dev->suspend_timeout_ms = EC_HOST_SLEEP_TIMEOUT_DEFAULT;
-
-	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
-	if (!ec_dev->din)
-		return -ENOMEM;
-
-	ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
-	if (!ec_dev->dout)
-		return -ENOMEM;
-
-	lockdep_register_key(&ec_dev->lockdep_key);
-	mutex_init(&ec_dev->lock);
-	lockdep_set_class(&ec_dev->lock, &ec_dev->lockdep_key);
+	int err;
 
 	/* Send RWSIG continue to jump to RW for devices using RWSIG. */
 	err = cros_ec_rwsig_continue(ec_dev);
@@ -322,8 +329,6 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 exit:
 	platform_device_unregister(ec_dev->ec);
 	platform_device_unregister(ec_dev->pd);
-	mutex_destroy(&ec_dev->lock);
-	lockdep_unregister_key(&ec_dev->lockdep_key);
 	return err;
 }
 EXPORT_SYMBOL(cros_ec_register);
@@ -343,8 +348,6 @@ void cros_ec_unregister(struct cros_ec_device *ec_dev)
 						   &ec_dev->notifier_ready);
 	platform_device_unregister(ec_dev->pd);
 	platform_device_unregister(ec_dev->ec);
-	mutex_destroy(&ec_dev->lock);
-	lockdep_unregister_key(&ec_dev->lockdep_key);
 }
 EXPORT_SYMBOL(cros_ec_unregister);
 
-- 
2.51.0.268.g9569e192d0-goog


