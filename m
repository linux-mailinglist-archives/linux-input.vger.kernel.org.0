Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26A5B729002
	for <lists+linux-input@lfdr.de>; Fri,  9 Jun 2023 08:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237997AbjFIGg2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Jun 2023 02:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjFIGg1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Jun 2023 02:36:27 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D701FE6
        for <linux-input@vger.kernel.org>; Thu,  8 Jun 2023 23:36:25 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5428f63c73aso377621a12.1
        for <linux-input@vger.kernel.org>; Thu, 08 Jun 2023 23:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1686292585; x=1688884585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OArSVKdP8kKZATYp3NGYxhiynyocbj6EsYiLTo9tnQ0=;
        b=ZJGfku3g8Z/kgfGN2s9BOlz/s/4Vqvp5qale9NSrkcJZAXxeQpaerp68KZeIgHPfI9
         86FzYj8v1LucC/9p+b/uQ/VsCKuoJWWrhJvmaOWirupHubWwxBD4PLEEk8rK4LQczB5X
         auCEszeK7jLlx/6Sh9gKkVEocQB86K7AZsbWHgE1oYY7Tmu4SybrcafnAo2lepd3T9Bl
         rIyG74+3/DYq4/gWweEyXdtfrvhPCZlW2IxPX2vZKe8SW9zue85rTqeHJcndu0hBuCeh
         S2quC+aQMVvwgITvqW7G5OhXes3J2edOdDFZAh77pVTz1dYOPcEwraG1z5eKLXciB6uW
         d3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686292585; x=1688884585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OArSVKdP8kKZATYp3NGYxhiynyocbj6EsYiLTo9tnQ0=;
        b=jwg4IlJBHfbHV2QyugxGHLB3vZCLXgwN6XX/oo1tV6Q4wJWOzy+YMk/d4qN32Omqex
         IvmB4w/trWYoMXOuZpjSLIedrfvLpIQKm7CQeV2VfYYeFESpbTB22vRJ5zPy6akf5X8G
         jGWu9AG+NPEAhZHDMEmxEA8v9tfMjBolpK5+LVe3cf1AROipGut0Z4bWvsGYooyAJ+4R
         3QK872TW85X67v//gsasR71kOAEqDgtiJd0648vnmpMMkdWUsNR2Xnd/eJ627IWUd6/Z
         3RmZwPdIJC4QOx/bqz/Fti87r0mCdTcqatAg311ZkosLDJyF3gsuNXzap5zbb0z5Xodi
         R+8Q==
X-Gm-Message-State: AC+VfDyOO3HARfPQskFoQacEgkCj9UyByWSDdoxwPwoO6RTIn5sFC1Z3
        utoxNEWtx/FmdihiSFVilGx5wKsIudAiKRw+Emo=
X-Google-Smtp-Source: ACHHUZ52oahsoZDVkU6EF4yj3h0eG1pLsRBq3kv3+ADvE6u/W5sWKX9yU8ZR2vkCgKm/ciflmvhLEg==
X-Received: by 2002:a17:903:493:b0:1b2:4df5:c00e with SMTP id jj19-20020a170903049300b001b24df5c00emr251138plb.35.1686292585194;
        Thu, 08 Jun 2023 23:36:25 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
        by smtp.gmail.com with ESMTPSA id o15-20020a170902d4cf00b001b211283294sm2445709plg.163.2023.06.08.23.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 23:36:24 -0700 (PDT)
From:   Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dianders@chromium.org,
        hsinyi@google.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v5 0/2] Add ili9882t bindings and timing
Date:   Fri,  9 Jun 2023 14:36:13 +0800
Message-Id: <20230609063615.758676-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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

Add bindings for Ilitek. The ili9882t touch screen chip same as
Elan eKTH6915 controller has a reset gpio. The difference is that
ilitek9882 needs to use vccio-supply instead of vcc33-supply. 
From Dmitry suggestion, it would make more sense to distinguish the
binging of ili9882 and eKTH6915.

From The datasheet specifies there should be 60ms between touch SDA
sleep and panel RESX. so we can add the 65 ms delay in i2c_hid_core_suspend.

Changes in v5:
- PATCH 1/2: Add panel as a required in property and examples.
- PATCH 2/2: Set a NULL to ili9882t_chip_data for vcc33-supply, then not use vcc33 regulator.
- Link to v4: https://lore.kernel.org/all/20230608130147.2835818-1-yangcong5@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Remove compatible items and add reset maxItems.
- PATCH 1/2: Refer to the panel description in Doug serias[1].
  [1] https://lore.kernel.org/all/20230607144931.v2.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid/ 
- PATCH 2/2: Set a "null" to ili9882t_chip_data for vcc33-supply, then using dummy regulator.
- Link to v3: https://lore.kernel.org/all/20230607133458.4075667-1-yangcong5@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Introduce bindings for Ilitek.
- Link to v2: https://lore.kernel.org/all/20230605060524.1178164-1-yangcong5@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/2: fix ran make dt_binding_check warnings/errors.
- PATCH 1/2: remove oneOf,just enum.
- Link to v1: https://lore.kernel.org/all/20230602140948.2138668-1-yangcong5@huaqin.corp-partner.google.com/

Cong Yang (2):
  dt-bindings: HID: i2c-hid: ilitek: Introduce bindings for Ilitek
    ili9882t
  HID: i2c-hid: elan: Add ili9882t timing

 .../bindings/input/ilitek,ili9882t.yaml       | 67 +++++++++++++++++++
 drivers/hid/i2c-hid/i2c-hid-of-elan.c         | 50 ++++++++++----
 2 files changed, 105 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ilitek,ili9882t.yaml

-- 
2.25.1

