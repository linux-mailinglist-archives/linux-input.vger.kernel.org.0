Return-Path: <linux-input+bounces-13365-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C49DAF7CA1
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 17:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4639D7B0C47
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 15:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5F1229B21;
	Thu,  3 Jul 2025 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lp4Wh9IS"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CAC19D8AC;
	Thu,  3 Jul 2025 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557342; cv=none; b=hlqMfuRzijFszyqYeDwh54UG8Giz2Xqg/BOcwX29duglrWzZ2TQ86noXMzg2SGTreH+Am6C9HDQw47oFpxnJh9kqtypuvRFbMHXgHsWDuNam8eC/ycHHqHXizSEsv5V/X9iOE6nbQkdEyv/wY8tmFoJhfi6shdeyYVGoBUL0SYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557342; c=relaxed/simple;
	bh=yC6hDoqxABim+0U/P7Lq08hxLKtYT+7rRFFFMob3zbM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HvcpqiVU1VafJNn7KImUQQMFzS+yfwyYypvHEzLo346BgJKB+KRH0qFj3N9+Q3h3qbMCz+k9Aj1TaLlb7x/qDNSbDh+jWOeWsiMhuVypTAZixnMZOCPo2MPoYLeQZyqiBYwNp65XRtE8LndGY2GOQJNSuGxdwZA6V+D6KrA9dic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lp4Wh9IS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751557338;
	bh=yC6hDoqxABim+0U/P7Lq08hxLKtYT+7rRFFFMob3zbM=;
	h=From:Subject:Date:To:Cc:From;
	b=lp4Wh9ISyxh8GAlBiZixOaSuvDEVGvLxbiUisrTfOXUh0suvB4qdQ05QDBNEzg88I
	 qYDAaRVA90p9v+vhQnkIawveaOCv6KcDeYuNrcXHTZn+jRQVtZ/EXenoKrLDlGNcA4
	 yhYe1iu5ESObGYApX0WzqCbkyTPBewZ3xOONcV5kJsTxmU7yittHc619VzpcUarLKM
	 hQrZsxLfxiCdipUvLsoI/BycRcYOt2dw0arI9q7ejzmF73zYRupeRD8JOf7DUJHqXF
	 4BW8/MGsYCJPBxIvLR4AF3RDgkwMxuhEQf7HQ6DZV68RBOnNAGy46T3mvfLI+lNOHR
	 gPxygPUU4gWMQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0692217E09C6;
	Thu,  3 Jul 2025 17:42:17 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] Mediatek Genio EVKs: add MT6359 PMIC keys support
Date: Thu, 03 Jul 2025 17:41:02 +0200
Message-Id: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6kZmgC/zWNyw6CMBAAf4Xs2U1aGhT4FcOhtqtuTB+2hWAI/
 24j8ThzmNkgU2LKMDYbJFo4c/AV5KkB89T+Qci2MrSi7cRFKNTWoitn1Q0YHRt80SdjnmMMqaA
 VvZCD7a0yEmoiJrrz+stfp4MTved6KYeEm86EJjjHZWw8rQX/J5j2/QuIuI+ynwAAAA==
X-Change-ID: 20250703-add-mt6359-pmic-keys-support-d08019d8d3c1
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751557337; l=2597;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=yC6hDoqxABim+0U/P7Lq08hxLKtYT+7rRFFFMob3zbM=;
 b=MY4zHQus25afqpRiSKmt8PqHFRihEiUuXBb1JBgogdxKIQbKxFtjdKk8JlWDR5Uh1h+K6CQrI
 Yb4r/W4tJVyD4QI4xtgLf9YLRrBX+nu2R4zhBL+3zS0jRF0gwZu6hJc
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

This patchset adds the support of the MT6359 PMIC keys (Power and Home)
that can be found on the Mediatek Genio 510, 700 and 1200 EVK boards
by:
- adding the MT6359 SoC support in the mtk-pmic-keys driver
- completing the existing definitions (only the Power key
  support was present) in Genio 510/700 EVK board common
  devicetree include file (mt8390-genio-common.dtsi)
- add the needed definitions in Genio 1200 EVK board devicetree
  (mt8395-genio-1200-evk.dts)

I've tested this patchset on Mediatek Genio 1200-EVK board with a
kernel based on linux-next (tag: next-20250703) plus [1] patch.

Output of evtest tool:
```
No device specified, trying to scan all of /dev/input/event*
Available devices:
/dev/input/event0:	mtk-pmic-keys
/dev/input/event1:	gpio-keys
/dev/input/event2:	Logitech USB Receiver
/dev/input/event3:	Logitech USB Receiver Mouse
/dev/input/event4:	Logitech USB Receiver Consumer Control
/dev/input/event5:	Logitech USB Receiver System Control
/dev/input/event6:	Goodix Capacitive TouchScreen
Select the device event number [0-6]: 0
Input driver version is 1.0.1
Input device ID: bus 0x19 vendor 0x1 product 0x1 version 0x1
Input device name: "mtk-pmic-keys"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 102 (KEY_HOME)
    Event code 116 (KEY_POWER)
Properties:
Testing ... (interrupt to exit)
Event: time 1751548607.957644, type 1 (EV_KEY), code 102 (KEY_HOME),
  value 1
Event: time 1751548607.957644, -------------- SYN_REPORT ------------
Event: time 1751548620.030611, type 1 (EV_KEY), code 116 (KEY_POWER),
  value 1
Event: time 1751548620.030611, -------------- SYN_REPORT ---
```

[1] https://lore.kernel.org/linux-mediatek/r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      Input: mtk-pmic-keys - add support for MT6359 PMIC keys
      arm64: dts: mediatek: mt8390-genio-common: Add Home MT6359 PMIC key support
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add MT6359 PMIC key support

 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi  |  4 ++++
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 15 +++++++++++++++
 drivers/input/keyboard/mtk-pmic-keys.c                 | 17 +++++++++++++++++
 3 files changed, 36 insertions(+)
---
base-commit: b803ad80123e6efccfeeffa7cd37f98f642e37f4
change-id: 20250703-add-mt6359-pmic-keys-support-d08019d8d3c1

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


