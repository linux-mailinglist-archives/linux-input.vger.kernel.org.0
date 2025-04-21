Return-Path: <linux-input+bounces-11866-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C351A94F35
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 12:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AADFD17064F
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 10:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D80213E71;
	Mon, 21 Apr 2025 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wh2msPt7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4396020C016
	for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230389; cv=none; b=kRqInBG0FnoePSPcsExTMz8Q9xgkruW2dm/ehvL9eR/4jr9V+7jvwlcnG71czTd0oTOLHMPhQE53ZO3hdUHyhEPHl5Rx8blSysalHvdK5fqYndNlznTdfaao4gySBvdWx+HYnwPQA/hoR2MPPP+bkydWfz9DuhGS9jrWPzpjs6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230389; c=relaxed/simple;
	bh=ixRYONgnygzUENQX+ohridJXTFmoDUomB21ryQ2dw9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2k2dOgKNCvxXN6jPLkue18+65BRzfLnbuTJjJlmpmKgKoGf7XkB/n98bdm6zv+Tdg3H7fBhuSQLV3Lu1LHunDA7T3I0K+hgkSon+yioW/9NrmBckbwSx1OhdyvfQsrB2tWv4tKfnkrNQGd8T0pJrfTr8PuAqNI7WXFqpBrSqSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wh2msPt7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223fd89d036so46037695ad.1
        for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230385; x=1745835185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AOgrKhqWzlPfaierQD2uw1OzuGW6898QT6wOBkGCJE=;
        b=Wh2msPt7jsueLcvAy5+60KWTolGX9G3PuktwgH0Gt2s0FUohgMLsjOozc45LSXogOW
         JRVGDUpgz0ynQupyUjie7Bkf5SWLxP8vlXYL//H1jViNAq5DreLSlSgkxAqbdc5AiWut
         MvW9fxk/b5J1Cfu/ghgeZLq3wJ0PxrXWh30nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230385; x=1745835185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AOgrKhqWzlPfaierQD2uw1OzuGW6898QT6wOBkGCJE=;
        b=opZOQOjGAIMUb5LYYa4eOMLt3LN5ny6QOaN2eVqWwjzDwzLnXHe975WXjB8FvIHlc+
         4mw3RU4XuwO8yQ7T+Sx0/QxW9psx2iNCCaRAiUqzj6wTEpRFDdFyPuCvt9+voP5kNyfs
         9E1PoVRO6hxRWIC13ZMB5a6oefkpuvL4/vuY25OG8bgF/h0ru+LLG8aQondwAGBUe09q
         aMIJxca6txe5KG/a5tSXpbBYhTotKk618mdVZWbO0Cs9wwtgVaMBqiV0SE5q51Cmp+NF
         nopTcmXM9ynszkaQ0nog4SoFzSkA0z24BaV9hQkUQ1NwUI2LpBJJVLTckyAXvVVSgDX4
         wVcw==
X-Forwarded-Encrypted: i=1; AJvYcCV4Dx2gtns+V1uYseU3KKWwp/bba2vI/eAH/ur/W36jZYwraZpq4YcmujP0yZX+RccZZdoSyDk4bhiSyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzoAUpTge6DcYzRKo/KRIpkWZjtXYFqWPKdHbt48mDhbARtiRt
	OBm94rBYOMAmpE7Xm56zPmPihlHOQV8tymIpTSaLlbLOFKqlmg4/3zA73/k7rA==
X-Gm-Gg: ASbGnctLZTzIlf5VKBoH5tAfMyA3exZV0ZnFatrn9L3q3TF9e0Oxfwnryuj2Gerf/MO
	zCOSq09E7ZqqoAl+yuAZQElrQdqrDJ7vWys6Hf4ZpxFUXsFaV9ZLZmAwrNwYVZ9wYdfKj8DJ1vU
	hd1CKT8vmn9j3F6u7hGi60yUQ1AqUP8s97Qr6I6ZYLDvMJ5I9q17xoZiwp4oWwERViUNuyPuVPu
	smP1Hqn3gLWwLOuiyO9YdODrmaxyirsf745WjwU+EM3CL8vNDsp+l+NzqB79F1vG/1Ym1eb19mT
	SnDxvObQNjo7dnHOC+YlZOyeFGqw/P6KInb2tthdfGZtagXDwlLD2/fpr9E=
X-Google-Smtp-Source: AGHT+IGnpHCEjIJrIXmHvs6VqUJ4pvMmeTt+m8C/FSrMMx0dcqiEAz4cygU8b09pUtOZGuXYRXJLmQ==
X-Received: by 2002:a17:903:19ed:b0:224:1c95:451e with SMTP id d9443c01a7336-22c53607dffmr160232245ad.33.1745230385598;
        Mon, 21 Apr 2025 03:13:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:05 -0700 (PDT)
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
Subject: [PATCH v2 0/8] arm64: mediatek: mt8186-corsola: Consolidate and add new devices
Date: Mon, 21 Apr 2025 18:12:38 +0800
Message-ID: <20250421101248.426929-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v2 of my "component probe for Corsola devices" series.

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
 .../bindings/input/elan,ekth6915.yaml         |  12 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
 .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
 .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
 ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
 .../platform/chrome/chromeos_of_hw_prober.c   |  29 +++++
 11 files changed, 167 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

-- 
2.49.0.805.g082f7c87e0-goog


