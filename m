Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD8E35E1CD
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 16:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344710AbhDMOpR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 10:45:17 -0400
Received: from smtpcmd15177.aruba.it ([62.149.156.177]:37619 "EHLO
        smtpcmd15177.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344702AbhDMOpK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 10:45:10 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id WKHXlmrLILwkNWKHYlJXtJ; Tue, 13 Apr 2021 16:44:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618325088; bh=gSZfGhiygZJU0oDrxMa87zhzk7OR1P7/Tw2HbQiKLs4=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=d0m0lI9d3MLjyJ5jYBvfSYWP+WmEL2ToUEVoTLRbOttI+SWRRJ8xOY3SKHeweCSbx
         jXwog/nf+Ahol6utAlukLqrSEd5M/mLyy8kYdS5tJ2ymlYAxPXTvDtxBElIn9l0L47
         AMx5nkVD3EjqZFFjB7lUQn3B2WU71x42bixS17r4GPV84FrkDr7KZSrfrHkc2t05e2
         j81/l3ZPXxqEaho88Licz8FYFJ1W0MJaOHjhrjJIJZAV5ERfktY4gEl8rj/5dY4cS5
         h5ndV1vsfQGERgHsdk4Q9HTZwGMkerLdel1nayBFnZ4ElDjmsNsiEewfrBfRdAP2W5
         WNLDoHyuKqUmA==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [PATCH v7 1/3] dt-bindings: Add Hycon Technology vendor prefix
Date:   Tue, 13 Apr 2021 16:44:44 +0200
Message-Id: <20210413144446.2277817-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfB+HwW2y5aybo6pZitV3RXOKGVSD8WEGtMAvMUoYxMPIR8MXShWixvm+OpeQtwmrpIYCjyoMziiHttrgE2F51MTZOCHNk4CLae/gqgZUPH2dfyqw2RQc
 qn1nSafpPFia4c3LZOkT/F20xEsKv91Tm6LbSuXj7pASrSSzoT9GXvD/8vTBPIjB38R9zBBqhhe0BwQieaQOM1cyJDpj31r6IJaA3Bc0OE8UneoeHx5eTiLi
 swJ7nzKHcXGO6jlmhHbfsZnYv4eR79gAAyFLrfBG2CQNst/scecMLvtzqDzfJEZ1dtj72eFK1ElOYbkeTGRkUWfGOrX8cAGygfQLYwYZ5IiSCRjxlADrmqjv
 zDoD4M5UpLaT3odQwLa9Lxeg+NfnDyqY8x+IcrZSIr0nhvvtSEdICV0eUcVGa3WpXI8YAB8QlrbuXWP0FwMT+pNNqwWZqHY0yxFNGvW8odWDCbdiFD4sRVgT
 bPGeSFOuu0xN/PqCfDZgWyoHavcrjzK6uuxiGg==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "hycon" as a vendor prefix for "Hycon Technology".
Company website: https://www.hycontek.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a1312637d6ff..67f429a757cd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -489,6 +489,8 @@ patternProperties:
     description: Shenzhen Hugsun Technology Co. Ltd.
   "^hwacom,.*":
     description: HwaCom Systems Inc.
+  "^hycon,.*":
+    description: Hycon Technology Corp.
   "^hydis,.*":
     description: Hydis Technologies
   "^hyundai,.*":
-- 
2.25.1

