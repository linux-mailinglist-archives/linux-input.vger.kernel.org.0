Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA2F4D76E7
	for <lists+linux-input@lfdr.de>; Sun, 13 Mar 2022 17:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235056AbiCMQga (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Mar 2022 12:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233827AbiCMQg3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Mar 2022 12:36:29 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D272CCBA
        for <linux-input@vger.kernel.org>; Sun, 13 Mar 2022 09:35:16 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id yy13so29192810ejb.2
        for <linux-input@vger.kernel.org>; Sun, 13 Mar 2022 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wyIELtQTCl+VPY6+JbFB6MkwcDo+lB1ZIE+4K4ki9U8=;
        b=VKH47+HpvvdnNGuyxMKR+SRsFItKVu02Ns44CVytgr1FywMPrSNnQAYZSarHRkGtjj
         Y9vhyumZvigyQNsl3IZ4SmNU+wAqd59VSf8oXFcd2l3IIHP2zyJ8drrFtQFj3HLggpH7
         TUvNzaMdh0i+q4W7ef0Go3qVCKMUzaGOXRy+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wyIELtQTCl+VPY6+JbFB6MkwcDo+lB1ZIE+4K4ki9U8=;
        b=KBTBny6WAPVdK3YPZall/WTmiA+ohu/EbDafJQc9Z2z+bB5qYKs3rV90agRansmfbN
         /QYSEqXYifDI4y76vBgFY+wWGdaq3RIRkJo38BIxFlh2AYPgtE3gS7xGv7sW6hxnRb5P
         +GN8QNpWeC9KkGM+1XrsRsztD6jTF1lxSyldV4bMIrnwjQ1CVevyWmBCQwaMe8RuOQRb
         G3G3bq2NM/F6hfWCwdxjKkvI9/RSwejOVftwAOP6o80+Nx9KRSw3XdKZt4bBWSLDTaZb
         TL+TKkkOVSrQqSRjGrP1/J37A6JywTMdRahbVAQqRLM+G2x6Rk9Nvt+nCdhb964WNrZR
         //4Q==
X-Gm-Message-State: AOAM532VP/GHPt4vRGU+WarJCzc18P/lF52OujP7hsy0RGZuihCYfzPn
        MMtMpl1rbOLMoUoL20eRb8cDRw==
X-Google-Smtp-Source: ABdhPJxY+k8xdwzX/qU+LdqCnlCbhreG3rRA9h0T/J1qqkNNsgCe/5XhQEbuGfoQMKlnBmjtN/nUOg==
X-Received: by 2002:a17:906:3ec7:b0:6d6:e52b:b with SMTP id d7-20020a1709063ec700b006d6e52b000bmr15473905ejj.521.1647189314941;
        Sun, 13 Mar 2022 09:35:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id qt22-20020a170906ecf600b006da6ef9b820sm5725028ejb.112.2022.03.13.09.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 09:35:14 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: input: touchscreen: edt-ft5x06: add report-rate-hz
Date:   Sun, 13 Mar 2022 17:34:58 +0100
Message-Id: <20220313163503.5183-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220313163503.5183-1-dario.binacchi@amarulasolutions.com>
References: <20220313163503.5183-1-dario.binacchi@amarulasolutions.com>
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

---

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

