Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2230C4440B3
	for <lists+linux-input@lfdr.de>; Wed,  3 Nov 2021 12:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhKCLkr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 07:40:47 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56891 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230250AbhKCLkr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Nov 2021 07:40:47 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 66EF3580689;
        Wed,  3 Nov 2021 07:38:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 03 Nov 2021 07:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=26DZ6/M3MgY9T
        a1v7+h0aelpWpuLYRAnVemoNeSeL34=; b=vkutM83pCtX3thsATOASt49IAwfhE
        jsaROAJDBv3qOZV4ShimnAImgigKel8ewK4kk9bnGeM3cY1UFKp5RG4mzT93oAaD
        tzodsnmlRpHBtNwki4nqMxkb0B7gb9mX8ohjN+qoyGKEYas8bMnfRP8Viy+eH1cQ
        ItCNWsv2DM/6ffCXAwaAMuVChyT8HrNzpVVkG72lP6mgBqCm8rLyDdEYKw++/2YW
        NQYkO89XYjT1QJThdW+Q6hO6vIOfvU4PZch6azewuIYGjY+gDSnoEGhyWQxI6dNs
        HkJIiRYdCSxyowRXYZN8NnzWoEqdjh5V0y8uylmtycM+rHC7opYDOwZTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=26DZ6/M3MgY9Ta1v7+h0aelpWpuLYRAnVemoNeSeL34=; b=cH2LBuZI
        E3u9jyDit+j1zQr9Sl66r8H6+n4ZAa9Pb707D52ARZs3JiCxzdYZ0UWq3uc7tHYl
        iFok2JWNIiLOSvTBuvnrL8miZ3olK0GW/XMoRqJRI3K2xDBwIt1c5RsIY9NHGZnv
        2AXh/gyo0Azg/ZM0bQhFZRuais4ze7n7E4WcxuoG/S0RwdxzZl0zXcAZKpN0P34f
        evtIhZO9NykJJCYbyIUVZBfRpXogvG0nK6FV0TAqjjbcBIeqK/1igC+Qygl3+5+s
        GgHMEh+FKZSyS439sSNaC5MOU1Dode7kOQR1P2Y62iGCNhxbHQdRnomNJc1k8MwI
        VHe9rzSIN3Mm6A==
X-ME-Sender: <xms:onSCYeAilY7eHpqStpSKNopdZX7dBJScTUTj6-Za_rAp8qX5bchXBg>
    <xme:onSCYYg1S2E4GZhIVEg4rgSMhdX_KDMNS9PbtCAiFydScRsSEi-kJqiX7_WVh3UrU
    bFHTy3kkKG1qTZCrq8>
X-ME-Received: <xmr:onSCYRlT3j_WkJBrMt-A6Qz-RDRe-oSZZhpw2AvJABm5d3c54KVXeWfl8NoGVxNvif4hoJu7E-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehlihhsthgr
    ihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqe
    enucggtffrrghtthgvrhhnpeeggedtteejkeeggeeugfehueevudegvdetjeeviedugedv
    tdekffekhedtteduhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:onSCYcxDQX65Mo5C4ENsrcKfesxnzT2yDXvSgkRfLYLOsPgRujC8NQ>
    <xmx:onSCYTTqBglETuQR-MCk4lFrqaPEgltNuxUdOsbgsHo7GHhF9uBvbw>
    <xmx:onSCYXYMM49DOL6rqT4Ipctm03GlCRaSZv3WjMbkN1wjz8LPpAgFjw>
    <xmx:onSCYbYoHeYFQpLRVSWtDuC5LTozDyS2boGFJplbv513DJ6Jwuo-9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Nov 2021 07:38:05 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, benjamin.tissoires@redhat.com
Cc:     linux-imx@nxp.com, jikos@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v14 2/3] HID: i2c-hid-of: Expose the touchscreen-inverted properties
Date:   Wed,  3 Nov 2021 21:37:47 +1000
Message-Id: <20211103113748.61046-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103113748.61046-1-alistair@alistair23.me>
References: <20211103113748.61046-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow the touchscreen-inverted-x/y device tree properties to control the
HID_QUIRK_X_INVERT/HID_QUIRK_Y_INVERT quirks for the hid-input device.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Acked-by: Rob Herring <robh@kernel.org>
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

