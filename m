Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5736573D222
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjFYQ20 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjFYQ2Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:28:25 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B943BD
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:28:24 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98df69cacd1so73168566b.1
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710502; x=1690302502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AhMc+nxOeeYfPI6LH+23GF4WjZTIppk4w21bXTn1i6k=;
        b=uqVIEWk9mXUl3tPmf96YMRhOYSC6ezjzeSdSBuHds+lRnYs/EGaceTAXVxQy+bZu9y
         QNjSbNeUU+Ho/3KsZrBX4XT0Vk1Wkv/VqrFzgGmLHQk1BBUt7k+7MpFs0F55GR6nFK98
         9uSZx75DA8hKpGgkY8Dar3mQNc+HfulYzJhkoxBNfVsgqdmTaI6VQNl7Y9Txpbn7z8ys
         GUGk+WuBC1JKYuUgw9v+sKGBeygcneRy1zCXElLnnq1w70PeR4nhZ+UJnjIC5NwjIj95
         zafkdznKqBB28vTQAne2h7+Z7TayS6MZZNXShL8IhBMjlCSjdBqRzLh9elzulwZ+cMPa
         OMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710502; x=1690302502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhMc+nxOeeYfPI6LH+23GF4WjZTIppk4w21bXTn1i6k=;
        b=lPk+QZklguYvSIMzg7+03TuZ0R3gqpw++Xd+kS8aUN0VtYmEUMIatdfTd1sf+XTgh8
         cdQNgfDwpApNJ0ycCgywVlJcYB/nUodSBPwBAexCckpxAxImP7+MOXxiK5BeomJ/0HbB
         4UWSfO/i/CzDsrCwcC3Yd6S1H6luSeMcmID+m2DYZiUSwqymSNasApsP0LSVKLzHOTM8
         KT8HuD2g/vVF22IkSidbplrTjpW5f72X+ikglbU/CL7hzHhnI3COXAMDM4fkEhpiOPB3
         NPxTjov3Ar9eZXTgneG8gQatzwLMphfb1QLFfthfzmOczbsSQJjxzqP44yfoJ3FWF+vx
         1g6Q==
X-Gm-Message-State: AC+VfDwV0zIG94+U3uFh+4at6ePVRLaJUnLH967USVYQ5VEoe8pG1V6d
        TIfZ/efKNloBHH0p710Q0ke3nQ==
X-Google-Smtp-Source: ACHHUZ58ULOzDOJCexuPb2LZkzug6PxFwG0fGJFHGbNRaGPX6JktTn/Hnhut++sDtTqn1YFIlgUk1Q==
X-Received: by 2002:a17:907:2682:b0:977:4b64:f5e8 with SMTP id bn2-20020a170907268200b009774b64f5e8mr23641312ejc.57.1687710502339;
        Sun, 25 Jun 2023 09:28:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 00/24] Input: Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:27:53 +0200
Message-Id: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Three years ago I sent v3 of this series. There was never an anwser from Dmitry
- no comment at all. Maybe after three years this can go in? It makes
the code nicely smaller.

Changes since v3:
1. Rebase
2. Drop gpio-keys patch as it depends on GPIO helpers and I am too bored to
   rebase it.
v3: https://lore.kernel.org/all/20200827185829.30096-1-krzk@kernel.org/

Changes since v2:
1. Add review tags,
2. Fixes after review (see individual patches).
3. Two new patches - 26 and 27.

Best regards,
Krzysztof

Krzysztof Kozlowski (24):
  Input: gpio_keys_polled - Simplify with dev_err_probe()
  Input: gpio-vibra - Simplify with dev_err_probe()
  Input: pwm-vibra - Simplify with dev_err_probe()
  Input: rotary_encoder - Simplify with dev_err_probe()
  Input: elan_i2c - Simplify with dev_err_probe()
  Input: bu21013_ts - Simplify with dev_err_probe()
  Input: bu21029_ts - Simplify with dev_err_probe()
  Input: chipone_icn8318 - Simplify with dev_err_probe()
  Input: cy8ctma140 - Simplify with dev_err_probe()
  Input: edf-ft5x06 - Simplify with dev_err_probe()
  Input: ektf2127 - Simplify with dev_err_probe()
  Input: elants_i2c - Simplify with dev_err_probe()
  Input: goodix - Simplify with dev_err_probe()
  Input: melfas_mip4 - Simplify with dev_err_probe()
  Input: pixcir_i2c_ts - Simplify with dev_err_probe()
  Input: raydium_i2c_ts - Simplify with dev_err_probe()
  Input: resistive-adc-touch - Simplify with dev_err_probe()
  Input: silead - Simplify with dev_err_probe()
  Input: sis_i2c - Simplify with dev_err_probe()
  Input: surface3_spi - Simplify with dev_err_probe()
  Input: sx8643 - Simplify with dev_err_probe()
  Input: bcm-keypad - Simplify with dev_err_probe()
  Input: bu21013_ts - Use local 'client->dev' variable in probe()
  Input: bu21029_ts - Use local 'client->dev' variable in probe()

 drivers/input/keyboard/bcm-keypad.c           | 14 ++--
 drivers/input/keyboard/gpio_keys_polled.c     |  8 +--
 drivers/input/misc/gpio-vibra.c               | 20 ++----
 drivers/input/misc/pwm-beeper.c               | 19 ++---
 drivers/input/misc/pwm-vibra.c                | 30 +++-----
 drivers/input/misc/rotary_encoder.c           |  8 +--
 drivers/input/mouse/elan_i2c_core.c           |  9 +--
 drivers/input/touchscreen/bu21013_ts.c        | 72 ++++++++-----------
 drivers/input/touchscreen/bu21029_ts.c        | 51 +++++--------
 drivers/input/touchscreen/chipone_icn8318.c   |  8 +--
 drivers/input/touchscreen/cy8ctma140.c        |  8 +--
 drivers/input/touchscreen/edt-ft5x06.c        | 10 +--
 drivers/input/touchscreen/ektf2127.c          |  8 +--
 drivers/input/touchscreen/elants_i2c.c        | 22 ++----
 drivers/input/touchscreen/goodix.c            | 40 +++--------
 drivers/input/touchscreen/melfas_mip4.c       |  9 +--
 drivers/input/touchscreen/pixcir_i2c_ts.c     | 38 ++++------
 drivers/input/touchscreen/raydium_i2c_ts.c    | 30 +++-----
 .../input/touchscreen/resistive-adc-touch.c   |  8 +--
 drivers/input/touchscreen/silead.c            |  8 +--
 drivers/input/touchscreen/sis_i2c.c           | 20 ++----
 drivers/input/touchscreen/surface3_spi.c      | 13 +---
 drivers/input/touchscreen/sx8654.c            | 10 +--
 23 files changed, 146 insertions(+), 317 deletions(-)

-- 
2.34.1

