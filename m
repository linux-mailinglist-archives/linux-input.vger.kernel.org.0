Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 548C718B9FE
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgCSPBm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:01:42 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:5374 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727428AbgCSPBl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:01:41 -0400
IronPort-SDR: 4Qg4svZXAvUjSgWybK+6foiDzKn6tS+4RwUVo0XPoEksD1mNCYFROqxqBllV4qvdaysWdiGU0u
 4mmtwjWE9tjqWCOlM2HIp/aKhfPz1Ylm5foegGjXnbCkK0rJmZ3mdespnYwBY4z2y7RKgKYvGi
 mAIZBXZVV3Wi8qMX8Y6vDmcM9luIyAH4/8eFkgKx4e6xfNwPtyvZ14L1KvSBYY/t7mDzZmuavX
 lIEoiVTByw/6PL2WMA4pYpaGJkoTo+4pHFgkJ9HVPE+84BKLVtLb/AJpdHn719mf0GJH3BguUS
 lHQ=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46818732"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:01:40 -0800
IronPort-SDR: xEsbXQoYGc/XXf4d9iGzTzf5HRxBgseMhlU4/Aiy2cUo+1GN8fOj2d5s6kyuNZ/YgN4aYOgEmr
 PjWC+Z61slivZkKN3Yl+YCF8EixhzeLVwZxw2x76nErmp0a4tRKgyR5GWQCI/VwyluYwujiR5k
 ZrY4gBto7HURYuIicClMk16hsqyTNG/ibBHA9GDM0TfVPRwbASZEc6tmYB0u2Bv2PfYNLN5fbh
 iQFyz69jw7E7BtZkRIqTa9rpGxdp6jWoQK6CY/EPP/gVMfuI85CYV/k9MvGGdOyZyU8GWJtCSI
 0MM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 20/52] dt-bindings: input: atmel: support to specify input name
Date:   Thu, 19 Mar 2020 07:59:44 -0700
Message-ID: <20200319150016.61398-21-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Support to specify input name

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index 713ce870805c..d7db16920083 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -40,6 +40,8 @@ Optional properties for main touchpad device:
 - atmel,cfg_name: Provide name of configuration file in OBP_RAW format. This
     will be downloaded from the firmware loader on probe to the device.
 
+- atmel,input_name: Override name of input device from the default.
+
 Example:
 
 	touch@4b {
-- 
2.17.1

