Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E561E8FE4C
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfHPIjv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:39:51 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1980 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfHPIi5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:57 -0400
IronPort-SDR: B/UKMTMgL1V3rYDOf1AD4z2OH5lmZBsv5s71Z6ieqgVwAO1DuonYMGPPwqgXSJJrn7cQ+xrOon
 QeMav4V4xhwz07wJHFaZXWS9G+qecRUysuL+XLBK6kPtOT2iM75cTYxcXFK9mHVzT82sNEpffD
 +V82Gbta25bEQQf00Ch8Ob6HQVofk1oL9ZWibtAvTJEWNI+KvhJfxrFVleRL/Pfy9+T5hz4oL/
 AVInmdMkLxWsHk3hDEUhs9A9lRPf2c7NKjW435v+mlRwpZCmApuqpD6nUeVxZmb4gvkK47xLXl
 ELo=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484323"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:35:53 -0800
IronPort-SDR: 3LRlwUxcL/PU660HasXBGP8vJSlmCapd5ni4O/SblKBQMfOfu1EQj3pcmuJsV60kUMntA6Tc6J
 zCfPvv3u/vSyf1s1bObTqvPCtYW2y4gzGfDvYPxjTKZE0ETQZKb5qKcfQIFQnAhVQgHbyBEgjC
 oy3Qc67pxN3FvQk+G4/7xM2gd8kEpSpzqn80XS1gXo6WxC1EVpZ0hHb5XUp1wtzCIQI6lFBX1G
 KBHuGu/rCN3E9Bg8WmnWali7wgmNFpFUWICp2Vukg4BzdtoI64b5jEZ8PS7kbnYvVLa6t1194s
 +po=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 41/63] Input: touchscreen: Atmel: Enable IRQ_DISABLE_UNLAZY flag for interrupt
Date:   Fri, 16 Aug 2019 17:35:36 +0900
Message-ID: <20190816083558.19189-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083558.19189-1-jiada_wang@mentor.com>
References: <20190816083558.19189-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>

The de-/serializer driver has defined only irq_mask "ds90ub927_irq_mask" and
irq_unmask "ds90ub927_irq_unmask" callback functions. And de-/serializer
driver doesn't implement the irq_disable and irq_enable callback functions.
Hence inorder to invoke irq_mask callback function when disable_irq_nosync is
called the IRQ_DISABLE_UNLAZY interrupt flag should be set. If not the
disable_irq_nosync will just increment the depth field in the irq
descriptor only once as shown below.

disable_irq_nosync
 __disable_irq_nosync
  __disable_irq (desc->depth++)
   irq_disable
    if irq_disable present -----------> if IRQ_DISABLE_UNLAZYflag set
             |                  no                  |
         yes |                                  yes |
             |                                      |
     desc->irq_data.chip->irq_disable   desc->irq_data.chip->irq_unmask
                                         (ds90ub927_irq_mask)
                                          disable_irq
                                           __disable_irq_nosync
                                            __disable_irq
(desc->depth++)
But the enable_irq will try to decrement the depth field twice which generates
the backtrace stating "Unbalanced enable for irq 293". This is because there is
no IRQ_DISABLE_UNLAZY flag check while calling irq_unmask callback function
of the "ds90ub927_irq_unmask" de-/serializer via enable_irq.

enable_irq
 __enable_irq (desc->depth--)
  irq_enable
   if irq_enable present -------------> desc->irq_data.chip->irq_unmask
              |                no        (ds90ub927_irq_unmask)
          yes |                            enable_irq
              |                             __enable_irq (desc->depth--)
    (desc->irq_data.chip->irq_enable)

Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index bc94adec6631..c6ba061098c0 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4349,6 +4349,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	snprintf(data->phys, sizeof(data->phys), "i2c-%u-%04x/input0",
 		 client->adapter->nr, client->addr);
 
+	irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
+
 	data->client = client;
 	i2c_set_clientdata(client, data);
 
@@ -4434,6 +4436,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		sysfs_remove_link(&client->dev.kobj, "reset");
 		gpiod_unexport(data->reset_gpio);
 	}
+	if (data->irq)
+		irq_clear_status_flags(data->irq, IRQ_DISABLE_UNLAZY);
 	return error;
 }
 
@@ -4449,6 +4453,8 @@ static int mxt_remove(struct i2c_client *client)
 	}
 	mxt_debug_msg_remove(data);
 	mxt_sysfs_remove(data);
+	if (data->irq)
+		irq_clear_status_flags(data->irq, IRQ_DISABLE_UNLAZY);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 
-- 
2.19.2

