Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1877F32A58F
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444942AbhCBMuz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:50:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379981AbhCBKXf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 05:23:35 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982E8C061756;
        Tue,  2 Mar 2021 02:22:05 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id q23so23232756lji.8;
        Tue, 02 Mar 2021 02:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u3zwkrw3cHSWJJ7SrOgT7FSkDK7Nb1eb+/tiKZcAfbQ=;
        b=RqIEdpOAAgcl80AL1PC1mX62xisSdEGrhhGlELSsaWIr0WWFNnZOBAoqJiFg1oLyap
         A5VitR0aUhCNyELLw1XiLLc5pJFBjMsiC5MPgcgjF775VnExER/WnY8G6DY5oOdDYFFp
         QyYmmGNl79AtXUnEtxPkBdMzpuGjs4RBO5/4sdUCjZUeEeqeZvLz6H68duzSFOe+vOOF
         dXKwphZkzvnBeIaUb5Bs3QViDN2a08HJFr5pPqgpy/Pn7KqIwPjAA7mVXA1Zg0WUtC08
         N7q2kOdGaymYyuEVyb+fDisG/LFEraVNM51bFCR7eIb7bV8oUuVKvXa4JNZaNBQ/t4GR
         yC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u3zwkrw3cHSWJJ7SrOgT7FSkDK7Nb1eb+/tiKZcAfbQ=;
        b=gKEj6xNdYExREt+Ve9uW/M64ZX5ArNHD0Ospl638Qlcgm+RMkucntiorMTRn5Oq5db
         9iBwcFaKTe9CpVc/vyoyE58SG4VGwtNtVO9G1MHzXs3nLRory3Ok+QM9hnzr+2Cp4vgw
         yszTVF+IiqHiz77xk6Gjie9ckTH/lqANDSxADIdms7pw/ZMIJMIREXP4xsUULMORxD4p
         cyFwycccBbdb6vt2bSYNTIQ+EJ04a7ZJ1wywr74plKQxo7Er7ppIEle7G8OAvj8Wiu/N
         fe2av4vb8UbVVGwz3yo+0/Xn9ndoABD2Epmc8MxAD63mx/zZUdzb/EaujN99737nIYad
         WbWg==
X-Gm-Message-State: AOAM532U2N3dZ0agL7M4G2RxSZSpCXoWoi4roO0RtFRFgQeeGF8To6Bw
        OaUf8ZZG2bO8yEV5CTmL/5s=
X-Google-Smtp-Source: ABdhPJw4UiNM8EWQ1z41AMe9ym6LDkfFECl8t+0LLWs5xKYnNVNsNaETkXhBdkjVic8Qt2cVQS/CKg==
X-Received: by 2002:a2e:a481:: with SMTP id h1mr2473275lji.143.1614680524152;
        Tue, 02 Mar 2021 02:22:04 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id n2sm2586369lfu.274.2021.03.02.02.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 02:22:03 -0800 (PST)
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
Subject: [PATCH v6 0/3] Support wakeup methods of Atmel maXTouch controllers
Date:   Tue,  2 Mar 2021 13:21:55 +0300
Message-Id: <20210302102158.10533-1-digetx@gmail.com>
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

v6: - Added r-b from Rob Herring to the DT-binding patch that he gave
      to v4.

v5: - No code changes. Improved commit message of the "acer-a500: Add
      atmel,wakeup-method property" patch and added r-b from Linus Walleij
      to "Input: atmel_mxt_ts - support wakeup methods" patch that he gave
      to v4.

v4: - Improved commit message of the DT binding patch. No code changes.

v3: - Added "default: 0" to the atmel,wakeup-method property in the binding.

    - Added r-b from Linus Walleij to the binding patch.

    - The wake-GPIO is now toggled on touchscreen's start/stop in order to
      allow it to sleep during suspend. Suggested by Linus Walleij.

v2: - Fixed copy-paste bug in the code.

Dmitry Osipenko (3):
  dt-bindings: input: atmel_mxt_ts: Document atmel,wakeup-method and
    WAKE line GPIO
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

