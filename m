Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7073A2F869F
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 21:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbhAOUZQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jan 2021 15:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbhAOUZQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jan 2021 15:25:16 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDBCC061794
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 12:24:35 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id y12so5711711pji.1
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 12:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Jy+sRCJHRiWM+ceRz2fikqssAZSpSpfI/4rqhLv5UY=;
        b=n+Ld6svog4T0o5pSqW43F4jUz1pZUfMnLmN+tPe4fjsQMhErj5dRDk5ofxhWBLA80s
         W8V9udmZoWB9o3Y2IPT4NNk7mntgXgIE8henc7cLzSnj2i1OCWLBsAkqUB5OOTpLrFgl
         hl4xJb5zZwtYkN2sRyGZVmosr5Up0LXyuHQE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Jy+sRCJHRiWM+ceRz2fikqssAZSpSpfI/4rqhLv5UY=;
        b=k6Ucsa4YFfi9cMtSTkH5tTvnjBQKduE7YAmUifx8p18T7K9NTS8IZhD+Mz1kNh9fTt
         vfpPCcPp9Rh7YHrQqRiS1AhT470TuxhW33G/xPQmfN5aGsEmVlsBfNdL1xPwlmQSDDbv
         4kbp7lJ0Ysw6/o2Q6NhaNWM7kQwRBalRZzNIQoq5QNuKSNXMqIzHHgMrDZi8ZUMeCRru
         hABaWxY2ucreMPL+cLFDQgQttJUP460bLPx5WgEdiuAC2pOMt90eEJApqIp0GGKXr1B/
         wFIL4/auZdfXi8Lkm9+DUtaTUMnbUfDmLXp6uNLektcIyJllQ9djJ9yJabCcHLgdQsWM
         rQ5Q==
X-Gm-Message-State: AOAM533OvhqBF88L/qSwNytm0rvr8qJQvIivDO8aoa4ntNUwwUZwlsfo
        IWYgrj3Sp+p0nnbbSKXjR6hHIQ==
X-Google-Smtp-Source: ABdhPJxfLfEXdoYx9cLDm7u1L3pDYoeIVqRGU+wDlNC9ThyGO+0OPKHSRx/2/3+C3rfVk5z0NFGxtw==
X-Received: by 2002:a17:90a:4d84:: with SMTP id m4mr12524210pjh.145.1610742275062;
        Fri, 15 Jan 2021 12:24:35 -0800 (PST)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fd59])
        by smtp.gmail.com with ESMTPSA id x19sm401097pfp.207.2021.01.15.12.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 12:24:34 -0800 (PST)
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
Subject: [PATCH v7 1/2] dt-bindings: input: cros-ec-keyb: Add a new property
Date:   Fri, 15 Jan 2021 12:24:29 -0800
Message-Id: <20210115122412.v7.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
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

Changes in v7:
- Use MATRIX_KEY macro to describe `function-row-physmap`

Changes in v6:
- remove $ref and add `function-row-physmap` to the example

Changes in v5:
- add minItems and maxItems for `function-row-physmap`

Changes in v2:
- add `function-row-physmap` instead of `google,custom-keyb-top-row`

 .../bindings/input/google,cros-ec-keyb.yaml   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index 8e50c14a9d778..5377b232fa10f 100644
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
 
@@ -38,11 +49,24 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/input/input.h>
     cros-ec-keyb {
         compatible = "google,cros-ec-keyb";
         keypad,num-rows = <8>;
         keypad,num-columns = <13>;
         google,needs-ghost-filter;
+        function-row-physmap = <
+            MATRIX_KEY(0x00, 0x02, 0)   /* T1 */
+            MATRIX_KEY(0x03, 0x02, 0)   /* T2 */
+            MATRIX_KEY(0x02, 0x02, 0)   /* T3 */
+            MATRIX_KEY(0x01, 0x02, 0)   /* T4 */
+            MATRIX_KEY(0x03, 0x04, 0)   /* T5 */
+            MATRIX_KEY(0x02, 0x04, 0)   /* T6 */
+            MATRIX_KEY(0x01, 0x04, 0)   /* T7 */
+            MATRIX_KEY(0x02, 0x09, 0)   /* T8 */
+            MATRIX_KEY(0x01, 0x09, 0)   /* T9 */
+            MATRIX_KEY(0x00, 0x04, 0)   /* T10 */
+        >;
         /*
          * Keymap entries take the form of 0xRRCCKKKK where
          * RR=Row CC=Column KKKK=Key Code
-- 
2.26.2

