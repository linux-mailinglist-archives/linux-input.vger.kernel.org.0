Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53BA4393F4
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 12:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbhJYKsn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 06:48:43 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:36361 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232838AbhJYKsm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 06:48:42 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id A3CE458054E;
        Mon, 25 Oct 2021 06:46:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 25 Oct 2021 06:46:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=C5zxeSlwRdOLM
        iHOAO1OQEWUKIbs3W/wItOWpqYaqBE=; b=Rd4Pv91wQd0EfCl6lns6jRsb/H6l7
        cr7FI2Mis6yqqlF5tld0cA0KNYXixWd33Nu2aB+Q5stqlx6ZGtIuy1A5Ei9gFXAL
        y+o5mbUwOiRnXwUvgxyFovUXRquduPI7H8frczw8/202Kw4g5RhZSGgGiv/1QL8S
        P3wkshDg6wRukcHTlyXsfRO/YwPpQhw1RkhBIZffYTUV1sX5TlyrTWyViB9gYP1Y
        58y7qQDVoCoxcugzMXpD48Dy50q9sd3sx4dT9Q++3+9sl6aress165+JdDeJQiUq
        pgLcT9qZxHZ6xePS/Xj8NlYz0y6pNngwqGB+EXK4VmhuEwWPE3EWiecyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=C5zxeSlwRdOLMiHOAO1OQEWUKIbs3W/wItOWpqYaqBE=; b=O/jYDHog
        lTnCel3/TppOk4Ds7CoGUjcWm19PO+h/Z5GSwGzc0Dg5UjgGe8EegFwBw+pa8bhm
        ePxbh+ViNg+Srox1VbTPtmXDtvI5iCKfleOqL7DlCKKqoIVyOy9lM6DLB1KPIzBD
        QZeFdg6oTZUHD4+bZZpnb39runS/j8vgW5V8hFx9I2QGFwIm7CQWJhKv09K6EfhA
        2cIkszCsz54OXRtFP4XF9EeQKSM8aphqZ1p7Z7Vz4psBgWprlZ9z7won95uM953M
        zRFz2Uuq+6fN0Veo9q9nyHc4f09YRBoJQ2FCoZ1pmTBqDm41J6DyizeUxj9dp7kT
        K8kcwauQTJS5cA==
X-ME-Sender: <xms:-4p2YWeOa_rzHgujsz2zEDyHr3QC8ZPlbEq3N6OZiUNlFO1LWHNzOA>
    <xme:-4p2YQNIpiKh3GJlVhZg8WO8bKrTxOkDLv8g6nYgYrshTVgVdoOOWmXu6N6lTSoGS
    WljpCxQBVfsOyuWKGU>
X-ME-Received: <xmr:-4p2YXizoxlXXK_cHJDXuNMfPAZyFHqUaJRytgm1nqruvuuEeSfRMhuecmGIfjd1xbG-2suxFJDp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:-4p2YT-mdMUkDc8Uwp79qtat8auihJcM6JVVxxP82CTI-r-tsN1zlg>
    <xmx:-4p2YSsnXwCk8srDrI3HcZwm1ChT2dNMiEf1cT7VUhCuV7VqhoDomA>
    <xmx:-4p2YaHrPozmlaVfFYuqpt6sAwSqCquf-p7BNb5HK7RljZkyaX6E5A>
    <xmx:-4p2YTnaWUZ3OhqIJ19vHQ7noyjUv-1wGKlyNevTQ286ZfNOus1IQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 06:46:15 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     s.hauer@pengutronix.de, benjamin.tissoires@redhat.com,
        dmitry.torokhov@gmail.com, shawnguo@kernel.org
Cc:     alistair23@gmail.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        jikos@kernel.org, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v13 2/3] HID: i2c-hid-of: Expose the touchscreen-inverted properties
Date:   Mon, 25 Oct 2021 20:46:04 +1000
Message-Id: <20211025104605.36364-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025104605.36364-1-alistair@alistair23.me>
References: <20211025104605.36364-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow the touchscreen-inverted-x/y device tree properties to control the
HID_QUIRK_X_INVERT/HID_QUIRK_Y_INVERT quirks for the hid-input device.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../devicetree/bindings/input/hid-over-i2c.txt        |  2 ++
 drivers/hid/i2c-hid/i2c-hid-acpi.c                    |  2 +-
 drivers/hid/i2c-hid/i2c-hid-core.c                    |  4 +++-
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c               |  2 +-
 drivers/hid/i2c-hid/i2c-hid-of.c                      | 11 ++++++++++-
 drivers/hid/i2c-hid/i2c-hid.h                         |  2 +-
 6 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
index c76bafaf98d2..34c43d3bddfd 100644
--- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
+++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
@@ -32,6 +32,8 @@ device-specific compatible properties, which should be used in addition to the
 - vdd-supply: phandle of the regulator that provides the supply voltage.
 - post-power-on-delay-ms: time required by the device after enabling its regulators
   or powering it on, before it is ready for communication.
+- touchscreen-inverted-x: See touchscreen.txt
+- touchscreen-inverted-y: See touchscreen.txt
 
 Example:
 
diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index a6f0257a26de..b96ae15e0ad9 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -111,7 +111,7 @@ static int i2c_hid_acpi_probe(struct i2c_client *client)
 	}
 
 	return i2c_hid_core_probe(client, &ihid_acpi->ops,
-				  hid_descriptor_address);
+				  hid_descriptor_address, 0);
 }
 
 static const struct acpi_device_id i2c_hid_acpi_match[] = {
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 517141138b00..4804d71e5293 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -912,7 +912,7 @@ static void i2c_hid_core_shutdown_tail(struct i2c_hid *ihid)
 }
 
 int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
-		       u16 hid_descriptor_address)
+		       u16 hid_descriptor_address, u32 quirks)
 {
 	int ret;
 	struct i2c_hid *ihid;
@@ -1009,6 +1009,8 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 		goto err_mem_free;
 	}
 
+	hid->quirks |= quirks;
+
 	return 0;
 
 err_mem_free:
diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
index 52674149a275..b4dad66fa954 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -150,7 +150,7 @@ static int i2c_hid_of_goodix_probe(struct i2c_client *client,
 		goodix_i2c_hid_deassert_reset(ihid_goodix, true);
 	mutex_unlock(&ihid_goodix->regulator_mutex);
 
-	return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001);
+	return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001, 0);
 }
 
 static const struct goodix_i2c_hid_timing_data goodix_gt7375p_timing_data = {
diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 4bf7cea92637..b16349d6e9de 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -21,6 +21,7 @@
 
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/hid.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -71,6 +72,7 @@ static int i2c_hid_of_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct i2c_hid_of *ihid_of;
 	u16 hid_descriptor_address;
+	u32 quirks = 0;
 	int ret;
 	u32 val;
 
@@ -105,8 +107,15 @@ static int i2c_hid_of_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
+	if (device_property_read_bool(dev, "touchscreen-inverted-x")) {
+		quirks |= HID_QUIRK_X_INVERT;
+	}
+	if (device_property_read_bool(dev, "touchscreen-inverted-y")) {
+		quirks |= HID_QUIRK_Y_INVERT;
+	}
+
 	return i2c_hid_core_probe(client, &ihid_of->ops,
-				  hid_descriptor_address);
+				  hid_descriptor_address, quirks);
 }
 
 static const struct of_device_id i2c_hid_of_match[] = {
diff --git a/drivers/hid/i2c-hid/i2c-hid.h b/drivers/hid/i2c-hid/i2c-hid.h
index 05a7827d211a..236cc062d5ef 100644
--- a/drivers/hid/i2c-hid/i2c-hid.h
+++ b/drivers/hid/i2c-hid/i2c-hid.h
@@ -32,7 +32,7 @@ struct i2chid_ops {
 };
 
 int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
-		       u16 hid_descriptor_address);
+		       u16 hid_descriptor_address, u32 quirks);
 int i2c_hid_core_remove(struct i2c_client *client);
 
 void i2c_hid_core_shutdown(struct i2c_client *client);
-- 
2.31.1

