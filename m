Return-Path: <linux-input+bounces-14507-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1630DB456E2
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 13:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1EBA5C0C32
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 11:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04ACC26B747;
	Fri,  5 Sep 2025 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KoNu/PZB"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D90343D76;
	Fri,  5 Sep 2025 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073128; cv=none; b=bgB/c5jUvXBrPH2BibwrdjmXz/LKas875JTG10l6hFTYKDaIqR9p9Wp/BlZao5b2j4YZbpk8bPcUZMTMrPnVtQbog/ttu64MXrFo+2aA5tA0aTjnwVVlLz1S3aV8c0plY/jYZayh9iFbtWH+JMR6QyjlMzoUfccdQamfGXBpnxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073128; c=relaxed/simple;
	bh=dST/8xVStC32ekP6gB7vITv41T5xV6Hei4eA5fX+3yk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NFxRhVeXzMcAt5JRO/ghD7U085jR0+iWz/HS+rOuck9oAC2AV8PIpzeqZshrm0uVki7FnC8xmVtd66P3SoXYpcfiW/3NQUYuzDYqgTJf+aWG9mRLkUwqZXX0bXXw9hgqAh/kTY1bR5lm3PZFb9NVoCZeL9HPUBMhmNrnlqsMGIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KoNu/PZB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757073124;
	bh=dST/8xVStC32ekP6gB7vITv41T5xV6Hei4eA5fX+3yk=;
	h=From:Subject:Date:To:Cc:From;
	b=KoNu/PZBVwQxyJw4U588Dtr1MZVIUtmtJ0zC3OZg2rcIFGvpNpdECWp7wcJgYpP9k
	 e2Pd8w1XmR//tjpTp+D8wHXDsB/ox+1DfSB1VJm01fgXWxdS30Cfaz7SXIZcjoU8/a
	 dlD3vb/uPlMB+pL0/eFx5ocaDodu0Z0VzRR4jOC8a7J76x62xAC220tmVssnkqC4NE
	 UwAgInY549BINS5QjwXywrc7GdGqkCXrHBSNhCXR64TofvGvpwqHA2loICcu1K2RDQ
	 YMYb2rOxGmHqECW3b7bKlno5gKINxEBOp0o/6rRaFBa8BM434PCAQTeY6lpSse2Osl
	 9Egf+jiNiGQaA==
Received: from localhost-live.home (2a01cb0892F2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 25A8417E0100;
	Fri,  5 Sep 2025 13:52:04 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v3 0/3] Radxa NIO 12L: Add GPIO keys and LED support
Date: Fri, 05 Sep 2025 13:51:57 +0200
Message-Id: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN3OumgC/33NSwrCMBCA4auUrB1JJo0GV95DXKR5tIHalERCp
 eTupl0Jirv5B+ablSQbvU3k0qwk2uyTD1MNfmiIHtTUW/CmNkGKgkrKICqzKJh8AIYwQj/XSbQ
 OqdQoOOekXs7ROr/s6u1ee/DpGeJrf5LZtv3vZQYUDJUtdVIY1PKqwziqLkR11OFBNjPjh4On3
 w5W5+yYdIq7zn07pZQ3mAz0zwIBAAA=
X-Change-ID: 20250801-radxa-nio-12-l-gpio-54f208c25333
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

This patchset adds support for the GPIO-connected red and blue LEDs,
as well as the various hardware buttons present on the Radxa NIO 12L
board.

It also includes a fix for the missing release (key-up) interrupt
handling for PMIC-managed GPIO keys.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Changes in v3:
Patch 3/3: drop the deprecated LEDs label property
- Link to v2: https://lore.kernel.org/r/20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com

Changes in v2:
PATCH 1/3
- Add Fixes tag
- Drop Angelo's Reviewed-By since I'm now introducing the
'key_release_irq' member that was missing in v1.
- Link to v1: https://lore.kernel.org/r/20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com

---
Julien Massot (3):
      Input: mtk-pmic-keys - MT6359 has a specific release irq
      arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys support
      arm64: dts: mediatek: mt8395-nio-12l: add support for blue and red LEDs

 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 65 ++++++++++++++++++++++
 drivers/input/keyboard/mtk-pmic-keys.c             |  5 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
---
base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
change-id: 20250801-radxa-nio-12-l-gpio-54f208c25333

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


