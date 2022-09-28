Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478F45EE897
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 23:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbiI1VsS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 17:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbiI1VsR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 17:48:17 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A34B4EB7;
        Wed, 28 Sep 2022 14:48:16 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1280590722dso19020999fac.1;
        Wed, 28 Sep 2022 14:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7YoXPwHNBIq87o+VHxc7Xmx8BJkAM/vCh8ISqRMAWFQ=;
        b=qE2ZxuhFV0W3DO/jbHcQ0HBwQr5VSWKLihnE8pnww5hp2S2oekDIA7kC2XH+W1M2Qi
         eJiBf7pgmn2hJBI1mZD9Vx3UTYxT60u2HN69DOx8EWPFYuS4LbbWO2nF3hhbejJpvvk5
         3Q4PHfvIeUJi1edWsBzd0wUM/YlnHtb1sy1GMWhHsJX/9jhbo+eTdU7W2Np6DsYzLABY
         rW/h+uc3KternD0smgNpmMFicVDHMESI0LW6tqUQzI9/Meik+X6YljedOBr10MmzMVY1
         HCVc3JLNoYMLoEJtJ+PUZewJxQylpAJESciM9nBa9YENLZabR/rLKIBljr4+yp5nnGQe
         PPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7YoXPwHNBIq87o+VHxc7Xmx8BJkAM/vCh8ISqRMAWFQ=;
        b=jI07GfJ9R6XMve9amr04lDn9N4Mx51lrosUtBSxLUESmm5a1upD0RhYxsRYJFwWkV8
         u/h5IOTNLdqZyZLt6py/MGFND4JCHT2D21/46vj0lb7T2KjhBs677sWAl90Qjp/j71SQ
         QtwdhxyhJ1qCBBhMGrFXgzwZz7o7lTW50yMWFkk5xOHIBAPxTioy6egzEne50fmSg+M1
         QDKgCET/+UiQirJXL/9Yw1QzQCejYFWAJ9xD3TH0gXXzPrmvnKBG8fuVDGe3dl7edBoL
         22jgpNn7hFiNoho5cZfKwCyGGtFtTbimSVTRRfeUt2TQS1CQ4nt/nVBjtSmchXaM540l
         BXqA==
X-Gm-Message-State: ACrzQf0mWXAU6D+RWmwtajXE0crt4GujCjw2olSiEP+3dZGuh14VjoZf
        VcbU6UBfVMIvTPqX6l/vVIL8a1B2B84=
X-Google-Smtp-Source: AMsMyM6/Sv1Fmz8HFC0Hq69uCoBrLpoelGrxy6kCghNkoDyX+mnur50pOa31WIa+BU9dNqq0/KEvSg==
X-Received: by 2002:a05:6870:6589:b0:131:b5d9:a41b with SMTP id fp9-20020a056870658900b00131b5d9a41bmr1892615oab.50.1664401694640;
        Wed, 28 Sep 2022 14:48:14 -0700 (PDT)
Received: from wintermute.localdomain (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
        by smtp.gmail.com with ESMTPSA id m18-20020a9d6452000000b00657a221eb71sm2623211otl.65.2022.09.28.14.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:48:14 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add Hynitron vendor prefix
Date:   Wed, 28 Sep 2022 16:48:04 -0500
Message-Id: <20220928214806.13572-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220928214806.13572-1-macroalpha82@gmail.com>
References: <20220928214806.13572-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Hynitron is a company based in Shanghai that makes controller ICs for
touchscreens.

http://www.hynitron.com/

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2f0151e9f6be..4f36032eab02 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -563,6 +563,8 @@ patternProperties:
     description: Hycon Technology Corp.
   "^hydis,.*":
     description: Hydis Technologies
+  "^hynitron,.*":
+    description: Shanghai Hynitron Microelectronics Co. Ltd.
   "^hynix,.*":
     description: SK Hynix Inc.
   "^hyundai,.*":
-- 
2.25.1

