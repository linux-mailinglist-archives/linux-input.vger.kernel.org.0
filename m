Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6646335B3C3
	for <lists+linux-input@lfdr.de>; Sun, 11 Apr 2021 13:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235546AbhDKLsc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Apr 2021 07:48:32 -0400
Received: from smtpcmd0642.aruba.it ([62.149.156.42]:56993 "EHLO
        smtpcmd0642.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235550AbhDKLsb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Apr 2021 07:48:31 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id VYZRl4bJnZCSXVYZSlNrf6; Sun, 11 Apr 2021 13:48:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618141686; bh=xxeajgw0ir1PuW9+0dUhy7xSrZePZNoFQ9DaDtfNkgI=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=SU9BvTXivciHoY/Mp51YmnSfK7H46vRz/SJan4FIixgRFHdfi0HvWkwaq3SRIiAGQ
         txKWREeXSeQc5giPNVfqRFINAUb/oFssILo75BBtRfApI84hWdjUlqHHtn9g6N3HLl
         61snzZduMsywWYssRJtrhnaKIuh+/Vct1U4/d/yKcJUrF4rNge8f9eU47qykS2gPAo
         mGnPXTvhZqlOopHLH4muI8p2wi300BG0Qn8mjX5J4LEG+bRetJ0zW+IT8B7h3Ci5uD
         p35a58JULeNCzNXH9ynNsp17hQKz9YG2dJxhWMLgE51T22gGxX0Fe9MbL+AkQe1gmO
         XA6PHw7LITgUA==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [PATCH v5 1/3] dt-bindings: Add Hycon Technology vendor prefix
Date:   Sun, 11 Apr 2021 13:48:02 +0200
Message-Id: <20210411114804.151754-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210411114804.151754-1-giulio.benetti@benettiengineering.com>
References: <20210408202137.GA1890401@robh.at.kernel.org>
 <20210411114804.151754-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJdBFV8gRcmhPgIJczoxbm88ALqio9MVOIxv1dH6IWrX1Mjdmz3h8Yb6uJuUwAhO0LnHgv6Ckae5/rOVvuebReDoKaw6yIDtrNqiz982HIRUxaOWV/Ht
 d1iqD8+eB4Ohe4vStDR6VDykQ+6pAXvmETYmAqrkjYMgph/vlLr4j3G9hkaG2yIelzlQVL0ExZ6iuZU24lXxg6OLLNgLBGfutgUfw24RArkEyuCWC7OW6JEQ
 SNaEOlu9RCK7f0yoXE1KXrU1vdw7KDV9uC/G1T/g3i+FWh3wf00QkDIJxsnplAzChS/0XcGYqztsFowDmnXQY4jiKGWtXgliXkPGRP/XWIS9JGtD6TDpL4tt
 +Ffy6MlNbo/ieCGiTaD4h0wjo+NnIq1u8VOT7YRI0c4zko3YNna8//2Vh+48Vv8i70oQ89QPKih0OjX/llDm6NuIgGIrLhnTMMczw6ZYxAgtR5ijZEwEDlCy
 962sfVF1c1X4SPn6
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "hycon" as a vendor prefix for "Hycon Technology".
Company website: https://www.hycontek.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
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

