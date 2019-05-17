Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30C6A218F3
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 15:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbfEQNNN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 09:13:13 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:33858 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728315AbfEQNNN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 09:13:13 -0400
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
        by uho.ysoft.cz (Postfix) with ESMTP id 34FF0A261B;
        Fri, 17 May 2019 15:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1558098790;
        bh=Hb5jFQIPCxZTBWzwQ8QSsG9NLvE8GRE3e3X2L85MB0U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WarrosLAZNFZI6MltRWt9NKz2G3W8ySrQTAnORm44L5yhYleCL+FjuP5y8yGhvKHx
         CbjHsfXYUHO2NXn/D7kjrqZWQnQVlV00ic4ke+VCYVpX9k4dZhh5TA+IGJm106A6pc
         VEBm8sZWN1nTNDLY9MyvhzlqMFjcLSwcJZgkxYtY=
From:   =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [RFC PATCH v2 3/4] Input: mpr121-polled: Add write-through cache to detect corrupted registers
Date:   Fri, 17 May 2019 15:12:52 +0200
Message-Id: <1558098773-47416-4-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The MPR121 chip (and I2C bus in general) is quite sensitive to ESD.
An electrostatic discharge can easily cause a reset of the MPR121 chip.
Even though the chip then recovers and respond to read/write commands,
it is not properly initialized.

This state can be detected using a write-through cache of the internal
registers. Each time a register is written to, its value is stored in
the cache and marked as valid. Once per MPR121_REG_CACHE_CHECK_LIMIT
polls one valid cache value is compared with its corresponding register
value. In case of difference an error counter is increased. If the error
counter limit is exceeded, the chip is re-initialized.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
 drivers/input/keyboard/mpr121_touchkey_polled.c | 100 +++++++++++++++++++++---
 1 file changed, 88 insertions(+), 12 deletions(-)

diff --git a/drivers/input/keyboard/mpr121_touchkey_polled.c b/drivers/input/keyboard/mpr121_touchkey_polled.c
index e5e80530c9d8..6536d9b2eeb8 100644
--- a/drivers/input/keyboard/mpr121_touchkey_polled.c
+++ b/drivers/input/keyboard/mpr121_touchkey_polled.c
@@ -67,6 +67,19 @@
 #define MPR121_POLL_INTERVAL_REINIT	500
 #define MPR121_POLL_RETRY_MAX		4
 
+#define MPR121_REG_CACHE_MIN_ADDR	0x2b
+#define MPR121_REG_CACHE_MAX_ADDR	0x7f
+#define MPR121_REG_CACHE_SIZE		\
+		(MPR121_REG_CACHE_MAX_ADDR - MPR121_REG_CACHE_MIN_ADDR + 1)
+#define MPR121_REG_CACHE_CHECK_LIMIT	8
+#define mpr121_addr_to_cache_idx(addr)	(addr - MPR121_REG_CACHE_MIN_ADDR)
+#define mpr121_cache_idx_to_addr(idx)	(idx + MPR121_REG_CACHE_MIN_ADDR)
+
+struct mpr121_polled_reg_cache {
+	bool valid;
+	u8 value;
+};
+
 struct mpr121_polled {
 	struct i2c_client *client;
 	struct input_dev *input_dev;
@@ -76,6 +89,9 @@ struct mpr121_polled {
 	u32 keycodes[MPR121_MAX_KEY_COUNT];
 	u8 read_errors;
 	int vdd_uv;
+	struct mpr121_polled_reg_cache reg_cache[MPR121_REG_CACHE_SIZE];
+	u8 reg_cache_check_count;
+	u8 reg_cache_next_check_item;
 };
 
 struct mpr121_polled_init_register {
@@ -95,6 +111,29 @@ static const struct mpr121_polled_init_register init_reg_table[] = {
 	{ AUTO_CONFIG_CTRL_ADDR, 0x0b },
 };
 
+static int mpr121_polled_write_reg(struct mpr121_polled *mpr121, u8 addr,
+				   u8 value)
+{
+	struct i2c_client *client = mpr121->client;
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, addr, value);
+	if (ret < 0) {
+		dev_err(&client->dev, "i2c write error: %d\n", ret);
+		return ret;
+	}
+
+	if (addr >= MPR121_REG_CACHE_MIN_ADDR &&
+	    addr <= MPR121_REG_CACHE_MAX_ADDR) {
+		u8 i = mpr121_addr_to_cache_idx(addr);
+
+		mpr121->reg_cache[i].valid = 1;
+		mpr121->reg_cache[i].value = value;
+	}
+
+	return 0;
+}
+
 static void mpr121_polled_vdd_supply_disable(void *data)
 {
 	struct regulator *vdd_supply = data;
@@ -140,18 +179,18 @@ static int mpr121_polled_phys_init(struct mpr121_polled *mpr121,
 	int i, t, vdd, ret;
 
 	/* Set stop mode prior to writing any register */
-	ret = i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR, 0x00);
+	ret = mpr121_polled_write_reg(mpr121, ELECTRODE_CONF_ADDR, 0x00);
 	if (ret < 0)
 		goto err_i2c_write;
 
 	/* Set up touch/release threshold for ele0-ele11 */
 	for (i = 0; i <= MPR121_MAX_KEY_COUNT; i++) {
 		t = ELE0_TOUCH_THRESHOLD_ADDR + (i * 2);
-		ret = i2c_smbus_write_byte_data(client, t, TOUCH_THRESHOLD);
+		ret = mpr121_polled_write_reg(mpr121, t, TOUCH_THRESHOLD);
 		if (ret < 0)
 			goto err_i2c_write;
-		ret = i2c_smbus_write_byte_data(client, t + 1,
-						RELEASE_THRESHOLD);
+		ret = mpr121_polled_write_reg(mpr121, t + 1,
+					      RELEASE_THRESHOLD);
 		if (ret < 0)
 			goto err_i2c_write;
 	}
@@ -159,7 +198,7 @@ static int mpr121_polled_phys_init(struct mpr121_polled *mpr121,
 	/* Set up init register */
 	for (i = 0; i < ARRAY_SIZE(init_reg_table); i++) {
 		reg = &init_reg_table[i];
-		ret = i2c_smbus_write_byte_data(client, reg->addr, reg->val);
+		ret = mpr121_polled_write_reg(mpr121, reg->addr, reg->val);
 		if (ret < 0)
 			goto err_i2c_write;
 	}
@@ -173,9 +212,9 @@ static int mpr121_polled_phys_init(struct mpr121_polled *mpr121,
 	usl = ((vdd - 700) * 256) / vdd;
 	lsl = (usl * 65) / 100;
 	tl = (usl * 90) / 100;
-	ret = i2c_smbus_write_byte_data(client, AUTO_CONFIG_USL_ADDR, usl);
-	ret |= i2c_smbus_write_byte_data(client, AUTO_CONFIG_LSL_ADDR, lsl);
-	ret |= i2c_smbus_write_byte_data(client, AUTO_CONFIG_TL_ADDR, tl);
+	ret = mpr121_polled_write_reg(mpr121, AUTO_CONFIG_USL_ADDR, usl);
+	ret |= mpr121_polled_write_reg(mpr121, AUTO_CONFIG_LSL_ADDR, lsl);
+	ret |= mpr121_polled_write_reg(mpr121, AUTO_CONFIG_TL_ADDR, tl);
 
 	/*
 	 * Quick charge bit will let the capacitive charge to ready
@@ -183,7 +222,7 @@ static int mpr121_polled_phys_init(struct mpr121_polled *mpr121,
 	 * boot.
 	 */
 	eleconf = mpr121->keycount | ELECTRODE_CONF_QUICK_CHARGE;
-	ret |= i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR,
+	ret |= mpr121_polled_write_reg(mpr121, ELECTRODE_CONF_ADDR,
 					 eleconf);
 	if (ret != 0)
 		goto err_i2c_write;
@@ -256,6 +295,36 @@ static int mpr121_polled_process_keys(struct mpr121_polled *mpr121)
 
 	return 0;
 }
+
+static int mpr121_polled_check_regs(struct mpr121_polled *mpr121)
+{
+	struct i2c_client *client = mpr121->client;
+	int i, reg;
+
+	/* Skip registers that were never written to (have invalid cache) */
+	i = mpr121->reg_cache_next_check_item;
+	for (; i < MPR121_REG_CACHE_SIZE; i++)
+		if (mpr121->reg_cache[i].valid)
+			break;
+
+	if (i == MPR121_REG_CACHE_SIZE) {
+		mpr121->reg_cache_next_check_item = 0;
+		return 0;
+	}
+
+	reg = i2c_smbus_read_byte_data(client, mpr121_cache_idx_to_addr(i));
+	if (reg < 0) {
+		dev_err(&client->dev, "i2c read error: %d\n", reg);
+		return -1;
+	}
+
+	if (reg != mpr121->reg_cache[i].value)
+		return -1;
+
+	mpr121->reg_cache_next_check_item = i + 1;
+	return 0;
+}
+
 static void mpr121_poll(struct input_polled_dev *dev)
 {
 	struct mpr121_polled *mpr121 = dev->private;
@@ -282,6 +351,13 @@ static void mpr121_poll(struct input_polled_dev *dev)
 	}
 
 	mpr121->read_errors = 0;
+	mpr121->reg_cache_check_count++;
+	if (mpr121->reg_cache_check_count > MPR121_REG_CACHE_CHECK_LIMIT) {
+		mpr121->reg_cache_check_count = 0;
+		ret = mpr121_polled_check_regs(mpr121);
+		if (ret < 0)
+			mpr121->read_errors++;
+	}
 }
 
 static int mpr121_polled_probe(struct i2c_client *client,
@@ -366,8 +442,9 @@ static int mpr121_polled_probe(struct i2c_client *client,
 static int __maybe_unused mpr121_polled_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct mpr121_polled *mpr121 = i2c_get_clientdata(client);
 
-	i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR, 0x00);
+	mpr121_polled_write_reg(mpr121, ELECTRODE_CONF_ADDR, 0x00);
 
 	return 0;
 }
@@ -377,8 +454,7 @@ static int __maybe_unused mpr121_polled_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mpr121_polled *mpr121 = i2c_get_clientdata(client);
 
-	i2c_smbus_write_byte_data(client, ELECTRODE_CONF_ADDR,
-				  mpr121->keycount);
+	mpr121_polled_write_reg(mpr121, ELECTRODE_CONF_ADDR, mpr121->keycount);
 
 	return 0;
 }
-- 
2.1.4

