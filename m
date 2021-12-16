Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B624780BD
	for <lists+linux-input@lfdr.de>; Fri, 17 Dec 2021 00:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhLPXhZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 18:37:25 -0500
Received: from finn.gateworks.com ([108.161.129.64]:36216 "EHLO
        finn.localdomain" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229755AbhLPXhZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 18:37:25 -0500
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
        by finn.localdomain with esmtp (Exim 4.93)
        (envelope-from <tharvey@gateworks.com>)
        id 1my0Cy-0093am-Mq; Thu, 16 Dec 2021 23:30:44 +0000
From:   Tim Harvey <tharvey@gateworks.com>
To:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [RFC PATCH 1/4] dt-bindings: input: touchscreen: edt-ft5x06: add poll-interval
Date:   Thu, 16 Dec 2021 15:30:38 -0800
Message-Id: <20211216233041.1220-2-tharvey@gateworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211216233041.1220-1-tharvey@gateworks.com>
References: <20211216233041.1220-1-tharvey@gateworks.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some devices might not provide an interrupt line for the touchscreen.
In that case the driver defaults to using a polled interface.

Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 2e8da7470513..a0d4dabf03b8 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -47,6 +47,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  poll-interval:
+    description: Poll interval time in milliseconds, only relevant if no
+                 interrupt was provided.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   reset-gpios:
     maxItems: 1
 
@@ -99,7 +104,6 @@ additionalProperties: false
 required:
   - compatible
   - reg
-  - interrupts
 
 examples:
   - |
-- 
2.17.1

