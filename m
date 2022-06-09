Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 547EB544A66
	for <lists+linux-input@lfdr.de>; Thu,  9 Jun 2022 13:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237325AbiFILjV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jun 2022 07:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240407AbiFILjV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jun 2022 07:39:21 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 428EC195905
        for <linux-input@vger.kernel.org>; Thu,  9 Jun 2022 04:39:18 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id n10so46922647ejk.5
        for <linux-input@vger.kernel.org>; Thu, 09 Jun 2022 04:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n04xRHDLPG5HTJiUoTVbiyOiGV01+5rVdjSb2OnFTXM=;
        b=Ho4w2nM3+Q5bGqtr36/o6zunEJf1I2XT6LKt8qPNLkRCy08ezqkJOGQcvBy5vco1my
         LGBVSuQy2o3zJ3VRCl5ktdED8AwYX9JPpK6G/5qGM8by9MmCH5kjgAac+5wdKBNIpFR8
         xwCEy+untlqCgNrdyjBW7OOwtMZ/fatULZ5sRrG0DbV8h1a8fkBFQZrHUVRrHVTdOMOk
         bFY0Q+lM7yWFhuw7oGtstkGAHtRN906miEa6MNINObX4FBiMpladAqhuYFhntv02FElx
         IpEdpyFjcGNvTY5jsUxfo3i9hgyGqj3e7n/Ht1bGDfF6O7zBd2Gr4mncFJWMEbpebOEc
         /opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n04xRHDLPG5HTJiUoTVbiyOiGV01+5rVdjSb2OnFTXM=;
        b=cVWZ/vB73Njp6W/xTE90AyktwElb4HhTJD1dWBcn7Bc0wTPRF5kBu8jwK01HWHRchQ
         o2v/6BHzBmrirRowkEbsNVDdXHCNN7MV39h4EzCIKPITMjFVlV/2fs4uk2zbgf1C20MW
         v+7u8Cpv0sU32q7xALwzdaE/beiXOqfkXQWR6BO5LzNFjWQzHpHzcAMS5e6HJ4dL1ngd
         eyGtfT1dcUYrsSg/s/Sj5e+F8AcSN6fZ8bj3JTesv5wVPhPu31vyEBVg67T42iP1ZPVI
         aGCv19x/xn1Hh5Xz7VrG7NFtjWqYyCVNDxJf43qShdbA8LjYT0mMcPE8FCoAdA50x/14
         a/0w==
X-Gm-Message-State: AOAM530a5EauPzTjrnxyKn9u02TxW/9qY+AOlUVytcn3J0YFY/e89hYr
        iHvjqOlXYCB41K8Mi5M+n4slSM5q6kDcWg==
X-Google-Smtp-Source: ABdhPJwgFvtD9GYY39BjWKd3xyuHcJYvYead1t+NeA7lJVCKNmpwd5ABumStlG++pLlWR2zP3uaRug==
X-Received: by 2002:a17:906:e202:b0:6fe:478b:7c1 with SMTP id gf2-20020a170906e20200b006fe478b07c1mr35455237ejb.419.1654774757503;
        Thu, 09 Jun 2022 04:39:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d54e000000b0042e21f8c412sm11898495edr.42.2022.06.09.04.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 03/48] dt-bindings: input: gpio-keys: accept also interrupt-extended
Date:   Thu,  9 Jun 2022 13:39:05 +0200
Message-Id: <20220609113911.380368-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Each key device node might have interrupts-extended instead of
interrupts property:

  fsl-ls1028a-kontron-sl28-var1.dtb: buttons0: power-button: 'anyOf' conditional failed, one must be fixed:
    'interrupts' is a required property
    'gpios' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/input/gpio-keys.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index e722e681d237..17ac9dff7972 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -92,6 +92,8 @@ patternProperties:
     anyOf:
       - required:
           - interrupts
+      - required:
+          - interrupts-extended
       - required:
           - gpios
 
-- 
2.34.1

