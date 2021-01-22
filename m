Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4BA3300F7B
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 22:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730965AbhAVV6o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 16:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730913AbhAVUIb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 15:08:31 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9159C06174A;
        Fri, 22 Jan 2021 12:07:50 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id a8so9227602lfi.8;
        Fri, 22 Jan 2021 12:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hh/SElQhpazfhLNsM2pfo+ND9UxMdLTk8ICaiFOA8oo=;
        b=kw+Nn1ocjUoHyDWrvc943QBL0+WO2rixQyuoDLdIZqfZChRixaK9EavU/IXYeE3mtx
         67xL8qtHAal7goK8OxGbJ8NDQZFQwhnQm4ucUTuQrK3seC3ysPD1kCdUGompYE1lN41I
         S8NZh5k/YgpSDdBPx/ZA5tYpPpl+4zuEW0DIkZ51OR8tn2ZvF7AmMfpRZo0wQEhr7e8M
         mhzEIh8cqbWcBjUgVlakfwKk7qg5ihEzCh5e+MTd1yyQVzi/olYQJQ7F7eDsWm447DAF
         h0x0ZyFCqfdJV6okuJLAgmjBLQz6VunAf7iHicjIkM5sNVYOrOTe/fZqVjXplXxAN6yf
         7N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hh/SElQhpazfhLNsM2pfo+ND9UxMdLTk8ICaiFOA8oo=;
        b=OLcynLez1/NalByLT9i3aSkBAiEYNAOX0kl8Pv/SAv4GNFUWRvJHjmoYwN7ecfT4KI
         u/t59heHyYwjAqgt0Eg2WO8oQzhC3b1CcflevRx0wq8kln/ZRputm854TUqz0n+L76r9
         GSAH9MO4o3WXSGJVs5t4zm8nFP9Ob8ydN7FdA8dz5QJ+HBDxiBlxqumkXU5/P7XZthKB
         2afdNOk0l97Bw6AmLYiJ98nzyVQv8CfrrzjmmqKEY+R15czMLfBYQ+0RGMJswWdEZy9J
         f0u1qBhgrPsnqe0Qxc80ppWhPDpVsQJKhWMtwi8qbZ/dr2jf7oYuevz/zHTGWt5//5sp
         QZfg==
X-Gm-Message-State: AOAM530NkVDVH+Pfn9c2uLcvTtSE5AqBLZRfMRDp3Qp+3coAg1fPCwGX
        10QgW519YSconUEL0RnbaO9aDCtfg2A=
X-Google-Smtp-Source: ABdhPJxsjwDjQKJCIYQKEu3vze9yfAtPHtRA28cKiQyCwFgRZe0Gd3Ux9hP3tBGwzJb36EHsIqUesA==
X-Received: by 2002:a05:6512:312b:: with SMTP id p11mr131881lfd.446.1611346069420;
        Fri, 22 Jan 2021 12:07:49 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u6sm994589lfk.127.2021.01.22.12.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:07:48 -0800 (PST)
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
Subject: [PATCH v4 0/3] Support wakeup methods of Atmel maXTouch controllers
Date:   Fri, 22 Jan 2021 23:06:56 +0300
Message-Id: <20210122200659.7404-1-digetx@gmail.com>
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

