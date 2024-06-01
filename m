Return-Path: <linux-input+bounces-4009-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C68D71DB
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 22:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D290B21752
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 20:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E62154C09;
	Sat,  1 Jun 2024 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q32f/k2O"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643611C680;
	Sat,  1 Jun 2024 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717274686; cv=none; b=SohKRgzMCPoHjqRRErr6Uzz+D9DR0yEaVc/PIwADPP95MCulrVA3axlOYpJEM5lm/0B9VTRvO1teJ0+Gx0dm+cfuBi/7tysWEAmZa7yyqxdN39ITz4Tu9fYcjakOVBARaIrZOPE6QRfCLi1xXLVahY1d0YH7M+KNYl5waRjLl9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717274686; c=relaxed/simple;
	bh=ZBV7j2HnfvAkZTkxfnAC+3ke3f7l/ctdE02xfZ2rec0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQdtOp7NiZBSFKasso2nFufI4l/YL03ADubG+lfB1cMMapqaTT7Djnrb1ZyMeGNryMdw42K5aq0xHIhYOC1EX8wl0a7jjsX60iXNzccLH5/Y1PPag1YICuu8hZ7s7wIOfw0HFHOSjaV0BAW7Y6yWhcYe+VIRJ+ynVPXs+qHGHdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q32f/k2O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD7F9C32789;
	Sat,  1 Jun 2024 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717274685;
	bh=ZBV7j2HnfvAkZTkxfnAC+3ke3f7l/ctdE02xfZ2rec0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q32f/k2OPzt0Tv0av5x1Lfc7d6gS6mwGR3O5eglm3+sw0oi4imXcZvcKtvWhOciFD
	 2t/CZe1rrOpsH3TDCpNGvLbcrp3oeOMDsyom5cDE2eaREzBk1RrOMmB1iVqwR/iemU
	 VoajdBFgW7XR5+1xdqT6vZI1YVcRPvb5GZMIOiGL/SbvHcdhIqW2VS14LlxlR7e7Te
	 QDa75jytb5aN7M+oGE3b1ZXbTIBZidlRgAKLOpKkGevjctXp9kCqF+Tj2JhTP54QzE
	 L3XJ+7iE5N42pQPoSjOQ8hIvulLyI+Wvkxu/YnjbPrGF3XCruI5LSR4evUqglVjIt6
	 AHqWCzBokAI6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAD0C27C44;
	Sat,  1 Jun 2024 20:44:45 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Date: Sat, 01 Jun 2024 15:44:43 -0500
Subject: [PATCH v5 1/3] Input: novatek-nvt-ts: replace generic i2c device
 id with specific IC variant
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240601-nvt-ts-devicetree-regulator-support-v5-1-aa9bf986347d@gmail.com>
References: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>
In-Reply-To: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717274685; l=1393;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=JfGOWdU2w8+0k5JiDiNeJehgANFUozza/8JZOnq70YQ=;
 b=RF68DnY9NAlhv/3eRIIiQTLqp2vGwHaWhW6rQSz6FZcrgANIEfaDL136UHZH8ALXmENfCpb9C
 tVbXnRDvYreDh+ukz5XmxdO0DfstB3trq81smg5BYOm3RxY/vCbjnM7
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
index 1a797e410a3fa..9bee3a0c122fb 100644
--- a/drivers/input/touchscreen/novatek-nvt-ts.c
+++ b/drivers/input/touchscreen/novatek-nvt-ts.c
@@ -278,7 +278,7 @@ static int nvt_ts_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id nvt_ts_i2c_id[] = {
-	{ "NVT-ts" },
+	{ "nt11205-ts" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nvt_ts_i2c_id);
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index eb0e55c69dfed..129273df0fdeb 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -40,7 +40,7 @@ static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst =
 	{
 		/* Novatek NVT-ts touchscreen */
 		.board_info = {
-			.type = "NVT-ts",
+			.type = "nt11205-ts",
 			.addr = 0x34,
 			.dev_name = "NVT-ts",
 		},

-- 
2.45.1



