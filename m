Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB7BDE275
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 05:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfJUDCT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 23:02:19 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41616 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbfJUDCT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 23:02:19 -0400
Received: by mail-pg1-f193.google.com with SMTP id t3so6830902pga.8
        for <linux-input@vger.kernel.org>; Sun, 20 Oct 2019 20:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X6S9FvkBoX7c9Y0Hjke4iSmTgg6uvkf7lyNpBmBveR4=;
        b=jqjY5/cRtRPsSQipV6x7w7sJTISINntClKcx3DEiBiEgiApkspaaryjY+sf1sMPpNQ
         3JceZD5RVyRelflxZBQJV09SLFvs2Q5aZ5iD4C9Rls12W+fTcYfxsV9DKKgZol9rlVMJ
         lTN6l0Fkkry/hgn+Vvognph08JVBslE2YM2VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X6S9FvkBoX7c9Y0Hjke4iSmTgg6uvkf7lyNpBmBveR4=;
        b=q8ylZL1k/CFJN9hA6N2bovJzVTLp7hkJzEbO0ZR2TUcWEQ1U/oTLXK+TxuD7Qng0Ea
         kkfLZLVDvAljhxWEKINrIvKRI3eI9bOXvmf7QMu3Vqp+I9dQ8p9j9rG66YxJbjdFVbcQ
         oyea/RiDL1WE111YUGYGXEmmzOd0mhOj/TMdFj0n1OxgvGCKzey9M6eG5uLfQx0yinG+
         IQRXZ80uckS/GuWrg6B+pt+veMYxSVM7A7MFFUaaxLE4QfyMtfJHmuQ9Sl8wXe1Aq6dP
         7SXClO5QLK+sb/VnMh/slD1lPRN8+JTQhtjSuXPDzqiEGUVAKcRypCbraKVsGcLFlIb5
         Nexw==
X-Gm-Message-State: APjAAAUqm5BsValtwwxquh41sDRQr9lOlMhKiBp+7B1D2U/fNF+7nStK
        hQDkzmfP+jVlS3BKWVWrUlov3Gmg/uw=
X-Google-Smtp-Source: APXvYqx6vYSF3nqStjI3axUliugUutPWmW6Gm5SwyKeglqcnXF7BTh2/vo3VqrBkGBJmsaFaKdW1jw==
X-Received: by 2002:a17:90a:dd43:: with SMTP id u3mr26201536pjv.130.1571626938285;
        Sun, 20 Oct 2019 20:02:18 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id j126sm14983542pfb.186.2019.10.20.20.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 20:02:17 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        Nicolas Boitchat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v2 1/2] dt-bindings: input: Add DT bindings for Whiskers switch
Date:   Mon, 21 Oct 2019 11:01:59 +0800
Message-Id: <20191021030158.32464-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the DT binding document for Hammer's TABLET_MODE switch.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 .../devicetree/bindings/input/cros-cbas.yaml  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cros-cbas.yaml

diff --git a/Documentation/devicetree/bindings/input/cros-cbas.yaml b/Documentation/devicetree/bindings/input/cros-cbas.yaml
new file mode 100644
index 000000000000..6a746c4cb266
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/cros-cbas.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/cros-cbas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS Hammer's Base Attached Switch
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+description:
+  On some ChromeOS devices with a foldable variant of Hammer base, SW_TABLET_MODE
+  event should be generated with proper consideration of current device state.
+  This device senses "base attached" signal from EC (Embedded Controller)
+  and generates SW_TABLET_MODE event when Hammer is not attached.
+  The node for this device must be under a cros-ec node like google,cros-ec-spi
+  or google,cros-ec-i2c.
+
+properties:
+  compatible:
+   const: google,cros-cbas
+
+required:
+  - compatible
-- 
2.23.0.866.gb869b98d4c-goog

