Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3855637BA0B
	for <lists+linux-input@lfdr.de>; Wed, 12 May 2021 12:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhELKJq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 May 2021 06:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbhELKJq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 May 2021 06:09:46 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD302C06174A
        for <linux-input@vger.kernel.org>; Wed, 12 May 2021 03:08:37 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id b21so11051262pft.10
        for <linux-input@vger.kernel.org>; Wed, 12 May 2021 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kZgjstHOYROHTT7vT6IiQEY3IT65wMZE5r7tRuaAKfk=;
        b=oIjOZtMNkRnY/ZbSuRC1GuQVbWrSsC8CR9YJWVkrafcQiuM6f36qbzdrYp5Qsog/S+
         LuFcXwmdiXHxqQ32iQSNo+FFu4KyoaFcuBSnMo5f7GoQmgowVYLQHtd/HFWTLiA1sovK
         eD4NUMeax/ib7ahf6XVp++kRKX1j+AeoArlx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kZgjstHOYROHTT7vT6IiQEY3IT65wMZE5r7tRuaAKfk=;
        b=buD1wzxfjiMYto2eGek1RvymqhN3Q5l+FwNOF/ic01gP/23bVikxBQsdxf2IR+MK1F
         Df+886lKhi9f3/BJI50A2+dwkSYX9KA+FwIWLmrtVne/CUOIZUkwOV2C+OW3fpTDlPHW
         K55Mh3V2bmI05tNPjQ10oTPVj5Rl1giQ7uahwg/mV4RMgsV0jDY52cEievusCT2W73oz
         JuM8pr0pCmcXu7SeiVCMG4TUVcaslpzdBj7jkja5CTDdlfrZLK3AJhGEo1fhnhnvhv5d
         HTVMx3Wj7G/izXqEbjrAp7hX2SMaIBa8ttlLShYZYNYjN495OaMWgzL7sah9GkvlfJua
         FOXg==
X-Gm-Message-State: AOAM531IQYYkg/R84EHEOG5Zge+5fyTABOhB1SaV7QQKrpfQd6QS/i06
        ulZ6zlsdPhZ3sesd5is4jmTAug==
X-Google-Smtp-Source: ABdhPJyHBs4vGbem7nSqycxt02ZAcG6NKtziRpLT4qcqxjo4mtcGAGrO250A304B4NkZPuRmRaZtWQ==
X-Received: by 2002:a65:60da:: with SMTP id r26mr16206280pgv.133.1620814117422;
        Wed, 12 May 2021 03:08:37 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:2e82:bfc3:6037:8e16])
        by smtp.gmail.com with ESMTPSA id o12sm15619919pjr.43.2021.05.12.03.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 03:08:37 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>, Ikjoon Jang <ikjn@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v6] mfd: google,cros-ec: add DT bindings for a baseboard's switch device
Date:   Wed, 12 May 2021 18:08:31 +0800
Message-Id: <20210512100832.3878138-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210415032958.740233-2-ikjn@chromium.org>
References: <20210415032958.740233-2-ikjn@chromium.org>
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

Changes in v6:
 - Remove a label from cbas node in an example

Changes in v5:
 - Add missing blank lines and change the description property's position.
 - Add a note to description: "this device cannot be detected at runtime."

Changes in v4:
Define cros-cbase bindings inside google,cros-ec.yaml instead of
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
2.31.1.607.g51e8a6a459-goog

