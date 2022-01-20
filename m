Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACA0494BEC
	for <lists+linux-input@lfdr.de>; Thu, 20 Jan 2022 11:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376354AbiATKku (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jan 2022 05:40:50 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:41688
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376320AbiATKkt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jan 2022 05:40:49 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EE842402A3
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 10:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642675247;
        bh=ICGGHPgMOz29NZPwcai0F42KglfVOVXY27QEZIjk5oU=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nyO0gE6UsbntWrO+7IDCBA7kthn+e1ev1dHlrG4ac2rwsFezBZoAm4XaHKlYWuaXC
         uXwfxcAAckjC4eYAQV3lVff6BWAh4pbRkOkS6BmeXHpTbI59089BcQEmPbdVKDUdVH
         adr90gFqJ8jf3pZJSMvki2viluxEi1QhyoiBi1+PkbHHgnbNg3ln+BDqEuRnJQEQZm
         HtqiIQcInNJg2leSlx58LZQZ85W4v5RptXVZQzdc/irtPRFDqiSwy29mjX9MxbVgOo
         kE/2+W1o6oCmMbL4QspDQxxv9UNGyrfIH2BtwxbEAYzBZiwMD70qMoaJljc4kGWtKf
         x1T/mpZVG6btw==
Received: by mail-ed1-f70.google.com with SMTP id i9-20020a05640242c900b003fe97faab62so5492789edc.9
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 02:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ICGGHPgMOz29NZPwcai0F42KglfVOVXY27QEZIjk5oU=;
        b=0AzTtLWAM1WnVxdYJzS0ZvAYy8tu/476CL+iDKNTwIh1bDL3s0Rsvx0XZ/mmGk18tz
         aq2W7nJQBCHtUQdLe1nWrdAGNzx6ETXJhtePCLCWQrnwWBdr53KH9TUzDyUE/5NLC0ez
         WlbcvEWrVHxxRriHUq+5ch+L6VVE352fTiwrjsFTx03iRhHJTFxJk8L2U0/0w1gKRSry
         A5msFU11PNMiLaSZqRd9gI4qE2dZ//hV7zu0pt7QJksVTK/IlGDv2iMdUPKYxlvoqaiO
         DREuTT2WxxiTV7aMUiBL0l8KSSEFFow0ELiKrpoxEvTBJv/fkgRhN+vzmr955uMv+vv7
         /Oxg==
X-Gm-Message-State: AOAM531w1X++GIgpNVmJaPFd4WX3zbNQfxUoxBiV8D+ILXtnaPynBg81
        TbqYntoPryMX24rnQmBhF2d3j78lv6PtRYx9sDbNHIf4ZL3b2PHHU1gkptZ+kEP+q8ECipZVZA+
        bBQ+ZvC/NTX5lIiaOGxoKqFa/fglOYJKh6CBjq6Cz
X-Received: by 2002:a05:6402:4310:: with SMTP id m16mr19187842edc.344.1642675247487;
        Thu, 20 Jan 2022 02:40:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyPXalZaMMnb38YbeEj30Tzd3scTSAbXmxSV188lCn85OIudmZVuBpWbdWwOJQ8I+iGR8Lag==
X-Received: by 2002:a05:6402:4310:: with SMTP id m16mr19187808edc.344.1642675247236;
        Thu, 20 Jan 2022 02:40:47 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id z8sm836027ejc.151.2022.01.20.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 02:40:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Simon Glass <sjg@chromium.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/2] dt-bindings: google,cros-ec: drop Enric Balletbo i Serra from maintainers
Date:   Thu, 20 Jan 2022 11:40:09 +0100
Message-Id: <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enric Balletbo i Serra emails bounce:

  <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table

so drop him from the maintainers, similarly to commit 3119c28634dd
("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml          | 1 -
 .../devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml       | 1 -
 .../bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml    | 1 -
 Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml | 1 -
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml        | 1 -
 5 files changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
index 20e1ccfc8630..2d82b44268db 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
+++ b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
@@ -8,7 +8,6 @@ title: ChromeOS EC USB Type-C cable and accessories detection
 
 maintainers:
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   On ChromeOS systems with USB Type C ports, the ChromeOS Embedded Controller is
diff --git a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
index b386e4128a79..6e1c70e9275e 100644
--- a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
+++ b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
@@ -10,7 +10,6 @@ title: I2C bus that tunnels through the ChromeOS EC (cros-ec)
 maintainers:
   - Doug Anderson <dianders@chromium.org>
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   On some ChromeOS board designs we've got a connection to the EC
diff --git a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
index 099b4be927d4..00e3b59641d2 100644
--- a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
@@ -10,7 +10,6 @@ title: ChromeOS EC MKBP Proximity Sensor
 maintainers:
   - Stephen Boyd <swboyd@chromium.org>
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   Google's ChromeOS EC sometimes has the ability to detect user proximity.
diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index 5377b232fa10..e8f137abb03c 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -10,7 +10,6 @@ title: ChromeOS EC Keyboard
 maintainers:
   - Simon Glass <sjg@chromium.org>
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   Google's ChromeOS EC Keyboard is a simple matrix keyboard
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index e9c46430fd8a..66a995bbbbe9 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -8,7 +8,6 @@ title: ChromeOS Embedded Controller
 
 maintainers:
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
   - Guenter Roeck <groeck@chromium.org>
 
 description:
-- 
2.32.0

