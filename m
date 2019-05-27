Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 918002B8C7
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 18:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbfE0QPV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 12:15:21 -0400
Received: from ironport.klsmartin.com ([212.211.191.11]:19886 "EHLO
        ironport.klsmartin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfE0QPV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 12:15:21 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 May 2019 12:15:19 EDT
X-IronPort-AV: E=Sophos;i="5.60,519,1549926000"; 
   d="scan'208";a="1674680"
Received: from unknown (HELO hera.klsmartin.com) ([172.30.5.66])
  by ironport.klsmartin.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 27 May 2019 18:08:13 +0200
Received: from SUMMAIL01.UMK.KLS.zentral ([172.25.1.63])
        by hera.klsmartin.com (8.14.3/8.13.1/SuSE Linux 0.7) with ESMTP id x4RG84Do028497;
        Mon, 27 May 2019 18:08:06 +0200
Received: from UML026.UMK.KLS.zentral (172.25.2.60) by
 SUMMAIL01.UMK.KLS.zentral (172.25.1.63) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 27 May 2019 18:08:06 +0200
From:   Leif Middelschulte <leif.middelschulte@klsmartin.com>
To:     <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>,
        Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 01/10] dt-bindings: input: touchscreen: stmpe: add touch window configuration
Date:   Mon, 27 May 2019 18:07:27 +0200
Message-ID: <20190527160736.30569-2-leif.middelschulte@klsmartin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.25.2.60]
X-KSE-ServerInfo: SUMMAIL01.UMK.KLS.zentral, 9
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 27.05.2019 13:23:00
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The STMPE811 is able to only monitor a subwindow of the
entire screen. Touches outside of this window are neglected.
This change adds the corresponding documentation.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 .../devicetree/bindings/input/touchscreen/stmpe.txt      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
index c549924603d2..04962e2e1ad0 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
@@ -33,6 +33,13 @@ Optional properties:
 - st,i-drive		: current limit value of the touchscreen drivers
 				0 -> 20 mA (typical 35mA max)
 				1 -> 50 mA (typical 80 mA max)
+- st,window-tracking	: An u12 array that allows to pre-set a sub-window in the touchscreen.
+				Any touch position that is outside the sub-window is discarded
+				(top-right x, top-right y, bottom-left x, bottom-left y).
+				The given window also affects the value range (limits) set
+				within the input subsystem which, in turn, affects
+				the input resolution calculation on both axes.
+
 
 Optional properties common with MFD (deprecated):
  - st,sample-time	: ADC conversion time in number of clock.
@@ -101,6 +108,8 @@ stmpe811@41 {
 		 * current limit value
 		 */
 		st,i-drive = <1>;
+		/* enable entire window */
+		st,window-tracking = /bits/ 16 <4095 4095 0 0>;
 	};
 	stmpe_adc {
 		compatible = "st,stmpe-adc";
-- 
2.21.0

