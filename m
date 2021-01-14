Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3892F5623
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 02:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbhANBm2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 20:42:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727945AbhANBm2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 20:42:28 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14521C061786
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 17:25:19 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id j13so2298232pjz.3
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 17:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JUUWLh/FNK3F0sgi880UceWHgzM8J4m+gkpp1DTJZ2M=;
        b=MuOEK8WfCL9YKsZi8iwmR4D5ghZgnc1kXQ5uaN9wCHI8LaFCwJ3GGH3LxOm5jHvX9p
         3NQMR/DZb44f3CQFSxFM7R1igdI5uz46xFlt/ZsZHJkeGqoDIjM8uhnxMg45Vr1fJ/Uz
         4YSFmLSE8a0mjGDoBDT1m/FxeEvaspjaWXUTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JUUWLh/FNK3F0sgi880UceWHgzM8J4m+gkpp1DTJZ2M=;
        b=Kz0P9m7oTskVkuoNL8mw82KMKc4ngI289q2LGl794csCVmYvz4tpfAGggraAuSm+gl
         emu92rtJFYp9pbfE9NLjubU7AqWjRtuDzQG7/jX3M4GKskLSPns5gb8nQAVPsCgnOMar
         0nCt016/mfXEr4QRGR8sTLOfCUrBTQacdoLAbr5Ibk+OqeOK4ODjVBCN9XUiR4rlLqxh
         cN36ued+xCTxFhvuf04ck3L4ZC80q96C0KRfIcw1UnXjLZTKzCn3IBJ1i7ejwik2ERmJ
         QPxN5x7KJb4PLJ9Vya8SIqsOmgJPa1UIxy+dh+YgMJOQ186eWZSXtGL4DzxdaZEXdG41
         2dEQ==
X-Gm-Message-State: AOAM53378Gh7hFMGFvz0RKWz2t68a+UyYLEnuVB77juGRRDU1W8EFhoH
        Ra6qFshulPhDDTj3ywF/0KPU5w==
X-Google-Smtp-Source: ABdhPJyQ18bA9094rP3M8AhElK5E2LPj18h89tEVmY4bjgqey79H3nl8KiJdN2eZRo40znR6vLf73Q==
X-Received: by 2002:a17:902:6903:b029:da:f458:798c with SMTP id j3-20020a1709026903b02900daf458798cmr5019315plk.68.1610587518594;
        Wed, 13 Jan 2021 17:25:18 -0800 (PST)
Received: from philipchen.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fd59])
        by smtp.gmail.com with ESMTPSA id w90sm3782703pjw.10.2021.01.13.17.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 17:25:18 -0800 (PST)
From:   Philip Chen <philipchen@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>, dmitry.torokhov@gmail.com
Cc:     dianders@chromium.org, swboyd@chromium.org,
        Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: input: cros-ec-keyb: Add a new property
Date:   Wed, 13 Jan 2021 17:25:12 -0800
Message-Id: <20210113172450.v5.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds a new property `function-row-physmap` to the
device tree for the custom keyboard top row design.

The property describes the rows/columns of the top row keys
from left to right.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

Changes in v5:
- add minItems and maxItems for `function-row-physmap`

Changes in v2:
- add `function-row-physmap` instead of `google,custom-keyb-top-row`

 .../bindings/input/google,cros-ec-keyb.yaml          | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index 8e50c14a9d778..e573ef3e58b65 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -31,6 +31,18 @@ properties:
       if the EC does not have its own logic or hardware for this.
     type: boolean
 
+  function-row-physmap:
+    $ref: '/schemas/types.yaml#/definitions/uint32-array'
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
 
-- 
2.26.2

