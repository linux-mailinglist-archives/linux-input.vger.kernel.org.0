Return-Path: <linux-input+bounces-14368-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEFBB39719
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 10:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCC855E25DC
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 08:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8BA2E0B5D;
	Thu, 28 Aug 2025 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtbmZCm2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4DC2D94B3;
	Thu, 28 Aug 2025 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756370183; cv=none; b=bD7qI3BR487AF0u36UPNQVULJrpMj/hmjZSqtwPii8D1GQiDSX7JthHAIBrY92whP2MNfn5qZ5C2Pj7F2gp8dTsXXAL9D3Nj79aJmwZNu4zcCdEE+8LiFD5GHA8zQdZqsMnvYaw+wiMrtyr72adoivWvbsMi2kdPxbfARZhdbt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756370183; c=relaxed/simple;
	bh=GwQGXwgvKAro243Z/bEC+EpR0j0HqiLPCxEA+X7HM6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7p1JzHNMPM4YdazGhyktdmQ0x4/YXgst8J5ve/nQkGvsbQNaSjqbWiLjgN81vd0PnUyoErG1H0XSw3fEBND3sFoVA+85MO+OyXR6cML9nWTU8flEt7uGEyVQPo/HZXX/Fe2Ga9WnNO9+Q6KSsNti3fMXvRTvFC7awWuW0OKkow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtbmZCm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989ABC4CEF5;
	Thu, 28 Aug 2025 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756370183;
	bh=GwQGXwgvKAro243Z/bEC+EpR0j0HqiLPCxEA+X7HM6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TtbmZCm2/GJTbwHMwYp43TKVHwG/yzgbXHHn3/vwEZSzzfU0cGjjtQV31Shms6PQe
	 az/+FSOVgQC22KjOLJIqUGki/lQtgd8IDc+ccbcAFlBOii71vGE9fQj55bHIoRVqTm
	 C7bvII1FWwDR3i4DPAByk8FEL/8N9CusLd5lt3ysD9q/yKPkNNOv4f6mHlVMslwrLe
	 w1ZzckqEACsZsLT9T6nH6VxHLg27GHb/H/FZaEyI1qDP6MkHBFvBU2dhFcoRzr01f+
	 phT+r4uzpLIpHjcEsJ2GTmEgMcW+qYS2YdhdoKyfyMVSxcmw2fxSnGQXFEz9WKKUyv
	 eZePb5GpZR8RQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 2/5] platform/chrome: Centralize common cros_ec_device initialization
Date: Thu, 28 Aug 2025 08:35:58 +0000
Message-ID: <20250828083601.856083-3-tzungbi@kernel.org>
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

Move the common initialization from protocol device drivers into central
cros_ec_device_alloc().

This removes duplicated code from each driver's probe function.
The buffer sizes are now calculated once, using the maximum possible
overhead required by any of the transport protocols, ensuring the
allocated buffers are sufficient for all cases.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec.c           |  9 +++++++++
 drivers/platform/chrome/cros_ec_i2c.c       |  5 -----
 drivers/platform/chrome/cros_ec_ishtp.c     |  4 ----
 drivers/platform/chrome/cros_ec_lpc.c       |  4 ----
 drivers/platform/chrome/cros_ec_rpmsg.c     |  4 ----
 drivers/platform/chrome/cros_ec_spi.c       |  5 -----
 drivers/platform/chrome/cros_ec_uart.c      |  4 ----
 include/linux/platform_data/cros_ec_proto.h | 14 ++++++++++----
 8 files changed, 19 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 25283a148ab9..da049068b6e9 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -38,6 +38,15 @@ struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
 	if (!ec_dev)
 		return NULL;
 
+	ec_dev->din_size = sizeof(struct ec_host_response) +
+			   sizeof(struct ec_response_get_protocol_info) +
+			   EC_MAX_RESPONSE_OVERHEAD;
+	ec_dev->dout_size = sizeof(struct ec_host_request) +
+			    sizeof(struct ec_params_rwsig_action) +
+			    EC_MAX_REQUEST_OVERHEAD;
+
+	ec_dev->dev = dev;
+
 	return ec_dev;
 }
 EXPORT_SYMBOL(cros_ec_device_alloc);
diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chrome/cros_ec_i2c.c
index ee3c5130ec3f..def1144a077e 100644
--- a/drivers/platform/chrome/cros_ec_i2c.c
+++ b/drivers/platform/chrome/cros_ec_i2c.c
@@ -297,16 +297,11 @@ static int cros_ec_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, ec_dev);
-	ec_dev->dev = dev;
 	ec_dev->priv = client;
 	ec_dev->irq = client->irq;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_i2c;
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_i2c;
 	ec_dev->phys_name = client->adapter->name;
-	ec_dev->din_size = sizeof(struct ec_host_response_i2c) +
-			   sizeof(struct ec_response_get_protocol_info);
-	ec_dev->dout_size = sizeof(struct ec_host_request_i2c) +
-			    sizeof(struct ec_params_rwsig_action);
 
 	err = cros_ec_register(ec_dev);
 	if (err) {
diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index c102a796670c..4e74e702c5a2 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -550,14 +550,10 @@ static int cros_ec_dev_init(struct ishtp_cl_data *client_data)
 	client_data->ec_dev = ec_dev;
 	dev->driver_data = ec_dev;
 
-	ec_dev->dev = dev;
 	ec_dev->priv = client_data->cros_ish_cl;
 	ec_dev->cmd_xfer = NULL;
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_ish;
 	ec_dev->phys_name = dev_name(dev);
-	ec_dev->din_size = sizeof(struct cros_ish_in_msg) +
-			   sizeof(struct ec_response_get_protocol_info);
-	ec_dev->dout_size = sizeof(struct cros_ish_out_msg) + sizeof(struct ec_params_rwsig_action);
 
 	return cros_ec_register(ec_dev);
 }
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 30fa89b81666..78cfff80cdea 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -642,14 +642,10 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, ec_dev);
-	ec_dev->dev = dev;
 	ec_dev->phys_name = dev_name(dev);
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_lpc;
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_lpc;
 	ec_dev->cmd_readmem = cros_ec_lpc_readmem;
-	ec_dev->din_size = sizeof(struct ec_host_response) +
-			   sizeof(struct ec_response_get_protocol_info);
-	ec_dev->dout_size = sizeof(struct ec_host_request) + sizeof(struct ec_params_rwsig_action);
 	ec_dev->priv = ec_lpc;
 
 	/*
diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/drivers/platform/chrome/cros_ec_rpmsg.c
index 9ac2b923db6d..09bd9e49464e 100644
--- a/drivers/platform/chrome/cros_ec_rpmsg.c
+++ b/drivers/platform/chrome/cros_ec_rpmsg.c
@@ -224,14 +224,10 @@ static int cros_ec_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (!ec_rpmsg)
 		return -ENOMEM;
 
-	ec_dev->dev = dev;
 	ec_dev->priv = ec_rpmsg;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_rpmsg;
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_rpmsg;
 	ec_dev->phys_name = dev_name(&rpdev->dev);
-	ec_dev->din_size = sizeof(struct ec_host_response) +
-			   sizeof(struct ec_response_get_protocol_info);
-	ec_dev->dout_size = sizeof(struct ec_host_request) + sizeof(struct ec_params_rwsig_action);
 	dev_set_drvdata(dev, ec_dev);
 
 	ec_rpmsg->rpdev = rpdev;
diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
index c778300a4145..28fa82f8cb07 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -757,16 +757,11 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	cros_ec_spi_dt_probe(ec_spi, dev);
 
 	spi_set_drvdata(spi, ec_dev);
-	ec_dev->dev = dev;
 	ec_dev->priv = ec_spi;
 	ec_dev->irq = spi->irq;
 	ec_dev->cmd_xfer = cros_ec_cmd_xfer_spi;
 	ec_dev->pkt_xfer = cros_ec_pkt_xfer_spi;
 	ec_dev->phys_name = dev_name(&ec_spi->spi->dev);
-	ec_dev->din_size = EC_MSG_PREAMBLE_COUNT +
-			   sizeof(struct ec_host_response) +
-			   sizeof(struct ec_response_get_protocol_info);
-	ec_dev->dout_size = sizeof(struct ec_host_request) + sizeof(struct ec_params_rwsig_action);
 
 	ec_spi->last_transfer_ns = ktime_get_ns();
 
diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
index 1a7511b1bbe3..d5b37414ff12 100644
--- a/drivers/platform/chrome/cros_ec_uart.c
+++ b/drivers/platform/chrome/cros_ec_uart.c
@@ -276,14 +276,10 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
 
 	/* Initialize ec_dev for cros_ec  */
 	ec_dev->phys_name = dev_name(dev);
-	ec_dev->dev = dev;
 	ec_dev->priv = ec_uart;
 	ec_dev->irq = ec_uart->irq;
 	ec_dev->cmd_xfer = NULL;
 	ec_dev->pkt_xfer = cros_ec_uart_pkt_xfer;
-	ec_dev->din_size = sizeof(struct ec_host_response) +
-			   sizeof(struct ec_response_get_protocol_info);
-	ec_dev->dout_size = sizeof(struct ec_host_request) + sizeof(struct ec_params_rwsig_action);
 
 	serdev_device_set_client_ops(serdev, &cros_ec_uart_client_ops);
 
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 3ec24f445c29..4d96cffbb9e3 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -33,12 +33,18 @@
 
 /*
  * Max bus-specific overhead incurred by request/responses.
- * I2C requires 1 additional byte for requests.
- * I2C requires 2 additional bytes for responses.
- * SPI requires up to 32 additional bytes for responses.
+ *
+ * Request:
+ * - I2C requires 1 byte (see struct ec_host_request_i2c).
+ * - ISHTP requires 4 bytes (see struct cros_ish_out_msg).
+ *
+ * Response:
+ * - I2C requires 2 bytes (see struct ec_host_response_i2c).
+ * - ISHTP requires 4 bytes (see struct cros_ish_in_msg).
+ * - SPI requires 32 bytes (see EC_MSG_PREAMBLE_COUNT).
  */
 #define EC_PROTO_VERSION_UNKNOWN	0
-#define EC_MAX_REQUEST_OVERHEAD		1
+#define EC_MAX_REQUEST_OVERHEAD		4
 #define EC_MAX_RESPONSE_OVERHEAD	32
 
 /*
-- 
2.51.0.268.g9569e192d0-goog


