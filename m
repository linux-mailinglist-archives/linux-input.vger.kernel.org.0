Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 189D0192A16
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgCYNgd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:36:33 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53281 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbgCYNgc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:32 -0400
IronPort-SDR: etNgX2mN18B8QdEcDEDouj0pfkYbiF3jD8D5SpfRzPC6JeR6luVU9c2PavpOitLgCOjJkYNFR3
 7UOAtQvZtsmZgGsBwKxlV0wklW2YKc59XPPoCHztatYLmIni33nakoY6TYmQXKRAjTVCQTc74Y
 pFRicibw21MtUMCOnSVigi9GU4FG3YJpt1VOeMZixDc5k04m8JjvXX+oASIK4Tfhj42MkoQEu4
 n32YSVqAvU7m93eW55Sx5AI5DY9RJgnFn5HkKq6ChvO7Ee+6CnvcDUQxgHLqp6rSRyGPKyd0Fp
 bNU=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099801"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:36:32 -0800
IronPort-SDR: N10rHtMg2wk/YP3YEjXoadnMq4XF2GTknK8gerK95ZzY9S3H5uxFIMOxdYiXY9U62C2bY5zvMp
 PVI5qhyjH5BELNnC6xyPCmiocxrPgmjMqtkjTvW3x8hTShOwkyVpe2Y9bfT36P6FR/0JzjGEA7
 8Z54s9+/VnxpS5m45WtYiU4ptwZDnH5FdogGvIuMAa6OnezRI8tsy8qgz2DnkeAKpKVoMzbZz9
 yAn6S+Sm3b7DbIxMB4yqxSn2Gs0Ikt6mq8CXAH6o8YGRrklrcuBxDNHsbUJHuvOy11sqQiPm+U
 v3s=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 43/55] dt-bindings: input: atmel: support to set max bytes transferred
Date:   Wed, 25 Mar 2020 06:33:22 -0700
Message-ID: <20200325133334.19346-44-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support to set max bytes transferred in an i2c transaction

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index d7db16920083..62c93d94bc5d 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -42,6 +42,8 @@ Optional properties for main touchpad device:
 
 - atmel,input_name: Override name of input device from the default.
 
+- atmel,mtu: Maximum number of bytes that can read/transferred in an i2c transaction
+
 Example:
 
 	touch@4b {
@@ -49,4 +51,5 @@ Example:
 		reg = <0x4b>;
 		interrupt-parent = <&gpio>;
 		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
+		atmel,mtu = <200>
 	};
-- 
2.17.1

