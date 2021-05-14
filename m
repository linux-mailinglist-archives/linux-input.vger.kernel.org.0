Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9966538091A
	for <lists+linux-input@lfdr.de>; Fri, 14 May 2021 14:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbhENMGZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 May 2021 08:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232710AbhENMGZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 May 2021 08:06:25 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6908CC06174A
        for <linux-input@vger.kernel.org>; Fri, 14 May 2021 05:05:14 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so548304pjt.1
        for <linux-input@vger.kernel.org>; Fri, 14 May 2021 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ESz1m+xFUF72VscU5fWkJoT2mNgqOdvTW7GhFogGpow=;
        b=jlLMKB+F/SNGEYmoZGhZ5YtkM3COzY94C5Ivz+iYkjUmqI2lLnk4k6ZlSvm1tbAFrL
         4CatoS/pHf+J0nmYUQ2qGObJ35+qtUdDEGjYQ6dR2xuafEBAbonWclGOYfp4TScaZDyE
         RVxAypldZSDnc6ZJnYTa89lgL8Lu1GIg4vkpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ESz1m+xFUF72VscU5fWkJoT2mNgqOdvTW7GhFogGpow=;
        b=jWKaThFxUi8u9NjM+K0UDrmcTueg0VxF9DTZqSSFjslrnwhy2ckwRlf7sQ0cqM2e2f
         +EJYyANcT8E9gd6k1RH+msPhy+9tHWQONtyGI4v+EkRYTjSgtaU9UIo9IUXL6BGAI2j7
         s+lV6O0spUuJxNd8v1jGbXTXrVqUUfDI9M80whs+D+zIJtUt/UEyqTZ8xuag/7Jhy07F
         ePxY7YX8IzPq6zYbfR87nYziVCUkv5YOUD5qWjrUjBt92jcaLD1c0NgV4E0EoY35Q9yK
         0KkedEfxyA91JvrLiF8cMaKNf/3yEQ2V8jGP+eDu7QHzQgS2UEvQB1rtilq04fL11Srv
         arXQ==
X-Gm-Message-State: AOAM532TABNeYZZiGqK8k/+oCWpFA4QpuYgAg6YZJG1ytO5SkKUUxGiw
        L8ni+wtaFbMuc8j7+524cJ12Gw==
X-Google-Smtp-Source: ABdhPJxqR+M96mho41Ct8cnfTqOd9Wenm8xCKMaP6Cs7rBEAt2Gh3Wb8X7EhF1DQX9+x5g4tQFQzHw==
X-Received: by 2002:a17:90a:c217:: with SMTP id e23mr10653652pjt.43.1620993913826;
        Fri, 14 May 2021 05:05:13 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:7641:4b1d:694e:6ea2])
        by smtp.gmail.com with ESMTPSA id q24sm4117786pgb.19.2021.05.14.05.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 05:05:13 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     Stephen Boyd <sboyd@chromium.org>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 1/2] mfd: google,cros-ec: add DT bindings for a baseboard's switch device
Date:   Fri, 14 May 2021 20:05:05 +0800
Message-Id: <20210514120506.264838-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
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
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

---

Changes in v7:
 - no changes from v6

Changes in v6:
 - Remove a label for cbas node in a example

Changes in v5:
 - Add missing blank lines and change the description property's position.
 - Add a note to description: "this device cannot be detected at runtime."

Changes in v4:
 - Define cros-cbase bindings inside google,cros-ec.yaml instead of
   a separated binding document.

 .../bindings/mfd/google,cros-ec.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 76bf16ee27ec..929c17552d8b 100644
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
+            cbas {
+                compatible = "google,cros-cbas";
+            };
         };
     };
 
-- 
2.31.1.751.gd2f1c929bd-goog

