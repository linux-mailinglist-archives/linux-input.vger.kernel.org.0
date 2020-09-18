Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A6926FDBE
	for <lists+linux-input@lfdr.de>; Fri, 18 Sep 2020 15:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgIRNDN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Sep 2020 09:03:13 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:24928 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbgIRNDN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Sep 2020 09:03:13 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 09:03:13 EDT
IronPort-SDR: Ll7X52+3bwPkHDBFm5q+muSu77QqvfJR53K3x8flgoU/n3LtPE6OfNSZlShnhoS9IKuBnK2saz
 BAcTlnokm46vuQhy4xwK7WNA/i5xGRtcasHkZkksTNEbPNtm84K3EwBqaijVANqqsnRv41ySQk
 MvhcSP/uyBQUZUuBJ7DSgSjDphxp/5duhXi4fiet/xv3aXD4DJ+GvhiNcBc4+4qKRZxxp6kl58
 rxkFAvqy9X7MzFFRjWXLGmftCFVEqimrQo8b4xoXs8xSl5gZJx/bf7BD11c1njLb8q2h35lIWA
 xi4=
X-IronPort-AV: E=Sophos;i="5.77,274,1596528000"; 
   d="scan'208";a="53022473"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 18 Sep 2020 04:56:06 -0800
IronPort-SDR: fC5JHIiRWj9SqYHNhubjnrTnhTROOtaF56uPoGAYhG43vhQEG0xvZQPNmFA612pVcbBSE5s5Lj
 RqAQxxl7C3YlQR63hNsqy+GBmRpFqINQ7uQFxGdIwSnLmltzgkBjALq8YaxjFjmw4vjaIuieob
 WIAQbD3q0/yCm7M1E1T5LmkWGsQnvsUrutKZPazwgNJlbqW+iQs0avDcxrPG6Q+VS12B1gPPqI
 nWhQkS7s3dOHZIrbbdIqL3lDQz5cqB/Y5+WWZTKrK/UUAR3+7PoFs3vnLr2cICVoecJEI0Ewid
 1kU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <robh+dt@kernel.org>, <digetx@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andy.shevchenko@gmail.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>, <jiada_wang@mentor.com>
Subject: [PATCH v1 1/2] dt-bindings: input: atmel: add compatible for mXT1386
Date:   Fri, 18 Sep 2020 21:56:00 +0900
Message-ID: <20200918125601.8210-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Document the mXT1386  compatible string.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index c88919480d37..c13fc0f3f00b 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -3,6 +3,7 @@ Atmel maXTouch touchscreen/touchpad
 Required properties:
 - compatible:
     atmel,maxtouch
+    atmel,mXT1386
 
     The following compatibles have been used in various products but are
     deprecated:
-- 
2.17.1

