Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 180D74389A2
	for <lists+linux-input@lfdr.de>; Sun, 24 Oct 2021 17:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbhJXPK3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Oct 2021 11:10:29 -0400
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:55764 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231564AbhJXPK2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Oct 2021 11:10:28 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id eeyWmj6mkdfuoeeycmWXwy; Sun, 24 Oct 2021 16:59:58 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1635087598; bh=J+qzONQYXgNyBKJYBTiaKJTYCSBiy+QsX3A+nUydbnY=;
        h=From;
        b=fOJnuGvh2e0uBr3YTMmS3LvwFi/wO6i62GFoelFWPnX1PzQLbRN+3bvPPvbY3XoeQ
         +PqoGQXhetkyxpiPmV+05ngIgHXfUVoTBSKJ/QTDIv6GH6QCMXPUEivcUc8w3ZzHPl
         uJHSXPDGRTd11iYFBg6qAsqIA8boYU79id8gyobQ58nyOD7Jmwzsck3A0e60Endt6k
         vwrijU8cUmgNdjtuSlJxvhFvL0lHIOfqYsaaXQ6e7K+TKRaNCcWt/kUogb3zFzdMHe
         +W9/qpCbf1xybTCIKJvgdptALjWcd4EENu4+bjxWxBFk7HeBoETsoP7IraKZY9CIoM
         GFqY5+NpYSQKQ==
X-CNFS-Analysis: v=2.4 cv=IrzbzJzg c=1 sm=1 tr=0 ts=617574ee cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17
 a=WGf4WTbLby2_tS91RlMA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: input: ti-tsc-adc: fix tsc node example
Date:   Sun, 24 Oct 2021 16:59:28 +0200
Message-Id: <20211024145931.1916-5-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211024145931.1916-1-dariobin@libero.it>
References: <20211024145931.1916-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfMVdhLtfg83vJJELVEZQUgLPfSOCgAeUHPnJ0uqOvaJjSPxdNFDp2mVg89wyZw/5MJmQaxRkxAK6NrM9Wp3n7gcol2YLUtS8+/5k5x9fW1Kmt3L/TOvD
 gq2suAyX5umxpBnzBzNhun+cS3rQlQLqxMEXun6WvgCwBpQ0I9okt8PQ2i1eFZJyCBV4Yi/BmYugKpF014aeM+LNFzDrJ+4OK02w6jlJCTRMgvXkSoe7xxwz
 V1x5plZN8kwao507DAGRykY706Q9favDyO5mhHyLG51XsuRUTApyEMTizrTgeqaREc7kTDZBsbpgcIMytM/gnKnX12xbmBcmY8QFXnC953z+hnl7s0mLDt/B
 QrwQEBvNogwz/n7NfSWQ13s3gIThOqbxdIUqE4Odh558tpR9hDL1qcS4U3fvM0r4L2rWnu4j
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The commit c9aeb249bf72e ("Input: ti_am335x_tsc - fix spelling mistake
in TSC/ADC DT binding") didn't fix the typo mistake in the tsc node of
the example.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 .../devicetree/bindings/input/touchscreen/ti-tsc-adc.txt        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti-tsc-adc.txt b/Documentation/devicetree/bindings/input/touchscreen/ti-tsc-adc.txt
index aad5e34965eb..2013fd7c4a10 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti-tsc-adc.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti-tsc-adc.txt
@@ -77,7 +77,7 @@ Example:
 		tsc {
 			ti,wires = <4>;
 			ti,x-plate-resistance = <200>;
-			ti,coordiante-readouts = <5>;
+			ti,coordinate-readouts = <5>;
 			ti,wire-config = <0x00 0x11 0x22 0x33>;
 			ti,charge-delay = <0x400>;
 		};
-- 
2.17.1

