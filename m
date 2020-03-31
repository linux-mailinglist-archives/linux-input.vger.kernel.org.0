Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E30D2199442
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730575AbgCaKxl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:53:41 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730467AbgCaKxj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:53:39 -0400
IronPort-SDR: hq2UmAM7kKSh/xD+P5jn7wn0uGFfS6hZtWvlLXqb80z3UHAjQFLZwX9855XHquljJtLdoo0sz9
 Df0cfII8XGpOdTveYgTzz6oHLqxFoVxfzDBi9fw7mCHy+PivtGvyV8QN3OuPm6DbtSEPgDHlV5
 0ST15N7GOeYIzXKg/GN7A8PcQ0KHMlYkA56SrhlcGZJMvud2XiW6hMknU4wy9ddpYL63iNtR5Z
 8QQg6ip0JrLbMU/Dkw09b3Ct6XSVnDP/8yWPUvWg0g1M4PGr0rZsVni3sT1rjJVfGKuQ+Qyjf/
 HTQ=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330835"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:53:38 -0800
IronPort-SDR: SbzT8s12pWv5BIzZSrYhyzCDiWMDVcEFPundOFCJe+WRDSugp6UBpNsoZiQ4gsAVNEBMQvPlX6
 q3AsAqjLK0Ik/luGaxpV6VF+hMYjIlw9DYm0LNjgW879wqe/l29zrHyctRuGwSJD7V8URgLRGi
 sJMbJonAf16pci29vkgRlN9VKQJuncwrKIV/IeXzdPK+i/k/h08JT1BvnNruVxDU2MKRzY0e5W
 +X8GP/xSP2mqRHR71Fea2cfUqs0NtXORDUJCz1S0gX0fNZa2fzRA5T9pfgDj1gSRCnU9nWawk9
 rPo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 43/55] dt-bindings: input: atmel: support to set max bytes transferred
Date:   Tue, 31 Mar 2020 03:50:39 -0700
Message-ID: <20200331105051.58896-44-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
index 126266891cdc..37a798cab0dd 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -45,6 +45,8 @@ Optional properties for main touchpad device:
 
 - atmel,input_name: Override name of input device from the default.
 
+- atmel,mtu: Maximum number of bytes that can read/transferred in an i2c transaction
+
 Example:
 
 	touch@4b {
@@ -52,4 +54,5 @@ Example:
 		reg = <0x4b>;
 		interrupt-parent = <&gpio>;
 		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
+		atmel,mtu = <200>
 	};
-- 
2.17.1

