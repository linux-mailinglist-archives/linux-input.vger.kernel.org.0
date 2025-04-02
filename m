Return-Path: <linux-input+bounces-11479-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FE9A7954A
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 20:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D276318945DC
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 18:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363DC1E0E13;
	Wed,  2 Apr 2025 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XE1n5gAa"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028DB1DDC28;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619498; cv=none; b=kW0cO9yt4EPcqR7fb65QGu8RBlTVrTjQ4Al3GLKKIMquXrz3WPICDFtsMUyQXzMazLAjCEBnKJ02Iaeldc/OOZEP+O4LVUQQLCQs4Az3L05+qztre2l3hCMuFX1Uo0cEX/3CIYZf8Wtxju143wcHTCqsuVPXnlu3HFJZthQ0ymc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619498; c=relaxed/simple;
	bh=kX0Z61P7BjNy7WhJ24tC3m5Hm2sT157SFCHC9z9ZvXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nog2pWORdShXRDwDevlvKRaIRpPrk77kHG0qn7THMHoFVzObxd9u+9iyYJum4gEopv8e6wxMJ3+tN0O9/fvLCiu8Vn0uDLvijNVJOLq5Mo7SscqR72nxlO2mMHll+xm9fHFhtwYdtb6esQ9RSpjvJxEuHMa0GQqirP1AZDiJnk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XE1n5gAa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72F4CC4CEEB;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743619497;
	bh=kX0Z61P7BjNy7WhJ24tC3m5Hm2sT157SFCHC9z9ZvXk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XE1n5gAawQvSpKPpaasw2Eg6t46J7JoUkteO2/Z/o62ui4D/Pc5nPCH2MDpYUGQhG
	 n66QX10Ftn6DB9tuUUmf2k5l8X/fA1oQ67JdkQU29B7947KoYMYDJ7rpdIhMO6D6Ru
	 gylTPK5aUgZSeqR5XFM5SfzhDPIxfe5QxlG+da/9N76LMwuPuAQgMUb9lM5T2lxmlV
	 ZlB/2UR2jRTzzLiuPuke7H6xcUUwVzxd3AGxjBDmRKbK1kErgveorUuekgfZPuY0WS
	 VqS4NgWGqgn2QrtcUk9mYpk8tZRDFDUmfnp3Uct6xvA5FYCZOFsHCjSpCQl+kJ8cuK
	 ngZOa+LY+1IxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6690CC3601E;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 02 Apr 2025 20:44:54 +0200
Subject: [PATCH v4 3/7] Input: synaptics-rmi4 - f12: use hardcoded values
 for aftermarket touch ICs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-synaptics-rmi4-v4-3-1bb95959e564@ixit.cz>
References: <20250402-synaptics-rmi4-v4-0-1bb95959e564@ixit.cz>
In-Reply-To: <20250402-synaptics-rmi4-v4-0-1bb95959e564@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6241; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=p/XNvq/UvwSU23ySeWSs7BuMIwAQjW0v6Rn2pc6/CJk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn7YWngj1ns0CAxOHbJ9efKV2uXbhLqJhupngiJ
 6h8j0iyzguJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ+2FpwAKCRBgAj/E00kg
 chk1D/9FIoqtN4bH/abCeTMRA0wYm5CldVtJHv2/+YnUcjvN1SVldzrTvwObXtjiWHoOZzmcLUm
 wa/ArFChF/gGf8mhzEN687vGYk772rmxy7y5U3V1P14Xut8DtLqGg7Sn1JM8nfiQc+nF+tK66jK
 +EekzfdUpc+JB0W5il4FZwtfojRMHzadxxTHoMCamXs1XrdIWqlnuDcXU76BW9/sUvlA2VFBJMD
 6Yx3G9shs5nwL9TcqcsXc2BPTN/hrXLYMfKstJJ4Yz3La6QUrNlDCKu6bVTiZ4eiHVKLO6NUDwc
 Hm7k3mteaOWYMtayz5/euHwX5vpPKQdpU5xhY6Pq0cMkbHWquUfkTYuiPnvyYJBIX8v0XLXf0x0
 MIWfF7pLhYq+E2/dMH6+1RmY5jsDO/C7nxKDhmjYTPnJosrJTUNWfgOS7hydIE4ft5nyOp2Nkgw
 slFta1D/VKAyBoPze08p7qt26k2IUTeXePbHSYrqv3ujtWyqLMZ4orZ9eFogJFLtCExLYT0DJsq
 U4l+14IlmJbE7zgnwjQSGSfoxIasWOyaztULLe5cYrR3GatwPH2+m/ezGNSWXdDqxyZgZbk0NQ5
 GzmVa+LQMRVDumvDDsxywEpQM5T8KQbrCHonh8NC2JvqDxMdDrimLgnSTLsXrX8JwWHNyWCz0rW
 c48l29pt+2vdFrQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Kaustabh Chakraborty <kauschluss@disroot.org>

Some replacement displays include third-party touch ICs which are
devoid of register descriptors. Create a fake data register descriptor
for such ICs and provide hardcoded default values.

It isn't possible to reliably determine if the touch IC is original or
not, so these fallback values are offered as an alternative to the error
path when register descriptors aren't available.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
[changes for readability / codeflow, checkpatch fixes]
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_f12.c | 117 +++++++++++++++++++++++++++++++++----------
 1 file changed, 91 insertions(+), 26 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
index 8246fe77114bbd8b795ba35d5a37ede8727fc7cb..1a103cc5f2235a6eafd7a3f5b89cbfc9e53203d2 100644
--- a/drivers/input/rmi4/rmi_f12.c
+++ b/drivers/input/rmi4/rmi_f12.c
@@ -218,6 +218,41 @@ static void rmi_f12_process_objects(struct f12_data *f12, u8 *data1, int size)
 		rmi_2d_sensor_abs_report(sensor, &sensor->objs[i], i);
 }
 
+static void rmi_f12_set_hardcoded_desc(struct rmi_function *fn, struct f12_data *f12)
+{
+	struct rmi_2d_sensor *sensor = &f12->sensor;
+	struct rmi_register_desc_item *reg_desc;
+
+	/* We have no f12->data_reg_desc, so the pkt_size is 0, override it with
+	 * a somewhat sensible default (this corresponds to 10 fingers).
+	 */
+	sensor->pkt_size = 88;
+
+	/*
+	 * There are no register descriptors to get these values from.
+	 * We set them to high values to either be overwritten by the clip
+	 * properties from devicetree, or to just not get in the way.
+	 */
+	sensor->max_x = 65535;
+	sensor->max_y = 65535;
+
+	/*
+	 * Create the Data1 register descriptor so that touch events
+	 * can work properly.
+	 */
+	reg_desc = devm_kcalloc(&fn->dev, 1,
+			sizeof(struct rmi_register_desc_item), GFP_KERNEL);
+	reg_desc->reg = 1;
+	reg_desc->reg_size = 80;
+	reg_desc->num_subpackets = 10;
+
+	f12->data1 = reg_desc;
+	f12->data1_offset = 0;
+	sensor->nbr_fingers = reg_desc->num_subpackets;
+	sensor->report_abs = 1;
+	sensor->attn_size += reg_desc->reg_size;
+}
+
 static irqreturn_t rmi_f12_attention(int irq, void *ctx)
 {
 	int retval;
@@ -338,6 +373,40 @@ static int rmi_f12_config(struct rmi_function *fn)
 	return 0;
 }
 
+static int rmi_f12_sensor_init(struct rmi_function *fn, struct f12_data *f12)
+{
+	struct rmi_2d_sensor *sensor = &f12->sensor;
+
+	sensor->fn = fn;
+	f12->data_addr = fn->fd.data_base_addr;
+
+	/* On quirky devices that don't have a data_reg_desc we hardcode the packet
+	 * in rmi_f12_set_hardcoded_desc(). Make sure not to set it to 0 here.
+	 */
+	if (!sensor->pkt_size)
+		sensor->pkt_size = rmi_register_desc_calc_size(&f12->data_reg_desc);
+
+	sensor->axis_align =
+		f12->sensor_pdata.axis_align;
+
+	sensor->x_mm = f12->sensor_pdata.x_mm;
+	sensor->y_mm = f12->sensor_pdata.y_mm;
+	sensor->dribble = f12->sensor_pdata.dribble;
+
+	if (sensor->sensor_type == rmi_sensor_default)
+		sensor->sensor_type =
+			f12->sensor_pdata.sensor_type;
+
+	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "%s: data packet size: %d\n", __func__,
+		sensor->pkt_size);
+
+	sensor->data_pkt = devm_kzalloc(&fn->dev, sensor->pkt_size, GFP_KERNEL);
+	if (!sensor->data_pkt)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int rmi_f12_probe(struct rmi_function *fn)
 {
 	struct f12_data *f12;
@@ -351,6 +420,7 @@ static int rmi_f12_probe(struct rmi_function *fn)
 	struct rmi_driver_data *drvdata = dev_get_drvdata(&rmi_dev->dev);
 	u16 data_offset = 0;
 	int mask_size;
+	bool hardcoded_desc_quirk = false;
 
 	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "%s\n", __func__);
 
@@ -365,9 +435,9 @@ static int rmi_f12_probe(struct rmi_function *fn)
 	++query_addr;
 
 	if (!(buf & BIT(0))) {
-		dev_err(&fn->dev,
-			"Behavior of F12 without register descriptors is undefined.\n");
-		return -ENODEV;
+		rmi_dbg(RMI_DEBUG_FN, &fn->dev,
+			"No register descriptors defined for F12, using fallback\n");
+		hardcoded_desc_quirk = true;
 	}
 
 	f12 = devm_kzalloc(&fn->dev, sizeof(struct f12_data) + mask_size * 2,
@@ -375,6 +445,8 @@ static int rmi_f12_probe(struct rmi_function *fn)
 	if (!f12)
 		return -ENOMEM;
 
+	dev_set_drvdata(&fn->dev, f12);
+
 	f12->abs_mask = (unsigned long *)((char *)f12
 			+ sizeof(struct f12_data));
 	f12->rel_mask = (unsigned long *)((char *)f12
@@ -393,6 +465,18 @@ static int rmi_f12_probe(struct rmi_function *fn)
 		f12->sensor_pdata = pdata->sensor_pdata;
 	}
 
+	sensor = &f12->sensor;
+
+	if (hardcoded_desc_quirk) {
+		rmi_f12_set_hardcoded_desc(fn, f12);
+
+		ret = rmi_f12_sensor_init(fn, f12);
+		if (ret)
+			return ret;
+
+		goto skip_register_desc;
+	}
+
 	ret = rmi_read_register_desc(rmi_dev, query_addr,
 					&f12->query_reg_desc);
 	if (ret) {
@@ -423,29 +507,9 @@ static int rmi_f12_probe(struct rmi_function *fn)
 	}
 	query_addr += 3;
 
-	sensor = &f12->sensor;
-	sensor->fn = fn;
-	f12->data_addr = fn->fd.data_base_addr;
-	sensor->pkt_size = rmi_register_desc_calc_size(&f12->data_reg_desc);
-
-	sensor->axis_align =
-		f12->sensor_pdata.axis_align;
-
-	sensor->x_mm = f12->sensor_pdata.x_mm;
-	sensor->y_mm = f12->sensor_pdata.y_mm;
-	sensor->dribble = f12->sensor_pdata.dribble;
-
-	if (sensor->sensor_type == rmi_sensor_default)
-		sensor->sensor_type =
-			f12->sensor_pdata.sensor_type;
-
-	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "%s: data packet size: %d\n", __func__,
-		sensor->pkt_size);
-	sensor->data_pkt = devm_kzalloc(&fn->dev, sensor->pkt_size, GFP_KERNEL);
-	if (!sensor->data_pkt)
-		return -ENOMEM;
-
-	dev_set_drvdata(&fn->dev, f12);
+	ret = rmi_f12_sensor_init(fn, f12);
+	if (ret)
+		return ret;
 
 	ret = rmi_f12_read_sensor_tuning(f12);
 	if (ret)
@@ -543,6 +607,7 @@ static int rmi_f12_probe(struct rmi_function *fn)
 		data_offset += item->reg_size;
 	}
 
+skip_register_desc:
 	/* allocate the in-kernel tracking buffers */
 	sensor->tracking_pos = devm_kcalloc(&fn->dev,
 			sensor->nbr_fingers, sizeof(struct input_mt_pos),

-- 
2.49.0



