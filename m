Return-Path: <linux-input+bounces-13367-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FFAAF7CBF
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 17:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7276B486424
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 15:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A732F2E7F1A;
	Thu,  3 Jul 2025 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cr+e74aa"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4798223DD0;
	Thu,  3 Jul 2025 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557343; cv=none; b=RUCeElhZfRY7dtaHBd/N0Eqp4viUJskpASqyvtKLMJpfBkU/zDdiCPtMgL7sg/eU9XFb+HNmE6XahuwFuHzUFWi+icYKw6I3XhoYC2h3ApKtNusrpVsoF0ulOd93zlqfbAZRQNPqNh9CWBWeuxZXWt1R8B9IzyHVUqQjTEaTd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557343; c=relaxed/simple;
	bh=d4fgjGNkQ+CXstPzPLDXaigiQXlneekXtm2M8pLICrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pcKuHeokKSXfgmjiJGnZwMfcHVt2YjNqr11UKRu8gHpOfSzCUULRNATijB8ut64+1k2rExvKNgNSbUgfGK8XLp3IxlrKvQQSnjgvha+t29WjZbif3Y4Dx4xyqaIXWq5CwfJQvTkwhVN4nGIHUG9ezEo8PLhdNZV0icmX8JVXqv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cr+e74aa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751557340;
	bh=d4fgjGNkQ+CXstPzPLDXaigiQXlneekXtm2M8pLICrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cr+e74aaI3XBMprb3FkyJFS/LV1rzmN82Pu0ZYaG+QivXXQyS+w51mMOirYNccVlQ
	 PjKyVpuGrnnD07L4zOJF3gF4Le7fj3XN1vtV75QRvNZ0ELdQWN81WIbbyWtMDgUrUW
	 Zv+5KbTfli0NEWnWm+ay636fv50hbdEySWbxDZSEsOVSn84a8dKbO6tqN/z7BmrgzL
	 A6zyjG1Pqw/R1cqwz2BmFY9omF3h6ctqLoWezG/BsWbsvafEv1Iv/k77dEtyjD0UBI
	 wTlj82un8OotF1/9DHGppj6WI5040K/xeukg9U6awqrsfnZZQ8ivMqv3o7BnLawxcm
	 p+Z9sWkqs43MA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 69C6817E0EBD;
	Thu,  3 Jul 2025 17:42:19 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 03 Jul 2025 17:41:04 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8390-genio-common: Add Home
 MT6359 PMIC key support
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-add-mt6359-pmic-keys-support-v1-2-21a4d2774e34@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751557337; l=780;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=d4fgjGNkQ+CXstPzPLDXaigiQXlneekXtm2M8pLICrA=;
 b=bnfzKGs+imz4mZg4UjsRjY9v61NAPDNnVI0EEbI+9pZdXNCTGd+EyoSKkiDaQSA7fSJfqXShB
 WOmYphl8Jw4B58JXT29cOZakM4rMlYPP75EHKh+rmhJ/Gn3TvynwjvM
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add in mt8390-genio-common dtsi file the support of Home MT6359 PMIC
key.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index eaf45d42cd347a2bd2db8af9ecef8f83f70c9183..a2cdecd2b9034e2f295d817e846d6ed1845e686a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1161,6 +1161,10 @@ power-key {
 			linux,keycodes = <KEY_POWER>;
 			wakeup-source;
 		};
+
+		home {
+			linux,keycodes = <KEY_HOME>;
+		};
 	};
 };
 

-- 
2.50.0


