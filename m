Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04B476E64A6
	for <lists+linux-input@lfdr.de>; Tue, 18 Apr 2023 14:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbjDRMvQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Apr 2023 08:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbjDRMvP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Apr 2023 08:51:15 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351BC16B21
        for <linux-input@vger.kernel.org>; Tue, 18 Apr 2023 05:50:53 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63b5fca48bcso1709371b3a.0
        for <linux-input@vger.kernel.org>; Tue, 18 Apr 2023 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681822252; x=1684414252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4OHoFWLVHVOU1gGJFIZyvFQwj4I/n5rmO4u4kQqp5s=;
        b=NaZDAMGrk+xiKbfMXkfc+hiiltFD0LlTuSqiIbDBkpzWQgLVSgj/O48zJ7VMGlzp68
         pCDOEKpcmGwFU7dSgwQqjWorn5Z13vwzcfdi34+M2L5EwoQEbckdcNX1V9iuSn4j74qB
         2IMNQfjqpLvm8WWUqmBcV11cHsW5gXqch7xqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681822252; x=1684414252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4OHoFWLVHVOU1gGJFIZyvFQwj4I/n5rmO4u4kQqp5s=;
        b=dtQNtkurTw2eePdMhYXpg64daDMyft29HkcZs/+ytHs7RYDplKI1sTWWOcUAF/UXjd
         xhJcTHmkWDge81IkutzHeKo/aDRKAZy0ry1L19xh/SVWzZIze6mhoDWRAczuT+b30xcH
         tQKLtUNqBEN0zLe5/tqF2MalrMuNyEgRqWgS8duEGdbl0YX7TdAMpdCOymqHwanLIbjW
         m4a7lFrTh5U4qR+QFyGOhqths7HvYCNo+H+megjVY1/LWqPlt8QKqh3+KkP7LTDvbH+y
         o7sHWY12Cf/gASxhkZkazMCajUKmRF1RueOzO2Ki2L2cpn1Wd/l9Vgy+VM3oWmqOV5Jr
         HKaQ==
X-Gm-Message-State: AAQBX9dVF0JygbDB2n+ySZD0eEL57+8W/veC7tIPRIz9aEL4CMz271IA
        w+XpoZSc8S/MrlLtREflBnyi6Q==
X-Google-Smtp-Source: AKy350YD/mHUZFPaUut90TfJLzOLDCDlzOufYyFO14OjgVg1t2eEm+ULWpBI96mTSUIsyi0jY51ohg==
X-Received: by 2002:a05:6a00:1483:b0:638:f0b1:4df1 with SMTP id v3-20020a056a00148300b00638f0b14df1mr25744364pfu.24.1681822252585;
        Tue, 18 Apr 2023 05:50:52 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:2fb7:301d:6083:752b])
        by smtp.gmail.com with ESMTPSA id v11-20020a62a50b000000b0063afb08afeesm9323733pfm.67.2023.04.18.05.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 05:50:52 -0700 (PDT)
From:   Fei Shao <fshao@chromium.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-mediatek <linux-mediatek@lists.infradead.org>,
        Fei Shao <fshao@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend property
Date:   Tue, 18 Apr 2023 20:49:51 +0800
Message-ID: <20230418124953.3170028-2-fshao@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230418124953.3170028-1-fshao@chromium.org>
References: <20230418124953.3170028-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We observed that on Chromebook device Steelix, if Goodix GT7375P
touchscreen is powered in suspend (because, for example, it connects to
an always-on regulator) and with the reset GPIO asserted, it will
introduce about 14mW power leakage.

This property is used to indicate that the touchscreen is powered in
suspend. If it's set, the driver will stop asserting the reset GPIO in
power-down, and it will do it in power-up instead to ensure that the
state is always reset after resuming.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index ce18d7dadae2..942acb286d77 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -43,6 +43,12 @@ properties:
       itself as long as it allows the main board to make signals compatible
       with what the touchscreen is expecting for its IO rails.
 
+  powered-in-suspend:
+    description:
+      This indicates that the touchscreen is powered in suspend, so the driver
+      will not assert the reset GPIO in power-down to prevent power leakage.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.40.0.634.g4ca3ef3211-goog

