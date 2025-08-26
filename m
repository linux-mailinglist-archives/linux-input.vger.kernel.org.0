Return-Path: <linux-input+bounces-14323-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F389B367E9
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 16:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0B81580D75
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 14:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADF034DCF1;
	Tue, 26 Aug 2025 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ay+vpxBb"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2778F374C4;
	Tue, 26 Aug 2025 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216918; cv=none; b=reePTgkXSPA2bH7WdwQ5UvhwhCOmgzi77W2GU++bIXwwCfBBwdZWuBnDytvrT6DsCM8v1dAtN9MP5/Q8DLT7/oLqqUZTedA+k/jLWxFB+9cGpUpF5T98O3NBIm88cqGfLENfwHkTKUd25ePEKMKVYELvTpPmp/37ecBmW542UbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216918; c=relaxed/simple;
	bh=QSwZwlauNJhLnv67cXc1P1WfebF0M6T+dK0F4Qjpt7o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lGIkrwSmxtWPy2FbliJvO537t6qVQBHa6JJESuUlulZfVhT2b1lNDTd+zE+ql+YYZnXBCqKgE8YatyEXfwkBm6+AL1tVJ3pQA4as2Xxh/OA4jvPEimuO6bFXQ32+5zNNaHkcXdYWcZ6XBDhpMDgnLL3S670+koH5gOVmFHneGQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ay+vpxBb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756216914;
	bh=QSwZwlauNJhLnv67cXc1P1WfebF0M6T+dK0F4Qjpt7o=;
	h=From:Subject:Date:To:Cc:From;
	b=ay+vpxBbFjwyWssKYyrA5ZtEkmCQBG9gG041eMidGHduCgWD/IgCjKUSsHX27TvxO
	 UegeJPR3aBd4WxtDv7NQz8bessr+E4BawfRRgd+f2mcJAVJf1gcYg9iwMA4zLPvyu8
	 yiC2TopvL3GJjlznD/ZMs/+ZuAg5QGbFAPTF4S+P0zb3vEF2k5chs5VPBbv/JbXnaI
	 HqvHoEUFoYIh7WmndyG1j/e25dRLUjr0JzglmmJYYJrLT8qh/4hfKO+GCB78cFDvPM
	 WKGy8W/EleKml6769jYyrYeiBk5wmm2b8c2C5wqYLwtRP3PdY05GESYo2QbaTvaKHc
	 YOrDiSQgqasFw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9976C17E046C;
	Tue, 26 Aug 2025 16:01:53 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/3] Radxa NIO 12L: Add GPIO keys and LED support
Date: Tue, 26 Aug 2025 16:01:51 +0200
Message-Id: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFC+rWgC/32NQQqDMBBFryKz7pTJaCB01XsUF2kSdcAaSUqwi
 Hdv6gG6++/Df3+HHJKEDLdmhxSKZIlLBb404Ca7jAHFVwYm1mRIYbJ+s7hIRMU447jWpLuByTj
 WbdtCXa4pDLKd1kdfeZL8julznhT1a//7ikJCT6ajwWjPztxdnGf7jMleXXxBfxzHF3tF1Fi6A
 AAA
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

 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 67 ++++++++++++++++++++++
 drivers/input/keyboard/mtk-pmic-keys.c             |  5 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
---
base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
change-id: 20250801-radxa-nio-12-l-gpio-54f208c25333

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


