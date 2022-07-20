Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06E9957B8CA
	for <lists+linux-input@lfdr.de>; Wed, 20 Jul 2022 16:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235316AbiGTOsn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Jul 2022 10:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235022AbiGTOsm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Jul 2022 10:48:42 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C195288E
        for <linux-input@vger.kernel.org>; Wed, 20 Jul 2022 07:48:40 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so1420174wmb.5
        for <linux-input@vger.kernel.org>; Wed, 20 Jul 2022 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:mime-version:content-transfer-encoding:from:date:message-id
         :to:cc;
        bh=y0nOdBdH/FiY2jfQvMH95VKpuAO3BFQhEGGb8OIH85M=;
        b=yI2UwrXOi3+iAjbP6Ub6fisppNUVUrxVmdsq3fNJv+N1wsO60lcIG0WM+ItxOyv4Rp
         J0pUF3pyFpUzkdwL8Q0jOkNMphJOCg4N/hrIQy5AjQ37nU3pVu6iemD41WcW+fRHW+/s
         jaPCYzpz13OTcIxMzKeVd/YZ5rDKvd7lmW3y8O1oZP/SPBqo8z51egLC6Dnr0TQSsGGe
         liZNw/xHmAIH6C2eGologqz4OCE5zYmpsvArnvvfcrI1OuHxNqPkSPrL5KPsWRaGMvnk
         PQ6MCEAP3UGVGSIDP+NM9cKT1dXQPid6xBLrqZPa2VtgMYUXDNdLTEkvRiwZXpRNI66V
         uUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:mime-version:content-transfer-encoding
         :from:date:message-id:to:cc;
        bh=y0nOdBdH/FiY2jfQvMH95VKpuAO3BFQhEGGb8OIH85M=;
        b=7sNLZtK8pZwoIb4c+S0yAb3z7tbKNmjAe1WhBdlcF8wsb4L2YkblLnRGdLBsXr2ehY
         TMAgS5PuuTed7lwWzgglX3NCx4URyWTJFBRBao4rnRr/UA4ZmSrSmIY2CjuGnT1WuCfz
         42Jzv1RUWcd+OmVfIxPo6+VsLK6Hkc/ywe+P4OU0iV9PEq3Q/TiDIaQKNNLor1xhtI1r
         EguFunjkS7LlaJVf4kVhlaRofULkJyMv8U1v/a3qQOjLwHNYNZ9D+GkHTuZR8j1HWtiQ
         cLfYLnSm3pw8ZCZPzZ3GXFW1pBNipcmIV/TZ5z6OmFviYri3y9aIN6mIZUWrNhJIhVVo
         dNjg==
X-Gm-Message-State: AJIora/gDYVKUE+iz/liMO6kdaK2MLUMnLvh6evQnWN4K3oUhIuq6mCS
        Rq9MW5iZXUEmJJxcnosBdhxKRw==
X-Google-Smtp-Source: AGRyM1ublPYAEei2qfPJouysredFf/CYLPH5v96mYBkQf2Q+0TkflmcBuDnsIT97NTApdhrn+fK1vw==
X-Received: by 2002:a05:600c:34d0:b0:3a1:a05c:b523 with SMTP id d16-20020a05600c34d000b003a1a05cb523mr4189886wmq.94.1658328518916;
        Wed, 20 Jul 2022 07:48:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb19:85e6:1900:c639:22f8:bed9:44dd])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c4e8800b003a31673515bsm3321121wmq.7.2022.07.20.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:48:38 -0700 (PDT)
Subject: [PATCH v1 0/6] Input: mt6779-keypad - double keys support
X-b4-tracking: eyJzZXJpZXMiOiB7InJldmlzaW9uIjogMSwgImNoYW5nZS1pZCI6ICIyMDIyMDcyMC1tdDgxODMta2
 V5cGFkLTIwYWE3NzEwNmZmMCIsICJoaXN0b3J5IjogeyJ2MSI6IFsiMjAyMjA3MjAtbXQ4MTgzLWtl
 eXBhZC12MS0wLTY4YzE5N2MxOWYyY0BiYXlsaWJyZS5jb20iLCAiMjAyMjA3MjAtbXQ4MTgzLWtleX
 BhZC12MS0wLWUyYmI0MjcwMTI3MUBiYXlsaWJyZS5jb20iLCAiMjAyMjA3MjAtbXQ4MTgzLWtleXBh
 ZC12MS0wLTc2OTM5ZmM0MTRhZkBiYXlsaWJyZS5jb20iXX19fQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date:   Wed, 20 Jul 2022 16:48:36 +0200
Message-Id: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0-dev-54fef
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The MediaTek keypad controller has multiple operating modes:
* single key detection (currently implemented)
* double key detection

With double key detection, each (row,column) is a group that can detect
two keys in the key matrix.
This minimizes the overall pin counts for cost reduction.
However, pressing multiple keys in the same group will not be
detected properly.

On some boards, like mt8183-pumpkin, double key detection is used.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

---
Fabien Parent (2):
      arm64: dts: mediatek: mt8183: add keyboard node
      arm64: dts: mediatek: mt8183-pumpkin: add keypad support

Mattijs Korpershoek (4):
      MAINTAINERS: input: add mattijs for mt6779-keypad
      dt-bindings: mediatek,mt6779-keypad: use unevaluatedProperties
      dt-bindings: mediatek,mt6779-keypad: add mediatek,double-keys
      Input: mt6779-keypad - support double keys matrix

 .../bindings/input/mediatek,mt6779-keypad.yaml      |  8 +++++++-
 MAINTAINERS                                         |  6 ++++++
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts     | 21 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi            |  9 +++++++++
 drivers/input/keyboard/mt6779-keypad.c              | 17 +++++++++++++++--
 5 files changed, 58 insertions(+), 3 deletions(-)
---
base-commit: 3b87ed7ea4d598c81a03317a92dfbd59102224fd
change-id: 20220720-mt8183-keypad-20aa77106ff0

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@baylibre.com>
