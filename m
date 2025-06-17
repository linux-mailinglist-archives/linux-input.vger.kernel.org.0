Return-Path: <linux-input+bounces-12923-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AACADC47E
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 10:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0671889AB4
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 08:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8F62900A3;
	Tue, 17 Jun 2025 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E5L6JVBo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6E728ECCB
	for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148411; cv=none; b=p4CzMAui/gt2rJtorIRGnqZcZEpjWZQ07HwLYoyXbpsLhGPNFGKFmBU2epCtQwczqY/dVCuEVZ9sgKaE6ay3X6Qg49ScoSHypfp8SC8JCCu+soFhrbP7+ntpViNZYCHLEigXjsJIhVitzFlvxNCUy115qZgbwn1V/LPo8iTgKeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148411; c=relaxed/simple;
	bh=1AG+e7q/YfpNh/SlwkVCOpC963NtuDICetxHLxE4P8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6n45bc/3pzM17M1QeZcar4HwklJ8C5NXBAbiNbLXEb/BSk+qymHf6CusFGhpi3NpP9PFHNF8b6tVmENnHUcGozaUrnQC4Itj9IjuvFp3XKXX7312YOfnCPXHM1ABYIGiVwpVtLYuhYgLv1Nip9Ij9iUrjCjdIflV2C26Fho6Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E5L6JVBo; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso4267927a91.1
        for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148409; x=1750753209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCgu0WUEcOwg7fCAIzSjiLXxg/4EglOh3d2upcp8Yto=;
        b=E5L6JVBoqJ5I21gjSFr3jlTaIVgBDYEKQg3a6WN+Y3JpJx17ZQfCBxGeM/tClSkrbQ
         oYfp3nsFXrBPiSJzFhSa31mq0ebY40/EUCeQ4umGKCq9Lau5Ka43ajPwIOIhE+3zJLEx
         fAkIkdJZn+0XbA1+Vg4aMw9RfOTFQ+0uAFlrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148409; x=1750753209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCgu0WUEcOwg7fCAIzSjiLXxg/4EglOh3d2upcp8Yto=;
        b=RLl3TSKupzi1Ss3p/3mvR889AXeMqtYCzznpzC+W6hA7X9siu0Lnfl+6kp0vtiVYyS
         VHYeXjIFyUPIlQBw449/wcm24ojPqUWKCPZfhguLb4SKmhaAN8FetZLnqV7zFgnQeWeb
         2EPo68WapLH7aFza0Wmy8XDGRlyAopilEkdChB23j6Gva5uea9E5psEOYUoowt19+tpo
         TVoeLvZ5eyyIDlJLOb5l7VfDC/kifoZYg7b3mU/M5RVgBKjeYK4aEoAucl7JCShFSnOr
         MdnTkYs3xG8F6qnVryDIBeRXiDyreyFA93lKsCc89w6nlQ5lKH7ZigVam79npODThZX7
         CChg==
X-Forwarded-Encrypted: i=1; AJvYcCX8KG8tW7AcOCyarvcwndJWdKYWkvn7mTmoon+3UsWdxR3nVb+N6Ab9s1BQsmz5yBHY146Ynw/4GFtbHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjG/WfDIju7bQJhOjQcBvRdap7cAayhFBXEB73hg5ShqDwzwtl
	mydkKGaEzFtNyo4ulBk5oEf8CjhLfpsqNPNgTktdCKYQ4TDJBq1e/DODNWvF2Openg==
X-Gm-Gg: ASbGncs+fmtREx+qcIUnwgg8LPvXfF/FOzWFHwNyeH84hrxxBIz8HUcRC1FGIGTjIgl
	nzKYuY/MfDgPBGjQF8oSJZ4b+KX8klGmNk/7guVO0SdV7qQ0izi3Q2cpDDMwfBeowz/CHvNE/i2
	eb33f2MoyFOKG53+MaP0spXR0vGkniGbnrBTk4Q4RGnyFoAQ0wHbBrZY/CwETuIrjtBWRjHmJDR
	g56W903NkJ/zv+haU9eJDGgv/TUbnXcBUqtMvwk1hu3VLQiSh0xDYEUnuqQ+uDZgwscZrVAMy9+
	1fdleViD1H6eqVcabbduc3OsqcWvQEuSM/yxGEiyz945c4NvO2t6Qer78rIgXEaiaLvXEncCMoC
	dMhOm
X-Google-Smtp-Source: AGHT+IGD8SOS4o5xDhrfWM54iSlJEPR1fjzyAoug43lUG4UEBLvt1iAqZCg4HuIsK4C60TSEQU1JaQ==
X-Received: by 2002:a17:90b:5847:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-313f1c7c54amr19445589a91.2.1750148409049;
        Tue, 17 Jun 2025 01:20:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 0/6] arm64: mediatek: mt8186-corsola: Consolidate and add new devices
Date: Tue, 17 Jun 2025 16:19:57 +0800
Message-ID: <20250617082004.1653492-1-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v3 of my "component probe for Corsola devices" series.

Changes since v2:
- Rebased onto next-20250616
- Collected reviewed-by tags
- Dropped driver changes that are already in v6.16-rc1

Changes since v1:
- Reworded commit message for Elan I2C-HID binding change
- Dropped I2C address constraint from Elan I2C-HID binding completely
- Dropped enum from new compatible string entry in Elan I2C-HID binding
- Picked up Rob's ack on two binding changes
- Rebased onto next-20250417, resolving conflicts with "spherion
  component prober" changes
- Link to v1:
  https://lore.kernel.org/all/20250312104344.3084425-1-wenst@chromium.org/

Here's a follow up series of the I2C component probers for Chromebooks.
This series enables the component prober for the Corsola series of
devices, combines the two existing Voltorb SKUs, and adds a new
device, codename Squirtle.

Patch 1 adds a new entry for the Squirtle device to the bindings.

Patch 2 fixes up the existing device trees for the component prober to
be active.

Patch 3 merges the device trees for the Voltorb device.

Patch 4 adds a device tree file for the Squirtle device, with I2C
components ready to be probed by the prober.

Patch 5 enables the prober to probe trackpads on some devices in the
Corsola family.

Patch 6 enables the prober to probe touchscreens on Squirtle.


Everything has been reviewed. Dmitry, please give an Ack so we can merge
everything through the soc tree.


Thanks
ChenYu

Chen-Yu Tsai (6):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
  dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
  dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
  arm64: dts: mediatek: mt8186-steelix: Mark second source components
    for probing
  arm64: dts: mediatek: mt8186: Merge Voltorb device trees
  arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     |   7 +-
 .../bindings/input/elan,ekth6915.yaml         |  12 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
 .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
 .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
 ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
 10 files changed, 138 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

-- 
2.50.0.rc2.692.g299adb8693-goog


