Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C308B2351BC
	for <lists+linux-input@lfdr.de>; Sat,  1 Aug 2020 12:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgHAKmw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 1 Aug 2020 06:42:52 -0400
Received: from smtpo31.poczta.onet.pl ([213.180.142.162]:54424 "EHLO
        smtpo31.poczta.onet.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgHAKmw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 1 Aug 2020 06:42:52 -0400
X-Greylist: delayed 522 seconds by postgrey-1.27 at vger.kernel.org; Sat, 01 Aug 2020 06:42:50 EDT
Received: from [192.168.5.106] (89-67-8-76.dynamic.chello.pl [89.67.8.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dragonn@op.pl)
        by smtp.poczta.onet.pl (Onet) with ESMTPSA id 4BJgVf38XXz1XQCMG
        for <linux-input@vger.kernel.org>; Sat,  1 Aug 2020 12:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1596278042; bh=KeFrB4aKWFka5VY0UgH63uL2C8TPvumeiAOzUV5IN2Y=;
        h=To:From:Subject:Date:From;
        b=jCDJDdDSrsyvevhWJ++EVO4iDY6zgKSdUuhKMldyxTtDQtIphEbaiCYZ1Zq8YK3xN
         NL8EmJguvJsmP7xQ4OJ/IpJpIwNfSyuWY83JVriuY+rny78S0gTvJnw5dwiGt8QNuB
         +n6BLnKHsanFDoJjVrgbJ4oa1umuDJkJoRVvMAN8=
To:     linux-input@vger.kernel.org
From:   Mateusz Schyboll <dragonn@op.pl>
Subject: [PATCH] i8042: asus: ignore PNP detection on lates ROG G14/15 laptops
Message-ID: <defa4aa9-1134-e936-1438-d3c925286ffe@op.pl>
Date:   Sat, 1 Aug 2020 12:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ONET_PL-MDA-SEGREGATION: 0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Recent ASUS laptops (G14 and G15) don't have a PS/2 PNP devices.
Because of that the i8042 module refuses to load when it is build
as external module (for example this is the cause on Arch).
But the module is needed to get asus_nb_wmi loaded, without i8042
it will not load due missing symbols. This is only due a legacy
device Q500 using some i8042 filters in the asus_nb_wmi module.

asus_nb_wmi is need on that devices to get basic fan control
via throttle_thermal_policy.

This patch adds all dmi board name to the i8042_dmi_nopnp_table.
So their users don't have to boot with kernel parameter i8042.nopnp
and have a better out-of-box experience on Linux with listed devices.

Signed-off-by: Mateusz Schyboll <dragonn@op.pl>
---
  drivers/input/serio/i8042-x86ia64io.h | 49 +++++++++++++++++++++++++++
  1 file changed, 49 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h 
b/drivers/input/serio/i8042-x86ia64io.h
index 7d7f73702726..55db7e96488d 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -705,6 +705,55 @@ static const struct dmi_system_id __initconst 
i8042_dmi_nopnp_table[] = {
              DMI_MATCH(DMI_BOARD_VENDOR, "MICRO-STAR INTERNATIONAL CO., 
LTD"),
          },
      },
+    {
+        /* ASUS ROG Zephyreus G14 GA401IH */
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IH"),
+        },
+    },
+    {
+        /* ASUS ROG Zephyreus G14 GA401II */
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+            DMI_MATCH(DMI_PRODUCT_NAME, "GA401II"),
+        },
+    },
+    {
+        /* ASUS ROG Zephyreus G14 GA401IU */
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IU"),
+        },
+    },
+    {
+        /* ASUS ROG Zephyreus G14 GA401IV */
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IV"),
+        },
+    },
+    {
+        /* ASUS ROG Zephyreus G15 GA502II */
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+            DMI_MATCH(DMI_PRODUCT_NAME, "GA502II"),
+        },
+    },
+    {
+        /* ASUS ROG Zephyreus G15 GA502IU */
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+            DMI_MATCH(DMI_PRODUCT_NAME, "GA502IU"),
+        },
+    },
+    {
+        /* ASUS ROG Zephyreus G15 GA502IV */
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+            DMI_MATCH(DMI_PRODUCT_NAME, "GA502IV"),
+        },
+    },
      { }
  };

-- 
2.28.0

