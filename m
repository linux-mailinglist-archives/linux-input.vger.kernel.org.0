Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7DC6EF351
	for <lists+linux-input@lfdr.de>; Wed, 26 Apr 2023 13:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240554AbjDZLVp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Apr 2023 07:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240560AbjDZLVo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Apr 2023 07:21:44 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A69804EC5
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 04:21:42 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4edc63c82d1so7117012e87.0
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 04:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682508101; x=1685100101;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9naGDk48Zj+PlZ+Jp1u6lFmP1KTwqXU2XbLPAygHrI=;
        b=eqcXXYmFnj/dE5MQy0eqvxRenOIf3Z5w0huIAj08pe9EuYktVgOpHNkRQl8wT1jn3I
         XXDUJL0HnftlZTRlZKuhAJy4m7b7lpQU7AreWOgWmdfAhiAXaEzQSMzPUWHHESLy34YD
         5m20EeE+Wl7tUMgCB9j9GS6Y4NENmrvk5SVXd4yHV8IVr4pfeQfFaY+m7PxA7a+K4hNo
         Rh06I9iWHUQl+NT9tIejugGmuIQmzXfjgZVf5sQbKarcAdVlHYsThSMF6ATbIBlHXU5O
         bRg11fPfPvjO/uOPsF4/zOxxqNJmBs9Woyg+EgHr+wVA/LUUPL+yDU7AmZ1G+A9eMiDf
         TuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682508101; x=1685100101;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9naGDk48Zj+PlZ+Jp1u6lFmP1KTwqXU2XbLPAygHrI=;
        b=K2IpnAADR7nSYLAPbMnTthKGnLuajCmj1cHYjZykVf9vfavU2w6rIcB75+HmKMnSSL
         XC1PtgskdrrUHiqM+KU57ILFlbB9WGQl8fr092+eWAGd8/CIy3/gwjGdx3oA85iFD3rb
         T+nrPv0eEn703mCIYSzOoDkObKcpKiwgl5ubJDOBAu/8fMp/KNdBp7ZcHAqvUwmf3+lC
         Q/x3lWXzJn64P9+y+2oayt2B9n5Zk6lEz48ZLEoXMvmjFaCpfRjev4wpu22V5gKOxK5n
         7qUM4RaAQIHbieo2p7fv960C89amwole4aIedieZrvGQ7jfaQOFEXEwxosYJc58poxdc
         w3DQ==
X-Gm-Message-State: AAQBX9drkNe+FtViGhLmd7XQSOK5RvpYyd1eD8YMCIB93kh2bYA6BXvz
        bE0ApIXAPk8aq3O56pQmZfYh8p4YJWYjsbiI1z0=
X-Google-Smtp-Source: AKy350Z4JDBnZVGtAj1Of/ojtlbjuivI9YyfI2Ny9UUwpUefKlwDymDGD1MQW/sISWtNsuN/8HTHJg==
X-Received: by 2002:ac2:4ade:0:b0:4e9:c627:195d with SMTP id m30-20020ac24ade000000b004e9c627195dmr5125919lfp.57.1682508100620;
        Wed, 26 Apr 2023 04:21:40 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b004ec84d24818sm2453237lfk.282.2023.04.26.04.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 04:21:40 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] STMPE device tree bindings
Date:   Wed, 26 Apr 2023 13:21:37 +0200
Message-Id: <20230426-stmpe-dt-bindings-v2-0-2f85a1fffcda@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEEJSWQC/z3NQQrCQAyF4auUrA3UtFj1KtJFZhLbgB3LpIhSe
 nenLlz+PD7eCq7Z1OFarZD1ZW7PVIIOFcSR06BoUhqopqZu6YS+TLOiLBgsiaXBMTZtdxHpjkx
 nKC6wK4bMKY67/IMPT499n7Pe7f37vPXb9gUhrSZ3gwAAAA==
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds the missing GPIO bindings for the STMPE port expander
and converts the existing MFD binding to YAML.

ChangeLog v1->v2:
- Split off a separate GPIO binding
- Updated the MFD binding according to feedback

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (2):
      dt-bindings: gpio: Add STMPE YAML DT schema
      dt-bindings: MFD: Convert STMPE to YAML schema

 .../devicetree/bindings/gpio/st,stmpe-gpio.yaml    |  60 +++++
 .../devicetree/bindings/input/stmpe-keypad.txt     |  41 ---
 .../bindings/input/touchscreen/stmpe.txt           | 108 --------
 .../devicetree/bindings/mfd/st,stmpe.yaml          | 298 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/stmpe.txt    |  42 ---
 5 files changed, 358 insertions(+), 191 deletions(-)
---
base-commit: 457391b0380335d5e9a5babdec90ac53928b23b4
change-id: 20230426-stmpe-dt-bindings-c3479dd71a28

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

