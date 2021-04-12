Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B3D35C529
	for <lists+linux-input@lfdr.de>; Mon, 12 Apr 2021 13:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240407AbhDLLbL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Apr 2021 07:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240410AbhDLLbL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Apr 2021 07:31:11 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98521C06138D
        for <linux-input@vger.kernel.org>; Mon, 12 Apr 2021 04:30:53 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id u7so4391187plr.6
        for <linux-input@vger.kernel.org>; Mon, 12 Apr 2021 04:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plw2ysi1W+MGJ3Nv2bWluJ2xI5lpxZozWa9eFpnjZ5Q=;
        b=K7b4lhCYYCq3BNYpzasyGmq5uEfqbaqHnLFERlhZ5hqt5p4MVmTq5gwRtf4E/y4XB3
         BVyRaF6lWT/7Z0C5ho+WBuzSevWpH9hvgJEITs5K2HwBiIBfNS5mrFYivE82Bv8ugm/7
         rn47xU+dBy6pU34+rHXd0Bp4nIAt/TiVfyQBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plw2ysi1W+MGJ3Nv2bWluJ2xI5lpxZozWa9eFpnjZ5Q=;
        b=fQtCV+5oKybyEAqw3+6GYyp0cpwY30T6bNxuKyOjTc6g+qwA2hBWPDBOzozEaWghZ8
         ri2r7DwqdSibrOeLi3RUUI1f7wRO4eAMYG4wisGwpQt17PRCe+HXW+shrsHdwKuYvHIQ
         6+BINVCxPucRVCyl4ghyUOW0QVbjgv6RQhHp/0hnZWhOv1JDC4v+qhX/wHtxSY03dbDy
         FFFjGMhBzrt3+txNiNksaM34jqIS98CR/IRbQdEpOsjS+688bzhP6MwW6RvFtvOvEjNT
         DDaAqo65YYnbHaZgSYMujd390JfrR5BGBA+lmmJ1zhAnP0B9ppybuot3SM+d73Lehaq5
         Zd3A==
X-Gm-Message-State: AOAM533YPLWYQwQi9WltmnLfXKgbRTyzHD633hhAwvgwuYiOuUS1FoFU
        xK6vEIfFe5j1Qglq8nP1yMBcBoCGJc/Bcg==
X-Google-Smtp-Source: ABdhPJwT7DYTlzqRpAsyxz1h0QIsVCtFYKwpiPQKZDkGO/R5hzNL7pHVeZUda/idsEfLKTSC3rztmA==
X-Received: by 2002:a17:90a:a103:: with SMTP id s3mr28756864pjp.158.1618227052905;
        Mon, 12 Apr 2021 04:30:52 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:32f1:1e05:984e:e039])
        by smtp.gmail.com with ESMTPSA id 129sm1572413pfv.159.2021.04.12.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 04:30:52 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Dmitry Torokhov <dtor@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] mfd: google,cros-ec: add DT bindings for a baseboard's switch device
Date:   Mon, 12 Apr 2021 19:30:19 +0800
Message-Id: <20210412113020.2724134-2-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210412113020.2724134-1-ikjn@chromium.org>
References: <20210412113020.2724134-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is for ChromeOS tablets which have a 'cros_cbas' switch device
in the "Whiskers" base board. This device can be instantiated only by
device tree on ARM platforms. ChromeOS EC doesn't provide a way to
probe the device.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

Changes in v4:
Define cros-cbase bindings inside google,cros-ec.yaml instead of
a seperated binding document.

 .../devicetree/bindings/mfd/google,cros-ec.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 76bf16ee27ec..c76809cd9f7f 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -127,6 +127,18 @@ patternProperties:
     type: object
     $ref: "/schemas/extcon/extcon-usbc-cros-ec.yaml#"
 
+  "^cbas$":
+    type: object
+    properties:
+      compatible:
+        const: google,cros-cbas
+    required:
+      - compatible
+    additionalProperties: false
+    description:
+      This device is used to signal when a detachable base is attached
+      to a Chrome OS tablet.
+
 required:
   - compatible
 
@@ -180,6 +192,10 @@ examples:
             interrupts = <99 0>;
             interrupt-parent = <&gpio7>;
             spi-max-frequency = <5000000>;
+
+            base_detection: cbas {
+                compatible = "google,cros-cbas";
+            };
         };
     };
 
-- 
2.31.1.295.g9ea45b61b8-goog

