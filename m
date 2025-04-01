Return-Path: <linux-input+bounces-11461-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F84A77BFF
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 15:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44E2A3ABFAB
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 13:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267AC202C30;
	Tue,  1 Apr 2025 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cq2kZ99d"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8501F09B7;
	Tue,  1 Apr 2025 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743513805; cv=none; b=M3NIiHyX0JuJM6st1ed68f916CcR0VyIRN1pB5TEnYDLatyPIG7QU+oWGfFKnWXGap6B193O/mAEEEfj1jjjioE9TO5tzzxwCelpTcszQ9S6r5bnFUrcQ0n8y1/Pw3cyPmnf/N+qAe0C1w7zrkRs5btnWF7qYO6SCg79SuoBMpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743513805; c=relaxed/simple;
	bh=6Nw24EbRgYYOy+DUPepq5IsFLUV2zOLDoEnzpik+ckQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IlmsxQCE5bcXKzwqEGPalIXCJ2F3HY07Vaf4xjkm6H84JrqSL0kTyzhYqCevguD584Jno2NEERWkH8XLI8KB0mlDfWLYSlSIWeb+dyLCUxdXzPnbhzOexyInJj1xbcstyDcg4bkqP2bLyqxM08TMrui/Gp83oGoxW/PmtaOr0wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cq2kZ99d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850DBC4CEE4;
	Tue,  1 Apr 2025 13:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743513804;
	bh=6Nw24EbRgYYOy+DUPepq5IsFLUV2zOLDoEnzpik+ckQ=;
	h=From:Date:Subject:To:Cc:From;
	b=cq2kZ99dvRPfIxGmTFv3MhgRx9esG0fmrnHDe/NgYY50SZvi+w5Lj0oaGCkqDK83x
	 5mVIe4bL3WOZniMGFUg4q7kZG0YK4VmnrftqaxxQNjHXDgt0WRh8JEVk7aglUSCPYU
	 gLeIbqX7d0PTEpSpLyHBHlJeug1A6GC1iggh2/rUp9tXr7qf7anuIDHv5J/I5PnYxS
	 xbTAS5+KIgXaGPkPvznvV7B1jcBAKkDBgDN2cj0WLDnMczc+q+KPNAW7FQwKyf2ls6
	 vdNvl07h+zFJ8bPM6tSs/egtAtSPhTWfZoAlX7zp02XATfi2qyHRsnDHWifFz+aA4O
	 regtDvx7wxp+A==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Tue, 01 Apr 2025 15:23:10 +0200
Subject: [PATCH] MAINTAINERS: .mailmap: update Mattijs Korpershoek's email
 address
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-mattijs-korg-v1-1-734a7ad8be1f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL3o62cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwND3dzEkpLMrGLd7PyidN00s0Rjk8Qkc/NkkzQloJaCotS0zAqwcdG
 xtbUARub+nV4AAAA=
X-Change-ID: 20250401-mattijs-korg-f6a34ab77c4f
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.14.3-dev-94c79
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=6Nw24EbRgYYOy+DUPepq5IsFLUV2zOLDoEnzpik+ckQ=;
 b=owEBbQGS/pANAwAIARkNHbRmThk1AcsmYgBn6+jIx9a8LCkrFb7kmJXLDCuPk62m9kwIBzlmu9ZR
 Q+Ro0mOJATMEAAEIAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCZ+voyAAKCRAZDR20Zk4ZNYbqB/
 43jZtO9qIG3UXhKqKWSGO9KB10zS2goC2nTlptSgzAcelUtnRxXIjshqRDgSR8HInKxRD0+hJZqytt
 Et6JexuYQPk6mI1pkasSqHFS2HtTt8XxnAnf4KeUmjVIUUkHUMsgpNjXWblajmSSCjeQCShU1RvIG8
 NnFVzCO4IiTQqdRIbFEiE8VrVRAXJr6MJVxUu7g6BAtozeB/Hx5X92PI8qDBMtrpuykiezQL1QYOwC
 9cG6ePFrx0kQDCdtpMTcHCrpzpcoTD+mTzwXOxOglItuoqN7VUTL3mDm+vnG7mr79YOsbBR/hEOg49
 gsEmTUdPH5qlpMBAskecPaeZE65NHO
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

Update Mattijs Korpershoek's email address to @kernel.org.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index f485903803c6..d68de811b8e8 100644
--- a/.mailmap
+++ b/.mailmap
@@ -474,6 +474,7 @@ Matthias Fuchs <socketcan@esd.eu> <matthias.fuchs@esd.eu>
 Matthieu Baerts <matttbe@kernel.org> <matthieu.baerts@tessares.net>
 Matthieu CASTET <castet.matthieu@free.fr>
 Matti Vaittinen <mazziesaccount@gmail.com> <matti.vaittinen@fi.rohmeurope.com>
+Mattijs Korpershoek <mkorpershoek@kernel.org> <mkorpershoek@baylibre.com>
 Matt Ranostay <matt@ranostay.sg> <matt.ranostay@konsulko.com>
 Matt Ranostay <matt@ranostay.sg> <matt@ranostay.consulting>
 Matt Ranostay <matt@ranostay.sg> Matthew Ranostay <mranostay@embeddedalley.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index d5dfb9186962..50d6519d3b9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15014,7 +15014,7 @@ F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
 F:	drivers/media/platform/mediatek/jpeg/
 
 MEDIATEK KEYPAD DRIVER
-M:	Mattijs Korpershoek <mkorpershoek@baylibre.com>
+M:	Mattijs Korpershoek <mkorpershoek@kernel.org>
 S:	Supported
 F:	Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
 F:	drivers/input/keyboard/mt6779-keypad.c

---
base-commit: 08733088b566b58283f0f12fb73f5db6a9a9de30
change-id: 20250401-mattijs-korg-f6a34ab77c4f

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@kernel.org>


