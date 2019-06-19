Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 339A04BB4B
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 16:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbfFSOVA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 10:21:00 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39029 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbfFSOUU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 10:20:20 -0400
Received: by mail-wm1-f67.google.com with SMTP id z23so2051824wma.4
        for <linux-input@vger.kernel.org>; Wed, 19 Jun 2019 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xe8Z7G8xOvRe6JhL6dXMu61WRA0y1QcBsLv7BXFLXu8=;
        b=llwcE/vozsWWrzWhJC9CO+SJiPMgZWnVaC4ILiC18AVKVObOtbHqSSD55EKh2GLEEr
         yW9kTMVwvXP0MW/YcvnEzOedwNkcQ2D6Cxmo+AS0urgcS1z0zlUcceMrzXx2kxIcjkSe
         rg0kUNgaJK0dkzvGoo3D8exmVpbm6fWRJy4NnAcO/IwjxmoZ1uk2SjFKEcmvTM1uZ9xv
         yWPWThjFu9RrEyhJQztu3gNLR0VQhk5HqJBiUqcFL8ffaWx1BlPizsHiRlsW2nPl5iyA
         QKRJyQJuHOE0l/qMKvWfFtsaYJ0knEMonny7dmoUcVIIV9Xu6mn+9Sc+psaIdyOuFPsd
         bCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xe8Z7G8xOvRe6JhL6dXMu61WRA0y1QcBsLv7BXFLXu8=;
        b=PoKxzYAguD0wxAdDvSn8saGeATe6WXWTdTpRNw6UXAwQx6HV5SD+rz7Eh8r6XN48ir
         mg8y7cpJJpoxNVdsVomtwo2OPi+WUMNsckibu+khqmph8MIdQ5TCOvJ5+VXTI2INRpJW
         Sx8IVidb8hcjQqcUNDO7zZeXo+To9lTBbPwzCbT63yko+aI/+0aDAt4LxB3EiM8ZMDbp
         1IAVNrD4SDEmbIzDU3fpdqkXJvX1oe60F16uQTwc7CY9vzzIU9SqTYflDA2AgzJq74oM
         LBnvpCV2OHV8KiFcjP6p7orqORlEWD1696l4hIzH25GRMQYGOG+5SSiOxLzcCM2BObU3
         Jlsw==
X-Gm-Message-State: APjAAAWDtghNRjHcWPJmDaBgZ7Z97SeJ2jJXeU2AZLURZ060zMfZ7tta
        BB0TsIlgbui1xuMmjpP/SAkpVA==
X-Google-Smtp-Source: APXvYqzUYdb3XhMJ78/mGb9h4pNZliClNr3lXrzr0m0AXlFqRlXutMI0MOSuI04PSQl09GOwpUpkgQ==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr8111575wmc.22.1560954017792;
        Wed, 19 Jun 2019 07:20:17 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id o20sm24209979wrh.8.2019.06.19.07.20.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 07:20:17 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v4 0/7] mt6392: Add support for MediaTek MT6392 PMIC
Date:   Wed, 19 Jun 2019 16:20:06 +0200
Message-Id: <20190619142013.20913-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series aims at bringing support for the MediaTek MT6392 PMIC. This
PMIC is used on the MT8516 Pumpkin board.

This patch series adds support for the following features:
 * PMIC keys
 * regulator
 * RTC

Fabien Parent (7):
  dt-bindings: regulator: add support for MT6392
  dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
  dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
  mfd: mt6397: Add support for MT6392 pmic
  regulator: mt6392: Add support for MT6392 regulator
  input: keyboard: mtk-pmic-keys: add MT6392 support
  arm64: dts: mt6392: Add PMIC mt6392 dtsi

 .../bindings/input/mtk-pmic-keys.txt          |  11 +-
 .../devicetree/bindings/mfd/mt6397.txt        |  12 +-
 .../bindings/regulator/mt6392-regulator.txt   | 220 ++++++++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 208 ++++++++
 drivers/input/keyboard/mtk-pmic-keys.c        |  14 +
 drivers/mfd/mt6397-core.c                     |  47 ++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 490 ++++++++++++++++++
 include/linux/mfd/mt6392/core.h               |  42 ++
 include/linux/mfd/mt6392/registers.h          | 487 +++++++++++++++++
 include/linux/regulator/mt6392-regulator.h    |  40 ++
 12 files changed, 1575 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6392-regulator.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.20.1

