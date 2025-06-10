Return-Path: <linux-input+bounces-12767-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA04AD3DD0
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 17:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24C7B18973C1
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 15:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A867235048;
	Tue, 10 Jun 2025 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STsVFGk1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AB9224AFE;
	Tue, 10 Jun 2025 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570391; cv=none; b=MlmGPhhhRaHPglw5NGedEG4rI/5lTCfgEf1RJ4as80NV1kO8kVWU2n8zuZ6mVtZCB71JEX9cGNkEsUqxOjyyaJMGSkQjaDdjMUs7tji0PxsEpKTGmgkuIMngGc+JRfMKAYppJWzAbkxYS56Dn3RtnvK26fVUL7INNziZDtuhTiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570391; c=relaxed/simple;
	bh=pfG1s9183abezt7qZiUMs/BwwFhBunVV8SYSk6+J1I4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CX2wHQ13HMqeuOWEADfciXiCAS0OyjgJhnZrTjD2R44Y1iGlGu32wFrn8f86a/BlsKbd1liyAY/mVd7sziMgMT2TX/OBQ32LOdxuuBrTnElD6rFQL8NBUJiwOWijSN/srG3RffdSP+zb4uOUe4EppkEKcWrCIQoXKtjAl2coCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STsVFGk1; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso4732456a12.1;
        Tue, 10 Jun 2025 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749570387; x=1750175187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d4YS4P0Up7khVvMxUsDAYxrG2IpA3abnuSN0A4MRVwo=;
        b=STsVFGk1UHiQ6yVpeeuetXvMgslZo3y/vAQ53rcXNk9eNNEnv23HB1GtzBd82Z73kd
         fs3FlEhSPik0+ipr2Qhn1LYQkhaoaH83nNI0NW2fhGlTzpMn7IqKAVBxy2w/AbT31Go0
         2p4qPu1R3txhJB5bFeGFx200bOnXUFLHpQdpg41eYqJml+RUqFLQgtKKfsGkNM7k9+cw
         kptqCe4ftHmDyS2r7rTiGFIjpl61KwGE6QzsYBpNbQ38kS7hBCiJnbP4bVablaVTZ0JP
         Qs+2zqG8zocjeBx2JQ3NO1YhUQJ4agPJchkhxCzdAJQHtNOKL6AlnNtaJMreY8EiFyY0
         ws3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570388; x=1750175188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4YS4P0Up7khVvMxUsDAYxrG2IpA3abnuSN0A4MRVwo=;
        b=Jsz1YLzqA9YmQXrXmGud7epQCe0mqVehB7vBTkfs1Z/BKDMS33RDXkr91aHfKxnKzR
         PBLc4gnQ5zNkKYhO1qx8OFQN8SZJ91ERQHOeQQCy4VsuPc3NoJUwbCmdBmK5HkjHPG6U
         B25Lk0OXC/a0huO4iO+2hai6QByBC0TTqE7McrSEIo+0SiMDa2U6dKMFiJu+2hqms5KG
         b1Wf4EKZld11o/+r4JCwTTaACu4KaXLoi4fm4z+B1h1REoIEfmi1tqeA/ZIeZGLPND7R
         zJlkBeX92+9HeS0/0BZAWSURTAZTk8oIgJOMkpSOda1YlRs7H59B5iT6V6qr507vBRfc
         uWSQ==
X-Forwarded-Encrypted: i=1; AJvYcCULHtJFbGcCH6D6TYfpBrSpLMYWMFLrVADR+8JI+SjZ2DxoKc/KfvU3S6X3EXbdioKfOSFUQb667Y3w@vger.kernel.org, AJvYcCWZJ8x1JdpSSkBTcXntoJae9jkAxXRSx7ZsOlxt/I76Sb35EWSQLvbTOpupAsoniAdATSAqFwARt9ZCRN4=@vger.kernel.org, AJvYcCWq157IaHQQ0q/pU42M0ydf9aREwO2OD4BX5c2f2ywOEa34DlTL9PrLV2oQCP35beUtAnEIQIkld7Lg1rIO@vger.kernel.org
X-Gm-Message-State: AOJu0YwwImm4pf+Ix5hWJCAjrrVAP6OjjpnJxPkXyzluQSeHHwT0ZsgV
	/MKrLUBgop2dJJX31XzkKywE9O1qLnC2+Nmib2J74+SX3VNDYJNVpbhC
X-Gm-Gg: ASbGncvjWrsNja4RKcal2C3+LCXkDIrGl9qiiE98tR30K1cT8wvEmTk+dr2sRIOAu99
	W46pznN4e1O5KTkibM/irnuNxM25eNBRcxx7+vfMJ3xzwVhh9zE4ReM4TLOKuukc2vIuwF9BoFH
	4FCkbPjGwtXUGdhbvvmRMT90dXVG01I4IFx6/gLD4pvIfr4iRS+uP5ELaMa1DJ2HgSPEHGbLu8Z
	5nsjL9a7ur7y2kjXhw3bpbx5apZiJE5eLv3jGOIN5dlUx9/fn4dcO9DumFThG9B3xFB8343TgfX
	jsXIing104gjAjl38VRsULcQH5hYX8vUWYqXLCMgFViG78+isE8UISlcy/UEQXr0pgjaRqoeAf2
	gJSv5g5U19zk=
X-Google-Smtp-Source: AGHT+IEDXtfS66XNV/mYblarMp3AlD3RJypXTbsURR1nOQJSYGHfyO5uBLmrdUAls16LsBGLPzUjIA==
X-Received: by 2002:a05:6402:40c1:b0:606:741f:194e with SMTP id 4fb4d7f45d1cf-6082dbed2c2mr3007949a12.32.1749570387328;
        Tue, 10 Jun 2025 08:46:27 -0700 (PDT)
Received: from jurenat-workstationFai.utb.cz ([195.178.92.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6078a54da54sm5390609a12.6.2025.06.10.08.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 08:46:26 -0700 (PDT)
From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Ju=C5=99ena?= <jurenatomas@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomas Jurena <jurenatomas@gmail.com>
Subject: [PATCH] Input: tca6416-keypad - Add OF support for driver instantiation
Date: Tue, 10 Jun 2025 17:46:10 +0200
Message-Id: <20250610154609.1382818-1-jurenatomas@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomas Jurena <jurenatomas@gmail.com>

Adds support for instantiating the tca6416-keypad driver via
Device Tree. If no platform data is present, the driver can now be
probed based on OF bindings.

A corresponding Device Tree binding document is added at:
  Documentation/devicetree/bindings/input/tca6416-keypad.yaml

This allows the driver to be used in systems that rely solely on the
Device Tree for hardware description, such as embedded ARM platforms.

Tested on Toradex Ixora 1.3A board and Apalis imx8 SOM.

Signed-off-by: Tomas Jurena <jurenatomas@gmail.com>
---
 .../bindings/input/tca6416-keypad.yaml        | 87 ++++++++++++++++++
 drivers/input/keyboard/tca6416-keypad.c       | 88 +++++++++++++++++--
 2 files changed, 170 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/tca6416-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/tca6416-keypad.yaml b/Documentation/devicetree/bindings/input/tca6416-keypad.yaml
new file mode 100644
index 000000000000..f050403c4dbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/tca6416-keypad.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/tca6416-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TCA6416 keypad
+
+maintainers:
+
+description: |
+  Texas Instruments TCA6416 IO expander as a keypad input device.
+
+allOf:
+  - $ref: input.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,tca6416_keys
+      - ti,tca6408_keys
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  linux,gpio-keymap:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Array of gpio keys provided by the driver instance. Each entry is a
+      bitfield holding configuration of the input key. The bitfield looks like
+      this:
+      +------------------------------------------------------------+
+      | Bits     | 31:18    |         17 | 16:14 | 13:10    | 9:0  |
+      | Function | reserved | active_low | type  | reserved | code |
+      +------------------------------------------------------------+
+      code - Linux key code
+      type - EV_KEY or EV_SW
+      active_low - Key is active in low state
+
+  linux,keycodes:
+    minItems: 1
+    maxItems: 16
+
+  autorepeat:
+    type: boolean
+    description: |
+      Enables the Linux input system's autorepeat feature on the input device.
+
+  polling:
+    type: boolean
+    description: |
+      Forces driver to use polling mode instead of IRQ.
+
+  pinmask:
+    description: |
+      Allows to disable certain keys. By default are all inputs enabled.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      keypad@21 {
+        compatible = "ti,tca6416_keys";
+        reg = <0x21>;
+        interrupt-parent = <&gpio>;
+        interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+        linux,gpio-keymap = <
+                            0x24290, // active low, EV_KEY, 0, KEY_MACRO1
+                            0x24291, // active low, EV_KEY, 1, KEY_MACRO2
+                            0x24292, // active low, EV_KEY, 2, KEY_MACRO3
+        >;
+      };
+    };
+
+...
diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
index fbc674d7b9f0..8910498cf266 100644
--- a/drivers/input/keyboard/tca6416-keypad.c
+++ b/drivers/input/keyboard/tca6416-keypad.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/tca6416_keypad.h>
+#include <linux/bitfield.h>
 
 #define TCA6416_INPUT          0
 #define TCA6416_OUTPUT         1
@@ -24,6 +25,7 @@
 #define TCA6416_DIRECTION      3
 
 #define TCA6416_POLL_INTERVAL	100 /* msec */
+#define TCA6416_MAX_IO_SIZE 16 /* maximum number of inputs */
 
 static const struct i2c_device_id tca6416_id[] = {
 	{ "tca6416-keys", 16, },
@@ -173,9 +175,67 @@ static int tca6416_setup_registers(struct tca6416_keypad_chip *chip)
 	return 0;
 }
 
+/* Configuration bitmap
+ * | 31:18    |         17 | 16:14 | 13:10    | 9:0  |
+ * | reserved | active_low | type  | reserved | code |
+ */
+#define CFG_CODE GENMASK(9, 0)
+#define CFG_TYPE GENMASK(16, 14)
+#define CFG_ACTIVE_LOW BIT(17)
+
+static struct tca6416_keys_platform_data *
+tca6416_parse_properties(struct device *dev, uint8_t io_size)
+{
+	static const char keymap_property[] = "linux,gpio-keymap";
+	struct tca6416_keys_platform_data *pdata;
+	u32 keymap[TCA6416_MAX_IO_SIZE];
+	struct tca6416_button *buttons;
+	int ret, i;
+	u8 pin;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return NULL;
+
+	ret = device_property_count_u32(dev, keymap_property);
+	if (ret <= 0)
+		return NULL;
+
+	pdata->nbuttons = ret;
+	if (pdata->nbuttons > io_size)
+		pdata->nbuttons = io_size;
+
+	ret = device_property_read_u32_array(dev, keymap_property, keymap,
+					     pdata->nbuttons);
+	if (ret)
+		return NULL;
+
+	buttons = devm_kcalloc(dev, pdata->nbuttons, sizeof(*buttons),
+			       GFP_KERNEL);
+	if (!buttons)
+		return NULL;
+
+	for (i = 0; i < pdata->nbuttons; i++) {
+		buttons[i].code = FIELD_GET(CFG_CODE, keymap[i]);
+		buttons[i].type = FIELD_GET(CFG_TYPE, keymap[i]);
+		buttons[i].active_low = FIELD_GET(CFG_ACTIVE_LOW, keymap[i]);
+		/* enable all inputs by default */
+		pdata->pinmask |= BIT(i);
+	}
+
+	pdata->buttons = buttons;
+
+	pdata->rep = device_property_read_bool(dev, "autorepeat");
+	/* we can ignore the result as by default all inputs are enabled */
+	device_property_read_u16(dev, "pinmask", &pdata->pinmask);
+	pdata->use_polling = device_property_read_bool(dev, "polling");
+
+	return pdata;
+}
+
 static int tca6416_keypad_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	uint8_t io_size = (uintptr_t)i2c_get_match_data(client);
 	struct tca6416_keys_platform_data *pdata;
 	struct tca6416_keypad_chip *chip;
 	struct input_dev *input;
@@ -190,9 +250,13 @@ static int tca6416_keypad_probe(struct i2c_client *client)
 	}
 
 	pdata = dev_get_platdata(&client->dev);
-	if (!pdata) {
-		dev_dbg(&client->dev, "no platform data\n");
-		return -EINVAL;
+	if (!pdata && dev_fwnode(&client->dev)) {
+		pdata = tca6416_parse_properties(&client->dev, io_size);
+		if (!pdata) {
+			dev_err(&client->dev,
+				"Failed to parse device configuration from properties\n");
+			return -EINVAL;
+		}
 	}
 
 	chip = devm_kzalloc(&client->dev,
@@ -207,7 +271,7 @@ static int tca6416_keypad_probe(struct i2c_client *client)
 
 	chip->client = client;
 	chip->input = input;
-	chip->io_size = id->driver_data;
+	chip->io_size = io_size;
 	chip->pinmask = pdata->pinmask;
 	chip->use_polling = pdata->use_polling;
 
@@ -279,9 +343,23 @@ static int tca6416_keypad_probe(struct i2c_client *client)
 	return 0;
 }
 
+static const struct of_device_id tca6416_of_match[] = {
+	{
+		.compatible = "ti,tca6416_keys",
+		.data = (void *)16,
+	},
+	{
+		.compatible = "ti,tca6408_keys",
+		.data = (void *)8,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, tca6416_of_match);
+
 static struct i2c_driver tca6416_keypad_driver = {
 	.driver = {
 		.name	= "tca6416-keypad",
+		.of_match_table = tca6416_of_match,
 	},
 	.probe		= tca6416_keypad_probe,
 	.id_table	= tca6416_id,
-- 
2.34.1


