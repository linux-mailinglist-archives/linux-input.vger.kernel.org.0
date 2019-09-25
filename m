Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB51BDB57
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2019 11:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbfIYJng (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Sep 2019 05:43:36 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36735 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbfIYJnf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Sep 2019 05:43:35 -0400
Received: by mail-pg1-f194.google.com with SMTP id t14so2475625pgs.3;
        Wed, 25 Sep 2019 02:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QSmbvMLWIOG6icxv8SCtVhg1sAmBSC0GfA0YqbLhr78=;
        b=JyZMYH9hIhMFUOG7+06XiJMUtTDcN6F1MvZKLJey1aBAz2GbwUttP4b9s7dhk572V3
         c9GXGz61DpjYojF9g+N16jvjKWAbFGLEqJJe65LYfztncO8uA4rrKfffMKN2mIB8Tic7
         xtHVK/ayWjtV1j6wWlv+mZXyFWuNDZ3aqFJVVcMzeTK+mWLBQ8qdbdGQcL8Fy2hwwEny
         KqtS07Vt35cCKKwVaiIwuEifD89eGQKbTu1f9yZBGhCRD9MV1DVBwvfyXv4TevLpQ0j8
         SofPDTfc/61LipjmnPTJIlzQ9DB8dZKBavj0/fm0t4ppR2/sE14iwHnEEyNfjdTmdIwx
         cPIw==
X-Gm-Message-State: APjAAAVEJfzFwbK3sNOXu0+Xk20dM+Tr2FauGwr2bRQiXmaU2WSZ0Hha
        jCaSQYlW6mH9V3y6ov9D9+o=
X-Google-Smtp-Source: APXvYqyHlpkSuJAk2YqcHnOLvwmYt56n4LFUi3Qp1fO1Ldy80+ZkfBrUs9ghqglz2AXxKcTQ/GyeNQ==
X-Received: by 2002:a17:90a:f010:: with SMTP id bt16mr5450327pjb.33.1569404614738;
        Wed, 25 Sep 2019 02:43:34 -0700 (PDT)
Received: from localhost.localdomain (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id s24sm3819715pgm.3.2019.09.25.02.43.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 25 Sep 2019 02:43:34 -0700 (PDT)
From:   You-Sheng Yang <vicamo.yang@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hui Wang <hui.wang@canonical.com>, Julian Sax <jsbc@gmx.de>,
        HungNien Chen <hn.chen@weidahitech.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: i2c-hid: allow delay after SET_POWER
Date:   Wed, 25 Sep 2019 17:43:25 +0800
Message-Id: <20190925094326.41693-2-vicamo.yang@canonical.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925094326.41693-1-vicamo.yang@canonical.com>
References: <20190925094326.41693-1-vicamo.yang@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According to HID over I2C specification v1.0 section 7.2.8, a device is
allowed to take at most 1 second to make the transition to the specified
power state. On some touchpad devices implements Microsoft Precision
Touchpad, it may fail to execute following set PTP mode command without
the delay and leaves the device in an unsupported Mouse mode.

This change adds a post-setpower-delay-ms device property that allows
specifying the delay after a SET_POWER command is issued.

References: https://bugzilla.kernel.org/show_bug.cgi?id=204991
Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
---
 .../bindings/input/hid-over-i2c.txt           |  2 +
 drivers/hid/i2c-hid/i2c-hid-core.c            | 46 +++++++++++--------
 include/linux/platform_data/i2c-hid.h         |  3 ++
 3 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
index c76bafaf98d2f..d82faae335da0 100644
--- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
+++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
@@ -32,6 +32,8 @@ device-specific compatible properties, which should be used in addition to the
 - vdd-supply: phandle of the regulator that provides the supply voltage.
 - post-power-on-delay-ms: time required by the device after enabling its regulators
   or powering it on, before it is ready for communication.
+- post-setpower-delay-ms: time required by the device after a SET_POWER command
+  before it finished the state transition.
 
 Example:
 
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2a7c6e33bb1c4..a5bc2786dc440 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -168,6 +168,7 @@ static const struct i2c_hid_quirks {
 	__u16 idVendor;
 	__u16 idProduct;
 	__u32 quirks;
+	__u32 post_setpower_delay_ms;
 } i2c_hid_quirks[] = {
 	{ USB_VENDOR_ID_WEIDA, HID_ANY_ID,
 		I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV },
@@ -189,21 +190,20 @@ static const struct i2c_hid_quirks {
  * i2c_hid_lookup_quirk: return any quirks associated with a I2C HID device
  * @idVendor: the 16-bit vendor ID
  * @idProduct: the 16-bit product ID
- *
- * Returns: a u32 quirks value.
  */
-static u32 i2c_hid_lookup_quirk(const u16 idVendor, const u16 idProduct)
+static void i2c_hid_set_quirk(struct i2c_hid *ihid,
+		const u16 idVendor, const u16 idProduct)
 {
-	u32 quirks = 0;
 	int n;
 
 	for (n = 0; i2c_hid_quirks[n].idVendor; n++)
 		if (i2c_hid_quirks[n].idVendor == idVendor &&
 		    (i2c_hid_quirks[n].idProduct == (__u16)HID_ANY_ID ||
-		     i2c_hid_quirks[n].idProduct == idProduct))
-			quirks = i2c_hid_quirks[n].quirks;
-
-	return quirks;
+		     i2c_hid_quirks[n].idProduct == idProduct)) {
+			ihid->quirks = i2c_hid_quirks[n].quirks;
+			ihid->pdata.post_setpower_delay_ms =
+				i2c_hid_quirks[n].post_setpower_delay_ms;
+		}
 }
 
 static int __i2c_hid_command(struct i2c_client *client,
@@ -431,8 +431,22 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
 	    power_state == I2C_HID_PWR_SLEEP)
 		ihid->sleep_delay = jiffies + msecs_to_jiffies(20);
 
-	if (ret)
+	if (ret) {
 		dev_err(&client->dev, "failed to change power setting.\n");
+		goto set_pwr_exit;
+	}
+
+	/*
+	 * The HID over I2C specification states that if a DEVICE needs time
+	 * after the PWR_ON request, it should utilise CLOCK stretching.
+	 * However, it has been observered that the Windows driver provides a
+	 * 1ms sleep between the PWR_ON and RESET requests and that some devices
+	 * rely on this.
+	 */
+	if (ihid->pdata.post_setpower_delay_ms)
+		msleep(ihid->pdata.post_setpower_delay_ms);
+	else
+		usleep_range(1000, 5000);
 
 set_pwr_exit:
 	return ret;
@@ -456,15 +470,6 @@ static int i2c_hid_hwreset(struct i2c_client *client)
 	if (ret)
 		goto out_unlock;
 
-	/*
-	 * The HID over I2C specification states that if a DEVICE needs time
-	 * after the PWR_ON request, it should utilise CLOCK stretching.
-	 * However, it has been observered that the Windows driver provides a
-	 * 1ms sleep between the PWR_ON and RESET requests and that some devices
-	 * rely on this.
-	 */
-	usleep_range(1000, 5000);
-
 	i2c_hid_dbg(ihid, "resetting...\n");
 
 	ret = i2c_hid_command(client, &hid_reset_cmd, NULL, 0);
@@ -1023,6 +1028,9 @@ static void i2c_hid_fwnode_probe(struct i2c_client *client,
 	if (!device_property_read_u32(&client->dev, "post-power-on-delay-ms",
 				      &val))
 		pdata->post_power_delay_ms = val;
+	if (!device_property_read_u32(&client->dev, "post-setpower-delay-ms",
+				      &val))
+		pdata->post_setpower_delay_ms = val;
 }
 
 static int i2c_hid_probe(struct i2c_client *client,
@@ -1145,7 +1153,7 @@ static int i2c_hid_probe(struct i2c_client *client,
 		 client->name, hid->vendor, hid->product);
 	strlcpy(hid->phys, dev_name(&client->dev), sizeof(hid->phys));
 
-	ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
+	i2c_hid_set_quirk(ihid, hid->vendor, hid->product);
 
 	ret = hid_add_device(hid);
 	if (ret) {
diff --git a/include/linux/platform_data/i2c-hid.h b/include/linux/platform_data/i2c-hid.h
index c628bb5e10610..71682f2ad8a53 100644
--- a/include/linux/platform_data/i2c-hid.h
+++ b/include/linux/platform_data/i2c-hid.h
@@ -20,6 +20,8 @@
  * @hid_descriptor_address: i2c register where the HID descriptor is stored.
  * @supplies: regulators for powering on the device.
  * @post_power_delay_ms: delay after powering on before device is usable.
+ * @post_setpower_delay_ms: delay after SET_POWER command before device
+ *                          completes state transition.
  *
  * Note that it is the responsibility of the platform driver (or the acpi 5.0
  * driver, or the flattened device tree) to setup the irq related to the gpio in
@@ -36,6 +38,7 @@ struct i2c_hid_platform_data {
 	u16 hid_descriptor_address;
 	struct regulator_bulk_data supplies[2];
 	int post_power_delay_ms;
+	int post_setpower_delay_ms;
 };
 
 #endif /* __LINUX_I2C_HID_H */
-- 
2.23.0

