Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 031277D8E13
	for <lists+linux-input@lfdr.de>; Fri, 27 Oct 2023 07:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbjJ0FT7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Oct 2023 01:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjJ0FT6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Oct 2023 01:19:58 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9B71A5;
        Thu, 26 Oct 2023 22:19:55 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6b26a3163acso1597818b3a.2;
        Thu, 26 Oct 2023 22:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698383994; x=1698988794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RNEzIaVtV/414HT6haHn0l0T8tiTVRxqza3+tEj9I8=;
        b=bhPKnWwL86oaRXxZXlPEzMFXhSwgxZyokK4ZV3OuIWb9BmxXhheoDSOO4cmk0ZteY0
         06QerrqKT5mo69rktSY/zkfWiQx9U+IfXcSuZGmmFzGXMagBwzS8HYKrF6uPOYBpUhO2
         9YsCjAfyofy3CfnGfqzAJyPGWzNuOVW1ruMlvbYIAj76Bm2cgz1r4EqEgx8uGFIdBNb+
         X9vOtWyWM/5sm4mpPtF+W6iSU/puzX/FBu5QOcDvyBTGlIC3o7YNXzasiD9omDg8hkUX
         p7/4bW7XC4nq0N8L1MeI/slo0J+nVFF6Dj1/E5hfL2lGZbfknZOW2QXcx5xlVBrIheVE
         j/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698383994; x=1698988794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RNEzIaVtV/414HT6haHn0l0T8tiTVRxqza3+tEj9I8=;
        b=VyQdU1u+hhEQMVr6M+pmpY1qFbzIyapcGH2dy8Bj/ICTdzyP0/U0qn42RwlBIkQwBH
         F3jSHpvOaKkf+jgtPwDlGs4nXEjsqrH+uB8So0O6hieWKDzz/I1cTIsUNoxSpNcK7Vm9
         R4xRnJ8nOXYZS5tAWTfKi+dXyUlCqFgtmYi+Bm3YsWy4K0nOyWMv4UEMKMOzYuwDDO4u
         V/OhGHQ9XVqIxdJdiizjhCtVYYIiaQ11XNW5pFiwJWKoGtxyYPrCXrJHoqAZcP/Epm0G
         kMadXahIL2tYZWhihnSXmFbtvvnzS6PQK6AfMeOUPpF5uFFAV/2p55ZRNuw+Tp8Rxi/4
         RXbg==
X-Gm-Message-State: AOJu0YxD3UB85zgS2bWH1SHVOUImmu+SG7wCifqUMr3AYj+eDT+wo+dt
        +hh4HmMv9ps4SuOvj8coTe7d0slXbEFskCTx
X-Google-Smtp-Source: AGHT+IEtM5nh8wn5Oqu0JDonDDESC+MoaubQennMrDPVsT5Cy4OtMVtMZXN/UFscmwWI5cgbu2K/NA==
X-Received: by 2002:a05:6a20:12c7:b0:138:836c:5370 with SMTP id v7-20020a056a2012c700b00138836c5370mr2058597pzg.42.1698383994036;
        Thu, 26 Oct 2023 22:19:54 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:6286:35cd:e1b0:b6b4:69e:b5fb])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090adb9000b00276e8e4f1fbsm2494296pjv.1.2023.10.26.22.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 22:19:53 -0700 (PDT)
From:   Anshul Dalal <anshulusr@gmail.com>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Anshul Dalal <anshulusr@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Jeff LaBundy <jeff@labundy.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] input: joystick: driver for Adafruit Seesaw Gamepad
Date:   Fri, 27 Oct 2023 10:48:11 +0530
Message-ID: <20231027051819.81333-2-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027051819.81333-1-anshulusr@gmail.com>
References: <20231027051819.81333-1-anshulusr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adds a driver for a mini gamepad that communicates over i2c, the gamepad
has bidirectional thumb stick input and six buttons.

The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
to transmit the ADC data for the joystick and digital pin state for the
buttons. I have only implemented the functionality required to receive the
thumb stick and button state.

Steps in reading the gamepad state over i2c:
  1. Reset the registers
  2. Set the pin mode of the pins specified by the `BUTTON_MASK` to input
      `BUTTON_MASK`: A bit-map for the six digital pins internally
       connected to the joystick buttons.
  3. Enable internal pullup resistors for the `BUTTON_MASK`
  4. Bulk set the pin state HIGH for `BUTTON_MASK`
  5. Poll the device for button and joystick state done by:
      `seesaw_read_data(struct i2c_client *client, struct seesaw_data *data)`

Product page:
  https://www.adafruit.com/product/5743
Arduino driver:
  https://github.com/adafruit/Adafruit_Seesaw

Driver tested on RPi Zero 2W

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---
Changes for v6:
- Added TODO
- Removed `clang-format` directives
- Namespaced device buttons
- Removed `char physical_path[32]` field from `struct seesaw_gamepad`
- Added `packed` attribute to `struct seesaw_data`
- Moved from having booleans per button to single `u32 button_state`
- Added `seesaw_button_description` array to directly associate device
  buttons with respective keycodes
- Added wrapper functions `seesaw_register_` around `i2c_master_` API
- Ratelimited input error reporting with `dev_err_ratelimited`
- Removed `of_device_id`

Changes for v5:
- Added link to the datasheet
- Added debug log message when `seesaw_read_data` fails

Changes for v4:
- Changed `1UL << BUTTON_` to BIT(BUTTON_)
- Removed `hardware_id` field from `struct seesaw_gamepad`
- Removed redundant checks for the number of bytes written and received by
  `i2c_master_send` and `i2c_master_recv`
- Used `get_unaligned_be32` to instantiate `u32 result` from `read_buf`
- Changed  `result & (1UL << BUTTON_)` to
  `test_bit(BUTTON_, (long *)&result)`
- Changed `KBUILD_MODNAME` in id-tables to `SEESAW_DEVICE_NAME`
- Fixed formatting issues
- Changed button reporting:
    Since the gamepad had the action buttons in a non-standard layout:
         (X)
      (Y)   (A)
         (B)
    Therefore moved to using generic directional action button event codes
    instead of BTN_[ABXY].

Changes for v3:
- no updates

Changes for v2:
adafruit-seesaw.c:
- Renamed file from 'adafruit_seesaw.c'
- Changed device name from 'seesaw_gamepad' to 'seesaw-gamepad'
- Changed count parameter for receiving joystick x on line 118:
    `2` to `sizeof(write_buf)`
- Fixed invalid buffer size on line 123 and 126:
    `data->y` to `sizeof(data->y)`
- Added comment for the `mdelay(10)` on line 169
- Changed inconsistent indentation on line 271
Kconfig:
- Fixed indentation for the help text
- Updated module name
Makefile:
- Updated module object file name
MAINTAINERS:
- Updated file name for the driver and bindings

 MAINTAINERS                              |   7 +
 drivers/input/joystick/Kconfig           |   9 +
 drivers/input/joystick/Makefile          |   1 +
 drivers/input/joystick/adafruit-seesaw.c | 310 +++++++++++++++++++++++
 4 files changed, 327 insertions(+)
 create mode 100644 drivers/input/joystick/adafruit-seesaw.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc6bf79fdd8..0595c832c248 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -441,6 +441,13 @@ W:	http://wiki.analog.com/AD7879
 W:	https://ez.analog.com/linux-software-drivers
 F:	drivers/input/touchscreen/ad7879.c
 
+ADAFRUIT MINI I2C GAMEPAD
+M:	Anshul Dalal <anshulusr@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
+F:	drivers/input/joystick/adafruit-seesaw.c
+
 ADDRESS SPACE LAYOUT RANDOMIZATION (ASLR)
 M:	Jiri Kosina <jikos@kernel.org>
 S:	Maintained
diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index ac6925ce8366..df9cd1830b29 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -412,4 +412,13 @@ config JOYSTICK_SENSEHAT
 	  To compile this driver as a module, choose M here: the
 	  module will be called sensehat_joystick.
 
+config JOYSTICK_SEESAW
+	tristate "Adafruit Mini I2C Gamepad with Seesaw"
+	depends on I2C
+	help
+	  Say Y here if you want to use the Adafruit Mini I2C Gamepad.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called adafruit-seesaw.
+
 endif
diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
index 3937535f0098..9976f596a920 100644
--- a/drivers/input/joystick/Makefile
+++ b/drivers/input/joystick/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
 obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
 obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
 obj-$(CONFIG_JOYSTICK_QWIIC)		+= qwiic-joystick.o
+obj-$(CONFIG_JOYSTICK_SEESAW)		+= adafruit-seesaw.o
 obj-$(CONFIG_JOYSTICK_SENSEHAT)	+= sensehat-joystick.o
 obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
 obj-$(CONFIG_JOYSTICK_SPACEBALL)	+= spaceball.o
diff --git a/drivers/input/joystick/adafruit-seesaw.c b/drivers/input/joystick/adafruit-seesaw.c
new file mode 100644
index 000000000000..1aa6fbe4fda4
--- /dev/null
+++ b/drivers/input/joystick/adafruit-seesaw.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 Anshul Dalal <anshulusr@gmail.com>
+ *
+ * Driver for Adafruit Mini I2C Gamepad
+ *
+ * Based on the work of:
+ *	Oleh Kravchenko (Sparkfun Qwiic Joystick driver)
+ *
+ * Datasheet: https://cdn-learn.adafruit.com/downloads/pdf/gamepad-qt.pdf
+ * Product page: https://www.adafruit.com/product/5743
+ * Firmware and hardware sources: https://github.com/adafruit/Adafruit_Seesaw
+ *
+ * TODO:
+ *	- Add interrupt support
+ */
+
+#include <asm-generic/unaligned.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#define SEESAW_DEVICE_NAME	"seesaw-gamepad"
+
+#define SEESAW_STATUS_BASE	0
+#define SEESAW_GPIO_BASE	1
+#define SEESAW_ADC_BASE		9
+
+#define SEESAW_GPIO_DIRCLR_BULK	3
+#define SEESAW_GPIO_BULK	4
+#define SEESAW_GPIO_BULK_SET	5
+#define SEESAW_GPIO_PULLENSET	11
+
+#define SEESAW_STATUS_HW_ID	1
+#define SEESAW_STATUS_SWRST	127
+
+#define SEESAW_ADC_OFFSET	7
+
+#define SEESAW_BUTTON_A		5
+#define SEESAW_BUTTON_B		1
+#define SEESAW_BUTTON_X		6
+#define SEESAW_BUTTON_Y		2
+#define SEESAW_BUTTON_START	16
+#define SEESAW_BUTTON_SELECT	0
+
+#define SEESAW_ANALOG_X		14
+#define SEESAW_ANALOG_Y		15
+
+#define SEESAW_JOYSTICK_MAX_AXIS	1023
+#define SEESAW_JOYSTICK_FUZZ		2
+#define SEESAW_JOYSTICK_FLAT		4
+
+#define SEESAW_GAMEPAD_POLL_INTERVAL	16
+#define SEESAW_GAMEPAD_POLL_MIN		8
+#define SEESAW_GAMEPAD_POLL_MAX		32
+
+u32 SEESAW_BUTTON_MASK = BIT(SEESAW_BUTTON_A) | BIT(SEESAW_BUTTON_B) |
+			 BIT(SEESAW_BUTTON_X) | BIT(SEESAW_BUTTON_Y) |
+			 BIT(SEESAW_BUTTON_START) | BIT(SEESAW_BUTTON_SELECT);
+
+struct seesaw_gamepad {
+	struct input_dev *input_dev;
+	struct i2c_client *i2c_client;
+};
+
+struct seesaw_data {
+	__be16 x;
+	__be16 y;
+	u32 button_state;
+} __packed;
+
+struct seesaw_button_description {
+	unsigned int code;
+	unsigned int bit;
+};
+
+static const struct seesaw_button_description seesaw_buttons[] = {
+	{
+		.code = BTN_EAST,
+		.bit = SEESAW_BUTTON_A,
+	},
+	{
+		.code = BTN_SOUTH,
+		.bit = SEESAW_BUTTON_B,
+	},
+	{
+		.code = BTN_NORTH,
+		.bit = SEESAW_BUTTON_X,
+	},
+	{
+		.code = BTN_WEST,
+		.bit = SEESAW_BUTTON_Y,
+	},
+	{
+		.code = BTN_START,
+		.bit = SEESAW_BUTTON_START,
+	},
+	{
+		.code = BTN_SELECT,
+		.bit = SEESAW_BUTTON_SELECT,
+	},
+};
+
+static int seesaw_register_read(struct i2c_client *client, u8 register_high,
+				u8 register_low, char *buf, int count)
+{
+	int ret;
+	u8 register_buf[2] = { register_high, register_low };
+
+	ret = i2c_master_send(client, register_buf, sizeof(register_buf));
+	if (ret < 0)
+		return ret;
+	ret = i2c_master_recv(client, buf, count);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int seesaw_register_write_u8(struct i2c_client *client, u8 register_high,
+				    u8 register_low, u8 value)
+{
+	int ret;
+	u8 write_buf[3] = { register_high, register_low, value };
+
+	ret = i2c_master_send(client, write_buf, sizeof(write_buf));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int seesaw_register_write_u32(struct i2c_client *client,
+				     u8 register_high, u8 register_low,
+				     u32 value)
+{
+	int ret;
+	u8 write_buf[6] = { register_high, register_low };
+
+	put_unaligned_be32(value, write_buf + 2);
+	ret = i2c_master_send(client, write_buf, sizeof(write_buf));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int seesaw_read_data(struct i2c_client *client, struct seesaw_data *data)
+{
+	int ret;
+	u8 read_buf[4];
+
+	ret = seesaw_register_read(client, SEESAW_GPIO_BASE, SEESAW_GPIO_BULK,
+				   read_buf, sizeof(read_buf));
+	if (ret)
+		return ret;
+
+	data->button_state = ~get_unaligned_be32(&read_buf);
+
+	ret = seesaw_register_read(client, SEESAW_ADC_BASE,
+				   SEESAW_ADC_OFFSET + SEESAW_ANALOG_X,
+				   (char *)&data->x, sizeof(data->x));
+	if (ret)
+		return ret;
+	/*
+	 * ADC reads left as max and right as 0, must be reversed since kernel
+	 * expects reports in opposite order.
+	 */
+	data->x = SEESAW_JOYSTICK_MAX_AXIS - be16_to_cpu(data->x);
+
+	ret = seesaw_register_read(client, SEESAW_ADC_BASE,
+				   SEESAW_ADC_OFFSET + SEESAW_ANALOG_Y,
+				   (char *)&data->y, sizeof(data->y));
+	if (ret)
+		return ret;
+	data->y = be16_to_cpu(data->y);
+
+	return 0;
+}
+
+static void seesaw_poll(struct input_dev *input)
+{
+	int err, i;
+	struct seesaw_gamepad *private = input_get_drvdata(input);
+	struct seesaw_data data;
+
+	err = seesaw_read_data(private->i2c_client, &data);
+	if (err != 0) {
+		dev_err_ratelimited(&input->dev,
+				    "failed to read joystick state: %d\n", err);
+		return;
+	}
+
+	input_report_abs(input, ABS_X, data.x);
+	input_report_abs(input, ABS_Y, data.y);
+
+	for (i = 0; i < ARRAY_SIZE(seesaw_buttons); i++) {
+		input_report_key(input, seesaw_buttons[i].code,
+				 data.button_state &
+					 BIT(seesaw_buttons[i].bit));
+	}
+	input_sync(input);
+}
+
+static int seesaw_probe(struct i2c_client *client)
+{
+	int err, i;
+	u8 hardware_id;
+	struct seesaw_gamepad *seesaw;
+
+	err = seesaw_register_write_u8(client, SEESAW_STATUS_BASE,
+				       SEESAW_STATUS_SWRST, 0xFF);
+	if (err)
+		return err;
+
+	/* Wait for the registers to reset before proceeding */
+	mdelay(10);
+
+	seesaw = devm_kzalloc(&client->dev, sizeof(*seesaw), GFP_KERNEL);
+	if (!seesaw)
+		return -ENOMEM;
+
+	err = seesaw_register_read(client, SEESAW_STATUS_BASE,
+				   SEESAW_STATUS_HW_ID, &hardware_id, 1);
+	if (err)
+		return err;
+
+	dev_dbg(&client->dev, "Adafruit Seesaw Gamepad, Hardware ID: %02x\n",
+		hardware_id);
+
+	/* Set Pin Mode to input and enable pull-up resistors */
+	err = seesaw_register_write_u32(client, SEESAW_GPIO_BASE,
+					SEESAW_GPIO_DIRCLR_BULK,
+					SEESAW_BUTTON_MASK);
+	if (err)
+		return err;
+	err = seesaw_register_write_u32(client, SEESAW_GPIO_BASE,
+					SEESAW_GPIO_PULLENSET,
+					SEESAW_BUTTON_MASK);
+	if (err)
+		return err;
+	err = seesaw_register_write_u32(client, SEESAW_GPIO_BASE,
+					SEESAW_GPIO_BULK_SET,
+					SEESAW_BUTTON_MASK);
+	if (err)
+		return err;
+
+	seesaw->i2c_client = client;
+	i2c_set_clientdata(client, seesaw);
+
+	seesaw->input_dev = devm_input_allocate_device(&client->dev);
+	if (!seesaw->input_dev)
+		return -ENOMEM;
+
+	seesaw->input_dev->id.bustype = BUS_I2C;
+	seesaw->input_dev->name = "Adafruit Seesaw Gamepad";
+	seesaw->input_dev->phys = "i2c/" SEESAW_DEVICE_NAME;
+	input_set_drvdata(seesaw->input_dev, seesaw);
+	input_set_abs_params(seesaw->input_dev, ABS_X, 0,
+			     SEESAW_JOYSTICK_MAX_AXIS, SEESAW_JOYSTICK_FUZZ,
+			     SEESAW_JOYSTICK_FLAT);
+	input_set_abs_params(seesaw->input_dev, ABS_Y, 0,
+			     SEESAW_JOYSTICK_MAX_AXIS, SEESAW_JOYSTICK_FUZZ,
+			     SEESAW_JOYSTICK_FLAT);
+	for (i = 0; i < ARRAY_SIZE(seesaw_buttons); i++) {
+		input_set_capability(seesaw->input_dev, EV_KEY,
+				     seesaw_buttons[i].code);
+	}
+
+	err = input_setup_polling(seesaw->input_dev, seesaw_poll);
+	if (err) {
+		dev_err(&client->dev, "failed to set up polling: %d\n", err);
+		return err;
+	}
+
+	input_set_poll_interval(seesaw->input_dev,
+				SEESAW_GAMEPAD_POLL_INTERVAL);
+	input_set_max_poll_interval(seesaw->input_dev, SEESAW_GAMEPAD_POLL_MAX);
+	input_set_min_poll_interval(seesaw->input_dev, SEESAW_GAMEPAD_POLL_MIN);
+
+	err = input_register_device(seesaw->input_dev);
+	if (err) {
+		dev_err(&client->dev, "failed to register joystick: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id seesaw_id_table[] = {
+	{ SEESAW_DEVICE_NAME, 0 },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, seesaw_id_table);
+
+static struct i2c_driver seesaw_driver = {
+	.driver = {
+		.name = SEESAW_DEVICE_NAME,
+	},
+	.id_table = seesaw_id_table,
+	.probe = seesaw_probe,
+};
+module_i2c_driver(seesaw_driver);
+
+MODULE_AUTHOR("Anshul Dalal <anshulusr@gmail.com>");
+MODULE_DESCRIPTION("Adafruit Mini I2C Gamepad driver");
+MODULE_LICENSE("GPL");
-- 
2.42.0

