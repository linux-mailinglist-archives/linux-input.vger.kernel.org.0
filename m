Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14F032A589
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442638AbhCBMun (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382786AbhCBKQp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 05:16:45 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D8DC061756;
        Tue,  2 Mar 2021 02:16:04 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id z11so30362246lfb.9;
        Tue, 02 Mar 2021 02:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PAuXf894I6dZt2fftnLEpxbZ38F5TI7pME3T3qqIkZI=;
        b=BeiNOLHXfUd6x5xIH3DAqIB46kUFYiitWpt4cNZNlo1GZmWsGL/2yYn1JfYePe7DoP
         89k+KuS66b0E5jDpnVX9hhx6pm4A/NqOpzGjUVC36RZsgvopFwvaa+jftP9zsyzCH3pE
         dwhJ8y8UiT5L/dbwkyDoNQMZUEAZHyn0zhYhjujR/Eq8GnFc/tZNhkXyGnHRjGw0hWCq
         0kZjkTk/UTjJNunNCE4osRlm9R6BZsjOIc3nCgjEI0Jj6Phr4vL1gaZJaNUBJuPpEN8E
         N82/HiWkhHxczU83tLGEqSI97gFAKIWd1fhnKqP5/D6H9AdMiWyEPD3yYjjgnTCbVli9
         eByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PAuXf894I6dZt2fftnLEpxbZ38F5TI7pME3T3qqIkZI=;
        b=XbgquZ2g59wVJNrBntjPjgYTuxaOVHLV1OAqctnIouqqjoTBJvef5gvOwURN6fNnhg
         HYLC+gmKRWbKkhbC0V7Gmg9cl5mKchBeL/SnQh7+tlPNq9xiBCKmK0Op5DhWAF4ux100
         F3PPq8jdokT1ngTH71ZTdC8GjlIM7FWDZaLvsaQ3IuHtkyDBFYNmgc11+xRHAowW0hIu
         QIgenqqOeiMPsf/q+/VZn6AA7EXCujBsrqgfsyDrOY4yFHsVEIk02+5LU785yZQhwuz0
         pVtOK9MbaFhW0ZNALj7LQ5AdoLieKfWtWMnl7ZSkeKOCEKi4VwsRewAtnDL8vIgGnAmK
         /wqA==
X-Gm-Message-State: AOAM530e+mZW9XSsBV6VhWAFdqnNgaDdoLw48RiJBii2m/P+JzmhXSvQ
        uMfU60aLyN43L2SHXJF32Dg=
X-Google-Smtp-Source: ABdhPJwYoPjpQg2/CPbZ46GC5VGUq1ff/xol41ePlNNTSTvg7Zai3jSN9j2oNzNuoeuND998v4BiWQ==
X-Received: by 2002:a05:6512:31cc:: with SMTP id j12mr11449977lfe.408.1614680162897;
        Tue, 02 Mar 2021 02:16:02 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id w4sm307861lfl.236.2021.03.02.02.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 02:16:02 -0800 (PST)
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
Subject: [PATCH v5 0/3] Support wakeup methods of Atmel maXTouch controllers
Date:   Tue,  2 Mar 2021 13:15:53 +0300
Message-Id: <20210302101556.7150-1-digetx@gmail.com>
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

