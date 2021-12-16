Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5729D4780B6
	for <lists+linux-input@lfdr.de>; Fri, 17 Dec 2021 00:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhLPXgA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 18:36:00 -0500
Received: from finn.gateworks.com ([108.161.129.64]:36180 "EHLO
        finn.localdomain" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229577AbhLPXgA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 18:36:00 -0500
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
        by finn.localdomain with esmtp (Exim 4.93)
        (envelope-from <tharvey@gateworks.com>)
        id 1my0I3-0093bq-Mh; Thu, 16 Dec 2021 23:35:59 +0000
From:   Tim Harvey <tharvey@gateworks.com>
To:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>
Subject: [RFC PATCH 1/3] dt-bindings: Add vendor prefix for DFRobot
Date:   Thu, 16 Dec 2021 15:35:55 -0800
Message-Id: <20211216233557.9393-2-tharvey@gateworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211216233557.9393-1-tharvey@gateworks.com>
References: <20211216233557.9393-1-tharvey@gateworks.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add vendor prefix for DFRobot (http://dfrobot.com)

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a867f7102c35..02ea75bb452d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -293,6 +293,8 @@ patternProperties:
     description: Devantech, Ltd.
   "^dfi,.*":
     description: DFI Inc.
+  "^dfr,.*":
+    description: DFRobot.
   "^dh,.*":
     description: DH electronics GmbH
   "^difrnce,.*":
-- 
2.17.1

