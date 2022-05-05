Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91A0451C458
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 17:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381466AbiEEQAZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 12:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381477AbiEEQAX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 12:00:23 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B3C59333
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 08:56:42 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id j6so9536072ejc.13
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 08:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TyZtZSd5cTSSlPOn3/pu61X0lFqS8ubq/VPK6S5b8ro=;
        b=CRCS3neJpFjGIowCVt0x91jnPy3Sh1dyCvNjbuisczZPX9DpbE8905wjJY+54Jn6ig
         5gZbkvCxu1FlgxulT+mFCuRSMTbTJVIw8UeVH2oOzdPOx8CigjLmxl7Wwx81+shR6hOO
         BvJu6yoCZOUod4ARpSmFzS1cNg1wetzG8qpUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TyZtZSd5cTSSlPOn3/pu61X0lFqS8ubq/VPK6S5b8ro=;
        b=Lk8NBnu17l9iZh6xWqYiYQP6l3XgVbxBY3P1gYlU7OVpzTS9T9ixKClGcOOG4dfDEU
         UbxdB09WJRoURdiXMd+zHTG6sqiw6bL1bbJGLEbCsb4br5Frr6Vp9T0uZQMC3U0x0zhV
         419N5jKgsywe08iypypsr9NIKUYK8ZeHUfC/k9559E9oukJ1VR1WeYl0b1SOWgIbX5iW
         NgPVpIo7nEpyrcLBTUsWsU0R9z9zcXQnqf/QFtBXuObNLtW+aJBpuaRTNRutBCNtx/2m
         GKpazrDjOqXwzLaw48DB7c2+7IhvPuJCNiKA4LT0C0xVR6qTuKwkr4UTSzciIF8IM4sP
         OUjg==
X-Gm-Message-State: AOAM531zRcPDIygw8iGU7YomY6xuLu0Qtc2ph4DYq5hSikMavGRe2G9n
        QNWfTrNsCIB8gLuF4hVkQcSrOHTrD21P9A==
X-Google-Smtp-Source: ABdhPJzQ91SrEr4jqIJlYh5c4uaHTjIvA/8NnPhZ9OV82WfQE8Lb/8Yeh7BaCWjdlQVRd/NbvLG/zA==
X-Received: by 2002:a17:906:6d91:b0:6f4:5433:72f5 with SMTP id h17-20020a1709066d9100b006f4543372f5mr19493466ejt.414.1651766201412;
        Thu, 05 May 2022 08:56:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d904000000b0042617ba6385sm1009328edr.15.2022.05.05.08.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 08:56:40 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 1/6] dt-bindings: input: touchscreen: edt-ft5x06: add report-rate-hz
Date:   Thu,  5 May 2022 17:56:30 +0200
Message-Id: <20220505155635.419653-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505155635.419653-1-dario.binacchi@amarulasolutions.com>
References: <20220505155635.419653-1-dario.binacchi@amarulasolutions.com>
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

