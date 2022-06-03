Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5B8453C870
	for <lists+linux-input@lfdr.de>; Fri,  3 Jun 2022 12:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240811AbiFCKQP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Jun 2022 06:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233907AbiFCKQO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Jun 2022 06:16:14 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABB03B288
        for <linux-input@vger.kernel.org>; Fri,  3 Jun 2022 03:16:13 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id h23so3929852ejj.12
        for <linux-input@vger.kernel.org>; Fri, 03 Jun 2022 03:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CE1k6uqQm8XxTm8kMTTnyye5I/ebSIAbCCt2XWDXsEI=;
        b=JhjH3pDETFmYHEKAKLaZdtjVcA9hZwcivyVzHYnI3wS/AKELt2b4Tsn9if/terlP8t
         JATy2D8DGgdXmOi6lmJ7A8u3Isct66UI7GgpJzd1PLmln0tGkXoQo6k2Keg/gczCZqhl
         tDmtWgUZqHFjYqmIoQQnAvfIam3HSDe8VgxsON9O5Qp7a4zWEdI8LiB9yxP5BXWbPVDI
         xOtRzOk4sa6900EoUrzB9ODvl0+Er70u8ZNEqNluskfRSflqX6dckj2sKtI/vj6oKG9r
         G01BAnoARN1OgZvVyUU6Ifd36Ez0zb7EHUjYlmFeNMijzAJcvBdk5nzUAOuFoJnLVE7R
         DmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CE1k6uqQm8XxTm8kMTTnyye5I/ebSIAbCCt2XWDXsEI=;
        b=7sBKoXCZdt1nKHCzLM9txrBCbqPQhsERjxKETiAX1FqTPGr2PCLO3h8cNBw2Bd3DVE
         3JXJronLs9gyq/tzvc5Ls6AyKDzlhr3NMUK8kLCw727Gw4vW6xg/lSkuhd0ERzrMzyEU
         Cnc4+NFJjtCZSp28+z22AZ4adwVKhEabce/Hw0FWLB9GfpL8uZPzIeb7YAj9v8g9Jm6l
         3WRk4lpTAs6+JIGbE5VgT5EK7g8qGB9daGVJ8w9mK4sYnQ46noVinpxFknzupI4AP2sy
         s4HAEw8HqNrooq7lbnKj+7PjwhdJvaLPOwhuSVbT1hviKCDD3Dz5k5MFUYJclFzWt9vs
         aqMw==
X-Gm-Message-State: AOAM531B1IVwGa2Vhl3WUYWQ83pzW92CV5feV7C6rNWg05cVl+7PdlMJ
        UJDj8b3le1GkX+VbqPm3D4CKQw==
X-Google-Smtp-Source: ABdhPJzPpiZRWh+oiv1/yJAwdjM+7tzslnDLIKqKxn+YiUPZk+INHft204nhSRv0ckPgQLfu0sJdWg==
X-Received: by 2002:a17:907:3e15:b0:6fe:f10e:6337 with SMTP id hp21-20020a1709073e1500b006fef10e6337mr8091317ejc.209.1654251372215;
        Fri, 03 Jun 2022 03:16:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j15-20020a170906430f00b006f3ef214dc7sm2779008ejm.45.2022.06.03.03.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 03:16:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stefan Hansson <newbie13xd@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 0/2] dt-bindings: input: gpio-keys: rework matching children
Date:   Fri,  3 Jun 2022 12:15:59 +0200
Message-Id: <20220603101601.542054-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Currently the gpio-keys schema allows any property to be present, even
undocumented.  Narrow the pattern for children to require specific key naming like:

    gpio-keys {
        compatible = "gpio-keys";

        // "up" is wrong
        key-up {
            label = "GPIO Key UP";
            linux,code = <103>;
            gpios = <&gpio1 0 1>;
        };
    };

This will cause many, many DTS warnings, which I can fix. But before I start
such big work, let's agree whether the approach is correct.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  dt-bindings: input: gpio-keys: enforce node names to match all
    properties
  dt-bindings: input: gpio-keys: document label and autorepeat
    properties

 .../devicetree/bindings/input/gpio-keys.yaml  | 177 +++++++++---------
 1 file changed, 91 insertions(+), 86 deletions(-)

-- 
2.34.1

