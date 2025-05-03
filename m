Return-Path: <linux-input+bounces-12132-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF72DAA7F99
	for <lists+linux-input@lfdr.de>; Sat,  3 May 2025 11:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F0D983F66
	for <lists+linux-input@lfdr.de>; Sat,  3 May 2025 09:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F301DF98F;
	Sat,  3 May 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="PDK9adsk"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A5F1DE2CC;
	Sat,  3 May 2025 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746263339; cv=none; b=fnzdD35NB+o5csNEvGenZYfW7L67ThF6RAJx4znUDjIenGIFd6J4HOoHD4pMMCb7fmnGkB1bFrWsg6hx3bACi1SzCSyFi1z0FLvikCqL04Ap7xfs7oGdVJHktY9s5++IAFXepqfvMXuVydpryjuVSgnxkJSiB3O3OcZ1RbbCzZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746263339; c=relaxed/simple;
	bh=db09hgbzvuUJ1yzYHRq+CAMm77k09qcfo3UfxtjsWeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4Y4YYXZLuRJufhTadXXnVz35xNDHpreu+hSlH2po9SzmsFsObINcwYCxDXlxarMsKiAQOUZcj3WDl9pUNLR74KiAT5F3+jmc/798I4wRWHq2KtLV3LkpuulQTHPnhZ8z0qHoC9c1BMEitZY5MwLvJLNmtQ3bJt7YH0bXkVJnPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=PDK9adsk; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 10D7225CE4;
	Sat,  3 May 2025 11:08:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AE5XxdhkPRVy; Sat,  3 May 2025 11:08:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746263335; bh=db09hgbzvuUJ1yzYHRq+CAMm77k09qcfo3UfxtjsWeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PDK9adskaoiTMMT9sGngElY1esVrk6c6kFyNwIy5bP9jrvctnQUHtMvAr5+pTp+XG
	 PWwRb7QCajx3FtIOP5zIpM8goDvvnqzTxp/sRT5Y9AmdmCu+hPANJ/SkqIZtznr046
	 hUBAGJPByCv2HEYy8WbyTZAnBHKWquS3Ch7P30jdgM8Kjfdna0bVQd7RT9N5EXAJzI
	 xZOkxeuyqfPrUiyNUt9djTWngdWekzCSOBnOu5RUl8QXb8FIi7lQwGI4BjWKpsk79P
	 tlBz/EyhcCsPgp1ZPhAEuLkoK2KewNyQ+W4ye4Jj5s0vEXf7mluntCwmJ49TIaJaNi
	 q2VDM7MlXDZ2A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 03 May 2025 14:38:29 +0530
Subject: [PATCH RFC 3/4] Input: melfas-mip4 - initialize touch events only
 if the device is a touchscreen
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-mip4-touchkey-v1-3-b483cda29a5b@disroot.org>
References: <20250503-mip4-touchkey-v1-0-b483cda29a5b@disroot.org>
In-Reply-To: <20250503-mip4-touchkey-v1-0-b483cda29a5b@disroot.org>
To: Sangwon Jee <jeesw@melfas.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746263323; l=3948;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=db09hgbzvuUJ1yzYHRq+CAMm77k09qcfo3UfxtjsWeY=;
 b=wlrUg1ONopq6BlhLWr2/7scfe+Kbt+zSC+HxlGSWE2gWSQVyTiboC3DS4GmI0iSlOh2It7E8G
 wvEdy7hcaD5D7ZUPuuRdHfGkcbLAvBokq0/P+M5WRFcPvCNnmEUtobq
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


