Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4092018BA25
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgCSPC7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:02:59 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:32379 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgCSPC7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:02:59 -0400
IronPort-SDR: hwU5uiOcTi+ztXV52I0bmrg9hoAOnZA1WdqsLSqg3mcPleNMv+JTyACJcqcGj8TKn1IUS4xD8m
 H6xIEnyk5n+6K4rx0Gl/uWf/SLdrDi9B4WqpOllEBufkjlJLlIK++z9n0zKMHZagO9zweWktBe
 cY4vvIbxlTpcJsmajX3kRSc14NVb8QhdGi2qa/mcqd1uvMcqY/hEtkEtJBiH4w2Idj295yhpVk
 WV1mvjbczGe4lWDo/8N04CWaDvFP6sOYew2+gjX5ySOHnknlOeZofSGEy0e5QuDQ12jnMdCGa/
 hIo=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46891026"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:02:59 -0800
IronPort-SDR: 5nyN4dqat9EO2p62EV/6vQMmu+VPTR1xmZts6A1EuKt77la/FlhFz/V+DFKYwnl9U4NDrQcVpc
 oVwPw84tUCgjUwobISzyHSzSTeJZqVWdjCGC97FNYO5JFjuYXPCH0T5rL3C9pI1eYuzfXTTrMC
 oFhOxYjGIA86oI+YuSgGBK5UMKo0bRzlvcJsnI1giwedEeR71qKnCvmwsGsN1NC32OysIirY/N
 psdMMeuZOQIhXE7c3O0GWSR7dWTXzinRX84eNr72MZUd9UuyorsMARNxDRUhbgWyiP3WDtF1uu
 4zE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 40/52] dt-bindings: input: atmel: support to set max bytes transferred
Date:   Thu, 19 Mar 2020 08:00:04 -0700
Message-ID: <20200319150016.61398-41-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
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

