Return-Path: <linux-input+bounces-16587-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFFCCBE5E9
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 15:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7FF93071F96
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 14:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE2A34844F;
	Mon, 15 Dec 2025 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XS/JYPfi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2784F346FD0;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765809006; cv=none; b=FhAeJLTt98XzoADy4LBD4GMNaw3pFUYfjnJVYHl2OJKbjvtBGTcuqMYeXsTUGjHXXSeE24feWkEKzvX5EN73p4tlbGf1zNzlRFC3JrTeHVx3oWNH4pzFeI0+G4hQZY6kH0o7r1MAOtpdp3YFi2e1B4cxZkyIf20mdun3fx/FMCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765809006; c=relaxed/simple;
	bh=ECIRge4VolAPtMWjM+w9B4pFiGXOGHl1dGi9UBY1dM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lEMrVzG7hnExMtFIO5EBtTx24fofyc5tPJaj3LdUmPa1xFpW48nqa9o2l8l/7YIhhUNh1O45P7dWJQUwnwlqT5V6AUyn3rifLpDnkN1s9X1Tdw7n/cVVNQJAtif0rYxb400qlbcARwC9eRehS/NcPAd3xK7qfSent+/sbWidIWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XS/JYPfi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA85DC16AAE;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809005;
	bh=ECIRge4VolAPtMWjM+w9B4pFiGXOGHl1dGi9UBY1dM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XS/JYPfig7JEX+7lPY5AXwkqXjRfzQLYaZ7C8zl16YUHkUsuB7TCJ9E9Bw16tLLVu
	 oLySkVnQDZtNjBYAZbrUwuxBA+B3rd3/CiA2jAyyY5vdTJ4taSly1e5Fih/sVYBJ6E
	 hDO0t86Wbqs3/b4PvOFOPGpUwpvvcrO3P/kxzH7j7bLoWCv4MFkHmjepGab/fYibdt
	 TZGLAIcsJx8rQpNR7Bx5AsRiefu5aAUtKN9/biNpMQZCpp8VMKH+dVgiDAVcynQAC3
	 4iESSd/SQ8u52DKY48Ef1NDxmnW/UrRaQA4Ihwy55DQu9NepoHlk/3qvB6An7n1eF6
	 LTPY8ZuiwXXIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B158FD5B172;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:02 +0100
Subject: [PATCH 2/4] Input: stmfts - Make comments correct
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-fts-fixes-v1-2-8c1e3a63ebf1@ixit.cz>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
In-Reply-To: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=+8T1xTsOJVjn1XL+OiuDFzpjTwMdaheaKiJkn4uzNC0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtrVk+/KB6coTqNYuMnIBrB/vm2/YxgSKgeO
 8D5TYOcCq2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 covAEACkdHFzLF0RrJb2jwOKLvgWbj8IznAZvFQpIEQkeIU5AwcTJ1W9s2KF9wToGtq0+B0VWj+
 fhPAsSz1iFl5SYfbBL56CuJp821p0Yn4QY0SyNrahuGyu9n6i900VLzcvB0rWqrR4RV4Bc9UOio
 VUmytGFM0q3f2/tY2pvHMsjhV9bD3DsUOc5e9WiXBViDmgnr7WCIjtTpFyhGRJ4jMw+bA14Y2TC
 07emPYv7j8L2Eq+9sQ4dNmQnP08J4XVlT1049ul3d5gfTNebtKcKoEDQ4rpcSIClPU1ODnMITnu
 rcWLOekQH4/CgsX62gA7rUqVISQJ0O+2XQmHaIdj6/pDLU+iQNaXcaDI7v/moY03HVuDQBpqrJ3
 JD8QnHAjwIRiKKG6EDj+i72lrQ21a3w4MMMSnoGTx3k4uJP8/AE3DLzyIaYf107Hrw0hDyC5ji7
 CbSlohpGYP8vOfzJccv1RnhhfoZeSmVWMPEa6G5mvuHCooAz2qT0d/tWqM3ML1Q2JAfPK6BHfK8
 rgAfBlxaUqI3lwDntbn9r3fNCuGvQwiaYIZiWGuGFEoBMJbANQuULYQEXDf1kY8o0UMfNb+Qx9C
 mS8D/VtdQl5WRPVB2YeSpQZgUf9UMQaa6G+oZaS41jzFGqvw/Di6gFm94TxnUW14NK2BbmeCcIw
 hVftWP6lsLGmQUQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Petr Hodina <petr.hodina@protonmail.com>

No functional change.

Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 9f5609524fef6..ad363b3c344cd 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -141,7 +141,7 @@ static enum led_brightness stmfts_brightness_get(struct led_classdev *led_cdev)
 
 /*
  * We can't simply use i2c_smbus_read_i2c_block_data because we
- * need to read more than 255 bytes (
+ * need to read 256 bytes, which exceeds the 255-byte SMBus block limit.
  */
 static int stmfts_read_events(struct stmfts_data *sdata)
 {
@@ -594,9 +594,6 @@ static void stmfts_power_off(void *data)
 						sdata->regulators);
 }
 
-/* This function is void because I don't want to prevent using the touch key
- * only because the LEDs don't get registered
- */
 static int stmfts_enable_led(struct stmfts_data *sdata)
 {
 	int err;

-- 
2.51.0



