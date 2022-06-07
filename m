Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF9D053FA80
	for <lists+linux-input@lfdr.de>; Tue,  7 Jun 2022 11:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240251AbiFGJ4M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jun 2022 05:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240229AbiFGJ4K (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jun 2022 05:56:10 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F55E8B88
        for <linux-input@vger.kernel.org>; Tue,  7 Jun 2022 02:56:07 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id m26so11949806wrb.4
        for <linux-input@vger.kernel.org>; Tue, 07 Jun 2022 02:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TyZtZSd5cTSSlPOn3/pu61X0lFqS8ubq/VPK6S5b8ro=;
        b=JQ6j73pVrChcMUfBmFTaW+tQL8dGlAue9g7Vy1Gh1LGNIv9slhQXKZt6bqLGiXUoO+
         tAqrctpEgedxjUbGVCe+6ypZTVpS5H6OohVCSyDiW+FGKNrcE5W8kR/Ks9HH+hAAMuHQ
         pAt9hK30UNk4kLLKiU+I+LoEJeKW2Byd9zb7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TyZtZSd5cTSSlPOn3/pu61X0lFqS8ubq/VPK6S5b8ro=;
        b=bxLNxmHsXXLmh1NoYkSjH47zQsKwMiJcVx4KlmHTYtHyJ87um8IBZUYcCWUumQB5+w
         yqCX11AY7gq8ew00cvPECJDSr7gm/V9/cNk06ns20XGdtBTqxfUgnr0O5uHBIR2oNdgF
         46lBDYPXxMQa3Q8aLH4b6u02kbDnk0v5FMvT1XpGOwHsY/h7hoCelOKW3Qw5B/MshK4f
         TuAQvMi8lcIn5Hza3h79zzMvD3GZz08ggRZ2Pr2xaCQbP9ax5Q3B4Nkmy/e5o+d0/oru
         dRyMJyQVDr4f16lsqvR6F2FH52MSqA45IVSUxqL3Icivs2x6Ab/GfS/f5RZr6/GzkK+l
         Y3tw==
X-Gm-Message-State: AOAM530L8zzctuXoxrDx85FWHF/bdmIkRaDt0dvY+oTEKig4v/b/1hPC
        GZQiMZj1Z/VDPctaMeR0u8fX9g==
X-Google-Smtp-Source: ABdhPJwTO1eSqVr5nYBS189a8PJucH9UV7iuGDV14lq8IyEv6Zcrj6lX7LEEtA/G9JPuvGNhSxHXjQ==
X-Received: by 2002:a5d:4849:0:b0:218:3f35:5336 with SMTP id n9-20020a5d4849000000b002183f355336mr9201071wrs.26.1654595765655;
        Tue, 07 Jun 2022 02:56:05 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (mob-5-90-137-51.net.vodafone.it. [5.90.137.51])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d4b8c000000b0020feb9c44c2sm17693546wrt.20.2022.06.07.02.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:56:05 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 1/6] dt-bindings: input: touchscreen: edt-ft5x06: add report-rate-hz
Date:   Tue,  7 Jun 2022 11:55:51 +0200
Message-Id: <20220607095556.1034338-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220607095556.1034338-1-dario.binacchi@amarulasolutions.com>
References: <20220607095556.1034338-1-dario.binacchi@amarulasolutions.com>
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

It allows to change the M06/M12 default scan rate.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes in v4:
- Add Rob Herring 'Acked-by' tag.

Changes in v3:
- Add hz unit suffix.
- Add '|' to description.

 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 2e8da7470513..46bc8c028fe6 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -85,6 +85,14 @@ properties:
     minimum: 0
     maximum: 80
 
+  report-rate-hz:
+    description: |
+                 Allows setting the scan rate in Hertz.
+                  M06 supports range from 30 to 140 Hz.
+                  M12 supports range from 1 to 255 Hz.
+    minimum: 1
+    maximum: 255
+
   touchscreen-size-x: true
   touchscreen-size-y: true
   touchscreen-fuzz-x: true
-- 
2.32.0

