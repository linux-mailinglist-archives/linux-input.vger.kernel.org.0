Return-Path: <linux-input+bounces-13741-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D634B177BD
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 23:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B7241AA55D3
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 21:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F5D2620E4;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1ERDWXi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61ED221FA0;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996034; cv=none; b=kaH19cYPXiI8hP1BGGRyv6eg2tGRwCY3v1jRYxtQ+jTAdBlqnPGvHCQuyOEOtZwCLZgPQlAN/opF58B/7/GT7yBEFdoXS6i4UTDUbP3M+F7fNbhbu2anXumHLJEwyZZJzGPDIISRvv6YFao+jTMArLDT2K2t2/Ya3FByBaMN4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996034; c=relaxed/simple;
	bh=WdPF/cC8LC3htAms9KpAu2xgqdYjXXg0Up/9TzJ3SO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g8HmYvSIXNF7dM07uuydbPnrBM7H+WPUU/Hblx9SDOB+TUa3phB5g/Il2oRe0b1/Q/nZimepcTPimAWuhOUM66zDDzrrgB8VRUknMLcWEWV1Tm4AVmdZk4V6z1Recd8JXKCg83514JaUt2nayfCSN+adienBaAfR5pmeJX0OP+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1ERDWXi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B06CC4CEF4;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753996034;
	bh=WdPF/cC8LC3htAms9KpAu2xgqdYjXXg0Up/9TzJ3SO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a1ERDWXivRq5e3VPsUBItQRAl2J7IQ7OhgcFfj2HHKdPdVJKzEe1mfy9v222gu0+2
	 sP+EWzeExe7XwNrQeVxxFSUxI3BFv3MMml8LzO/eaBlaVNcUVBN9nQnjoyR4w+jqRl
	 AbRN9t3MNxIH+35sVbm0/zn5IeLcw+BPfRPWe/tOs7pyO01OccWsPBKc+kKXaYmcnw
	 EN53jXTUjjxilad+qM1CYw/ku/7X/9Dfk7M/HrugAcXMSXZVOB7SLDyc52P39RQCk4
	 9XkJIVHMKzNcS6opi6S+uAAGHoJMaSAJan6DHjxbwlyjE/Gn6w3U+YAGOAFSE6fxgZ
	 fkwgeM2HyiYPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39562C87FD6;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 31 Jul 2025 23:06:53 +0200
Subject: [PATCH RESEND v5 3/7] Input: synaptics-rmi4 - f12: use hardcoded
 values for aftermarket touch ICs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-synaptics-rmi4-v5-3-cd0d87d34afa@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6241; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ricXe6yk/5+TIKlQtxt1oMTaSqZP1i68UXtX5FFQ3T4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoi9r/md4k2gkGqPUPzhPq95CcT7bB/dh/D6Uy0
 X6likF9OmmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIva/wAKCRBgAj/E00kg
 cuPND/9PqFoKbBgFT30hlSwYjgkuvb7BgQ6Nr1qxb7BubBjDe46w1yux512Tno88ky0HWVNOReM
 B1IiGTRJq/WRdqgc6f/cJWOmZmctm6FuW+aXSKNAerCz5qFKTaIQUASGuPlC+tGJbo0dmCW9Nbi
 LMHPc6kBXmyHPwxmfqikqpo5V2U0k4nsIonqNHJ2KfjY54Q7svRtqS2HwGltr2Mwcwdq9YZMc+8
 Agy7fzHbe0KjUSw469GZHJovR3TiA6XGEO9/3REMRowoPQaLz3N0Ys6lVRsn02qv7ihGgF3olmU
 MBQYlDnisUI/PFwIhyOyUdQ/PZ7QTfOv1RgFsziyeYri2gxNvdwu5rtwHJrQk0jrMZBWVkryO4y
 kaa1FBEuWAV/b5Sj3+6S3nnk10BhOYOcYEhYY8yfVx2K7snKc1yPDJFYY2xa9CVaVNVFgGW3Ct2
 WH2A7pKcrbRLMGeN5s9JyVSVYsmyWuhqxZ1m4mVnfzzEQLh/jDiWrP8NTdjqGjo6B6lXPSP3qG4
 5JdQJg7nB4SRVm6haNhmZWdjoIZoMbca272RjUsTvQ4ZLinO9WdU1Px6mypRcxVZLYmZ8URAxoo
 K6cjXGgush6cekLPzHW70whOrQVQxTK8ibeWRPDbqJBuAYm++Bjc3aYQ43WZiNmL9SEUHIztw99
 c04quLbRjI40O0g==
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
2.50.1



