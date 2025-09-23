Return-Path: <linux-input+bounces-14998-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72277B93AB0
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 02:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 354362A24AF
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 00:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B932A1B2;
	Tue, 23 Sep 2025 00:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0s/2sx0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E3224F6;
	Tue, 23 Sep 2025 00:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758586499; cv=none; b=ngNst9mkD6/TrPT+7x15CBINnE0L4PEoGNErvlv15e6K1Yt+7QbbcLA6rGNLh6Vt9XPvuIhAx4eBZv9bguxHWCIWCljBNZ1a3d9sx6mCQ0+zEO+H0x6BTHaBe4zYUDxov/taveI+yXOmvqyTYjYvuYmAdMEuygQsnDENkOcjUZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758586499; c=relaxed/simple;
	bh=uJRu90axGePaPzwjQdQUU/DsYV1Oe0neqc4sV1m2M2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ce3iJQP9KbMK3jvmDFo5DVW0m79bFerHOjx1x3qyIFxJDLN++RnhmG2sYwPNJtIIJbYTttrkQj7Sovyd0h3TTAzps1OU02+ikBPV3LNRloofLf1fG27BsQz34GRySBbQZcqXglCxrSi3VzB6k5Y9c6yEaFgslkYzYDlhKWANXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0s/2sx0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 789E4C4CEF0;
	Tue, 23 Sep 2025 00:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758586498;
	bh=uJRu90axGePaPzwjQdQUU/DsYV1Oe0neqc4sV1m2M2A=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=f0s/2sx0oJa8Vs2gvlE9XbJi8yNT9wwWEtm+dCZeAD15NzemYuZn+4t2tPxrBp7Y5
	 XMLVn4NVoQoi4VMF0aPkwoe4CjqjA0O6OsGTzz4So5/sq9W3RTPextU1372MfFhTtG
	 1W8yR7nXZT3bAWOg5OmOS1WOQnrdoPz05S8KGIb0Zva6VXROsni+v+dhxzo5jemJTp
	 x02GzNIZepWpBkqInxj4WiavEPmHtWMi2G0UsieMb7sGZJVM+cpIWoIgPL8SoVpthT
	 yDoVknTzf8XMe3ynfqjacid/HFx3ArLAuHR1iuySOdbj2tPtP6GDMMZ1zCPdynvdqB
	 l+pCCw1Fnczxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650CCCAC5AA;
	Tue, 23 Sep 2025 00:14:58 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Tue, 23 Sep 2025 02:14:50 +0200
Subject: [PATCH] Input: ps2-gpio - fix typo
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250923-ps2-typo-v1-1-03d2468acc32@posteo.net>
X-B4-Tracking: v=1; b=H4sIAHnm0WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyNj3YJiI92SyoJ8XVMzcxOzZFMzC1ODRCWg8oKi1LTMCrBR0bG1tQC
 l/lTBWgAAAA==
X-Change-ID: 20250923-ps2-typo-56746c56850a
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758586497; l=1181;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=IPy139GDL40Ao6EBEyf0Bsm3lBOPa8B5AbzRx2Cm4mo=;
 b=0utriwySV/XiOEb9kOXBBXidP+4XaLTRlLPAaNEOcq1fRowy6LyK5hrLbVNuQ4g2HcXq8A1/w
 +WW8rCLQcRNBp+XDkZ6eoN9ONeLve3nHjGMRB3uiFLMRv+ePmLzQh/r
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

"The data line must be sampled" makes much more sense than what was
previously written, and given that "s" and "d" are neighbors on the
QWERTY keybord, it was probably a typo.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 drivers/input/serio/ps2-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
index 93769910ce24ea96265b67e2d04dfd768b9d6c6b..46fb7667b244a37e29c19ac363d17e0c32d7f822 100644
--- a/drivers/input/serio/ps2-gpio.c
+++ b/drivers/input/serio/ps2-gpio.c
@@ -50,7 +50,7 @@
  * interrupt interval should be ~60us. Let's allow +/- 20us for frequency
  * deviations and interrupt latency.
  *
- * The data line must be samples after ~30us to 50us after the falling edge,
+ * The data line must be sampled after ~30us to 50us after the falling edge,
  * since the device updates the data line at the rising edge.
  *
  * ___            ______            ______            ______            ___

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250923-ps2-typo-56746c56850a

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



