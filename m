Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF312F7096
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 03:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbhAOCbR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 21:31:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbhAOCbQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 21:31:16 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C33BC061757
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 18:30:36 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id n7so5084215pgg.2
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 18:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M3hi31hXF/amT1aylqDWNav/3iJLAxsSS7aEJf90nIs=;
        b=SKTWV24u583g9PIINb39rtUzEyev0V5rLRMapQFld7HvUAuth/807RAz9XH6v0Zj/3
         LmhQvsTmGbZ0jQnXeZY49kryKsxOlG/EBLocT237XJxMgYIADb84l3nPAzg0zDkGmSSf
         JTrsTb6yU7595x+QBwSQhXc1nQyQYDgQ56dqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M3hi31hXF/amT1aylqDWNav/3iJLAxsSS7aEJf90nIs=;
        b=K3JuvP9b+JRtiQMbqmPlf8/3t5l3NPZ1eytdHsqXRlb7Um512GebG2IVZzHKSKOc3q
         I72IAQGyAA69zLyIzAIlPnf/p0KSLGh1IvTPtOuMr4NsHP5WqJe/HssvW+JN7HFZYDIt
         iKFFdXAyjRm3MDPPHIHyF6hcbnEYAK+P7ZMxgsEKVS2VdQV1fsseXuqWY4RAxyfEdpGf
         JVwhgTKcnK6HLMU7LQOAo/hnivHBHSh+KeTUIY3A5YfBBvpxzZDJsCra/3ypD5kapDfe
         SXnIGTac0QEnLwyD045UToXGWMMksPnBDc2s/1ZKLaT1j2/TIKMvmeOLAV/w4qdqRb2W
         pK7A==
X-Gm-Message-State: AOAM531+RLD229Jw9CXxlDyYkImv8Qr0jZQgKUvbQ6D4LMM7yBPv9+V1
        OzZ/lWN81ArJ/kFwlGIRRqlseA==
X-Google-Smtp-Source: ABdhPJxJqcsm9SWMowTCeOB5TH+nIZIw3iSt9lgffKAXEj+//dBT3/S98stQIugnOxLrcS3sFZPPIw==
X-Received: by 2002:a62:b415:0:b029:1a6:8b06:68f4 with SMTP id h21-20020a62b4150000b02901a68b0668f4mr10698432pfn.43.1610677835761;
        Thu, 14 Jan 2021 18:30:35 -0800 (PST)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fd59])
        by smtp.gmail.com with ESMTPSA id b11sm6046429pjg.27.2021.01.14.18.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 18:30:35 -0800 (PST)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>, dmitry.torokhov@gmail.com
Cc:     swboyd@chromium.org, dianders@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: input: cros-ec-keyb: Add a new property
Date:   Thu, 14 Jan 2021 18:30:30 -0800
Message-Id: <20210114183010.v6.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a new property `function-row-physmap` to the
device tree for the custom keyboard top row design.

The property describes the rows/columns of the top row keys
from left to right.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

Changes in v6:
- remove $ref and add `function-row-physmap` to the example

Changes in v5:
- add minItems and maxItems for `function-row-physmap`

Changes in v2:
- add `function-row-physmap` instead of `google,custom-keyb-top-row`

 .../bindings/input/google,cros-ec-keyb.yaml   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index 8e50c14a9d778..a742b0777ee6d 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -31,6 +31,17 @@ properties:
       if the EC does not have its own logic or hardware for this.
     type: boolean
 
+  function-row-physmap:
+    minItems: 1
+    maxItems: 15
+    description: |
+      An ordered u32 array describing the rows/columns (in the scan matrix)
+      of top row keys from physical left (KEY_F1) to right. Each entry
+      encodes the row/column as:
+      (((row) & 0xFF) << 24) | (((column) & 0xFF) << 16)
+      where the lower 16 bits are reserved. This property is specified only
+      when the keyboard has a custom design for the top row keys.
+
 required:
   - compatible
 
@@ -43,6 +54,18 @@ examples:
         keypad,num-rows = <8>;
         keypad,num-columns = <13>;
         google,needs-ghost-filter;
+        function-row-physmap = <
+                0x00020000      /* T1 */
+                0x03020000      /* T2 */
+                0x02020000      /* T3 */
+                0x01020000      /* T4 */
+                0x03040000      /* T5 */
+                0x02040000      /* T6 */
+                0x01040000      /* T7 */
+                0x02090000      /* T8 */
+                0x01090000      /* T9 */
+                0x00040000      /* T10 */
+        >;
         /*
          * Keymap entries take the form of 0xRRCCKKKK where
          * RR=Row CC=Column KKKK=Key Code
-- 
2.26.2

