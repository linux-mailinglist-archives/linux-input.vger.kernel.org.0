Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8017D2D074F
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 22:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgLFVYI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Dec 2020 16:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgLFVYI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Dec 2020 16:24:08 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D14CC0613D1;
        Sun,  6 Dec 2020 13:23:27 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id x22so9841435wmc.5;
        Sun, 06 Dec 2020 13:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJVu7lAb4oJTbHUAssptypIC43UfqX9yrxi8AHaGOCM=;
        b=HMuPAplgWkRlJgph/+o8oi/eKeDH4Z6Ixd81DYwKJ+9AJ0ViOtCzgVtwGxOb0vSofq
         alJ1OecukrmW6zfrFR10FnunFQkuR2WoI1zJwNCpkPvoB3JB1lwXcyb65ZzyR0gJ74B6
         wMSDkdJIf4djmRPaPoo/4jLgfm+wdY/pmBvvalKym42eCpnYjE8s5zktaYTVplcwwIOl
         SeiKW3OHmefAxUfCYq4vUF5IADeIpZuXMRALDGTBu/PNTsk4xgL/hyR+lF2McVh+aP+c
         xYrLo8pP3qX6Z2HZUaUs9XbBiWNee/o3UK7v8o7ZuqXTvFTMHKoZT5VkuAZFTMBNzEBg
         yG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJVu7lAb4oJTbHUAssptypIC43UfqX9yrxi8AHaGOCM=;
        b=UfC7UUBMnypGxBOjQkQ3jE/LBN47qd9+sfHhIfP68smBrgh0vvK14rTwUpvc32l5pC
         03/jFrzzXtNsngfXFY/kL1llw48C/m5v5wloiigiBwG6sCzC5tNLb9qW9ZzFZRE+jzL1
         5ANUB2Noz6qSopMPUNhoTHXr8x+1bgabJcO0Dl/d4Alvs2/AyXVA3Kda8kcC54Jo171L
         IctwaPWBUtkwuUQKWfeUlmAgDh1b2k2dbkegxnFFg4LImWmrxOKv52W+sHtkmQ7ZI2zW
         qFcaLLjzWJjEQyxc6fgz1X8AwOu03Jk5Z+soifiBxlIwwWSq0PAUk4P5cMTerPC/eaIh
         RXiA==
X-Gm-Message-State: AOAM530TNLtMB/CWEassWSESfzXkUB46mCkLXvRw6NNvsmSukU/Xfkhi
        JPiZZ94Z6wzQtqVn+EjLKoE=
X-Google-Smtp-Source: ABdhPJz9vITV6sLBx8u3DNyQCp+5oUqnN221wCYSDh+RzjFHWard0ZXYMYEN7oVrOGTBDwdbMal9Sw==
X-Received: by 2002:a1c:68d6:: with SMTP id d205mr15246727wmc.154.1607289806341;
        Sun, 06 Dec 2020 13:23:26 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.gmail.com with ESMTPSA id l24sm12737540wrb.28.2020.12.06.13.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 13:23:25 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Support wakeup methods of Atmel maXTouch controllers
Date:   Mon,  7 Dec 2020 00:22:14 +0300
Message-Id: <20201206212217.6857-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Atmel maXTouch controllers, like mXT1386 and mXT3432S1 for example,
have a WAKE line that needs to be asserted in order to wake controller
from a deep sleep, otherwise it will be unusable. This series implements
support for the wakeup methods in accordance to the mXT1386 datasheet [1],
see page 29 (chapter "5.8 WAKE Line").

The mXT1386 is a widely used controller found on many older Android tablet
devices. Touchscreen on Acer A500 tablet now works properly after this
series.

This patchset is a continuation of the work originally started by
Jiada Wang [2].

[1] https://ww1.microchip.com/downloads/en/DeviceDoc/mXT1386_1vx_Datasheet_LX.pdf
[2] https://patchwork.kernel.org/project/linux-input/list/?series=357875

Changelog:

v3: - Added "default: 0" to the atmel,wakeup-method property in the binding.

    - Added r-b from Linus Walleij to the binding patch.

    - The wake-GPIO is now toggled on touchscreen's start/stop in order to
      allow it to sleep during suspend. Suggested by Linus Walleij.

v2: - Fixed copy-paste bug in the code.

Dmitry Osipenko (3):
  dt-bindings: input: atmel_mxt_ts: Document atmel,wakeup-method and
    wake-GPIO
  Input: atmel_mxt_ts - support wakeup methods
  ARM: tegra: acer-a500: Add atmel,wakeup-method property

 .../bindings/input/atmel,maxtouch.yaml        | 29 +++++++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |  3 +
 drivers/input/touchscreen/atmel_mxt_ts.c      | 78 +++++++++++++++++++
 include/dt-bindings/input/atmel-maxtouch.h    | 10 +++
 4 files changed, 120 insertions(+)
 create mode 100644 include/dt-bindings/input/atmel-maxtouch.h

-- 
2.29.2

