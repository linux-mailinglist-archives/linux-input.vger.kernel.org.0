Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2120D2CF9E3
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 06:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgLEFst (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 00:48:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728779AbgLEFss (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 00:48:48 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DA2C0613D1;
        Fri,  4 Dec 2020 21:48:01 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id b4so3050491lfo.6;
        Fri, 04 Dec 2020 21:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5++2croPNd/0hpgvNFTve6N+aJVcX7l0nkuMAfD5rIU=;
        b=pj+nZMel3sOc4wy4AFiHY+OPzj0MY/S+/jw+dprE3y+Kw2PvQ765iN31VxOfif2+7N
         oJ3RRT3fBM3Lo9BboclgZT/SVI8suGbIG7aA2xAJkyudwX4q2SU4tIkZBM7fbJ5sVgUy
         s4hUP5SUJ+jVzWio29KPk9ocBwVw/5p1HgjU/ZhET3FIDK5dt1HzWHiuxDDmucI9nEuh
         BHBe+VbJ+w+EB4nGS8K297rjCEnCNHMFIY/ea38W7Sh1R3/30zWxEk6ITz2bTqX2mSCu
         rom3ANjb47exAOKG14hV0DSsHkXnokXkhi+Nzeu7gcwcGoLpmNDbcp3toyUXXPT059sW
         sWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5++2croPNd/0hpgvNFTve6N+aJVcX7l0nkuMAfD5rIU=;
        b=cur8BVI4mXK3poWD6lZKXqLbcGQzgG7Rycy7JULrF70cVlOqrYj+aM07tTnFm3XFvM
         SsYi3KEwlwDvFoFiVvNgec38E4HyaXJ3khfqt5Qq7zT9fTgXRfAI4Vt/Zg4dxq6SZZcE
         mxYwZrwW+twYGsgxR0Vj5tOiPb8FZE26HbvWmcVQ4hS1aWpiVaTPAJBl4ZSboqJyd/uc
         7vWN5VkFv+SvV5gHA7oyMbvIu6hGY+hdAjcAS2MQlhvoZ/kzFMy3bjbLS9jqqxn/fieQ
         E0HhX5VgqIukm1AMoAxMsnFtzrEc3/JIh41B9oeCsuKXvg34bOONfQIbRNkB/N61y64e
         aCEw==
X-Gm-Message-State: AOAM530VvxHwRre9NRVcs+JLS2AVQIvRqnYOY4MgockZbF90v23LlPwT
        pTWDcUGPfKPMLHvP9fq1/8E=
X-Google-Smtp-Source: ABdhPJyP3ILU+Ha+0vcWH3qObB1wxbd7+pGVAk6JPrQMA6Bf1V7zFOknz/ZnJb9hM42i/fi7LqTZYA==
X-Received: by 2002:ac2:4a79:: with SMTP id q25mr4408504lfp.495.1607147280227;
        Fri, 04 Dec 2020 21:48:00 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.gmail.com with ESMTPSA id w28sm2231490ljd.48.2020.12.04.21.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 21:47:59 -0800 (PST)
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
Subject: [PATCH v2 0/3] Support wakeup methods of Atmel maXTouch controllers
Date:   Sat,  5 Dec 2020 08:47:46 +0300
Message-Id: <20201205054749.26487-1-digetx@gmail.com>
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

v2: - Fixed copy-paste bug in the code.

Dmitry Osipenko (3):
  dt-bindings: input: atmel_mxt_ts: Document atmel,wakeup-method and
    wake-GPIO
  Input: atmel_mxt_ts - support wakeup methods
  ARM: tegra: acer-a500: Add atmel,wakeup-method property

 .../bindings/input/atmel,maxtouch.yaml        | 26 +++++++++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |  3 +
 drivers/input/touchscreen/atmel_mxt_ts.c      | 55 +++++++++++++++++++
 include/dt-bindings/input/atmel-maxtouch.h    | 10 ++++
 4 files changed, 94 insertions(+)
 create mode 100644 include/dt-bindings/input/atmel-maxtouch.h

-- 
2.29.2

