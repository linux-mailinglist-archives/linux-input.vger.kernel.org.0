Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3AE1199412
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730482AbgCaKwS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:52:18 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43515 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730481AbgCaKwR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:52:17 -0400
IronPort-SDR: KMeHU56svksp1Ud8CpIXFd3UYUJtlVGfDBV7DaD1b6O4ZOzNeC3LatiBuQePRxE+w1HwTB/oQH
 qmQdF09xopCLTxoNsfixP661gu+IqrmPnTpIfWRKy/qG9IGKKu8hhVyIpriKFozrtAIwohUS9c
 37h4XyXFfDld7/ju3iBQFdDR5P01nsQvOA1/F42kZzvrnJHzQ5+gsAqA/zPAvyWg0Gnyo+fkho
 SRIpQQCj3pcvkO4FWbp91tnZquwhzsWmlIxj1vmA+SzwgF+sHYR6fRQZJ7jhSgFfo7zFVGZOP7
 4hw=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330772"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:52:16 -0800
IronPort-SDR: R7OMOUh4sdEig5MGqfUA7b+V/vgTcBls5KVPQs60Sc2D+FxpdmlclfYXnJN6BRcKb8rt7MYLXr
 PzGf3xLQkvMpsUvihZB7yFu9ueoyXx+EpqHL2apl2B3XVro1CY7llEQNwbRhSJrUa0ebB8liSz
 uVGqTeDF3LabUG9tBf4A1uZhsvsEn2rDDIhpw+l3Qv2KSxYm+h+MHf3uw5xHQy9FIrI/XeEVnL
 v6ZnRUxUdMdXGgWXTzsiWKKdzLKYp3edI7Fi2r9HIj6xAwt4aF/2I2KMaPkYQ9dIfd7W+bXarS
 jkI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 21/55] dt-bindings: input: atmel: provide name of configuration file
Date:   Tue, 31 Mar 2020 03:50:17 -0700
Message-ID: <20200331105051.58896-22-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
index 0307e7f7bb43..29bb84a920d6 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -40,6 +40,9 @@ Optional properties for main touchpad device:
 - vdd: Required supply regulator when MXT_SUSPEND_REGULATOR is used to suspend
 - avdd: Required supply regulator when MXT_SUSPEND_REGULATOR is used to suspend
 
+- atmel,cfg_name: Provide name of configuration file in OBP_RAW format. This
+    will be downloaded from the firmware loader on probe to the device.
+
 Example:
 
 	touch@4b {
-- 
2.17.1

