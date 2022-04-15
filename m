Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545CA502CFB
	for <lists+linux-input@lfdr.de>; Fri, 15 Apr 2022 17:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354736AbiDOPjn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Apr 2022 11:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356284AbiDOPj2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Apr 2022 11:39:28 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4D13C72F
        for <linux-input@vger.kernel.org>; Fri, 15 Apr 2022 08:36:58 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id ay11-20020a05600c1e0b00b0038eb92fa965so7951106wmb.4
        for <linux-input@vger.kernel.org>; Fri, 15 Apr 2022 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bjsrGI6b0RLOajPWZ9Roh+05A2VIae/Wu/ntaXQOjlw=;
        b=3wSns6Qsgrs4cf7sI/QmPRIbAuQFGeQOWy+IwaG4p/9G7wFu2NT3G9NIDox8GsYa83
         lIW5eRDkq87Z8CCCA5g4ZABFIx+PXqihPJ7jJ7jd9wDZYLFNkMXHH5HGR66XCPF+9dTG
         yBbvNBiJWOAM9LE0PerlZPkmCWGL5Ca6Ij+gCgK4iPuD2xWi2jTf4VeR6K0hBkuKstUA
         eKhtkY7CUj6iRNbZBGBOx99przt0jbd2VdOJuWEFD6h94LZnJNuDAkyx1bSVjSteJyCP
         +bftqFga/mY4fsJ8lJf2VOI9bkrKtnifVoc8pP8x+0fPRnZD60jCuzijfIPp+zGjyYwG
         GFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bjsrGI6b0RLOajPWZ9Roh+05A2VIae/Wu/ntaXQOjlw=;
        b=zLCDZ9KgvO3W2LxSMLik+rvRsBcmX8O8s9J/+x+AkrAujasyXBgaH2XmZSyanx9mVJ
         4zYi31HTqWRdqGB0QMa1RY7QtKMn4FKFxvO6dPPv5iS7E9inuYq1k+fUyDFcpODkl0DL
         z8TtrrNH0nN1TNiFRlgSFxuYzuf05Y2gFbSXlRDLkw2UPl82CwSUsIyw+f3pleZgLqKb
         6F0fK3y9OAHaLz6QzVNAXsJdvmePRWROCbBxtWEghiTM0XLEyNMSoflUwUqXLYQDynRE
         2FBrB+qY1a6pPdLiaetU1sl7baT8y/zgQEWXz6GC1aUyfG7a8J2MLTYBblWHhOzjLw7+
         azYQ==
X-Gm-Message-State: AOAM5304xjqKkACqAgbWhLzA5KwWu4m7n43Aj1yutMisDpiwfwDGpnmD
        aOFk/IZGeIoxWN9GaRv/TuTyCw==
X-Google-Smtp-Source: ABdhPJys6pbLabTkeRziK+wc3YsUE7sp3OaYxjUErcU8DVV+dThnk4NTfuDDdx9muo/luGe71Ahcxg==
X-Received: by 2002:a7b:c8cd:0:b0:38e:c2c1:5219 with SMTP id f13-20020a7bc8cd000000b0038ec2c15219mr3731923wml.151.1650037017310;
        Fri, 15 Apr 2022 08:36:57 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc018000000b0038a18068cf5sm8459292wmb.15.2022.04.15.08.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 08:36:56 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: input: mtk-pmic-keys: add MT6359 binding definition
Date:   Fri, 15 Apr 2022 17:36:23 +0200
Message-Id: <20220415153629.1817202-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415153629.1817202-1-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
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

Add binding definition for the support of the MT6359 keyboard driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 9d00f2a8e13a..afe9062a4dc7 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -13,6 +13,7 @@ Required properties:
 	- "mediatek,mt6397-keys"
 	- "mediatek,mt6323-keys"
 	- "mediatek,mt6358-keys"
+	- "mediatek,mt6359-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.35.2

