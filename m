Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2C636007D
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 05:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhDODak (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 23:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhDODae (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 23:30:34 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63A3C061760
        for <linux-input@vger.kernel.org>; Wed, 14 Apr 2021 20:30:08 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id w6so603237pfc.8
        for <linux-input@vger.kernel.org>; Wed, 14 Apr 2021 20:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AqTCmxCVXgLJsXqXTluosraXffm24ijyPJ7oIm03HUg=;
        b=hTv5o9+BrrE9EjC5denORW74HCF/42J7he8+Mx0uWBZ3C28CT6ebw/hsjvDuB+UF9A
         zjmO6Nuw3ItN1cnh/p3RQDlGkYcPyIpKofML84pTYZQQkU8drprtOTub7CrBOOHilPlf
         JkFisLLIsgX+NBMhogntTdF3kDl0Su9WJKXJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AqTCmxCVXgLJsXqXTluosraXffm24ijyPJ7oIm03HUg=;
        b=JRF/OPveLQ7Y0NYbf16aaWGfM6ONR2pAyMtmlhqHsh7LWx5wgCVcqh+saC3481Vkp8
         ZWZR4yr2agTbniNOQAQSqV8hjm6249DPUwp3jfLYiBz73p4s2PcvFGRC+r9EauRwxgg9
         1VcN0EAeEVC/q5XOwXkgnBfZ1GZ4F8KXsAZJoKgWGGtWb1xD6suEMxbVBJhpnAq3WKFt
         Ih304Bl8m+/rjswLfLVRvssmzioDwQn88SE6Er6SIN4nnxVqlx+SvUZOuA5tbKn3x4tI
         3lFzY9ukwlt5NIxd4H5/fYgDJZL9FgtMhf0Z5M6r8yhNv6hsx2+bqBxnJt+kwOukNl16
         20zQ==
X-Gm-Message-State: AOAM532JXAsu2KCmDAeEC96hHQ0XvTP+1qcYW9lhkGOFTY2JXs3GNDIQ
        qRjsNjb19wXfwJBDG0VhQkUT7g4vuinjBg==
X-Google-Smtp-Source: ABdhPJzWZIDaJ7ZCMyQwwmkIH+E2r8i72JxGRuxVcUtvX0FJErfjLa8ExIklqYcWRBEqZgfChLrvhQ==
X-Received: by 2002:aa7:8d84:0:b029:1f8:3449:1bc6 with SMTP id i4-20020aa78d840000b02901f834491bc6mr1262712pfr.76.1618457408048;
        Wed, 14 Apr 2021 20:30:08 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:2d50:863d:8932:d6bc])
        by smtp.gmail.com with ESMTPSA id n3sm351622pga.92.2021.04.14.20.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 20:30:07 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dtor@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] mfd: google,cros-ec: add DT bindings for a baseboard's switch device
Date:   Thu, 15 Apr 2021 11:29:57 +0800
Message-Id: <20210415032958.740233-2-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210415032958.740233-1-ikjn@chromium.org>
References: <20210415032958.740233-1-ikjn@chromium.org>
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

Changes in v5:
 - Add missing blank lines and change the description property's position.
 - Add a note to description: "this device cannot be detected at runtime."

Changes in v4:
Define cros-cbase bindings inside google,cros-ec.yaml instead of
a separated binding document.

 .../bindings/mfd/google,cros-ec.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 76bf16ee27ec..8dcce176b72e 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -114,6 +114,22 @@ properties:
       - "#address-cells"
       - "#size-cells"
 
+  cbas:
+    type: object
+
+    description:
+      This device is used to signal when a detachable base is attached
+      to a Chrome OS tablet. This device cannot be detected at runtime.
+
+    properties:
+      compatible:
+        const: google,cros-cbas
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
 patternProperties:
   "^i2c-tunnel[0-9]*$":
     type: object
@@ -180,6 +196,10 @@ examples:
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

