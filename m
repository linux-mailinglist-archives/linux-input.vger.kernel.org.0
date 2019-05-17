Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946D8218EC
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 15:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbfEQNNM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 09:13:12 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:33846 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728434AbfEQNNM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 09:13:12 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id BBFD3A0795;
        Fri, 17 May 2019 15:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1558098789;
        bh=YOn6mM87TjxR80/dccn4u4pUAqod87oqS9b7+tHqE/E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=As8u2HFFsehCUZ8yhzq1ZjgrEuTFXiGZ79yV0NvbyuJMzjC2tBW/dWp8sgT+8xTz9
         X1OcEJAOPLKIXsDktkDQJ8vdzWi02mSIeXV+AonOgC37YCkjMLZbxy2A/Vdq5n66NM
         +f1WR8cG/VX3pelWaP1qid/KxC2QJIN6PEHQE/2Q=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [RFC PATCH v2 1/4] dt-bindings: input: Add support for the MPR121 without interrupt line
Date:   Fri, 17 May 2019 15:12:50 +0200
Message-Id: <1558098773-47416-2-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Normally, the MPR121 controller uses separate interrupt line to notify
the I2C host that a key was touched/released. To support platforms that
can not use the interrupt line, polling of the MPR121 registers can be
used.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
Changes since v1:
- Document the polled binding in the original file, do not create a new one.
  (Rob)

 Documentation/devicetree/bindings/input/mpr121-touchkey.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/mpr121-touchkey.txt b/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
index b7c61ee5841b..97f55273d473 100644
--- a/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
+++ b/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
@@ -1,9 +1,14 @@
-* Freescale MPR121 Controllor
+* Freescale MPR121 Controller
 
 Required Properties:
-- compatible:		Should be "fsl,mpr121-touchkey"
+- compatible:		Should be one of:
+			- "fsl,mpr121-touchkey" - MPR121 with interrupt line
+			- "fsl,mpr121-touchkey-polled" - MPR121 with polling
 - reg:			The I2C slave address of the device.
 - interrupts:		The interrupt number to the cpu.
+			In case of "fsl,mpr121-touchkey-polled" the interrupt
+			line is not used and hence the interrupts property is
+			not required.
 - vdd-supply:		Phandle to the Vdd power supply.
 - linux,keycodes:	Specifies an array of numeric keycode values to
 			be used for reporting button presses. The array can
-- 
2.1.4

