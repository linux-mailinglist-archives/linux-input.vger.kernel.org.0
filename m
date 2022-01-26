Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B99C49CE9B
	for <lists+linux-input@lfdr.de>; Wed, 26 Jan 2022 16:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242919AbiAZPf1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jan 2022 10:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242910AbiAZPfZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jan 2022 10:35:25 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46716C061747
        for <linux-input@vger.kernel.org>; Wed, 26 Jan 2022 07:35:25 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v13so26429217wrv.10
        for <linux-input@vger.kernel.org>; Wed, 26 Jan 2022 07:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3U2VlbaDiL8zCwzswKdJmuhmgZcDC5jFlEtFb0awmuo=;
        b=H63H9mJZx+2wNR4miZeP2BG9jFbtr6BXJRaDXRJB7+UM87PNnkEuDk4JU86/Uuj4nU
         o74Z1FhfadPMea+oscObqeq5MTVxmYqEVr7LaHsT0WU46Z1aN4ZAK7VLijKdpn/rNwTw
         B3zZi6kW/J7SScpS7ZZvEeV43gZZvIN18CxSDu147n+JJfmHEI+kHWAijEFYhz+rBMCH
         7stkchPJ7/1oyNDPCV/DO6HNvgP87Vq4WvLeCA7V+sdluRStNy3PqpjTOLkyygD12tn/
         4wC9Ggh63fA3g/fKGbTNpsyhiZQdduKj5JEpa//INoJmnGun9M6uL6NVUksz3A1otNvo
         w2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3U2VlbaDiL8zCwzswKdJmuhmgZcDC5jFlEtFb0awmuo=;
        b=LX2UQQyCP2yEL15uoXg2jCDCERAly2On6pKQt61wMl9sisx1yl7xqKxE+vuHTs/TpV
         D9cpOFBPixU74tJ9T6BpNTPxMKpJqEAGIJrQm5k7D5tG2A1scvi6tOGRejnS+EvG1OyK
         TK308wGOasdDLlvoTrZ+tLu0Ue5+fIegiLNzwtnzFN6XvyBJa6oUZaRp5a6febvJzSzd
         PJ0e1UMF/U0ANinpawAysp6rDJm40ZJUOKmYFkmMx7MJp4K6Zuj+NuKDZWZhyJ1bWPSP
         1OYVWaQOS3bxXGVxyEV67eTEn94sHUo2fnc77NSd+jTpS4uHsG/LMKTkR1wiGZsz5Qa/
         NRmw==
X-Gm-Message-State: AOAM5335rDKvQrEUXEDnN/GrkDGAdPOHyZlNsn9pO3dymt6nCmwAIbIW
        b6KEsIvm//8K3Nyk2MPeFaWXAA==
X-Google-Smtp-Source: ABdhPJz2hfUkHjqnjSjNIHx9xgMie+71LhrZ6IWHyS38Ps4va/mJ4GSkip4hIiWw/0AIIgt4hddUww==
X-Received: by 2002:a5d:508a:: with SMTP id a10mr6584123wrt.360.1643211323734;
        Wed, 26 Jan 2022 07:35:23 -0800 (PST)
Received: from mkorpershoek-XPS-13-9370.. (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr. [92.154.18.143])
        by smtp.gmail.com with ESMTPSA id n10sm3360958wmr.25.2022.01.26.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 07:35:23 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fengping Yu <fengping.yu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v19 0/3] Add matrix keypad driver support for Mediatek SoCs
Date:   Wed, 26 Jan 2022 16:35:16 +0100
Message-Id: <20220126153519.3637496-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear all,

This is a follow-up on an abandoned series, see [1]

Since Dmitry seemed generally happy with the driver, I applied his rename
recommendations.
I also did a couple of binding fixes which were needed to pass "make dt_binding_check".

Thus, I have made the following:

* All Reviewed-By: tags were kept
* Applied Marco's reviewed by on the bindings (since he approved v10)
* Fengping is still the maintainer since he is the original author of this driver
* The binding license is not changed even if checkpatch recommended it:
  > WARNING: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-Clause)

Please tell me if you would rather have me do things differently.

[1] https://lore.kernel.org/all/20200909072159.14888-1-fengping.yu@mediatek.com/

v18 -> v19:
- bindings: fix maintainer -> maintainers keyword
- bindings: add matrix-keymap.yaml ref and remove included properties
- bindings: fix compatible strings (reported by make dt_binding_check)
- bindings: reorder properties to match the required ones
- bindings: remove un-necessary descriptions
- bindings: fix multiline description for mediatek,debounce-us
- bindings: fix example to pass make dt_binding_check
- bindings: fixed licence to GPL-2.0 only (checkpatch)
- bindings: rename to mediatek,mt6779-keypad.yaml to match driver
- rename driver to mt6779-keypad.c
- prefix function names with mt6779_keypad_
- prefix globals with mt6779_keypad_
- rename CONFIG_KEYBOARD_MTK_KPD to CONFIG_KEYBOARD_MT6779
- rename module name to mt6779-keypad
- update copyright year to 2022

fengping.yu (3):
  dt-bindings: input: Add bindings for Mediatek matrix keypad
  Input: mt6779-keypad - Add MediaTek keypad driver
  arm64: defconfig: Add CONFIG_KEYBOARD_MT6779=m

 .../input/mediatek,mt6779-keypad.yaml         |  80 +++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/keyboard/Kconfig                |  12 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/mt6779-keypad.c        | 218 ++++++++++++++++++
 5 files changed, 312 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
 create mode 100644 drivers/input/keyboard/mt6779-keypad.c


base-commit: 87a0b2fafc09766d8c55461a18345a1cfb10a7fe
-- 
2.32.0

