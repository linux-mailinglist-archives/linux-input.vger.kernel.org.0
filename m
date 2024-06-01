Return-Path: <linux-input+bounces-4002-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4BD8D70DE
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 17:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F3ED1F2177F
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 15:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B859D152DED;
	Sat,  1 Jun 2024 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gc+WA7JI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2A11E4AF;
	Sat,  1 Jun 2024 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717255825; cv=none; b=pFR8UaZHSx9iWCymGkmRRh0XdFUI5U73mUcJSF5Z3zCQLwC8kPk2nW011OjqRLUac8u17IHFBbMAKXpAFkN+a4I9uDf53jHsRq424fqrgLnMzpHn7/J+qKKykyDujoU20tYa5zZrsd3HaKRX9hzojH87nx3BoxBpRGDWwhY6ky8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717255825; c=relaxed/simple;
	bh=ZBV7j2HnfvAkZTkxfnAC+3ke3f7l/ctdE02xfZ2rec0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTMh8B9v7w1sZLWi3GjfZqJ4ykcRM+SNQQVLiZ9Dki6Xw9Wq1JC6yjYosz/Kc2EuyKj98/k3T1vh+wCnAfYx2iAxegy1mpYXJ7bMA1Zns2GX87/62EarV2tiorWDDzIgeIZj5NvFPPG0d9YIyptu76QgQSERJFVPrcDG9T8gdFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gc+WA7JI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 168B2C32789;
	Sat,  1 Jun 2024 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717255825;
	bh=ZBV7j2HnfvAkZTkxfnAC+3ke3f7l/ctdE02xfZ2rec0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gc+WA7JIv0ZxCWz9WnKw808SVquDIlv8UvCm5Y9yIYl9i+TPg9UXt9LzejNIJHQTU
	 LzYk54OYtlFvcj0i/as7wEuEcU0sJrxKaY6RkgxwO7ckob7KLEH3S2G5vySdovjtdb
	 H7+34wRgujQEzCZgKnjxGM9XFLT1BZzD+cZ7mh4FQjBHEB3rcg2KWcWY+/cde0MxMD
	 2B+3995B6hqaXIwr1nHCWfFJPE65ucPhr5ah1utJ/gaJdDCOOWvkzEPE8CHqSyqnEy
	 deQpSrTX7DDTfq3GGi7lBr9QB9WOtU3Nf6a3nyKtM7MKaATvoUR5YCo5Ia63qROvct
	 uRZtH1+ng82tw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DB9C25B7E;
	Sat,  1 Jun 2024 15:30:24 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Date: Sat, 01 Jun 2024 10:30:18 -0500
Subject: [PATCH v4 1/3] Input: novatek-nvt-ts: replace generic i2c device
 id with specific IC variant
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240601-nvt-ts-devicetree-regulator-support-v4-1-e0c0174464c4@gmail.com>
References: <20240601-nvt-ts-devicetree-regulator-support-v4-0-e0c0174464c4@gmail.com>
In-Reply-To: <20240601-nvt-ts-devicetree-regulator-support-v4-0-e0c0174464c4@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717255824; l=1393;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=JfGOWdU2w8+0k5JiDiNeJehgANFUozza/8JZOnq70YQ=;
 b=2N+nKpMcTgWMGs8Ob0QX/kRltK4J5K/rzYKY24xqfxDgujMvB8JyQuVXzM4gOJjwmtOA12ZgO
 NZfn/z8OzhDBgdibMjte+4Qc+nz+YibOf/Imfj1a2WDsnzJ6jMiWFbv
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



