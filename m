Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9076F640356
	for <lists+linux-input@lfdr.de>; Fri,  2 Dec 2022 10:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbiLBJ3u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Dec 2022 04:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbiLBJ3t (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Dec 2022 04:29:49 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A17A6CCA
        for <linux-input@vger.kernel.org>; Fri,  2 Dec 2022 01:29:47 -0800 (PST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NNngz15kxzmWPZ;
        Fri,  2 Dec 2022 17:29:03 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Dec 2022 17:29:46 +0800
From:   Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To:     <dmitry.torokhov@gmail.com>, <zhangxiaoxu5@huawei.com>,
        <linux-input@vger.kernel.org>, <rydberg@bitmath.org>
Subject: [PATCH] Input: raydium_ts_i2c - fix possible memory leak in raydium_i2c_send()
Date:   Fri, 2 Dec 2022 18:34:12 +0800
Message-ID: <20221202103412.2120169-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is a kmemleak when test the raydium_i2c_ts with bpf mock device:

  unreferenced object 0xffff88812d3675a0 (size 8):
    comm "python3", pid 349, jiffies 4294741067 (age 95.695s)
    hex dump (first 8 bytes):
      11 0e 10 c0 01 00 04 00                          ........
    backtrace:
      [<0000000068427125>] __kmalloc+0x46/0x1b0
      [<0000000090180f91>] raydium_i2c_send+0xd4/0x2bf [raydium_i2c_ts]
      [<000000006e631aee>] raydium_i2c_initialize.cold+0xbc/0x3e4 [raydium_i2c_ts]
      [<00000000dc6fcf38>] raydium_i2c_probe+0x3cd/0x6bc [raydium_i2c_ts]
      [<00000000a310de16>] i2c_device_probe+0x651/0x680
      [<00000000f5a96bf3>] really_probe+0x17c/0x3f0
      [<00000000096ba499>] __driver_probe_device+0xe3/0x170
      [<00000000c5acb4d9>] driver_probe_device+0x49/0x120
      [<00000000264fe082>] __device_attach_driver+0xf7/0x150
      [<00000000f919423c>] bus_for_each_drv+0x114/0x180
      [<00000000e067feca>] __device_attach+0x1e5/0x2d0
      [<0000000054301fc2>] bus_probe_device+0x126/0x140
      [<00000000aad93b22>] device_add+0x810/0x1130
      [<00000000c086a53f>] i2c_new_client_device+0x352/0x4e0
      [<000000003c2c248c>] of_i2c_register_device+0xf1/0x110
      [<00000000ffec4177>] of_i2c_notify+0x100/0x160
  unreferenced object 0xffff88812d3675c8 (size 8):
    comm "python3", pid 349, jiffies 4294741070 (age 95.692s)
    hex dump (first 8 bytes):
      22 00 36 2d 81 88 ff ff                          ".6-....
    backtrace:
      [<0000000068427125>] __kmalloc+0x46/0x1b0
      [<0000000090180f91>] raydium_i2c_send+0xd4/0x2bf [raydium_i2c_ts]
      [<000000001d5c9620>] raydium_i2c_initialize.cold+0x223/0x3e4 [raydium_i2c_ts]
      [<00000000dc6fcf38>] raydium_i2c_probe+0x3cd/0x6bc [raydium_i2c_ts]
      [<00000000a310de16>] i2c_device_probe+0x651/0x680
      [<00000000f5a96bf3>] really_probe+0x17c/0x3f0
      [<00000000096ba499>] __driver_probe_device+0xe3/0x170
      [<00000000c5acb4d9>] driver_probe_device+0x49/0x120
      [<00000000264fe082>] __device_attach_driver+0xf7/0x150
      [<00000000f919423c>] bus_for_each_drv+0x114/0x180
      [<00000000e067feca>] __device_attach+0x1e5/0x2d0
      [<0000000054301fc2>] bus_probe_device+0x126/0x140
      [<00000000aad93b22>] device_add+0x810/0x1130
      [<00000000c086a53f>] i2c_new_client_device+0x352/0x4e0
      [<000000003c2c248c>] of_i2c_register_device+0xf1/0x110
      [<00000000ffec4177>] of_i2c_notify+0x100/0x160

After BANK_SWITCH command from i2c BUS, no matter success or error
happened, the tx_buf should be freed.

Fixes: 3b384bd6c3f2 ("Input: raydium_ts_i2c - do not split tx transactions")
Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/input/touchscreen/raydium_i2c_ts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 3a4952935366..3d9c5758d8a4 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -211,12 +211,14 @@ static int raydium_i2c_send(struct i2c_client *client,
 
 		error = raydium_i2c_xfer(client, addr, xfer, ARRAY_SIZE(xfer));
 		if (likely(!error))
-			return 0;
+			goto out;
 
 		msleep(RM_RETRY_DELAY_MS);
 	} while (++tries < RM_MAX_RETRIES);
 
 	dev_err(&client->dev, "%s failed: %d\n", __func__, error);
+out:
+	kfree(tx_buf);
 	return error;
 }
 
-- 
2.31.1

