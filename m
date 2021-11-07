Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF954472B3
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 12:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234640AbhKGL11 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 06:27:27 -0500
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:33734 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234639AbhKGL10 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Nov 2021 06:27:26 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id jgG9mbDBMCVSejgGumjsSv; Sun, 07 Nov 2021 12:23:43 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1636284223; bh=EEtrSSWFEIEm+hm9c1Utn/zMqEcLWIoArC5KJHteRL4=;
        h=From;
        b=r66t5NSVq2vowqyc1m9pZkYXi/Is2VZMWYAgE8fJOeQcN9IQ3ZE0K1q1GfmJLRCqF
         +IEqPkIH7SqL1hkbJK+othUcleul13hojyIqJnx6NC06zFSEyftJBB4joDB2wSTDa4
         9i9g5iGEBBSOaEKBzO0uDKXE7P8JGmV2nYR2ytqSm3i2zoIUCTOskw3JtgaXa7QJGp
         1/FbHRfJULW8CWMK6T7xuLklzT5MDUJ+8UALHqqwE99CAntlhqzyefq8zHAvjgqgT8
         GsMfCBbNPb2NWP8t7JUR2HjSFawWqCbu1a9E1VA1V+DpLzis1MQyKHROWgTupW+t2T
         s2ccXJuoN0GDw==
X-CNFS-Analysis: v=2.4 cv=M/2Ilw8s c=1 sm=1 tr=0 ts=6187b73f cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17 a=VwQbUJbxAAAA:8
 a=WGf4WTbLby2_tS91RlMA:9 a=AjGcO6oz07-iQ99wixmX:22
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rachna Patil <rachna@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dario Binacchi <dariobin@libero.it>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [RESEND PATCH 4/6] dt-bindings: input: ti-tsc-adc: fix tsc node example
Date:   Sun,  7 Nov 2021 12:22:34 +0100
Message-Id: <20211107112236.7969-5-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211107112236.7969-1-dariobin@libero.it>
References: <20211107112236.7969-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfGJiT1p+RKZwKdMcJkkVOvukmmvGCfoREfMzSsL7AL23Wlv9dD6Ysj1MPiO60BIVswz4NWCZ3/IayEp3nrNMEjkIzRTnTfsX7ioBma+pwc4e6wCGVitC
 8bARPidV7a16pxWfRStWCMda9wzGW/cUI/IWVjsaunoAv1CyYXN3iduhbOMcbV8dLdQhnkSznPCpKkEhmxD7f5bvfMUUEBDo0p/iBgFKmUWmDVB7jfIpnENo
 DmIgC+pqjarzMwW4zNmGms1JdPLZPwGVsEU385ewB4WracoX9P55E4K1BQGkqpG+YQvSC/xCCGarrmpjCb7pwzL8DER6FHsvkrBSODNGRMrwlo6zXOzDXHgI
 ceCyAjAn5Alm31PeSEg4+RZr8ENlwcIwJT19pCzXQ4oPq74gxZUoQnrvHqQE01Zmp7Kb2k+/ewCx2j2Qpq/tH5LZPUUul1X12kFmcNq4gTqGgzH8+XNfkPWD
 W+EfGrccxOGQscRKK3gNsmRqh1q9VPlxyVULKA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The commit c9aeb249bf72e ("Input: ti_am335x_tsc - fix spelling mistake
in TSC/ADC DT binding") didn't fix the typo mistake in the tsc node of
the example.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Acked-by: Rob Herring <robh@kernel.org>
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

