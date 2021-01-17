Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7282F964D
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730713AbhAQXm7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:42:59 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41975 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729455AbhAQXm5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:42:57 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 59A535C011C;
        Sun, 17 Jan 2021 18:42:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 17 Jan 2021 18:42:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=oClwcGbSXTcI3
        kvaAdIUVBBqOR56N1zqJP29sSkNGDE=; b=eEZgM6hBkrm7HoX0OCsWqtC493sup
        XmOlx3249ZSXbayhSc969s/Fqii8LHg9voL/JNeRRNuo6ZlHXgUFR90lDAl+5xpC
        Ik+PTk79cSWR/ekCh4lQxufedLRUSNaZODvBIKigEydiNVI2qKua+yFR8Ok7JoVn
        CJxSoKz/bEM9jUiQCAE/3mRN2OyjLnTXmos1gsoS7s/gTMlmLbbQ55ge2UJHk6y7
        s7sBvpLu/gR395LuzfAYvMynuipXnjcurvRKD21MTGjsWHkDaGJEtTru5DJXDa/H
        yHlnDZn4kaXQm+uD4ilRPthlAOhXNX+N6sBZ/oWjHAF9G0hq4xHKRc/pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=oClwcGbSXTcI3kvaAdIUVBBqOR56N1zqJP29sSkNGDE=; b=EcAeSGdA
        Z4hY4mTaauvBSe8VuWJaIpasBcv7VxFHRvrH2Ybxy4DGf0DVaDv1quCqlDDvY02Z
        pu2wein8I91qAGRmnLXYIMQxlXDzOS0jcZ/em3iniDgvjJR89bXD4lXO3Q3Tq5bW
        mpmtYSXhQvaz4flmu/b1792mQbHGi3JPY0jHsU0WJ6ANCzpe0sggOTpQzDGSjhGf
        CurMJlorwhVfx+xFmySbKKNFZ2j7JajQxpyHyRJly/cY6Yx59M0Uk9RMMJi/fg8j
        WJ5sIvhUyt17/BIFJmih6/+ZFP4dmYU/QPPVBmGr3beMfwfGq7/14tHvYAqgoUru
        U0OqyGtVaJZd5g==
X-ME-Sender: <xms:U8sEYKYhwksCqgnCfNCNkBwmJaM2ZJ1fhzxBnPau_jNHWd2mMkP-Iw>
    <xme:U8sEYNaT4ezXfxOvY2uGQt59dP7CN622pmrgiK1ergnj0uKdeQSZxPBWrMlY9UQxZ
    jCCmRSH_xA-PI2bvOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecukfhppeejfedrleef
    rdekgedrvddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:U8sEYE-Ohltkm6005My6clBl-iGo0EB3bQKQ8xzNz0a5Xf7I1AFlGg>
    <xmx:U8sEYMr93NOCQIflf49pRZykFPbxobBfonvQzt_Y09MayofWlOmNoQ>
    <xmx:U8sEYFpPlx_MY6QbPjP3pB3y8Sfyhkb0tFZjgwMsNY9paNHx-H0_WQ>
    <xmx:U8sEYMW3f7xTgbtc3h-0aSsunaHw-uIe5UfZ1HCgUbfAO1-dbDZvFw>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
        by mail.messagingengine.com (Postfix) with ESMTPA id 76DBE240066;
        Sun, 17 Jan 2021 18:42:10 -0500 (EST)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 2/3] input/touchscreen: Add device tree support to wacom_i2c
Date:   Sat, 16 Jan 2021 20:24:27 -0800
Message-Id: <20210117042428.1497-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210117042428.1497-1-alistair@alistair23.me>
References: <20210117042428.1497-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow the wacom-i2c device to be exposed via device tree.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 drivers/input/touchscreen/wacom_i2c.c | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 1afc6bde2891..54af2934ba17 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <asm/unaligned.h>
 
 #define WACOM_CMD_QUERY0	0x04
@@ -35,6 +36,13 @@ struct wacom_i2c {
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
+
+	bool flip_tilt_x;
+	bool flip_tilt_y;
+	bool flip_pos_x;
+	bool flip_pos_y;
+	bool flip_distance;
+	bool flip_pressure;
 };
 
 static int wacom_query_device(struct i2c_client *client,
@@ -144,6 +152,20 @@ static void wacom_i2c_close(struct input_dev *dev)
 	disable_irq(client->irq);
 }
 
+#ifdef CONFIG_OF
+static void wacom_of_read(struct wacom_i2c *wac_i2c)
+{
+	struct i2c_client *client = wac_i2c->client;
+
+	wac_i2c->flip_tilt_x = of_property_read_bool(client->dev.of_node, "flip-tilt-x");
+	wac_i2c->flip_tilt_y = of_property_read_bool(client->dev.of_node, "flip-tilt-y");
+	wac_i2c->flip_pos_x = of_property_read_bool(client->dev.of_node, "flip-pos-x");
+	wac_i2c->flip_pos_y = of_property_read_bool(client->dev.of_node, "flip-pos-y");
+	wac_i2c->flip_distance = of_property_read_bool(client->dev.of_node, "flip-distance");
+	wac_i2c->flip_pressure = of_property_read_bool(client->dev.of_node, "flip-pressure");
+}
+#endif
+
 static int wacom_i2c_probe(struct i2c_client *client,
 				     const struct i2c_device_id *id)
 {
@@ -214,6 +236,11 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	}
 
 	i2c_set_clientdata(client, wac_i2c);
+
+#ifdef CONFIG_OF
+	wacom_of_read(wac_i2c);
+#endif
+
 	return 0;
 
 err_free_irq:
@@ -262,10 +289,21 @@ static const struct i2c_device_id wacom_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id wacom_i2c_of_match_table[] = {
+	{ .compatible = "wacom,wacom-i2c" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, wacom_i2c_of_match_table);
+#endif
+
 static struct i2c_driver wacom_i2c_driver = {
 	.driver	= {
 		.name	= "wacom_i2c",
 		.pm	= &wacom_i2c_pm,
+#ifdef CONFIG_OF
+		.of_match_table = of_match_ptr(wacom_i2c_of_match_table),
+#endif
 	},
 
 	.probe		= wacom_i2c_probe,
-- 
2.29.2

