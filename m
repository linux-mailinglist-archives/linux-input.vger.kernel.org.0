Return-Path: <linux-input+bounces-13368-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBEBAF7CC2
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 17:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8292E4873C1
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 15:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1C12EF64C;
	Thu,  3 Jul 2025 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QkQWGDr7"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726A22A4DA;
	Thu,  3 Jul 2025 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557344; cv=none; b=uK24GS7Sar9RGx2RnGaxqEnO0EJrJKVUiNaw5HMtvgXY4lfRbWb2HcKFyl8fWD3Yx4VR8ClZSYzFFz1/PdHG/tozP/kc41GqCvK9knIr22n/jkPCLUZWny9W8ScIy2gdZMeJvgNxOclw4hKPCdidYi2Cpp5nPnz7z/oAG/13ctU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557344; c=relaxed/simple;
	bh=OXXezo9jCjAPl/UpmJAtt4tT5kGKJpblJSn0+4s/R7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvYWGHSD9P4u75ezNcpurr8614G82KfcriBN9jd/H8Yx+YfkAXdQ5nMy0l4HrTZM9fXcmOdZt2bH5ZQygC2Px7itcRIuBvzRPAnYwD0GgdKeZm2eTQ1fcE/TNfiqWK1PiwLoDxsGzFIFXs6NJYpMrJhgCSJ4feIsRTVazKVOuwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QkQWGDr7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751557340;
	bh=OXXezo9jCjAPl/UpmJAtt4tT5kGKJpblJSn0+4s/R7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QkQWGDr7oijzoJ/CcZpmfAsXzc2dhIE1KfQkr7shBqz81sJIhCpgghJzVcQXfdATO
	 adlhFw/0DYmtGoDgMP2bSKdBZs3ZjCDbOYBxM+1AVYVo63cgR7+cEAw253NQIkdQyJ
	 pEHHh5O0QN5Q3sBovTXm4UZTPz324D1sFlAog1oKKpQDliEtYzCYXJ3C801OPXRBtO
	 F3+sZbWMrDaIMXPrajESgKxbdIBfR4+foUn1s2rvlqz0CUGsG1d96RMTn1LnNQSYN8
	 CzHYOOaqMOpM5ZfiUZf19j+ziUlaoafgh26+q48GbK08wPv7hRf4iL4Ms+6Up361Hf
	 i02dbupo2OeEw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FD2617E0EC0;
	Thu,  3 Jul 2025 17:42:20 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 03 Jul 2025 17:41:05 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8395-genio-1200-evk: Add
 MT6359 PMIC key support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-add-mt6359-pmic-keys-support-v1-3-21a4d2774e34@collabora.com>
References: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
In-Reply-To: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751557337; l=1095;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=OXXezo9jCjAPl/UpmJAtt4tT5kGKJpblJSn0+4s/R7Q=;
 b=7QKFk6Yce77TlmxpQVpDSTveC0jBucm9jpilEQAqsvQ5BKzG2pC3sDQRkDKqSC6iqomdV5jTd
 da5pjVybZWxAA8ZjU7FOsjYWqVDSTY5NeHQa6NL1joHXGzf1OAGu15D
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add in mt8395-genio-1200-evk devicetree file a sub node in pmic for
the mt6359-keys compatible to add the Power and Home MT6359 PMIC keys
support.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 9f0734731b5ef3c6b86693a389adc399707d5212..cf8cd37f570845a836a97564fd64a6a9a0e4e4d0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -990,6 +990,21 @@ pins {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+
+	mt6359keys: keys {
+		compatible = "mediatek,mt6359-keys";
+		mediatek,long-press-mode = <1>;
+		power-off-time-sec = <0>;
+
+		power-key {
+			linux,keycodes = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		home {
+			linux,keycodes = <KEY_HOME>;
+		};
+	};
 };
 
 &scp {

-- 
2.50.0


