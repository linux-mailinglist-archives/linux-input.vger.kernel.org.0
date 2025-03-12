Return-Path: <linux-input+bounces-10731-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B714EA5DAB0
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 11:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 361113B32BC
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 10:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13D723ED60;
	Wed, 12 Mar 2025 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="irDXNeaj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1768623E33C
	for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776234; cv=none; b=mKsV8Drq0kqrvEgDbwcthcrCvILCO8J11XKMjyr8xUsS11aOmDHBe2+CVT0Ss99ZYEFCFbPWF8ZvZe4ufpJ6iVXyCr2U7FJYpgOmVo/986WRAw0nRXV4dsQswYONW2HCULHJiTGsy0x2CD4mRYjjtmhU6XQGb2LeL0FioFCkokY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776234; c=relaxed/simple;
	bh=E5HHwUQ5W46oZ14AYATkIXSSrCcrAZBPe8OWfY2dZGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vekd/ncTJbKNeBPaMnyCp+5HsqtrSdAQADDvGqGx90vgBQ+dnVycsTqlU4AnQvDf5xB6Zl4Q3oMqYAwxKvcKVSfbPIGB0u/srXS6W+PDUdrP+qVIIT4at2NKGt9PGndaX+KwxEkqtyTY6GVzGPiXld5Rz9B3lsYf1FO+vKI8aPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=irDXNeaj; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3012885752dso224049a91.2
        for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 03:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776232; x=1742381032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L51FLDBP/NVINxb14cO3l0go6Z1l639IzpDfowui3bI=;
        b=irDXNeaj4pbye9y+Q5j3WEXXsu/kghUwhTRGPCv64kQiyV9nrSP1/0m6R/IXzRAsjI
         26wixjVhXtkXgNTCh5HMhb/bTx0Sc1NbcTrbeKWvdnmrcNbF9tIgl08yZD2ZBbWgT7+Q
         M9Gk+QHAsdSodSLAZY0GSKgDq2QglHsu4I4YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776232; x=1742381032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L51FLDBP/NVINxb14cO3l0go6Z1l639IzpDfowui3bI=;
        b=BVWOMnrZXGQh7fxuvimWbPom3yuDKmGrV7DXCWYcXzhFxxOGML4O8K9W1q/Ojfpg5a
         +FEgmO8Ww0uqJK99whUPN1UI4Y33sUeU5NfqfagYo8NCevVu3/b/jaGFlPFVRR/u31iy
         DbnvAw/mLI4RlzxibGR/U3xNBPehBSnT1IfiBWEo6/sDVm5a7FLTsII8tCWMpcB9XDtq
         MjvXfjrVWSp4OPVlz+md84Kf/xxeiaF5+663T3As0HNDfFDvegS1xPPpO0rfVEO33+uP
         GBmdRkYswvAEPdSyjqXQmDruDTDKTfTIjWFsLwwNZkEPkBhetoQu4wtxG5Fz4W2Ef2tn
         WPLg==
X-Forwarded-Encrypted: i=1; AJvYcCXtpPRCuxF9DYSfl6MaqQPfmhUL4lvwOpDKoPn9aOVAQdVuf+kvYVv2iVbIgSczsywaa538JNyf3V7M8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YywA22ouSMTH3IiCvRmH9JCheeFbV35kXQCuywp2fsBqGMu4MFR
	mJc4F/kvKYAhjU7X7FwJPKUpcNTKFKc7D5mFSOJmkHyodQJyTun63KSxOEms+Meyz+xHq/hrgrg
	=
X-Gm-Gg: ASbGncv8zLaC+MAwSct5eqA9u9RCept5fiDmwJEs3GZhYiVsEeHMVuY+ZeyBgDzi0vC
	lSBllEHtcSPXFjXh8mc4JpoxjiLnZ30DxtWiEmIP3PnB2LLDxlFjFlzjXmoqGhMVklKIfHP7jUn
	Rv4K8rPVOkkWHoTKnhZZTMwgITHOz+mK6JszSHx/yRXKULqC3uoVDPCbjiWnSsH8vxJ4/5NcMiF
	GTGzQZA/I2nrnVzS6Qbk9hHVIptAPohBErrZ0o7zAl70t3XUWF31QET1kCXaJm3x2ycRiiKIsqs
	2JqVHENhmRJXKl7L1WGiL2GYIWbWZtmqn2R8ORnh+Hn9jsEYsHN/un8KSv/gxTM=
X-Google-Smtp-Source: AGHT+IFwYKsuYFk05Yb2ZLG7oOnOSu3sTQBXUECA3daxKB2RdxKe0gDbN37+1iCGZOUpVOTrPKRIXQ==
X-Received: by 2002:a17:90b:4f87:b0:2fe:b774:3ec8 with SMTP id 98e67ed59e1d1-2ff7cf13a91mr25942847a91.23.1741776232319;
        Wed, 12 Mar 2025 03:43:52 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:43:51 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/8] arm64: mediatek: mt8186-corsola: Consolidate and add new devices
Date: Wed, 12 Mar 2025 18:43:34 +0800
Message-ID: <20250312104344.3084425-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

Here's a follow up series of the I2C component probers for Chromebooks.
This series enables the component prober for the Corsola series of
devices, combines the two existing Voltorb SKUs, and adds a new
device, codename Squirtle.

Patch 1 adds a new HID-over-I2C touchscreen from Elan.

Patch 2 merges the Voltorb entries in the device tree bindings into one.

Patch 3 adds a new entry for the Squirtle device to the bindings.

Patch 4 fixes up the existing device trees for the component prober to
be active.

Patch 5 merges the device trees for the Voltorb device.

Patch 6 adds a device tree file for the Squirtle device, with I2C
components ready to be probed by the prober.

Patch 7 enables the prober to probe trackpads on some devices in the
Corsola family.

Patch 8 enables the prober to probe touchscreens on Squirtle.

Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (8):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
  dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
  dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
  arm64: dts: mediatek: mt8186-steelix: Mark second source components
    for probing
  arm64: dts: mediatek: mt8186: Merge Voltorb device trees
  arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
  platform/chrome: of_hw_prober: Support trackpad probing on Corsola
    family
  platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle

 .../devicetree/bindings/arm/mediatek.yaml     |   7 +-
 .../bindings/input/elan,ekth6915.yaml         |  29 ++++-
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
 .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
 .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
 ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
 .../platform/chrome/chromeos_of_hw_prober.c   |  29 +++++
 11 files changed, 185 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


