Return-Path: <linux-input+bounces-13756-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DD4B18249
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 15:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C64131AA7110
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 13:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848DD2505CB;
	Fri,  1 Aug 2025 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oCchi7g4"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786C1248871;
	Fri,  1 Aug 2025 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754054216; cv=none; b=REQjziXKcqnkytTWOir6B71RYCtkEC3zF8AHs/31Z654fIQmFSQy0BJOVBF21OiQY7XalBhzgpXVZAwKYLH/N4MeqjWg/hjXz4K3P55oGwiBj6tOBgyuDqw0umtyZwMVNpks5piGoKLGeuop/qFLQR3tl/IX8oQy2Eze2JrUzis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754054216; c=relaxed/simple;
	bh=vYMoaA+SHxkZkQ8TViaTJ2DCB6xNRtqi06zUZsQKohw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oJnTB5nErUIA/z/a3qs2YzGn1XFjkORip/6+ozCOk+Blnsy/nLaD5ss/ZC6gIeaZmQq7BxbLPbH1Q0lHaRLrqSJUdT5U+6MF9e3HS1+xd0KYDv93zppF+mQu4AaZJmr/ymR6q0AyeDNnh4j/NIT3iCyQ2xwvIY013gsc1tRar5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oCchi7g4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754054212;
	bh=vYMoaA+SHxkZkQ8TViaTJ2DCB6xNRtqi06zUZsQKohw=;
	h=From:Subject:Date:To:Cc:From;
	b=oCchi7g4mNseOB7tfrBeYKUiEuhLDZUVwhFP1Xo6P1+O0QdjHPF5nRDUGAJ0FONWb
	 N4XaIJqq4Z1W10JSBmxOyeHXSqhxZAEUEYFtGrOLqnTsbo1LyaPeOFKvQtt8vmSMCi
	 sj6Vvz4FYKHcBbJM1bPpEtj1CJh+u46dcZ5gsKelVc84xIYksoM61JrKBVzXmFIJoJ
	 ejumLv4CkAsgAB2OZi8X9geLl9k7GJ1DOBQKU7icmmHmAKjiESYDVQ5a6JwGls/2Xg
	 p0gAooOyRnFp62Za9etTDtQrKmrWw8a10QwnMUYAsUJDaDJuN/WMrlbDuMOaZsVJUa
	 JKc83Qyk/h/QA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08D3817E046D;
	Fri,  1 Aug 2025 15:16:51 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/3] Radxa NIO 12L: Add GPIO keys and LED support
Date: Fri, 01 Aug 2025 15:16:48 +0200
Message-Id: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEC+jGgC/x2MQQqAIBAAvxJ7bkHXhOgr0UFsq4XQUAhB/HvSb
 eYwUyFzEs6wDBUSv5Ilhi56HMBfLpyMsncHUmTVrDQmtxeHQSJqwhvPp5OdDlKzJ2uMgV4+iQ8
 p/3XdWvsA7BTHeGUAAAA=
X-Change-ID: 20250801-radxa-nio-12-l-gpio-54f208c25333
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

This patchset adds support for the GPIO-connected red and blue LEDs, as well as the various hardware buttons present on the Radxa NIO 12L board.

It also includes a fix for the missing release (key-up) interrupt handling for PMIC-managed GPIO keys.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (3):
      Input: mtk-pmic-keys - MT6359 has a specific release irq
      arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys support
      arm64: dts: mediatek: mt8395-nio-12l: add support for blue and red LEDs

 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 67 ++++++++++++++++++++++
 drivers/input/keyboard/mtk-pmic-keys.c             |  1 +
 2 files changed, 68 insertions(+)
---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20250801-radxa-nio-12-l-gpio-54f208c25333

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


