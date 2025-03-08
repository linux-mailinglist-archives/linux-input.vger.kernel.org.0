Return-Path: <linux-input+bounces-10650-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B8FA57AEB
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 15:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D873E3B1DF6
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 14:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305BE1D934B;
	Sat,  8 Mar 2025 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJwhmt9w"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0071BD4E5;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741442924; cv=none; b=MDpzn/ZBoA9bRePiO240YeqVeA5FSFGluf8d8OiwVfvuPueGD4zabbETJWwaGSZEmvLpvwGA9bQqzVJWLTbd7Yu65QLBkx4E7lJdvTMpS/HyYAeCWC755L1mipBy8a9yqbt8QY6j4tWHKIQty+xcALqr850HW+BzjGEH12Xu6wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741442924; c=relaxed/simple;
	bh=Ib1RxKPJXDynmwe5rkzdveYc0pqL9TtucOCQXMLF+aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lDhTf9pjsA2B8XhCAauPTro7mapsKHN0WPPsnUbIr5/Yqg/SsU0lzciKCpZxRzkw+BTyVAFxRxKkKe2iq93k/UJ1GXZdNi1MYC4suTp91Mpoea09l87zX5lDLnhpWNQNEdiCejvZr4yXxXYI4aNsVsm18YS+3OBhe/KrZlY+dGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJwhmt9w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 805CEC4CEFB;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741442924;
	bh=Ib1RxKPJXDynmwe5rkzdveYc0pqL9TtucOCQXMLF+aQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vJwhmt9wEXKMyvyyfgyOii7S36GnSv8DBHl6qDMRxlD/mL5qIoWa4Npki09dtcRp7
	 qoxLmbi3YtiTvOguyXcfTzAMCMgmWtx4RPvBwZzZ0gJkaEiQhtuWeJhgtf1ni9/jPb
	 ntmtynaLx7IEt7EJbNTowItltQUVSJBKqf9n+amc+TkDYOAw2vi96L4yccJ3CREl7Y
	 JL06d8jQp5PSGNs9K3kKPPNiufJ1y12TzTocFr5hsbAjs4+7CQKQLaWHvztgH70sW4
	 qiQzeXvxnWVDaYuQ8gPkLNytMM4B4uMrMCDrsx3oy+sLrjWTmR7B6qjKiuLNtuuEpa
	 ToTJIon34FHtw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A28C282EC;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 08 Mar 2025 15:08:43 +0100
Subject: [PATCH v3 7/7] Input: synaptics-rmi4 - support fallback values for
 PDT descriptor bytes
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-synaptics-rmi4-v3-7-215d3e7289a2@ixit.cz>
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
In-Reply-To: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, methanal <baclofen@tuta.io>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6298; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Dn5bsYg4pf/Oeca1et0GD9N++L1Q1XHbzr6rlTyTyRc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBnzE9qXHjqdifeUGdAvEjMz8T7DdSjpZMWlnOYu
 zAQbOZe63WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ8xPagAKCRBgAj/E00kg
 curOD/wJdyymSHG97wQFh8EeZ1106F5az7WIyDPmIUgofVsYkTF3uasNhbkgfPE80jS85WoqIa4
 gIAp+YZEC/F//wfVz8hzOm/OFsYJJNTvnYoybV5h4MkK1U4PPo1KUyj3f+Z2UmM5I9HrkDJEiaj
 QlBtUgF9SNH34XVm4vN2PjKJLk7+zzd8fIedwYu0zhkhRoY98VDAUgn0S6R3lHmpgTxgCJh686F
 T3kc4BtmMSrLjyTEljMpU0l3WRMH/hNqRassLVwHCVIE9FB65NeknQQwUHYeRP2tknO6qoM5YGc
 UI/IPQ5ZRjdt6KzmxbzZPeDDeXzMZYEV9PY/2nngYnoDhCQvVamDcFH3gJq3FbW2hZxMgZI5noc
 rhRL690JIj9kaXtpthFeRL/G8vEuup4FQL15lGCtTIWYMVkkdFDP8s95SBUR8/SGGCUrtyzIED7
 Ss9iNQZTgr23jdG/Z3WlD0wOqUMSHmJXJDCTtm+HhaHOnWQZhbF7DMM2Gzs0S5AjsvEQGq09bMu
 ETE3dnr3vmzi4XnE5gTI57M6y39szjMX3tw1x4S+LEpmqD6Mgu3UO3LUQMtkgL5umfJ2y9qnhV4
 HNJMCT094qzX+cbETpNHiJA1cuJiTuIvohMkDId6s8FpXfNjXwejtqcWFklieRj6lrPIJj4xzoz
 epJI+EeucsSY4jQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: methanal <baclofen@tuta.io>

Some replacement displays include third-party touch ICs which do not
expose the function number and the interrupt status in its PDT entries.

OnePlus 6 (original touch IC)
  rmi4_i2c 12-0020: read 6 bytes at 0x00e3: 0 (2b 22 0d 06 01 01)

OnePlus 6 (aftermarket touch IC)
  rmi4_i2c 12-0020: read 6 bytes at 0x00e3: 0 (2c 23 0d 06 00 00)

Introduce a new devicetree property `syna,pdt-desc` which can be used to
provide platform-specific fallback values for users with a replacement
display with an aftermarket touch IC.

Signed-off-by: methanal <baclofen@tuta.io>
[codeflow adjustments, checkpatch fixes, wording]
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_driver.c | 73 ++++++++++++++++++++++++++++++++++++-----
 drivers/input/rmi4/rmi_driver.h |  2 ++
 include/linux/rmi.h             |  3 ++
 3 files changed, 70 insertions(+), 8 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 2790f00a58bc66c04656d0cd1b4afe9f843ee093..f233c0b1f8e6a936089fd81344c46b6741d3d82d 100644
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
+		/* Use the description bytes from DT */
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
@@ -551,7 +567,7 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 	int retval;
 
 	for (addr = pdt_start; addr >= pdt_end; addr -= RMI_PDT_ENTRY_SIZE) {
-		error = rmi_read_pdt_entry(rmi_dev, &pdt_entry, addr);
+		error = rmi_read_pdt_entry(rmi_dev, &pdt_entry, state, addr);
 		if (error)
 			return error;
 
@@ -1028,9 +1044,11 @@ static int rmi_driver_remove(struct device *dev)
 }
 
 #ifdef CONFIG_OF
-static int rmi_driver_of_probe(struct device *dev,
-				struct rmi_device_platform_data *pdata)
+static int rmi_driver_of_probe(struct rmi_device *rmi_dev,
+			       struct rmi_device_platform_data *pdata)
 {
+	struct device *dev = rmi_dev->xport->dev;
+	u8 buf[RMI_PDT_ENTRY_SIZE];
 	int retval;
 
 	retval = rmi_of_property_read_u32(dev, &pdata->reset_delay_ms,
@@ -1038,11 +1056,50 @@ static int rmi_driver_of_probe(struct device *dev,
 	if (retval)
 		return retval;
 
+	/*
+	 * In some aftermerket touch ICs, the first PDT entry is empty and
+	 * the function number register is 0. If so, the platform
+	 * may have provided backup PDT entries in the device tree.
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
+	pdata->pdt_fallback_size = of_property_count_u8_elems(dev->of_node,
+						  "syna,pdt-fallback-desc");
+
+	/* The rmi4 driver would fail later anyway, so just error out now. */
+	if (pdata->pdt_fallback_size == -EINVAL) {
+		dev_err(dev, "First PDT entry is empty and no backup values provided\n");
+		return -EINVAL;
+	}
+
+	if (pdata->pdt_fallback_size < 0) {
+		dev_err(dev, "syna,pdt-fallback-desc property was not specified properly: %d\n",
+			pdata->pdt_fallback_size);
+		return pdata->pdt_fallback_size;
+	}
+
+	pdata->pdt_fallback_desc = devm_kzalloc(dev, pdata->pdt_fallback_size, GFP_KERNEL);
+
+	retval = of_property_read_u8_array(dev->of_node, "syna,pdt-fallback-desc",
+		pdata->pdt_fallback_desc, pdata->pdt_fallback_size);
+	if (retval < 0)
+		return retval;
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
@@ -1163,7 +1220,7 @@ static int rmi_driver_probe(struct device *dev)
 	pdata = rmi_get_platform_data(rmi_dev);
 
 	if (rmi_dev->xport->dev->of_node) {
-		retval = rmi_driver_of_probe(rmi_dev->xport->dev, pdata);
+		retval = rmi_driver_of_probe(rmi_dev, pdata);
 		if (retval)
 			return retval;
 	}
diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
index 0ecbd19cefffe00ce7c8001db6479a2e213ac466..67a04133a4d85c56d80d0eafee65797319c75c54 100644
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
index ab7eea01ab4274bfc9efcefcdb0cced6ec34966f..974597960b5ee61b670ab55a78c317710022d7cc 100644
--- a/include/linux/rmi.h
+++ b/include/linux/rmi.h
@@ -214,6 +214,9 @@ struct rmi_device_platform_data {
 	int reset_delay_ms;
 	int irq;
 
+	u8 *pdt_fallback_desc;
+	int pdt_fallback_size;
+
 	struct rmi_device_platform_data_spi spi_data;
 
 	/* function handler pdata */

-- 
2.47.2



