Return-Path: <linux-input+bounces-10331-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC1A43661
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 08:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B81616D8AB
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621B6257422;
	Tue, 25 Feb 2025 07:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipo2GP71"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381871FC7F9;
	Tue, 25 Feb 2025 07:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740469710; cv=none; b=Vwij6zIGmhmAN6Rz0NsK/VIrUWSxMHWhESnroWyN7j4aeOAOtA+lQ96Lqpv2mrKKMdzmXW3vzjwcYNnakoUrifHxzI+UdjAaCioZ2LYIEHGWSUdjat/dqNrbcF3LsU1//ck/xGfVwTCYOHuel7wN5Y9K3zgcozcI1SR3UpFD8xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740469710; c=relaxed/simple;
	bh=n5Rxmsh4HcvPHYeIf8J+K6lgfD7C7/W8Pd89umUMb9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U0ar+Mw7E6NFT0sF1nhXiuVoJZEAO7yHDQQq+N/Hee9uGrro5vWhjktsUwaqg0+ePw7jNnYBoZwa1wdLcxTBLgaOEVwbFY7s4YXPuOFUEHEIM8C63q8D7+Q/vLf4NL8V3/Xk6unH0jBI6wOpLvnsHCMkLfIGsGMJ+wo83E2Wf4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipo2GP71; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADA81C4CEDD;
	Tue, 25 Feb 2025 07:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740469709;
	bh=n5Rxmsh4HcvPHYeIf8J+K6lgfD7C7/W8Pd89umUMb9k=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ipo2GP71iYvLj1lzPEKN3HFAsIQdTBRU4K9z7mhjBU4qntHa2UN++vdgbLMNsQUrw
	 vqI38ovULqWqZn6dsRyqDBNz2DxoV9B/x1uI6OSLF3oBpy/TBFAeygecEbdAYx4Wsc
	 MTLP1T5heCZ07p7vA9qUQJCbWApsu1nfEbQfWTkIKP4EE1SzVg5UxlQPeosoulN0zl
	 i9hGvwskGQt7UHWStWPAxbwt+LHV6SlaguRFuRdz3/5AlO8edUkrNhm3RPaPS38c2I
	 lfKsaZ67hmwc59/Ux4Ydm9JHJJFuvyOjvZtlrsezD7Xi1fpDRrqKlbH4vE8M6/x+UL
	 pWEkYYFBgpWaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C4DC021B2;
	Tue, 25 Feb 2025 07:48:29 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 25 Feb 2025 08:48:24 +0100
Subject: [PATCH] input: apple_z2: Fix potential confusion in KConfig
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-z2-kconfig-v1-1-a67d9b778a6c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMd1vWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNT3Soj3ezk/Ly0zHRdszTzRBPztKSkFPNkJaCGgqLUtMwKsGHRsbW
 1ANwzviBcAAAA
X-Change-ID: 20250225-z2-kconfig-6f7a47fbbd7c
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740469708; l=1031;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=M+k6ONNmhncbOygKgNxDfkOOv4aJ8TjDfJ9c96zbA9I=;
 b=nSePU+uFQ961+MUI2ngin8dOOursf0PVEzo8cjbR9e4JUizGvEHwqrRG0N1BuxRYwsFz3V4uS
 2E+jZRkT/heADUIdl/0m/6geVTC3etkLTAr4bjYPycIQIzZH+E6KBza
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add a dependency on ARCH_APPLE and clarify the description to make it more
obvious that this is for ARM machines, not x86 ones

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/input/touchscreen/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 6c885cc58f323b3628538d41460248f8ab1dbf7d..91a2b584dab1469a3c907c0f1accfa10c4c4a3ca 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -106,9 +106,9 @@ config TOUCHSCREEN_ADC
 config TOUCHSCREEN_APPLE_Z2
 	tristate "Apple Z2 touchscreens"
 	default ARCH_APPLE
-	depends on SPI
+	depends on SPI && (ARCH_APPLE || COMPILE_TEST)
 	help
-	  Say Y here if you have an Apple device with
+	  Say Y here if you have an ARM Apple device with
 	  a touchscreen or a touchbar.
 
 	  If unsure, say N.

---
base-commit: 9995b98a4b2a704fa6744d2bee9c5d50b2c33836
change-id: 20250225-z2-kconfig-6f7a47fbbd7c



