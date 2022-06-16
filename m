Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51CAA54D655
	for <lists+linux-input@lfdr.de>; Thu, 16 Jun 2022 02:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348889AbiFPAxx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jun 2022 20:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348770AbiFPAxw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jun 2022 20:53:52 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABFB4FC4D
        for <linux-input@vger.kernel.org>; Wed, 15 Jun 2022 17:53:51 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id z17so103584pff.7
        for <linux-input@vger.kernel.org>; Wed, 15 Jun 2022 17:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9qwwQJJVg91/nnmcAMwyXvHYok0DyJzSkywxG0QwUEU=;
        b=xaURczxPMBttLVmTmtGaORZcEYgKETRyblkz+ZCrDhSyDx2Tunc/S2v8DC6VVYxdqK
         sRYGcjKJkLZD2qlzFfenHjs4qBn6hPw5b4IK7kPrM9ujAYOCNJATsV5dBU/o215GwiWs
         Y4mVuoaR/mKo2TTBKc4n+bFkeF3Z+V77bUy6so1KRprO3lBj5ovtvXtmyk1rWLtmw0Tw
         uVcOPE0LvTostMvW0hrjQfH7aRN1s9fJ/m8qN8u3k1UgWCk53kA03nG4zENG4/WdKUU0
         v8/TRoGNfK638qSEbnBztIgwoL343SvYPGytjPwWSOlFI/Bnx+hHLBRQQJjMcekGRxNC
         bYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9qwwQJJVg91/nnmcAMwyXvHYok0DyJzSkywxG0QwUEU=;
        b=WvUvLoJ4KFMom8ybs2AAgp1LJfm61NvFENYCV9JNm+hNVvkXbier8jIHiZOA8tsP4S
         zUlee3/yfZorxuaxqczOzsz/r7NOuVCv8kWqn3UuWFVuoeR3QEExXm28Qkp2QRNfMWMo
         9YzKTF0ZmhNtL0oxFZT4VO1aQOcPKpjCezVYfAMtU08k0PCMNHWyH7RPeH7CSzohm5uh
         qYwC+UFk0A0Mj2mWMSEW+gkvpufGYR1kDUFh57TT924T9LEbaxV8tXnQXl+n7D/eOGdc
         ysuVdLbDHGX72DqBQ/aodMJstDQGPLIsb1JyUfi2xZoRt2tK29RbPN8ZLS79sMEqqlej
         0U3w==
X-Gm-Message-State: AJIora8PLyrtUAZKVQSkulyOrauaNZr5pBsRdX4oxQtJOvwy1l3NikI4
        xLS62eudDUedeXZDH/IDchmKFg==
X-Google-Smtp-Source: AGRyM1tlL6hO/EWZAR4S1GVC5e2TtQKXy+/+OmKG6Mf2UDs62lOXQ/aqvgoOhUOd/krZOVlMkKPPHQ==
X-Received: by 2002:a63:4e62:0:b0:398:cb40:19b0 with SMTP id o34-20020a634e62000000b00398cb4019b0mr2136424pgl.445.1655340831593;
        Wed, 15 Jun 2022 17:53:51 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:53:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 03/40] dt-bindings: input: gpio-keys: accept also interrupt-extended
Date:   Wed, 15 Jun 2022 17:52:56 -0700
Message-Id: <20220616005333.18491-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
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

Each key device node might have interrupts-extended instead of
interrupts property:

  fsl-ls1028a-kontron-sl28-var1.dtb: buttons0: power-button: 'anyOf' conditional failed, one must be fixed:
    'interrupts' is a required property
    'gpios' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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

