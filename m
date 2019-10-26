Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02A59E5961
	for <lists+linux-input@lfdr.de>; Sat, 26 Oct 2019 11:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfJZJJq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Oct 2019 05:09:46 -0400
Received: from mout.perfora.net ([74.208.4.194]:34551 "EHLO mout.perfora.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbfJZJJp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Oct 2019 05:09:45 -0400
X-Greylist: delayed 308 seconds by postgrey-1.27 at vger.kernel.org; Sat, 26 Oct 2019 05:09:45 EDT
Received: from marcel-nb-toradex-int.cardiotech.int ([81.221.67.182]) by
 mrelay.perfora.net (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
 1MUXAC-1iXByg3mRk-00QUVm; Sat, 26 Oct 2019 11:04:23 +0200
From:   Marcel Ziswiler <marcel@ziswiler.com>
To:     devicetree@vger.kernel.org
Cc:     linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH v2 3/5] dt-bindings: input: tochscreen: ad7879: generic node names in example
Date:   Sat, 26 Oct 2019 11:04:01 +0200
Message-Id: <20191026090403.3057-3-marcel@ziswiler.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191026090403.3057-1-marcel@ziswiler.com>
References: <20191026090403.3057-1-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AZs6m5j7/5kpHp4N1P9TZUPPmrn+q7afV0uY7Y+OBbvWyaLp11Z
 4azYw13OHQkir1m2J0LuVCj1RXGSiu9S7HZFq58rNgb1oV7kzbU6IiKSu18+Wik1skVyroN
 oAEX9v4N6dLcQEc/to2v9e6QJ4Z4mSz6ZVwXImJ2reT8LiTx7PbAkXR4DwT5/qGMdzNwtNb
 6NhXpZYcAIpI8ssCjXacQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2wDFJmfKpKY=:a4fHeKL+d5tPnniShUyqvK
 SU1aZ7KUjZi7A4BX35z9CMOKiQe7S3M7pUDfG2jBpEpQLrGF3S5eL/Q4zZQhAkjNRAeopMHVH
 JRJybCDqevRhzjrxAQEANqysq7fLI1Z3LJ9uQQItJkfPFFkF8R6DE8X+dFc8z4spmjHHPqMIw
 t/Yg0wmqfPbtZOlUi9Pc+T1ZQoviK3gwwNiBBKtWdmj5VZdVQsdPSYk+z+VLxYaivVg9BnSc4
 eGlbikhS8aGm/bnJjuHn2Kpi4JOaBttJG5JtTXJMb/wc+/nk+nYnA+WWMAzA5zuw7OYdyZbui
 qhzOGAOUfumz0GFsWkWwB7LTKgvLltZtWnUsFUubfO1tAKD6WycbM2sHS+kjGjdG7Ngzolz2+
 eFJ2oqums9QR0Hi69nfP1tkk1BMxGrFLOvglCV9E77LoReNNeMap1iLhrtXYcP4xE/rkyYOnO
 e0h58SVpOxUvCLaNjEuxjzkYdHR2WHEEoIcIiOHRW3CR6bcTyow2nm75hyz6wSimPCm286wmQ
 EMs9P/Y103EPjPtyb4SXZjVTtXnYf7pYaMpD6/ohPg/+Ns3fnfNWiDUMx1ZMxM1L8E2Uqw9kc
 4Qg3n4qACh+65i2RZPHHjLiGi3x1BWdOLdIAHRsoBIR/ZWeaGNgGKIqQR/7LXsP5SPzwLJu4x
 TUFc8m/nGEnU29DQYh+xpEwns1febIh0Gq08PAaLxR96+/xLQnoB3cNEjpePtcY/S/jXMAJxs
 LRvtlXKj9W9ieVpl3X4Lp+AMZJmPHk2qSO272RJi7odyVEfZgGYfVTTLZ7XtLvNCjT56d1FRs
 EDzr6OWGvYXBL06H/54iSZDuikkrNRc4s7pDE7OOt+6RmyxjFKz/SjKxpJatydBz0zwk3t4KE
 lPuVRv7L6N1ElrKznzzY6Chi/CzlwlhLaa8rahZrE=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Update example in ad7879 devicetree documentation to use generic touch
controller node names.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: New patch.

 .../devicetree/bindings/input/touchscreen/ad7879.txt          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ad7879.txt b/Documentation/devicetree/bindings/input/touchscreen/ad7879.txt
index cdd743a1f2d5..afa38dc069f0 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ad7879.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/ad7879.txt
@@ -38,7 +38,7 @@ Optional properties:
 
 Example:
 
-	ad7879@2c {
+	touchscreen0@2c {
 		compatible = "adi,ad7879-1";
 		reg = <0x2c>;
 		interrupt-parent = <&gpio1>;
@@ -52,7 +52,7 @@ Example:
 		adi,conversion-interval = /bits/ 8 <255>;
 	};
 
-	ad7879@1 {
+	touchscreen1@1 {
 		compatible = "adi,ad7879";
 		spi-max-frequency = <5000000>;
 		reg = <1>;
-- 
2.21.0

