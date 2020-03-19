Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECB718BA96
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbgCSPI7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:08:59 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:5936 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgCSPI7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:08:59 -0400
IronPort-SDR: XpzddIKqmBnCcZ1zEWUlBMpp6ePbYlJqibb3EzHjnkuWkWCqFNauKVkInmP/T0+Wb7zKl3peMf
 Tu+G79SXUBMZY5I9JEm0ZVgdsCRr7szz1gsT/EvjS7humN4i6F7gz3AkP4kvHe98+p8y1rAEr6
 fEknKcT1A7iyVOHmH/oTa+frymAmdJGw7tqv1nvg7jzQkkhhaW5kxB6b7W5TbVmU9UqolwUCaX
 WOnXb58AI/yYCAfFE6QUBpwq8YPnbWt9D+u2gFwvSoMWopw9+k/LDuo7DRX5ruAgV5zp3Z0MyD
 sH4=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46926843"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:01:32 -0800
IronPort-SDR: 0nXmbnI2F+DjT/64+txdGLxD0MaYfr72IO8BkJxpfDTyD1kG4i7bxEIc5ZQl2wlwFk73ak/gWU
 G/FK6EZ80HkhZy9brGhT3WBYK2EZDL9+9OGJKa+ezRlmbmtYFZX+1puAzkBsmCNehnX95LZEs/
 7IeK8SSKFpBI+U9ir/stx4DpZKHjk6u9wTtBirE9AJXjcZftQg7FmjSQuQYngDwE3eZtgPuKYP
 5FrG2yE8T9oBRfXA6xY1c1ajeWT/ly+wp5mHbYirj1c04zRlAWUC0KZqvRZQLKNRoF2YnWtCHj
 8N4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 18/52] dt-bindings: input: atmel: provide name of configuration file
Date:   Thu, 19 Mar 2020 07:59:42 -0700
Message-ID: <20200319150016.61398-19-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support to set name of configuration file

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index e28139ce3cae..713ce870805c 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -37,6 +37,9 @@ Optional properties for main touchpad device:
     MXT_SUSPEND_REGULATOR - use regulators to power down device during suspend
     Definitions are in <dt-bindings/input/atmel_mxt_ts.h>.
 
+- atmel,cfg_name: Provide name of configuration file in OBP_RAW format. This
+    will be downloaded from the firmware loader on probe to the device.
+
 Example:
 
 	touch@4b {
-- 
2.17.1

