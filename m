Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC4806EF6AE
	for <lists+linux-input@lfdr.de>; Wed, 26 Apr 2023 16:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241480AbjDZOov (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Apr 2023 10:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241484AbjDZOon (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Apr 2023 10:44:43 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C056872B4
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 07:44:41 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-63b5465fb99so5995679b3a.1
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682520281; x=1685112281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMx52XrqJI/lkSS1akmRczc5aEbg1BtnIjYD6cH52u8=;
        b=F91dapaZh/JVWjuQtDJodQztlL98yiEx4kYIDCxP4Mk0I/lkQ2G5L4dBr6bLELESx/
         vvHmStLQPZXLg8Ifj2mb3/SVQJ5Y/ZlwxynDVlrhes5pGa97XuaU5Lw8uQ71dccoS4YT
         SB5JXG7eTFanP0Dzp+JpYeLIwiaFta1xOhPAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682520281; x=1685112281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMx52XrqJI/lkSS1akmRczc5aEbg1BtnIjYD6cH52u8=;
        b=k7RgVrZEk+WRUanhiLQJqp5BQLZiiR+hPp+v4EmnjEbABstkdZMMYda61Ie24h1Y1p
         qGVo2mBA25uJUPtDlXamrxXjJ/0Xpf61Mbhl3b6ha6JJSeU+Tto41ZXN15uaWZj4pzhK
         bCMU3iiN7IpB6wFOO9jWDJT5znuCEFwvoUy3cYKvwt3OaVbZ9acPTvXtxvkKcbmS3fDK
         j2Ya6Z1dAC5nXiUXcIblMOvD+me/twyyAVpgEYZtl/YiZll5PGGyBrADOGBwB+ZVVdlt
         mGLf4lP2A0w1WsJ7dH9x/3GcojqLkUAJVam1a8lIBtFGAklszUTpaGCwZ6C0ZSfDXSSD
         yttg==
X-Gm-Message-State: AAQBX9cune4De/1oQkPzEBzkjrXeu7GqMNuLO87t2JrSRQkCaXrLnsDE
        5ppXzAdc5RiiO6DdP8FY1r9sag==
X-Google-Smtp-Source: AKy350YHKPdB0cD+iLdEEgdjKOEmIZB2krvhGetLkbFmx30LTATpiGYRXuiXoO70s1nsDAjFe3+khA==
X-Received: by 2002:a05:6a21:6d96:b0:f4:3934:96b0 with SMTP id wl22-20020a056a216d9600b000f4393496b0mr15771936pzb.37.1682520281201;
        Wed, 26 Apr 2023 07:44:41 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id f17-20020a631011000000b00502f20aa4desm8750495pgl.70.2023.04.26.07.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:44:40 -0700 (PDT)
From:   Fei Shao <fshao@chromium.org>
To:     Jeff LaBundy <jeff@labundy.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-mediatek <linux-mediatek@lists.infradead.org>,
        Fei Shao <fshao@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend" property
Date:   Wed, 26 Apr 2023 22:44:21 +0800
Message-ID: <20230426144423.2820826-2-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
In-Reply-To: <20230426144423.2820826-1-fshao@chromium.org>
References: <20230426144423.2820826-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

To address that, we add this property to skip reset during suspend.
If it's set, the driver will stop asserting the reset GPIO during
power-down. Refer to the comments in the driver for details.

Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---

(no changes since v2)

Changes in v2:
- Use a more accurate property name and with "goodix," prefix.

 .../devicetree/bindings/input/goodix,gt7375p.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index ce18d7dadae2..1edad1da1196 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -43,6 +43,15 @@ properties:
       itself as long as it allows the main board to make signals compatible
       with what the touchscreen is expecting for its IO rails.
 
+  goodix,no-reset-during-suspend:
+    description:
+      Set this to true to enforce the driver to not assert the reset GPIO
+      during suspend.
+      Due to potential touchscreen hardware flaw, back-powering could happen in
+      suspend if the power supply is on and with active-low reset GPIO asserted.
+      This property is used to avoid the back-powering issue.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.40.1.495.gc816e09b53d-goog

