Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F80363DB6
	for <lists+linux-input@lfdr.de>; Mon, 19 Apr 2021 10:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237718AbhDSIj6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Apr 2021 04:39:58 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60029 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237262AbhDSIjy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Apr 2021 04:39:54 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id D10B95C007E;
        Mon, 19 Apr 2021 04:39:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 19 Apr 2021 04:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=iMA5K+xFvBtF3
        QCb4I1QCVjObfpkmcYxY9AlcLhoGG4=; b=ZziTWBBEcxyZkAFDl/Quo8gX9IxE0
        M1D8RRxzlC+hmNs3MMH3isyLxmYtJzLpczRFmDMmuDWjA1C37Bqdx/6gIlgwDZcl
        lfLpWtK5AFzhXaSr90LLw+47S18Ijk2wAagx5tqrbqV6Op/28JF0Uhc0viOcPhjm
        +xWsNaUCHDtL3llarUCdis1UNtMriXYA51xerbnjX7qZYzBDSIkE67MroIaYOYkl
        pZ2EQj3VqMWBKWRkOFW/MAjc0Y+OQsQuB3XXtzP+ND+6D7pKtMH2T7T0fFQz0OLE
        gRek90N4DVCppbjI82rqLwy+SXmBVpNycUMxHQuPzu+2uapOdMxrb8QDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=iMA5K+xFvBtF3QCb4I1QCVjObfpkmcYxY9AlcLhoGG4=; b=VyK2X7Qg
        m2XkwNq/OpmMDxi3L0gv1BlwqjYtZCd2eX4MePZMgjnx+M4NFVqX0lGqY05UP+IM
        NnrKuYeRKiMIOW8PKWxzfcMEQcbs75L7I+833BCtmeUqc127gdf5+cNvfD8WyxZU
        YacMlyILAhK5MFtURR92uo99TCHhkyCg9Jl50uDMmuXGWRVt7+5ANWGbY9OTOZo6
        5ARBR5R3oZ4Q6zqYLvS9u0uvN3U5QwTJ5er6aG5IJLU60b5zDCND3yjr/yy7B5vl
        e5hEuZjbjZjkH5m78ioV6DVKCYPoHd2iFe8+2edrY2gBv6Mp52PLai2JKCtu1qJr
        +n0i7TGOomZVrg==
X-ME-Sender: <xms:vEF9YMEzC0weIHI1rQbGoYZWM02LRffqzC9DAjelthOQhLQi3oPdrA>
    <xme:vEF9YFWLJs1bMUzMlZFsNuWffF7ZNukw_Xxot4wj-CAASdQe9m5filr5Eg_XGvxe_
    3PiZSyJls9vASKZNe4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepkeelrdeg
    gedruddtrdduvdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:vEF9YGIJVBr1aaGGilrqHUvPVqMM46PigADnrbB8Vw4EB7U-0fyfVA>
    <xmx:vEF9YOF2cZ2SioRoCk0tsQda-ElnCQsDKJuKSM8nvOGTqemC96_XNw>
    <xmx:vEF9YCWIzevI1mzLElEB3qfucyqVdu5EUBe7Q5N562Y_Ow8j8cHJTQ>
    <xmx:vEF9YBRHkp4vn7fqzjTXA4ZcPhRFzpEfqUWIT8V4lJLcYblXvKRL3g>
Received: from ThinkpadX1Yoga3.localdomain (unknown [89.44.10.123])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3B4FE1080057;
        Mon, 19 Apr 2021 04:39:21 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v5 3/9] Input: wacom_i2c - Add device tree support to wacom_i2c
Date:   Mon, 19 Apr 2021 07:00:58 +1000
Message-Id: <20210418210104.2876-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210418210104.2876-1-alistair@alistair23.me>
References: <20210418210104.2876-1-alistair@alistair23.me>
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
index 1afc6bde2891..dd3fc54d3825 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <asm/unaligned.h>
 
 #define WACOM_CMD_QUERY0	0x04
@@ -262,10 +263,17 @@ static const struct i2c_device_id wacom_i2c_id[] = {
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

