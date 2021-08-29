Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4361A3FAA62
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235072AbhH2JV1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:21:27 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:45933 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235037AbhH2JV1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:21:27 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2D017580B11;
        Sun, 29 Aug 2021 05:20:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 29 Aug 2021 05:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=A4mgAYGVpG6Ka
        yGWNohPnEKS5U+ZGD2LaPPYB9DPm6Q=; b=nGmeTmkRD0Cqcq2SPfFMAQRd5W7+D
        uCnQYNcV54a+h8kHCNqhvvzsvFlQViMTm8qICXi5ZOAepHXuWq9wOvU9otAL2m8L
        hYcLfT+9YIN/IUxG0UCFZfe1oAu0WHUe6kZ8K2QTqTEmJJLfhXz8CsTka/pvWMGB
        i+g0aRXxQrTp56BBWEFZyFDaQp8qN7785RTonJb0+3wG5bVSRbC0s0bw8ez6Ju0U
        /CToEJm5RURost9EyrSJjLB9CvMxJ/AI69845Vdwoz3zQjjUogffRzObstLaDgzP
        6L1yYRooKY95J+ZGSUDhqmxmgXAa41Z77y8nGftlYRInSDSOO3EczS6ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=A4mgAYGVpG6KayGWNohPnEKS5U+ZGD2LaPPYB9DPm6Q=; b=HWEt0FsI
        cyVY0uYjISWEyOTI9QXyx5KWAss5nGv/nncKThrex9TAfnYM0paZC1NUl3RM7HbF
        IC8VzLZPIbl3unNKiWu0F0BIpXQeeTdPdjt4ZBf4P1kkNZXWWk9iqB91luzDLVmd
        GN4ppx1SAQWcj2KOf50hWjwVyrJt1oGQC4vH0XcxDK7Cw2gH1lZIvYJzB50IHbER
        jQ+TFVYFMk1BXvgaJAhrBb4vZCDjkSDLd3c6EwHB0Am9Di/23m+nzCQQxO9n55cx
        b4KOwiaMMqItqwRgEHe4KjCcaatOkch9IV8Ywe6NxP/vA+XnNkA68H0U797Ve463
        XTyrWjwuJKA1zA==
X-ME-Sender: <xms:Y1ErYdzlBTVFqIsU20s1snonCdr39Vz28LM1myiNl9Qrvl5K-XZcXA>
    <xme:Y1ErYdSizNayG4TgpTwKNM_aLNP1C7wl6ijKlw0TkD-Te_D4lzSd1igFpeF8QTuD_
    e7GaEjnRYtEcIx-gYs>
X-ME-Received: <xmr:Y1ErYXUkPDoywG3nefxMTgy-7pKf6BMWxZujecmW-7m3GHdEKr7rEijui0JlTt2VlxTdkXilsrxmvX-mY8fjBKhk_lwb-MkFwJnspeCgyAqzOqDxqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:Y1ErYfgPHCuwfXqIW_I6PvZBsiE92mDQjMnKMguMzPBKW3MnuWTjkg>
    <xmx:Y1ErYfBgL5agB9G1MR2Zm8eeTpDKq_ob1YlXZJMVFRin_-n_-3OWfw>
    <xmx:Y1ErYYKCaoEyaHq0WTfAwbK98nqHCs0fMzNohldl5QKbuCCnONEfPA>
    <xmx:Y1ErYcI5jtJ-AqnMkqXS3SoPl8KwwHYSlzSF6sPaVILpWuou3I0lqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:20:30 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v10 10/12] Input: wacom_i2c - Allow flipping the values from the DT
Date:   Sun, 29 Aug 2021 19:19:23 +1000
Message-Id: <20210829091925.190-12-alistair@alistair23.me>
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
 drivers/input/touchscreen/wacom_i2c.c         | 34 +++++++++++++++++++
 2 files changed, 54 insertions(+)

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
index f78a43212901..dd8fa351c6e4 100644
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
@@ -198,6 +204,25 @@ static int wacom_query_device(struct i2c_client *client,
 	return 0;
 }
 
+static void wacom_of_read(struct wacom_i2c *wac_i2c)
+{
+	if (!IS_ENABLED(CONFIG_OF)) {
+		struct i2c_client *client = wac_i2c->client;
+
+		wac_i2c->flip_tilt_x = of_property_read_bool(client->dev.of_node, "flip-tilt-x");
+		wac_i2c->flip_tilt_y = of_property_read_bool(client->dev.of_node, "flip-tilt-y");
+		wac_i2c->flip_pos_x = of_property_read_bool(client->dev.of_node, "flip-pos-x");
+		wac_i2c->flip_pos_y = of_property_read_bool(client->dev.of_node, "flip-pos-y");
+		wac_i2c->flip_distance = of_property_read_bool(client->dev.of_node, "flip-distance");
+	} else {
+		wac_i2c->flip_tilt_x = false;
+		wac_i2c->flip_tilt_y = false;
+		wac_i2c->flip_pos_x = false;
+		wac_i2c->flip_pos_y = false;
+		wac_i2c->flip_distance = false;
+	}
+}
+
 static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 {
 	struct wacom_i2c *wac_i2c = dev_id;
@@ -234,6 +259,13 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
 
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
@@ -361,6 +393,8 @@ static int wacom_i2c_probe(struct i2c_client *client,
 		return error;
 	}
 
+	wacom_of_read(wac_i2c);
+
 	return 0;
 }
 
-- 
2.31.1

