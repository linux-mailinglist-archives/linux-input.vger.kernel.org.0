Return-Path: <linux-input+bounces-11710-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3025EA84651
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 16:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 530811B61092
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 14:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCFE28D824;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gji7fY8D"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8065728CF5B;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295304; cv=none; b=bEPgTOQWoZyv61oUOEKenAh/jXyLEIXIMyHLfbpExjMcCs4jjtBce/zDmcjTuteU4bLOyantQX89kIUN9mFl4Q8IRDF7wwAVB0NXsC9UvVCFK0BYBXR8ZeZjpuHMGLFHx5idW3Rt+gkZBO7IdE5VR4wGs1LOwDtsCFqnzFYpV6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295304; c=relaxed/simple;
	bh=1m5MrCMQZzlU0LN1R3HC+JwbXbXfHGmK5U8Hi2uUEyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CkhioTTr0oxyHRsvj0aBT/aWgGwV8r58QLBsK/aQ1K7e+gDnupq7h0xo6L7ZJqh3tb7hPa0GbLAWBqxi+rzdQtsshKriSruxgdsBqIfI84BoqkFiodbY09Kfsh6Ey8LysVripdwXMSK31DVp3ToAWpVoQ3myVR0q1jj5juNSV9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gji7fY8D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BF91C4CEED;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744295304;
	bh=1m5MrCMQZzlU0LN1R3HC+JwbXbXfHGmK5U8Hi2uUEyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gji7fY8DFeP004b5Iejv6FALlhgzP7dYKkZCpsLielfBcGg7x0arY9RcS5Bv7BKbP
	 PKOUiX55IJhS81lGgm7HUAhDzwlgfb35f84dSDeTBdYd7JcM03OpxeA/4qCHr5ijOb
	 yZZfLcr1sxcJJGV1C2+zdz1tTW8MeJn3W5Amoy+Sn+IqlSLQLue5whQ44Gt4/IECQ9
	 asgb2RxNc1/GpY+Ep13C9MbtEDy+8RTE6eW/fGJx6ehINkCbctpiCzqPURSE/9lMUh
	 Wzx8G8YzRa2J+QFvH57QQjhTixX+A/74Ergciphqk8espJvWtHow5MB35r3uKPeZ8U
	 p+IWVrLjxvfJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01800C369A9;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 10 Apr 2025 16:28:25 +0200
Subject: [PATCH v5 7/7] Input: synaptics-rmi4 - support fallback values for
 PDT descriptor bytes
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-synaptics-rmi4-v5-7-b41bb90f78b9@ixit.cz>
References: <20250410-synaptics-rmi4-v5-0-b41bb90f78b9@ixit.cz>
In-Reply-To: <20250410-synaptics-rmi4-v5-0-b41bb90f78b9@ixit.cz>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5812; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DYMCSRx4MYk/eiJZRVIbkMrJs+fsXN/6sXerZ8espFs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn99WFILMWTotJJzfqkt07UciWHWfwLLcdraefK
 +eWaJEz1eGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ/fVhQAKCRBgAj/E00kg
 cg6eD/4pEfQGtsusYNhAuIKQiEbi7zyY13QPhez7C1VHAsIblmK4vWf/K4vNcSdkTORNrEUqZxy
 MKz/eKGbDMEBRCWo4WwnmP4G3eq2pNy5VRjSNhVObQm/n9P0Zyt9M08gh76CZHPLhvsktHbzzKg
 uHQ4u2aYhH6jUlUS/8yi2i4Wek4piscVmFpqCnCQw28rTf8gb5xGxC1gLTKN4AcDpbyw6NmSjWD
 /AyAkVvNKWuSbZP/GiCWQmERhbtr1uK7aVH4RpEdRZrYdaKMDNw0aIB0tIiXTfy2i0mFfFWfDdK
 W060UQJVrLFE4cAlEIRG50lihHVk3dOEeTvnSpXpXgpeli6w48ZcvRxW9TmYpd8JW2MqnHj7Hz3
 2RByGzUo3KoRDoK8AlFdl+CUmrJEO2E3oDXlsB1drjF6jMCDefVxnnxbcIrya/jQu8f8QpGzrxr
 hZVNh+5VOBiq0p/uY930OVlyyX1u8oxwhbE1NVkL/sBr0WiXmuTpRV/Af+GeckA8hzovcPrQt+n
 jRyHe11grMay0VD0wmhwmS+FgmmYXjx0K73lbCuQ8KelxNjYTUmPugXSxPybZMtc4TnDb8oVLVD
 sJagrXW+21t/ze7qW4JCRezbm7MHUbHi9KjEBKuTraYEcL1VBbQie9ko7I40xu3hRBVWXlswr/1
 spMdD6yCS4HJvfA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Kaustabh Chakraborty <kauschluss@disroot.org>

Some replacement displays include third-party touch ICs which do not
expose the function number and the interrupt status in its PDT entries.

OnePlus 6 (original touch IC)
  rmi4_i2c 12-0020: read 6 bytes at 0x00e3: 0 (2b 22 0d 06 01 01)

OnePlus 6 (aftermarket touch IC)
  rmi4_i2c 12-0020: read 6 bytes at 0x00e3: 0 (2c 23 0d 06 00 00)

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
[codeflow adjustments, checkpatch fixes, wording]
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_driver.c | 62 +++++++++++++++++++++++++++++++++++------
 drivers/input/rmi4/rmi_driver.h |  2 ++
 include/linux/rmi.h             |  3 ++
 3 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index f977541d8913525d53a59e1d53c33897f1c93901..e736e90c071466cc61a441bcb3061564e039bfc8 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -461,9 +461,10 @@ static int rmi_driver_reset_handler(struct rmi_device *rmi_dev)
 	return 0;
 }
 
-static int rmi_read_pdt_entry(struct rmi_device *rmi_dev,
-			      struct pdt_entry *entry, u16 pdt_address)
+static int rmi_read_pdt_entry(struct rmi_device *rmi_dev, struct pdt_entry *entry,
+			      struct pdt_scan_state *state, u16 pdt_address)
 {
+	const struct rmi_device_platform_data *pdata = rmi_get_platform_data(rmi_dev);
 	u8 buf[RMI_PDT_ENTRY_SIZE];
 	int error;
 
@@ -474,6 +475,21 @@ static int rmi_read_pdt_entry(struct rmi_device *rmi_dev,
 		return error;
 	}
 
+	if (pdata->pdt_fallback_size > state->pdt_count * RMI_OF_PDT_DESC_CELLS + 1) {
+		/* Use the description bytes from the driver */
+		buf[5] = pdata->pdt_fallback_desc[state->pdt_count * RMI_OF_PDT_DESC_CELLS];
+		buf[4] = pdata->pdt_fallback_desc[state->pdt_count * RMI_OF_PDT_DESC_CELLS + 1];
+
+		error = rmi_read_block(rmi_dev, pdt_address, buf,
+				RMI_PDT_ENTRY_SIZE - 2);
+		if (error) {
+			dev_err(&rmi_dev->dev,
+					"Read PDT entry at %#06x failed, code: %d.\n",
+					pdt_address, error);
+			return error;
+		}
+	}
+
 	entry->page_start = pdt_address & RMI4_PAGE_MASK;
 	entry->query_base_addr = buf[0];
 	entry->command_base_addr = buf[1];
@@ -546,7 +562,7 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 	int retval;
 
 	for (addr = pdt_start; addr >= pdt_end; addr -= RMI_PDT_ENTRY_SIZE) {
-		error = rmi_read_pdt_entry(rmi_dev, &pdt_entry, addr);
+		error = rmi_read_pdt_entry(rmi_dev, &pdt_entry, state, addr);
 		if (error)
 			return error;
 
@@ -1023,9 +1039,13 @@ static int rmi_driver_remove(struct device *dev)
 }
 
 #ifdef CONFIG_OF
-static int rmi_driver_of_probe(struct device *dev,
-				struct rmi_device_platform_data *pdata)
+static const u8 rmi_s3706_fallback_pdt[] = {34, 41, 01, 01, 12, 01};
+
+static int rmi_driver_of_probe(struct rmi_device *rmi_dev,
+			       struct rmi_device_platform_data *pdata)
 {
+	struct device *dev = rmi_dev->xport->dev;
+	u8 buf[RMI_PDT_ENTRY_SIZE];
 	int retval;
 
 	retval = rmi_of_property_read_u32(dev, &pdata->reset_delay_ms,
@@ -1033,11 +1053,37 @@ static int rmi_driver_of_probe(struct device *dev,
 	if (retval)
 		return retval;
 
+	/*
+	 * In some aftermerket touch ICs, the first PDT entry is empty and
+	 * the function number register is 0. If so, the driver
+	 * may have provide backup PDT entries.
+	 */
+
+	retval = rmi_read_block(rmi_dev, PDT_START_SCAN_LOCATION,
+			buf, RMI_PDT_ENTRY_SIZE);
+	if (retval) {
+		dev_err(dev, "Read PDT entry at %#06x failed, code: %d.\n",
+			PDT_START_SCAN_LOCATION, retval);
+		return retval;
+	}
+
+	if (!RMI4_END_OF_PDT(buf[5]))
+		return 0;
+
+	/* List of known PDT entries per compatible. */
+	if (of_device_is_compatible(dev->of_node, "syna,rmi4-s3706b")) {
+		pdata->pdt_fallback_desc = rmi_s3706_fallback_pdt;
+		pdata->pdt_fallback_size = ARRAY_SIZE(rmi_s3706_fallback_pdt);
+	} else {
+		dev_err(dev, "First PDT entry is empty and no backup values provided.\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 #else
-static inline int rmi_driver_of_probe(struct device *dev,
-					struct rmi_device_platform_data *pdata)
+static inline int rmi_driver_of_probe(struct rmi_device *rmi_dev,
+				      struct rmi_device_platform_data *pdata)
 {
 	return -ENODEV;
 }
@@ -1158,7 +1204,7 @@ static int rmi_driver_probe(struct device *dev)
 	pdata = rmi_get_platform_data(rmi_dev);
 
 	if (rmi_dev->xport->dev->of_node) {
-		retval = rmi_driver_of_probe(rmi_dev->xport->dev, pdata);
+		retval = rmi_driver_of_probe(rmi_dev, pdata);
 		if (retval)
 			return retval;
 	}
diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
index cb1cacd013a3f39db96935f705f18018bf15adff..3b87d177db59591691a56ce7ac03dd2e8671421d 100644
--- a/drivers/input/rmi4/rmi_driver.h
+++ b/drivers/input/rmi4/rmi_driver.h
@@ -31,6 +31,8 @@
 #define RMI_PDT_FUNCTION_VERSION_MASK   0x60
 #define RMI_PDT_INT_SOURCE_COUNT_MASK   0x07
 
+#define RMI_OF_PDT_DESC_CELLS 2
+
 #define PDT_START_SCAN_LOCATION 0x00e9
 #define PDT_END_SCAN_LOCATION	0x0005
 #define RMI4_END_OF_PDT(id) ((id) == 0x00 || (id) == 0xff)
diff --git a/include/linux/rmi.h b/include/linux/rmi.h
index ab7eea01ab4274bfc9efcefcdb0cced6ec34966f..4ba2cefac85583a4ba65c70dca418a2c7c65362a 100644
--- a/include/linux/rmi.h
+++ b/include/linux/rmi.h
@@ -214,6 +214,9 @@ struct rmi_device_platform_data {
 	int reset_delay_ms;
 	int irq;
 
+	unsigned int pdt_fallback_size;
+	const u8 *pdt_fallback_desc;
+
 	struct rmi_device_platform_data_spi spi_data;
 
 	/* function handler pdata */

-- 
2.49.0



