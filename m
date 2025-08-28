Return-Path: <linux-input+bounces-14367-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97893B3971A
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 10:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48C7B7AA078
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 08:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18D32DF6F4;
	Thu, 28 Aug 2025 08:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+sTBjBW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F652D94B3;
	Thu, 28 Aug 2025 08:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756370182; cv=none; b=TfdFQUStWENa6B8+JdNF8C0aNlmCEk0K4XzHSY0xy6VR5+rbwx50npFpOC6u68ZiCXRHbyzpMjtNN1IFTzwIzg5wyLaDGRcvS2eWbYoO91FTNqT6y77T+kEG9UNURnc+iU5RHbx2V0uQzlcObyiypfzoz3g6xIAIlIUTbrZXNMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756370182; c=relaxed/simple;
	bh=bOFc5F0sceucudWZM8vrUviQSdurdZCsxUDVtOwblr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEXQyTecvOMAtJuEmfxO3FNAkx1BiNub2o0VyzyRkpws7QAHIfqZHHAV/UGCynnIdxtsGwOdwaC5ounqxtzkqzvkkb/rdVOaSvvjO4ebjhI8ff8WAiaqVYcA3NZW9VuIie9BCvo6J8OODvEl6/ltZ20OLoyo59kYAkNMBTyCutk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+sTBjBW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1D5C4CEF4;
	Thu, 28 Aug 2025 08:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756370182;
	bh=bOFc5F0sceucudWZM8vrUviQSdurdZCsxUDVtOwblr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K+sTBjBWNL3aq1PUtvyOgNkPpcd5JAzFVQHtGRRiXCnACQOqBzjVoXIFPXUyeNQUW
	 MS9ndhejMItkntYGaMN9+0QAtlmtVmtelnmVLb8e8cq2UQkEnlYdqE2oVWZgD1FQFF
	 xHlzawlYtsq8sujdCN/CfYnax1m0Vq2tfg978ZzcSq0LsEGB8OxVFm3/g7TidzqBd4
	 98pPeFLoCQN3A/PA0swozkBUci+7gGETByZKxDyMlKcc+3kYANQEk5qJrttu00/ZvG
	 kPMmQ0GuAFjmeuc9h9ORVQgcV76p0D3KB2p2AWyitpyRJHbyEDgI8lbXQpaLWNXnUU
	 hvDcjSzOemsNw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 1/5] platform/chrome: Centralize cros_ec_device allocation
Date: Thu, 28 Aug 2025 08:35:57 +0000
Message-ID: <20250828083601.856083-2-tzungbi@kernel.org>
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

Introduce a helper function, cros_ec_device_alloc(), to centralize the
allocation of the struct cros_ec_device.  Convert all protocol device
drivers to use this new function.

This is a preparatory step for separating common initialization logic
out of device drivers' probe() and cros_ec_register().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec.c       | 12 ++++++++++++
 drivers/platform/chrome/cros_ec.h       |  3 +++
 drivers/platform/chrome/cros_ec_i2c.c   |  4 ++--
 drivers/platform/chrome/cros_ec_ishtp.c |  2 +-
 drivers/platform/chrome/cros_ec_lpc.c   |  2 +-
 drivers/platform/chrome/cros_ec_rpmsg.c |  2 +-
 drivers/platform/chrome/cros_ec_spi.c   |  2 +-
 drivers/platform/chrome/cros_ec_uart.c  |  2 +-
 8 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index b1730362e399..25283a148ab9 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -30,6 +30,18 @@ static struct cros_ec_platform pd_p = {
 	.cmd_offset = EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX),
 };
 
+struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
+{
+	struct cros_ec_device *ec_dev;
+
+	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	if (!ec_dev)
+		return NULL;
+
+	return ec_dev;
+}
+EXPORT_SYMBOL(cros_ec_device_alloc);
+
 /**
  * cros_ec_irq_handler() - top half part of the interrupt handler
  * @irq: IRQ id
diff --git a/drivers/platform/chrome/cros_ec.h b/drivers/platform/chrome/cros_ec.h
index 6b95f1e0bace..cd4643bc5367 100644
--- a/drivers/platform/chrome/cros_ec.h
+++ b/drivers/platform/chrome/cros_ec.h
@@ -11,6 +11,9 @@
 #include <linux/interrupt.h>
 
 struct cros_ec_device;
+struct device;
+
+struct cros_ec_device *cros_ec_device_alloc(struct device *dev);
 
 int cros_ec_register(struct cros_ec_device *ec_dev);
 void cros_ec_unregister(struct cros_ec_device *ec_dev);
diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chrome/cros_ec_i2c.c
index 38af97cdaab2..ee3c5130ec3f 100644
--- a/drivers/platform/chrome/cros_ec_i2c.c
+++ b/drivers/platform/chrome/cros_ec_i2c.c
@@ -289,10 +289,10 @@ static int cros_ec_cmd_xfer_i2c(struct cros_ec_device *ec_dev,
 static int cros_ec_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct cros_ec_device *ec_dev = NULL;
+	struct cros_ec_device *ec_dev;
 	int err;
 
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 7e7190b30cbb..c102a796670c 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -543,7 +543,7 @@ static int cros_ec_dev_init(struct ishtp_cl_data *client_data)
 	struct cros_ec_device *ec_dev;
 	struct device *dev = cl_data_to_dev(client_data);
 
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 7d9a78289c96..30fa89b81666 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -637,7 +637,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 		}
 	}
 
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/drivers/platform/chrome/cros_ec_rpmsg.c
index bc2666491db1..9ac2b923db6d 100644
--- a/drivers/platform/chrome/cros_ec_rpmsg.c
+++ b/drivers/platform/chrome/cros_ec_rpmsg.c
@@ -216,7 +216,7 @@ static int cros_ec_rpmsg_probe(struct rpmsg_device *rpdev)
 	struct cros_ec_device *ec_dev;
 	int ret;
 
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
index 8ca0f854e7ac..c778300a4145 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -749,7 +749,7 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	if (ec_spi == NULL)
 		return -ENOMEM;
 	ec_spi->spi = spi;
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
index 19c179d49c90..1a7511b1bbe3 100644
--- a/drivers/platform/chrome/cros_ec_uart.c
+++ b/drivers/platform/chrome/cros_ec_uart.c
@@ -259,7 +259,7 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
 	if (!ec_uart)
 		return -ENOMEM;
 
-	ec_dev = devm_kzalloc(dev, sizeof(*ec_dev), GFP_KERNEL);
+	ec_dev = cros_ec_device_alloc(dev);
 	if (!ec_dev)
 		return -ENOMEM;
 
-- 
2.51.0.268.g9569e192d0-goog


