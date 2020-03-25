Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C271929E6
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgCYNfG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:35:06 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:13562 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgCYNfF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:35:05 -0400
IronPort-SDR: cazHNmWqe6TRZMANX/MKhf5ghuBTHQpFjHw4wRkk5tf+4WdNseUx2c9COdg3f9MRYE4JWlvW4+
 iWNDBqjPwH569TqaN74jti/Dm+50YuiQmYuzZlEpVjgdHNMhXf8ANcN75xcfXDVEaZnVUgDUwX
 gG/Kosj4Px8gw7JJPACNTUJGsGm2BCqPjRlGYt9aN79O15ohYXeAG0WA2PPhN85b5fbmlR/cj7
 gRUnBoe4HWO7F6bZmSt7KjGDv9D+ZE+cdDNWX3taUSRsJFw5ur9keZ1FEuygTE+XYCsWxIbKXo
 fEo=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47010628"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:35:04 -0800
IronPort-SDR: 7HjRXQArOQzGhxk/EqPibw0+W31ADf1XNXgBnQ2bOxpWcdtfhkOykl11PF0a0IQFaXNFKT9ntq
 /BDmUIRyswTnBuNyc4ydqtPce1k3G2kURAkSEST6/0eiWssj6XsP0wLVDuv9vYSWLQZnLY/tqK
 wAk0eNxZa7zM0uZutuIR6HeCb4nJ1gNzMV/Xcp57v+FboRUWi3LuZ3+9dmw+UTrnTpSux8mPzE
 pLtHsthyewCrkjzwAMb8B5eyJM47PX4GY/sRc+qoMv2wmvzy/Hy9dhizQCqXFd/a+yAPoAE5/p
 UUs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 21/55] dt-bindings: input: atmel: provide name of configuration file
Date:   Wed, 25 Mar 2020 06:33:00 -0700
Message-ID: <20200325133334.19346-22-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
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

