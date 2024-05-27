Return-Path: <linux-input+bounces-3851-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF46F8CF80D
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 05:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86859281248
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 03:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70C779DE;
	Mon, 27 May 2024 03:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCj3FsZI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DA64C96;
	Mon, 27 May 2024 03:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716780395; cv=none; b=myQKmHsqSTPdUyayfCGqXsZ3PpdztKrOifbf5DtBWUjYceydlMMqhQfRNfuiXspi5M86EsulA1j042boD6p/PrQPnFa3AFXAsAbVD00hq8Vhe3SWy5GQpYI/uy0PwSZMn/01wGDct6hfSiYgcLYJvXS3yH9YBhhI3lMP3ajiu9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716780395; c=relaxed/simple;
	bh=M9oEkYlMCsLV8xMj4+wTERAWbk6x/3fQFKuCW2n0YG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4PrI5amACmQmdEe7kLI6ToVwcg+I6k+Ov4VDOYKeIxoo+p4W2LBrLEFWjumfUGm+gaZ4bSlv6MD9n+gZzFnvKsn3eSQPRM4FS0DY/pUsTaO9ZD+y5YbPT+1tnqDpFJJwmZdVXvan9Gkm2pADQLr52y2SwNUBPBINVLHbUD0tTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCj3FsZI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EF19C4AF07;
	Mon, 27 May 2024 03:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716780395;
	bh=M9oEkYlMCsLV8xMj4+wTERAWbk6x/3fQFKuCW2n0YG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dCj3FsZI73nlPbxBzdr0XGoPyXWNAXqnPiRrWxDoo28CK8Xqqfdd5brBc0mbk+z9X
	 N3lXGDON40JXmVvQVz/+1ph5k0W6YJJtlb8V5P8GPAeuPcilGM7jxPzubP8+0U9i2L
	 gNfpyy+Y8UinXIzjl6cAUjeZQehlZCPg/41ZrMxo9w9ShRPaN92K8pqprkQPveRQGv
	 +TCg9dzFExMi4eQayjRwHvCdtgNDn/vYUG4a9TKzjAL7xnDuvQStyaojPKnmx8jkc3
	 WnK8N+SuwSS8qUiHY8CbA4CTQXC2rx4jX0uof61vxmM3Ent6wGsWhi/2McCYBclKln
	 iQ1o3Ol2dRs5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A177C25B79;
	Mon, 27 May 2024 03:26:35 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Date: Sun, 26 May 2024 22:26:24 -0500
Subject: [PATCH v3 1/3] Input: novatek-nvt-ts: replace generic i2c device
 id with specific IC variant
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240526-nvt-ts-devicetree-regulator-support-v3-1-aa88d10ccd9a@gmail.com>
References: <20240526-nvt-ts-devicetree-regulator-support-v3-0-aa88d10ccd9a@gmail.com>
In-Reply-To: <20240526-nvt-ts-devicetree-regulator-support-v3-0-aa88d10ccd9a@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716780394; l=1393;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=o9JSDCGAeFyywH+QabP9V+yumWYX1UdF0t0fi0getJU=;
 b=8FfurXUpLV+IoRY8Zi4iAt7/+TyxzFfJwjFZLV1wORlhXEFvibA7HtBlgm+zJejWGxxNBJMYV
 iRcI+G4lgkhDIogOvq0knO3l4FDjijRBX4LOoGM3K+JcqtfIC1sH4tb
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



