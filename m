Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99EE3FAA48
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234921AbhH2JUn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:20:43 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:33075 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234922AbhH2JUm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:20:42 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id AB4ED580B0B;
        Sun, 29 Aug 2021 05:19:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 29 Aug 2021 05:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=iVyeV50bKKhdG
        7jLyQsoLCre3zWmDz3rpMHZ1cLGQFo=; b=oy0GO77NB3z6yV5ewShmp18VIQzYj
        X+/ZTPkNb4AAjQUB6xP/3ceL/HkOYfh7p19wzJXklZ0L1LFJrk0SxuK2eJ2c2ASU
        F0SSAnhQE/5Yid6H9WupZyAyFUm063vF7BvqINyy4iKBaihc9LAmOtFyWLQhiFec
        cg+0nNSKI6s18rUutf7qbmmL3IsaDK21WLigwVQ2YgygXp/eW8+hOUmGBGkhKonA
        Ey5RmjxQ6ZdLJ10Kurd5YdqykURGOEetByujE7ch4RmK6C6Q8DHqicLo+ASJY5kX
        2dkmRV2MDcMFJ0O8JQaS1NKHJ4yNTeX+dmWIWvoYPP/Nm4s2slT0rUoFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=iVyeV50bKKhdG7jLyQsoLCre3zWmDz3rpMHZ1cLGQFo=; b=iyTiaSQ6
        JecYl7TYkWBskQhFf/LsYDrmCgdnkXyuWci6a7k/chlIui96Io2o2dai3Ip0Yc5K
        cAxqBQmPjbWxu25qhQaGvHGzdb+YNmVP/KelhWHcDurnpzUSA1ZO4dmbP2cmQ73p
        4I6fPiYwZoOcEErvOLQGJ0+fxs8bjvod9QPNkr45BguqEYp/ZbqEZ9mBO0pcnBGe
        QSYOCZMqt0mLtjH93DKaFcMPCFRfOYff9faqHYKent5K/oHqAHNop+vGoaZPcEmk
        MnA55wOpI1ssbjSUY2Q44N8IuocKqn19VicFA/lxHhwQ2NieCg07kQxVce8+Qm0G
        xHX/WE64oSeQ0w==
X-ME-Sender: <xms:NlErYYft5VI4DcE-2GLfueZGCWIKJn4mZtH0zdd5RBIXQEULUezj_A>
    <xme:NlErYaOItzE27jEtzKKg2517-9bKwA3PWd0gs4n_88l59t7VVDsT4b6iTzvmIrxtR
    9EhXx9hmyc1No1Cqgs>
X-ME-Received: <xmr:NlErYZj3i1fLyCfIpHsHsGnVNB5Zl4-YwkE6V8FM1R9oFYpKZFM1-ryqck0PfdhlncFHJIiqVX8ABsWeHdLpf4PzP2ypl_GX0JKZCbkbfg-SpW6UwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:NlErYd9nDlxqVF0trgCc50RjMsDoYryWv0nY3g1crb7narUkK3-ZwA>
    <xmx:NlErYUtYTIMTg2Nb7V9jOOdQkQCJFzOtzhtSN7PBslzv2nUJNY98Fg>
    <xmx:NlErYUGW327RoG9msZ7iu5FgWjiMI49j7Ie3J9DVPJGK0-OACme4LA>
    <xmx:NlErYUG7-5m5zdK6YUhF55YFqSYVQoWAxgsLWIHzqzV3Douo0PDrKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:19:45 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] Input: wacom_i2c - Allow flipping the values from the DT
Date:   Sun, 29 Aug 2021 19:19:14 +1000
Message-Id: <20210829091925.190-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829091925.190-1-alistair@alistair23.me>
References: <20210829091925.190-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow the device tree properties to flip the tilx, position or distance
values.

This is required for the stylus to work correctly on the reMarkable 2.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../input/touchscreen/wacom,generic.yaml      | 20 +++++++++++
 drivers/input/touchscreen/wacom_i2c.c         | 36 +++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
index a8a7f362b0ce..d451c9a235b6 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
@@ -25,6 +25,26 @@ properties:
   vdd-supply:
     description: Power Supply
 
+  flip-tilt-x:
+    type: boolean
+    description: Flip the tilt X values read from device
+
+  flip-tilt-y:
+    type: boolean
+    description: Flip the tilt Y values read from device
+
+  flip-pos-x:
+    type: boolean
+    description: Flip the X position values read from device
+
+  flip-pos-y:
+    type: boolean
+    description: Flip the Y position values read from device
+
+  flip-distance:
+    type: boolean
+    description: Flip the distance values read from device
+
 required:
   - compatible
   - reg
diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index f78a43212901..903353106ca8 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -105,6 +105,12 @@ struct wacom_i2c {
 	u8 data[WACOM_QUERY_SIZE];
 	bool prox;
 	int tool;
+
+	bool flip_tilt_x;
+	bool flip_tilt_y;
+	bool flip_pos_x;
+	bool flip_pos_y;
+	bool flip_distance;
 };
 
 static int wacom_query_device(struct i2c_client *client,
@@ -198,6 +204,19 @@ static int wacom_query_device(struct i2c_client *client,
 	return 0;
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
+}
+#endif
+
 static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 {
 	struct wacom_i2c *wac_i2c = dev_id;
@@ -234,6 +253,13 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 
 	wac_i2c->prox = data[3] & 0x20;
 
+	// Flip the values based on properties from the device tree
+	distance = wac_i2c->flip_distance ? -distance : distance;
+	x = wac_i2c->flip_pos_x ? (features->x_max - x) : x;
+	y = wac_i2c->flip_pos_y ? (features->y_max - y) : y;
+	tilt_x = wac_i2c->flip_tilt_x ? -tilt_x : tilt_x;
+	tilt_y = wac_i2c->flip_tilt_y ? -tilt_y : tilt_y;
+
 	touchscreen_report_pos(input, &wac_i2c->props, features->x_max,
 			       features->y_max, true);
 	input_report_key(input, BTN_TOUCH, tsw || ers);
@@ -361,6 +387,16 @@ static int wacom_i2c_probe(struct i2c_client *client,
 		return error;
 	}
 
+#ifdef CONFIG_OF
+	wacom_of_read(wac_i2c);
+#else
+	wac_i2c->flip_tilt_x = false;
+	wac_i2c->flip_tilt_y = false;
+	wac_i2c->flip_pos_x = false;
+	wac_i2c->flip_pos_y = false;
+	wac_i2c->flip_distance = false;
+#endif
+
 	return 0;
 }
 
-- 
2.31.1

