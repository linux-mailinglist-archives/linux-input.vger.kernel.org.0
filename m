Return-Path: <linux-input+bounces-13742-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A9B177BF
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 23:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE8D57B2423
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 21:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBA9264FBB;
	Thu, 31 Jul 2025 21:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eY5+g//L"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E4125A2AA;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996034; cv=none; b=WuWs0Ah+/M0YAYT52qkxdSkpTt9M3aX+VCW2s8eNGUoCmoPC9INPjYlKqKlSnJGTISbVtDMewoIuwVKjDSOlEhHi4RRonGKdpR+wiHofycZGpKY+7S+nqwNclAzEs51E+jkYdrxZMfv5MOG07q5FTIWofuJKBrqEWwNkF1BeFGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996034; c=relaxed/simple;
	bh=wt3tMAQNjH7QXUaT5eywmVu/MXm11C/CrJGLDrJreYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FLSzZ70PsUmeEDOdczBEA6KIHi8eOFvAnFa8ZM5M5wQo29OHXkGXW/awpz6jKhhCb0VbH7e5dWfQl0G/FXgS+EWALmMuTlJ34mfa6eSqec9clcA8zkMCEwVfASm+hJKf6JPybh77YZZAqBiNVxONK2cc0cIwK+lkQFfBB0UPq7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eY5+g//L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CB22C4CEFA;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753996034;
	bh=wt3tMAQNjH7QXUaT5eywmVu/MXm11C/CrJGLDrJreYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eY5+g//LlTwO25ZbP4CL0rUVWZn5nYE77o+W9iUMc425RaeIzE1lKd4eO8UpoIQys
	 zKAoRfsYqugYOiXbyiFEF40UeF+ln823vEk5qkZyFw+L4OiPGvWfhdDQY8F1LHuMOV
	 yob+YKlgflwEC1SuNK/qWZbmbufpkUXowfO+3bOYwGS/HZINHzcpqJaL0qMZdfiIhZ
	 2hERSwPxkdiAB1OOVV/GHAlPWxtE9JAO7YLDK4Lt4uxCWbS8QH+soK/2zJxS6yrXXz
	 TJ8WKH8qKGlOwN8zk6O0zmPaYkwzmXZ2P/BQbCyHpHuyWh+m9shlJpK/W0FAV3wIWe
	 UEcdzvqFOEEbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C88C87FDA;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 31 Jul 2025 23:06:57 +0200
Subject: [PATCH RESEND v5 7/7] Input: synaptics-rmi4 - support fallback
 values for PDT descriptor bytes
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-synaptics-rmi4-v5-7-cd0d87d34afa@ixit.cz>
References: <20250731-synaptics-rmi4-v5-0-cd0d87d34afa@ixit.cz>
In-Reply-To: <20250731-synaptics-rmi4-v5-0-cd0d87d34afa@ixit.cz>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Casey Connolly <casey.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5812; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ydrRSeYmz91rM0r0O51CFGQGWObxeUx/kic8zsab5pU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoi9sA62W8kpS2OpUixDcfLR+/8BrR6vclDOk42
 wshGTV0+omJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIvbAAAKCRBgAj/E00kg
 cppaD/9LTKRWfrwP+q5uMdfCLQ3ye+gWB93AYjKrF9B4aD0WbLljUlsjSgm8h8GQ7mZhTmQwd8v
 F/Df6SBrC9A+JrLdTK/DJbqbCyRLRqzykRWKcso2SvWdAZCGPyXvR09lgmoy0uy4wgSJgC30ZlX
 +GJHcWkY776skUedrynlHk3v4IDn1enRxLLLB9h2QXEy8rhAMgMM06tJCXIhFEAqyzRamGWbNB3
 XkO0zgeAekobK/r6UxERU2t4hhnwXAei74SbLYW8Dys9/I1N5lX+1EzKUGGAVQHMZvf55j2u100
 nTTGYJrVqoFuCArOLNrLF2nVNWx8sU2xB7QmSo8yw7yc9DymRs1+vrdzLv0HvxSOv/JAkhfooy1
 giFtnB4V/QL5kgoB6tDbDlH8ZmHAIX9P6APvN2a4sb2lWlZ3WnUcs4A1VS7dD7BirLMvs777BXO
 frrrTIYdwagNWGr9oQLIeZzgMEIQxl3OxgVlwPGTNmCVwCEdVn6olxrBJx5DEqTSr1m7BqDBjTX
 +yw6ZRPUXzDeNMgip+QTuVRcf1mxQvXJ34Roun2Bv75+LMKd8N1SllMWobm65zVAOhZJ3eMh4P4
 MhsZ9EcX+keIUFlvXed3l+MwJ5OLDpv6ea1jzq74Q+xNnVctPzvHtED10q88svoF6Tvs5uVmkF8
 JL8xAkKrG8WHaFA==
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
2.50.1



