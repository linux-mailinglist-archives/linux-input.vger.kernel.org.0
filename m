Return-Path: <linux-input+bounces-12029-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A193DA9EAF5
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 10:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A849189192E
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 08:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FBF25E466;
	Mon, 28 Apr 2025 08:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PT/5uQWr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA1200138;
	Mon, 28 Apr 2025 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829623; cv=none; b=nyo4a1FVCrwqxuKZSSMuKeav81ysz6CZgKvZP56KSWzpQGNyVjYecyq9whhm/yqJk3WyaOErhJ3GXWobKzQ4wEbY3dub4T5OV+u3DbHGbbu2p/sZOuwKzbdymKh7rUKmH+QiT6M/LH9+wVo7O6xQYyMJHYKeTxpcqdUzmPP/Zpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829623; c=relaxed/simple;
	bh=6I0kWj4PmNIOlZtd9oOgfAw9VX6z3OU98LzApc571p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z3A6dJ2tRWgMKo8W4YScFLJNzDJj55GMUZ2Z1sIM21T4duWDz4DMfN1ZeHe4CYll/LOhaHEd/cd0HSz/UfoSVY4KJsYQMLrigExKmZN6RNrXQm/OnH7Rrk6MjCOIC6EphTHqgwLoUkrtNrvM7Pea+ZPReG4wq/okqcCk1ylBwyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PT/5uQWr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390DEC4CEE4;
	Mon, 28 Apr 2025 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745829622;
	bh=6I0kWj4PmNIOlZtd9oOgfAw9VX6z3OU98LzApc571p0=;
	h=From:Date:Subject:To:Cc:From;
	b=PT/5uQWr22MsvaDK+lS2Fx/k/jcmpe46qbGmx7tRbmLaYEGfCkENpe5ORE6SJ/kKy
	 ZBDgH8viX3bTYttK+lOpjaerExszoSVlnInvYjl3/d10tsZdQOV1ZhuFfkGCI2q0yC
	 lF6M8fsmU+k5vBDx9PXrs1hR+nUZ6JOn0MktcHqLpU0WJKoCtvW8A03DJWEFPVhCk4
	 G/UY4YWwoVdWHNLGnyTlmh/xa/ln8Oa5RWcatZ46hooTIIlh/B9DLlRgL/twuQq0hx
	 eWze6ZqLra6hG7tTMK/DlqkMbsFUqZs4UlFPV6EPZauxviTufX14YdUPVmk8d70zKf
	 YwetIOSixkilA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Mon, 28 Apr 2025 10:40:17 +0200
Subject: [PATCH RESEND] MAINTAINERS: .mailmap: update Mattijs Korpershoek's
 email address
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-keypad-maintainers-v1-1-4e9c4afba415@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPA+D2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3ezUyoLEFN3cxMy8EiBOLSrWNbcwsDQwNkpJNDY0VQJqLChKTcu
 sABsarRTkGuzq56IUW1sLAJLCbWhsAAAA
X-Change-ID: 20250428-keypad-maintainers-7809032da315
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-input@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3-dev-7b9b9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=6I0kWj4PmNIOlZtd9oOgfAw9VX6z3OU98LzApc571p0=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBoDz70zMGTm3Ip8bhSkxPyjZri9uKgI8YajngVH
 NZBiWkvsISJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCaA8+9AAKCRAZDR20Zk4Z
 NaWOCACYnc5P9s7zUJalhI3ZuPDzbpupV2g+DuZVyTDzz0f6WL1JZbEoXJeUytDq3WjsaRp5Tk2
 PDvysM+MyQ/GmA06qHozYanzhAY3UIhedeZkKuBb4nQfn0Y7vrhzlqV3VwiEQ01nzsKii2SCUL4
 PZpB8RkRcQeFscX4VT8xYt+gXxwewN/osaVIxiEW/aOHGsX4f2s+0yDXQp8fSFHvKqrTo/KJf3h
 ZExzXPfDNZzS338KDsSPMyxNL5mwgrApkwiZ37yaaELHolzUHaV25qmdDFkP9I2mErKBP0n/UIb
 CfmGmybNhm4CbgKXRWduJrKBzHMpaFrnt6AXyzzTH/YaQpz8
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

Update Mattijs Korpershoek's email address to @kernel.org.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
Hi Dmitry,

Would it be possible to pick this up please?
My BayLibre email will no longer work soon and I'd really like to stay
involved with the mt6779-keypad driver.

Thanks!
Mattijs
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 6762cde6ac7a..8c89847a048f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -486,6 +486,7 @@ Matthias Fuchs <socketcan@esd.eu> <matthias.fuchs@esd.eu>
 Matthieu Baerts <matttbe@kernel.org> <matthieu.baerts@tessares.net>
 Matthieu CASTET <castet.matthieu@free.fr>
 Matti Vaittinen <mazziesaccount@gmail.com> <matti.vaittinen@fi.rohmeurope.com>
+Mattijs Korpershoek <mkorpershoek@kernel.org> <mkorpershoek@baylibre.com>
 Matt Ranostay <matt@ranostay.sg> <matt.ranostay@konsulko.com>
 Matt Ranostay <matt@ranostay.sg> <matt@ranostay.consulting>
 Matt Ranostay <matt@ranostay.sg> Matthew Ranostay <mranostay@embeddedalley.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index b2c3be5f6131..e8a0fa814ab5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15130,7 +15130,7 @@ F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
 F:	drivers/media/platform/mediatek/jpeg/
 
 MEDIATEK KEYPAD DRIVER
-M:	Mattijs Korpershoek <mkorpershoek@baylibre.com>
+M:	Mattijs Korpershoek <mkorpershoek@kernel.org>
 S:	Supported
 F:	Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
 F:	drivers/input/keyboard/mt6779-keypad.c

---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250428-keypad-maintainers-7809032da315

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@kernel.org>


