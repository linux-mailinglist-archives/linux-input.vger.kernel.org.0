Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78ACD3A7BE7
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 12:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbhFOKcz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 06:32:55 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:56697 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231643AbhFOKcy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 06:32:54 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 44FC4580729;
        Tue, 15 Jun 2021 06:30:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 15 Jun 2021 06:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=PKUtGSy8iZDEY
        lpTbw2VI9ddzDZdqrWO9usf566B1Ng=; b=KRiY8AX9yhHq9NXiNRxat6AT0y3NS
        S1p/D9w9/6kpXOUvxnaLG2nJ/8C7lqcvcninXIOY/qT4GS6Qi/mPcS4IJAt8/sBO
        yxitxMxBczAZOFp+Kv6NjUZw7nC3TqTAelH9CZqAMAsO8N8HYgKUp54r0B4njUoJ
        cu4HjpQ/O/5CopQb+PHp7VPbH0kGQECbUxMS3w4xJ5FQt0CyQRi6in13pz9pu5dM
        eeDf3zugE5qwhOHrKsS6/0V3llBjbnNs4F0pD86e5ZKtS61NtExsK10khSEwUW5p
        xkWTT9LRYcIOPtJ22WlLOj5kGcZOdRQhjz7IYxDE8vIZQ7ibegcpuA4mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=PKUtGSy8iZDEYlpTbw2VI9ddzDZdqrWO9usf566B1Ng=; b=mahrQz1K
        hgR+RkY9m7QLQj+ZMqo/mmUFck6lt+kIRMGSfFOgWITEuzXwmOU5wbTgOnHe9CyW
        vCdtKwrJHV4+TviSGHa9xYrT1lH4ci/W01Ie1M3AIxC9iZ5jmZ6EDRiZLEP10kE4
        eznAmt5EZgvbmHwJhPrZmPWag0rI6x3SeL+BTQYFSAj4UPUs5AjZqAYQKN82Guz+
        oN9XruPLOnjPDJBF+pJ1n94d1aO2HGE0Yn/dF2ymeUhq4JabXyThYrURmzU9NAlb
        OsOOa2hfbndIP4hW0BlTA3sObH2Gnp21YGu1PZHGdaQprDASIvUm/i/7l6b4ZWvl
        cpmQWP2bCU9plA==
X-ME-Sender: <xms:WYHIYGUgj3RM_H-hJoWHS6DLTclubpB0GqmQJow4svEG1aEDTUbMOw>
    <xme:WYHIYCmlHfNqgPD95Lq70sHj62LDzWU02dVXWA9x-Kp2LesxE6uuHaE-ILxA9Eq32
    vj7TFv4J5xslp_Rzt0>
X-ME-Received: <xmr:WYHIYKaALu1ycrBRwAWFGxHVKaBswEYSGEeMprnw76Vk3fQ7B75Da0iRBwUdadStTax2DhNY_PG4s76->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:WYHIYNVWTZbxp8Xd4F5CoBovoLUl9Y2RJ5m-iN_I8epNgJS3Wf8xVA>
    <xmx:WYHIYAkbkXkCQx1S_nWEcEtyh3NlAB9z63b-0ou6K3yvxD7ZauY7Vg>
    <xmx:WYHIYCc1RVxnulJVhKycodtlMfi51rSNkHuXdNLPQ8DeTonitQFSDQ>
    <xmx:WoHIYK7etlhZbrHnLhkI9-Qdh-yvCE5xIz_4QiRAEDqNg6-Ysl9wQQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:30:45 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v6 3/9] Input: wacom_i2c - Add device tree support to wacom_i2c
Date:   Tue, 15 Jun 2021 20:30:08 +1000
Message-Id: <20210615103014.798-4-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615103014.798-1-alistair@alistair23.me>
References: <20210615103014.798-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow the wacom-i2c device to be exposed via device tree.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 22826c387da5..6053595f2b30 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <asm/unaligned.h>
 
 #define WACOM_CMD_QUERY0	0x04
@@ -241,10 +242,17 @@ static const struct i2c_device_id wacom_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
 
+static const struct of_device_id wacom_i2c_of_match_table[] = {
+	{ .compatible = "wacom,i2c-30" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, wacom_i2c_of_match_table);
+
 static struct i2c_driver wacom_i2c_driver = {
 	.driver	= {
 		.name	= "wacom_i2c",
 		.pm	= &wacom_i2c_pm,
+		.of_match_table = wacom_i2c_of_match_table,
 	},
 
 	.probe		= wacom_i2c_probe,
-- 
2.31.1

