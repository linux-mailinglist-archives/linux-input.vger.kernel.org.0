Return-Path: <linux-input+bounces-16104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FFAC590B1
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 18:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 27E05548739
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 16:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643B6363C69;
	Thu, 13 Nov 2025 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjxCpYfr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D7D363C42;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051468; cv=none; b=bt5Fr+fwpGn7NINJMuywi4rpmZ8TGgDJTlNe877ga3GHL1+MwqSk8bPOrrAE9LvRTS//zNeKjv7V8hSOBr8CGM1roZea7fNukHTOCTEwExGxWR2aDTktfBHreyfG7PfwSbisIafw1rl1RQBVtbQvwEgJTONBpLxUa+3i2nsFQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051468; c=relaxed/simple;
	bh=ImsBrSsWCbftesE+Cb1PYnzgguu50ch+W6P48qu+dUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjCwsc/1MNKdFe/4P5nlTD1x5MG1zFE1vJm8eoodC0O0tfyKPGcf5YI/9qoeeGFBIOpqP4mQeym8oljoH/5UP0oDNgDl4f+9LTmhih1tv81kf3a/tzXK2okEOK8ynWX9mrM7SCAWuSuPAHb4GWUpu9CX4Ey5Wv3y47C68Ocy6Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjxCpYfr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87BA8C2BCC4;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763051467;
	bh=ImsBrSsWCbftesE+Cb1PYnzgguu50ch+W6P48qu+dUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qjxCpYfrA+jv9Cs/yv229WgXJxRN+0rlmD69yl8QvZ+mQZUWi7J9/5KxAT//fNUpu
	 Xqax7/rVDSDd372Dy60R8t+3UMZhlNTT7hNVug1DlxJLcsuvj7Se96Q4aE4M3eEhQn
	 4yo4wxAUEckApMesXY7cBeilI7CCmoemizq7I6Mo9fdGq3CnLxRWVSk059BjsOmQ3Y
	 nW3FdeyKjLcKwvSEloJVp2RxBAgvCmi4yGycATT43pX1Ee4ftH4S+focUvYR9Q+LIO
	 ks33tthtdECLMINZTMb3FOUzsvrkIFFeXitKbySepsCDjcWbh0QVMjiwoHKVasDp21
	 RATVEsFBFzg9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59690CD8CA7;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 17:31:03 +0100
Subject: [PATCH v6 7/7] Input: synaptics-rmi4 - support fallback values for
 PDT descriptor bytes
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-synaptics-rmi4-v6-7-d9836afab801@ixit.cz>
References: <20251113-synaptics-rmi4-v6-0-d9836afab801@ixit.cz>
In-Reply-To: <20251113-synaptics-rmi4-v6-0-d9836afab801@ixit.cz>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5650; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=WDxThFuTW5xe6P2WYsbevC4RS4y/BvA9+hBHQwKvAJE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFgfJZS4oQt3CYBKaahhk76Gf+LJqmETicSXSh
 LQs/aKqEFaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYHyQAKCRBgAj/E00kg
 cvTED/9o0xvCKweql1jKRZ1ltYvYsDJWnYgxmZAlbO0XL5K0kgJX4xvJ0w+7KZKwSJmREszyjMX
 uw4wiFyMxn3lSEJD1NEEbfk0qF8gvUv0rKCTzRTY3yx/gO1BLEMcTvxuLdqrQNAv9WI8xEGpGel
 HE9kS/SUf9sS+DNLRVsLn7eAfYzqBL+BCjqJrDA7Zs/CBh81ab0Wwvg33V8y0F/i6cX2lt5QpgW
 NcvwAtFqoJzPhrqupY929bQIdfCI2yOVyuRxmbqWOQmzBXr6U5bTDtiYupfqkIPgKr908J9JapP
 d0h+4SduEnHHrsN9yFdqU98I7skD9mNREUutvzedrAgG1V6QQsW4JpX+vHvLcKPJ5fXylXWlRs1
 UKwVn7dd+6WuJtPydTizVEOykj2kdJ64/niTfW4OUbuJDRTaPS3gDhGt8eRLT903vtkW76JduQ6
 9FYtjYimVc+Lh5VX7iHe0KaDZEsRii37wveTvUkdtuyVEOUqr75hXZSEHIlS0d3t8Bji9ZON21G
 Bo0oSBbn1lDKKoHs30i6G7j5bAVTHC/CS3N2yr06V/ltR2rIQF7raNI4EzXlfJSquXUElmbdeqT
 lX2yA5V0lsSpSp0V3plDF6vzv7YfsZbE7PXjtXy9tmwmn2RKA12WykfEmsWVy10kSfmyMay3ya6
 Z/3zn38+y8pZZvw==
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
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_driver.c | 62 +++++++++++++++++++++++++++++++++++------
 drivers/input/rmi4/rmi_driver.h |  2 ++
 include/linux/rmi.h             |  3 ++
 3 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 93a190e333c66..bb1db5bbb3abb 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -462,9 +462,10 @@ static int rmi_driver_reset_handler(struct rmi_device *rmi_dev)
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
 
@@ -475,6 +476,21 @@ static int rmi_read_pdt_entry(struct rmi_device *rmi_dev,
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
@@ -547,7 +563,7 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 	int retval;
 
 	for (addr = pdt_start; addr >= pdt_end; addr -= RMI_PDT_ENTRY_SIZE) {
-		error = rmi_read_pdt_entry(rmi_dev, &pdt_entry, addr);
+		error = rmi_read_pdt_entry(rmi_dev, &pdt_entry, state, addr);
 		if (error)
 			return error;
 
@@ -1024,9 +1040,13 @@ static int rmi_driver_remove(struct device *dev)
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
@@ -1034,11 +1054,37 @@ static int rmi_driver_of_probe(struct device *dev,
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
@@ -1159,7 +1205,7 @@ static int rmi_driver_probe(struct device *dev)
 	pdata = rmi_get_platform_data(rmi_dev);
 
 	if (rmi_dev->xport->dev->of_node) {
-		retval = rmi_driver_of_probe(rmi_dev->xport->dev, pdata);
+		retval = rmi_driver_of_probe(rmi_dev, pdata);
 		if (retval)
 			return retval;
 	}
diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
index a4ae2af93ce3a..b931f428713bf 100644
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
index ab7eea01ab427..4ba2cefac8558 100644
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
2.51.0



