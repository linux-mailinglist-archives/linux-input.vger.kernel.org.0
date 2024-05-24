Return-Path: <linux-input+bounces-3822-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E308CE73D
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 16:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19AC628189F
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 14:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE3C12C555;
	Fri, 24 May 2024 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bt2WlCCG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D3286643;
	Fri, 24 May 2024 14:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716561589; cv=none; b=kpuZ2efmZtZlpdfGTtYTKgOgnuE+hxU3KhlQSdOfIEOcjpfAOdKy+QZLvmoU4ht2FE8enG8jQkYNX59XVkIvtJXPULkeV0zHlQQ9kDgFglMx2CW+uvDqq1mb8fJYVZd2ukfC+Dv/hCDfza/vajfCMG+fIoJaDlPUwgB1QeLFclk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716561589; c=relaxed/simple;
	bh=M9oEkYlMCsLV8xMj4+wTERAWbk6x/3fQFKuCW2n0YG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VdgxfN8qY4GZlOFEGV7pt1R5OmbYh6oZStXweiU12gMkSR5PoMbsPgXTwzxIT/uSR3Rbi8eDCNoJDN4RVIFnNNyh2ePO/KZbTOSAJwh4fDVg+syg/AOMVc1G5zUay10Il0v0CfuC9phqIFkF0ceaY4mITZhQRoE1A3Pdejh6LtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bt2WlCCG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A61CC32782;
	Fri, 24 May 2024 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716561589;
	bh=M9oEkYlMCsLV8xMj4+wTERAWbk6x/3fQFKuCW2n0YG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Bt2WlCCGVn3Nt81R3yCa8GpCrYR4fOUV/UdO0/yyIWOtRzvm+vO/8J2RXbzAmuXwo
	 uL0ZhJTyx8BLSagQLCng+6mubnw1I2W+lzLh1IPAYq7kN6sA4h9B3yAKVLt2jH2Rs5
	 AXrAJrpDkd17NTir6HZ0jdZc7jFle3FRZ+vK4tKMVlz3xKG48cdRm+Gepc3rOd0hha
	 ivMAUuDwBdST34b8LdZL1BPaNauNMF7Xne+TeShr3l7r4iDYetPtEUe5x3xxKC3U7Q
	 kEeUTdt4WrbeqiLggBJQVTiFtBOgRgirtlbzuue49W7zT96y5tx6J9r2LU5o2XTi+l
	 rmqLzBuox9HlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B367C25B7C;
	Fri, 24 May 2024 14:39:49 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Date: Fri, 24 May 2024 09:39:18 -0500
Subject: [PATCH v2 1/3] Input: novatek-nvt-ts: replace generic i2c device
 id with specific IC variant
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-nvt-ts-devicetree-regulator-support-v2-1-b74947038c44@gmail.com>
References: <20240524-nvt-ts-devicetree-regulator-support-v2-0-b74947038c44@gmail.com>
In-Reply-To: <20240524-nvt-ts-devicetree-regulator-support-v2-0-b74947038c44@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716561588; l=1393;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=o9JSDCGAeFyywH+QabP9V+yumWYX1UdF0t0fi0getJU=;
 b=+OHGaB9WLCWxuEeAT06cejRG59IV/cz0Vfn5cBW7XM9N5BLLtADdbu3SlSTg8/7LJHtJssDAJ
 lujx96/TNl1ApdmyOspcU4XlxT0qo/HB70ckz2PcY1BzGCLk9SlfNlK
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

This is done in preparation to introduce other variants of the Novatek NVT
touchscreen controller that can be supported by the driver.

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
 drivers/input/touchscreen/novatek-nvt-ts.c       | 2 +-
 drivers/platform/x86/x86-android-tablets/other.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
index 1a797e410a3fa..224fd112b25a9 100644
--- a/drivers/input/touchscreen/novatek-nvt-ts.c
+++ b/drivers/input/touchscreen/novatek-nvt-ts.c
@@ -278,7 +278,7 @@ static int nvt_ts_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id nvt_ts_i2c_id[] = {
-	{ "NVT-ts" },
+	{ "NT11205-ts" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nvt_ts_i2c_id);
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index eb0e55c69dfed..5ecee6e66fb4d 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -40,7 +40,7 @@ static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst =
 	{
 		/* Novatek NVT-ts touchscreen */
 		.board_info = {
-			.type = "NVT-ts",
+			.type = "NT11205-ts",
 			.addr = 0x34,
 			.dev_name = "NVT-ts",
 		},

-- 
2.45.1



