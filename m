Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECB7363DC0
	for <lists+linux-input@lfdr.de>; Mon, 19 Apr 2021 10:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238190AbhDSIkL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Apr 2021 04:40:11 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38465 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237811AbhDSIkH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Apr 2021 04:40:07 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 373105C007E;
        Mon, 19 Apr 2021 04:39:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 19 Apr 2021 04:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=tsYfqjVQonAa5
        lbJhO0HanEGazrEoetr/Xp3UbO8c4w=; b=Odt6vwwqeaEPtdCC58IoQsxQBn8ou
        97YSKPTi+U5Vy4wre4AfK5GwIvzK6JAOfpPbt2uq1DuOk5xKS8s/9SGO2wzbILBj
        ueRL4KOJE6nlMIOSaMvBiWAJfX1ZGmv0e4E4FjsH1VZx7ldPZxKBytPuWEUYvKrE
        qBtYGp49pr1Nk1AUDCOxPLh2mRNdVYK3pHGOIcvSHNKiwtzlp3RcQIeTnea83Mmi
        VDth0PK91YoMdkgGzsiqTvome/iuqwDxqlytN8jHrw+xYihPL5TiWBTKKhEKSGo5
        6HLLjcClQvvwp67np8XgdZIbU5974UQXKnjCSFIInA78HsVcXiGsm35Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=tsYfqjVQonAa5lbJhO0HanEGazrEoetr/Xp3UbO8c4w=; b=E+YyNtcY
        KdM5QZ/dnr575IXNfLKvhGllVJJUVt42noqRP0DtPofbow4QK/bxliJUw28rg7Pp
        rspVUi++5AfAmquMh2q0c96ahWK0ra/8iLMmfnDQECP6vbqw4zvZw/galSS9VPUS
        Zwr7qkjYiKCvN+R5iwy+n/lqFWfXTTMyNClrE61Mx2EiF0PAjzEB/vl96VXaBg2c
        6M7moebl2kEN+O7hSn+L35gLcZcAqMjmwnnQtNI2AGnt6bDnqUPmRbejg8TIvKfZ
        JVfkUe3JAxwExghfCfr1QomwdCYdeM5kMwRoPBgvY0wayRmXJHy7R+sQpRivD7Jd
        a5X390oz326iFQ==
X-ME-Sender: <xms:ykF9YOdhS0ivrTyAXTLnj2PiFiaTIruG0FXYkurL9-bPX-WTWhJIuw>
    <xme:ykF9YINV-Fwf10fV7EsGfdvrtBrKhsOBvf1b-DHRpOaDNqDmxW40Tn3jZeGugYHt5
    Oo_ncfEslYzBG6BO6M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepkeelrdeg
    gedruddtrdduvdefnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilh
    hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:ykF9YPhytBjRH_2penOxAq0bNlqNQ34b7_1a_nfOD7EBrxi_8EBiQw>
    <xmx:ykF9YL8vo_WH0aUvVpDZE8QC0_o6hJeMYJI4_946MSi4vhmdqVBeWQ>
    <xmx:ykF9YKuyuBVsruO_rwc-FpvKiMdqoZGLdoc_MWE7Eepcui-v2cE7Lg>
    <xmx:ykF9YOJZD-TUq6MeZb9zibGZxqStMPxASritxcTZb2lMXboMa3qduA>
Received: from ThinkpadX1Yoga3.localdomain (unknown [89.44.10.123])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7520A1080063;
        Mon, 19 Apr 2021 04:39:35 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v5 7/9] Input: wacom_i2c - Add support for vdd regulator
Date:   Mon, 19 Apr 2021 07:01:02 +1000
Message-Id: <20210418210104.2876-7-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210418210104.2876-1-alistair@alistair23.me>
References: <20210418210104.2876-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for a VDD regulator. This allows the kernel to prove the
Wacom-I2C device on the rM2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 26881149d509..a5963d9e1194 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -13,6 +13,7 @@
 #include <linux/irq.h>
 #include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
+#include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/of.h>
 #include <asm/unaligned.h>
@@ -58,6 +59,7 @@ struct wacom_i2c {
 	struct i2c_client *client;
 	struct input_dev *input;
 	struct touchscreen_properties props;
+	struct regulator *vdd;
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
@@ -221,6 +223,20 @@ static int wacom_i2c_probe(struct i2c_client *client,
 		goto err_free_mem;
 	}
 
+	wac_i2c->vdd = regulator_get(&client->dev, "vdd");
+	if (IS_ERR(wac_i2c->vdd)) {
+		error = PTR_ERR(wac_i2c->vdd);
+		kfree(wac_i2c);
+		return error;
+	}
+
+	error = regulator_enable(wac_i2c->vdd);
+	if (error) {
+		regulator_put(wac_i2c->vdd);
+		kfree(wac_i2c);
+		return error;
+	}
+
 	wac_i2c->client = client;
 	wac_i2c->input = input;
 
@@ -277,6 +293,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 err_free_irq:
 	free_irq(client->irq, wac_i2c);
 err_free_mem:
+	regulator_disable(wac_i2c->vdd);
+	regulator_put(wac_i2c->vdd);
 	input_free_device(input);
 	kfree(wac_i2c);
 
-- 
2.31.1

