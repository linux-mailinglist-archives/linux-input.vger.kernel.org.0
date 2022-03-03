Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 181AC4CC1D7
	for <lists+linux-input@lfdr.de>; Thu,  3 Mar 2022 16:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234554AbiCCPoF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Mar 2022 10:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234659AbiCCPoB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Mar 2022 10:44:01 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73934155C1B
        for <linux-input@vger.kernel.org>; Thu,  3 Mar 2022 07:43:08 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id t11so8477514wrm.5
        for <linux-input@vger.kernel.org>; Thu, 03 Mar 2022 07:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/PQYi5V1lBftwwUBkJym+Rqvvi9OxhM3bg4N4a7up4g=;
        b=ii7ieihtWdQjGhc0wAY2obQoDNuQbavoa/z0Z1invHkvtW0lLnlSTaf1AESWTTnFJC
         mYvpjwT2YnGO6avrMN+XqwIIhVVD26M8nYpCRPssahgfG/w6oASdBkmAl49TWGcZfiHc
         QM6Ew7mmiLzj6wZ/PdJo49O7DuHSt0QVCg+lIv5YVaIvM+cyJ/dVM1PDOrqjq35GOZFJ
         LUQhXQZLaixMYQssB3WqNkdBc81LAuXWqSXJjSOYaYppXSkH9KOhaTySdYMPgveR9WEO
         X/7p7a5zLJSMWUYQC4utzilK5wSPU59saQSU3KbSANl2PirVUc5enoQ/TWD/VWej2YQu
         NyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/PQYi5V1lBftwwUBkJym+Rqvvi9OxhM3bg4N4a7up4g=;
        b=HrhZS5gB5bVd1Rzr+4Oz6GS7B1YXdviwlBaLK20O+DNXiUitgHmhPxSJWifv7Pqzx/
         CQx2bcY6YV45HysZ3nKZrP0A8+jMplBtUSZhhEqMrlu3mNWZ9kxVxa7PnbqTIYzWT601
         6qKTfo0VQ/J/iOVmdn5M+lx+dKClAzpfNAoAXX3q8fAiNyoi8KbHrsd9yn7SXSGEk9Hr
         Mep4tpTgn+Gh5hsf8WmKsZ85SosndPcdGsYcoiWycM7dbiRiY7NUK/ohKdXFVvXMXfIs
         4HuSYAObl2Qw/eVTVn3B1FJA3nXTnVgKVHAkbN9Zt7wQG1YT2RhcbMBwXTSbpa8YU9qS
         0Cvg==
X-Gm-Message-State: AOAM532vt3kRrxMY1YcVQ6BucyPa87ciiW6E9KfwIMxB1gB1VweN6u4W
        jRkUzsUnEx9S7+cnB1Jb6lw3Mg==
X-Google-Smtp-Source: ABdhPJwjWCWULRfIdubZwads+hZK1W/6OkX6dkMsq2u8EwoVi2VvqGzLxjPky3oaLS8WkdkBtFt/cA==
X-Received: by 2002:a5d:534d:0:b0:1ef:956e:320a with SMTP id t13-20020a5d534d000000b001ef956e320amr17525107wrv.613.1646322187010;
        Thu, 03 Mar 2022 07:43:07 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb19:8b2c:5e00:e059:ffd7:be1c:ef2c])
        by smtp.gmail.com with ESMTPSA id d8-20020a056000114800b001f045f3435asm3272452wrx.108.2022.03.03.07.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:43:06 -0800 (PST)
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
Subject: [PATCH v21 0/3] Add matrix keypad driver support for Mediatek SoCs
Date:   Thu,  3 Mar 2022 16:42:59 +0100
Message-Id: <20220303154302.252041-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear all,

This is a follow-up on an abandoned series, see [1]

Since Dmitry seemed generally happy with the driver, I applied his rename
recommendations.

Thus, I have made the following:

* All Reviewed-By: tags were kept
* Applied Marco's Reviewed-By: on the bindings (since he approved v10)
* Fengping is still the maintainer since he is the original author of this driver

Please tell me if you would rather have me do things differently.

[1] https://lore.kernel.org/all/20200909072159.14888-1-fengping.yu@mediatek.com/

v20 -> v21:
driver: reduce code line count (suggested by Andy)
driver: use bitmask for magic "32" value (suggested by Andy)

v19 -> v20:
bindings: use dual license
bindings: fixed 2 indentation issues found by yamllint
bindings: drop clock-names description
bindings: use standard keyboard node name for example
bindings: use default: keyword for default values
use debounce-delay-ms property instead of mediatek,debounce-us

fengping.yu (3):
  dt-bindings: input: Add bindings for Mediatek matrix keypad
  Input: mt6779-keypad - Add MediaTek keypad driver
  arm64: defconfig: Add CONFIG_KEYBOARD_MT6779=m

 .../input/mediatek,mt6779-keypad.yaml         |  77 +++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/input/keyboard/Kconfig                |  12 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/mt6779-keypad.c        | 215 ++++++++++++++++++
 5 files changed, 306 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
 create mode 100644 drivers/input/keyboard/mt6779-keypad.c


base-commit: dfafa56029576c52a393b61dcba7a3a43fd2b6c0
-- 
2.32.0

