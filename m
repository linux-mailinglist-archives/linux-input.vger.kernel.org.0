Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28D02CF9B9
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 06:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgLEFew (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 00:34:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgLEFev (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 00:34:51 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36072C0613D1;
        Fri,  4 Dec 2020 21:34:11 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id b4so3027823lfo.6;
        Fri, 04 Dec 2020 21:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yCU3SOeU9zl2SpHdAZLen/M5fwqT/Vu4q8FtTqROekE=;
        b=i/YmjZFwpHP4RPHfHa8QHNlcL88SaGOoHajjZJRI1wNISakosonxxjgzP4+V5GdnZF
         iU0mlhEtC7Dpi/k9ZyG/KeXSSR/EOR9JUhLBM/A01TuFX/ghZ9thzHuw1KXjOpvggqx8
         KklD36y9nZA26FdD3daLz3PGb57WX50IdYjrG9dE8l4US1ZG0z0zA8JYuIE2HlQS4b6o
         A4rF+1W97NYX+UsBMZ3cYcXLMpYt/fzBkshxTIwDQLZKn13yFQQBrKVTCjCo3lkrcGKu
         lnhyXq7XMOA4GL0j9+K1kIUWLEMV3OJnS2E+mDIBx8MyjG2HFE/kPj8rwEsxrE3tKTT2
         I70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yCU3SOeU9zl2SpHdAZLen/M5fwqT/Vu4q8FtTqROekE=;
        b=niVKNLdJDcE8PqmszRRDm2/mO5Tex/7Vdq3L6cG45eEqsMDBC1Ltnql1lDfyCrOJ6R
         1uL4uQRrsYmyVXwzW13AAC+tUm/jrYFV6X1pyUrv3ezqWnbGRseOZJzpnJpS/282aUDy
         sRwdOUOzhiqM+DyAPpx9DxgzbgMyIblNa/Z0d7TMuErBVyjGBcuDX42CizS2zcUo04EP
         tKEDU2gUQgEWW6FedzEriFDpfQiep4wac7K4aDAHHHQQ4YY3oTfxa/BCyw3lfbCKxNWT
         2oFdSJ9lJOWlylYL0zCO3dvANVAjNlOGYpN0TLgeX9I3tjiWNBR58QKczysbnt2avZsc
         lUEg==
X-Gm-Message-State: AOAM533O0HlsoVbz40XcCdCYMH0sD7VquJv2aBD9X0HinRFAMK/EvbB9
        x13K5py24VNPJ1LLAvifpRGEycC9OOY=
X-Google-Smtp-Source: ABdhPJyRaWFPkhqshOs/XY2SinuybxtX/EaVrF7L3jIURRRtL1am1yhtDDRH8XXU01K1Qs2mmvKvNQ==
X-Received: by 2002:a19:5f1d:: with SMTP id t29mr4946607lfb.85.1607146449649;
        Fri, 04 Dec 2020 21:34:09 -0800 (PST)
Received: from localhost.localdomain (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.gmail.com with ESMTPSA id d25sm2289861lja.40.2020.12.04.21.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 21:34:08 -0800 (PST)
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
Subject: [PATCH v1 0/3] Support wakeup methods of Atmel maXTouch controllers
Date:   Sat,  5 Dec 2020 08:33:25 +0300
Message-Id: <20201205053328.9535-1-digetx@gmail.com>
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

