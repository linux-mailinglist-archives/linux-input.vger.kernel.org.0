Return-Path: <linux-input+bounces-12857-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 079DAAD7B3A
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 21:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EDC33AF65B
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 19:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DCE2D6634;
	Thu, 12 Jun 2025 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Loqs1Gre"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276DC2D5417;
	Thu, 12 Jun 2025 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749757332; cv=none; b=OPUv9u2FGpzQ1l79FHcV7yKxVUOje3S5jYN/JJx5j+XDT0xf0EAxzH7na6t3tuHGzlYM+Frr93JhkQZ+F9Yya5GZEOcWuVAZwbhGa2GSlmw6JfNMJhxmPBf0QSMfB1tUtyiiNC5MlaWG0Yo8PAS6LDdyx04QbkQTxj/BeHeaZ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749757332; c=relaxed/simple;
	bh=db09hgbzvuUJ1yzYHRq+CAMm77k09qcfo3UfxtjsWeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cwKb9/Oq/qgCoCwu9JBkzgeHcIaZzNLLTT4sT5WJh58e/dwvq1EPU0TxE5quoLXiZN4FmARYO85fxDkjEHNM7yhinj6HrIc0mKS5ByqmpJnM+5Nle85uSp9979hd0dXpQpqbhELeOa8Enx4ux9DdO8UaxK87L3yqLgRot1rmGWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Loqs1Gre; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A846226024;
	Thu, 12 Jun 2025 21:42:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixglB28ds2Vk; Thu, 12 Jun 2025 21:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749757328; bh=db09hgbzvuUJ1yzYHRq+CAMm77k09qcfo3UfxtjsWeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Loqs1Gre7sEBdRavftFxphL4OSPxllLVpJSzI4AY7Kxv+u9CIPbH8YwuBKfVnV1Ww
	 xE3xbqv4xZrbOLr2OFocWCCR02UYnNL5Z5SGNM1uA+xW2ZZ+FfDV2HoVPF8EUBxGS0
	 uDiGZ+UDFo1g55Z8CiMA0zAy33vJIiYscZgy7/stcKBM3COcjKKIk+nUFXt2KUe7ZB
	 Fl4OL4w8LzEBIOI4XBmgco52PE/8as+VAUmMqwX0D2v2MZCv7Dk8YhF9+p1rCdmUMR
	 DGXoQLb8hkvIc2r1UO1jpFzD6gN4xLpv6Y3cvg7UBaSw1YNo+46p6mJGAlnl12q0lD
	 gGIDSL2gT2EqQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 13 Jun 2025 01:11:36 +0530
Subject: [PATCH RFC v2 4/5] Input: melfas-mip4 - initialize touch events
 only if the device is a touchscreen
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-mip4-touchkey-v2-4-9bbbe14c016d@disroot.org>
References: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
In-Reply-To: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
To: Sangwon Jee <jeesw@melfas.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749757299; l=3948;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=db09hgbzvuUJ1yzYHRq+CAMm77k09qcfo3UfxtjsWeY=;
 b=jVvhya2K7et4gPQ1D2SoHMH75rK0PpUX3kgiS4WERstxyknOfOYKwRlEVR1eXLqGD45xgzuwl
 zHBYeTiz2yHDxDiH/TJ3dbLBacpoxqguVQuyXcilyuLYDZCErIvV9h1
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Certain MIP4 devices report zero values when enquired for its touchscreen
dimensions (MIP4_R1_INFO_RESOLUTION_X and MIP4_R1_INFO_RESOLUTION_Y),
which is indicative of the fact that those devices are not touchscreens.

While registering for touch events for the device, always check - and
proceed - only if the device reports a non-zero resolution.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/input/touchscreen/melfas_mip4.c | 50 ++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index 061ac353bc7a2e28f17581411af81f35c89733a1..57b657694a420220be135c2f78d3ddad3ef6f520 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -1146,14 +1146,16 @@ static int mip4_flash_fw(struct mip4_ts *ts,
 	mip4_query_device(ts);
 
 	/* Refresh device parameters */
-	input_set_abs_params(ts->input, ABS_MT_POSITION_X, 0, ts->max_x, 0, 0);
-	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, ts->max_y, 0, 0);
-	input_set_abs_params(ts->input, ABS_X, 0, ts->max_x, 0, 0);
-	input_set_abs_params(ts->input, ABS_Y, 0, ts->max_y, 0, 0);
-	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->ppm_x);
-	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->ppm_y);
-	input_abs_set_res(ts->input, ABS_X, ts->ppm_x);
-	input_abs_set_res(ts->input, ABS_Y, ts->ppm_y);
+	if (ts->max_x && ts->max_y) {
+		input_set_abs_params(ts->input, ABS_MT_POSITION_X, 0, ts->max_x, 0, 0);
+		input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, ts->max_y, 0, 0);
+		input_set_abs_params(ts->input, ABS_X, 0, ts->max_x, 0, 0);
+		input_set_abs_params(ts->input, ABS_Y, 0, ts->max_y, 0, 0);
+		input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->ppm_x);
+		input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->ppm_y);
+		input_abs_set_res(ts->input, ABS_X, ts->ppm_x);
+		input_abs_set_res(ts->input, ABS_Y, ts->ppm_y);
+	}
 
 	for (i = 0; i < ts->key_num; i++) {
 		if (ts->key_code[i])
@@ -1498,21 +1500,23 @@ static int mip4_probe(struct i2c_client *client)
 	input->keycodesize = sizeof(*ts->key_code);
 	input->keycodemax = ts->key_num;
 
-	input_set_abs_params(input, ABS_MT_TOOL_TYPE, 0, MT_TOOL_PALM, 0, 0);
-	input_set_abs_params(input, ABS_MT_POSITION_X, 0, ts->max_x, 0, 0);
-	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, ts->max_y, 0, 0);
-	input_set_abs_params(input, ABS_MT_PRESSURE,
-			     MIP4_PRESSURE_MIN, MIP4_PRESSURE_MAX, 0, 0);
-	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR,
-			     MIP4_TOUCH_MAJOR_MIN, MIP4_TOUCH_MAJOR_MAX, 0, 0);
-	input_set_abs_params(input, ABS_MT_TOUCH_MINOR,
-			     MIP4_TOUCH_MINOR_MIN, MIP4_TOUCH_MINOR_MAX, 0, 0);
-	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->ppm_x);
-	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->ppm_y);
-
-	error = input_mt_init_slots(input, MIP4_MAX_FINGERS, INPUT_MT_DIRECT);
-	if (error)
-		return error;
+	if (ts->max_x && ts->max_y) {
+		input_set_abs_params(input, ABS_MT_TOOL_TYPE, 0, MT_TOOL_PALM, 0, 0);
+		input_set_abs_params(input, ABS_MT_POSITION_X, 0, ts->max_x, 0, 0);
+		input_set_abs_params(input, ABS_MT_POSITION_Y, 0, ts->max_y, 0, 0);
+		input_set_abs_params(input, ABS_MT_PRESSURE,
+				     MIP4_PRESSURE_MIN, MIP4_PRESSURE_MAX, 0, 0);
+		input_set_abs_params(input, ABS_MT_TOUCH_MAJOR,
+				     MIP4_TOUCH_MAJOR_MIN, MIP4_TOUCH_MAJOR_MAX, 0, 0);
+		input_set_abs_params(input, ABS_MT_TOUCH_MINOR,
+				     MIP4_TOUCH_MINOR_MIN, MIP4_TOUCH_MINOR_MAX, 0, 0);
+		input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->ppm_x);
+		input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->ppm_y);
+
+		error = input_mt_init_slots(input, MIP4_MAX_FINGERS, INPUT_MT_DIRECT);
+		if (error)
+			return error;
+	}
 
 	for (i = 0; i < ts->key_num; i++) {
 		if (ts->key_code[i])

-- 
2.49.0


