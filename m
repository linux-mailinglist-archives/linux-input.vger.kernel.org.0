Return-Path: <linux-input+bounces-10384-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4AAA451D7
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 02:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27ED07A8C27
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 01:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CDD187342;
	Wed, 26 Feb 2025 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="bsbitLzs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pFxwwEA/"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61238185920;
	Wed, 26 Feb 2025 01:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740531707; cv=none; b=nrwapc7zv0KERXP0+qB1LZvjJnflrh6hJWxiIMs+LJzr4PE3XstuegPus5QiFhe59lWmcKWaczKptIcagrx3PtXqyjX/HHhBBGMHS0ir/Ys73i4RN6KStuNzF3qlxvKLbnACyQcX0MBjXZY6f61tS8ZcYZile12e1CZVnoxkuFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740531707; c=relaxed/simple;
	bh=Mp65KYnR8hKiIngvOU+YTpmfHTRrTH2xMc+5SpUvLbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRKErR0B1LJ8PbM1uj6oN4CjiPK+u+RJjyr5jerE2EwyEXkZbhfBxmXlmquZzAu3/KFi9/QNLbg40mbdjo7Y3eoHwlAhY3u9u7Zms2ChRmj7P/Axlk2/EkIY9mPbF9QRnMB71FiduESTpYo20zRziyGkxcOUwh5KRWStZaWmmw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=bsbitLzs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pFxwwEA/; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 583FD1380991;
	Tue, 25 Feb 2025 20:01:44 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 25 Feb 2025 20:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1740531704; x=
	1740618104; bh=il4LPXWUD1av5OphbGE9K+BBj0l27zpD7hz98u6gKPo=; b=b
	sbitLzs7gCYJ3DPLIX3y4ZvT98tSfzjBdVYUlMhtqEjrnpdXeDqL+MMPOxmS8jSO
	a+SDDphsMI+LwpTKoOeNA+6cOm03d3g2LOYdyBcWHpOi8Jer71MP2s+ScRher32I
	Sd0XFe56YYGhHwbya2plUIwc4oQM4SCn3ybpYrxF8hEb/H0ObcshoTlOzi0VrW8V
	AtJ0LZIo3Xc+L0nANLhAsfZlIhp3GRILys2kQ4ks6hCnOsVHqaleE97X/24L+inh
	+8L+bj/tP6D8QL/toDBE0fzfH3voPEuIpzMSxZ0nY/cAsEvAssBp48EPapNysFK4
	uBfD3gDQ3mE14ibVoUGAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1740531704; x=1740618104; bh=i
	l4LPXWUD1av5OphbGE9K+BBj0l27zpD7hz98u6gKPo=; b=pFxwwEA/mU8s5P039
	GBmqXLw/0O+8qfQ9KPZ5qq0R6+kOuFA+twxf7GnVEkwvbbA+6z/mjdZUrEZhaHMs
	sGFfHXm9Jsc1sz3HwV7yj28yPZQxOLvJbXYmWeB42IQTikRDEMVlGkk7wYFQkRvH
	fURYaMAQDqXqhOeOnugHIju/3bJT/Rm/kvp439IZB4uKz+NS3aVefqpLkA12PA7I
	H2vXFKNaU8x3S+bg+vfaOMa3P+2vM7htGFZ8hevT2lpwMXT8O0ZAGlEeu1LSFMkI
	0/xHxsuc3W5Go3dUI6XTOglHHUhKTJyYNhOeXkyxIo15kKaCFoVAy106cai9yntR
	4LwRg==
X-ME-Sender: <xms:-Ge-ZzNPS4zvPZBAWg3DrYOZJ97PrZJVCNXRoQY83L0mcRLb_tBw2w>
    <xme:-Ge-Z9-mMur4cCwT4CJ3zxGVB9OLyMpRPPgTH_ccAY5zzfCvZEt-OWxQOGd8DgsTt
    Ldv7v48Dh7ngo9LmSk>
X-ME-Received: <xmr:-Ge-ZyS_cWgDUScNc2kk9Pxs65oUD1yhAETLnK0Pn7eGDYW9wPulpdHaQte3U2YvlOuJ2swMrFXMZNq3Qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekfedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefnuhhkvgculfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqe
    enucggtffrrghtthgvrhhnpeeuueelfeefiefhlefhhfehleefffegteeuhfehveekteeu
    udfgteefteelhfeijeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeelpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrght
    rdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthhtohep
    lhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:-Ge-Z3smPFzJDOiBEapt32kcKqConDLfs7n6JztDqWyEJgDO_zMACg>
    <xmx:-Ge-Z7eo1q8OFylDd4x8Tri8Il_o_S3g43qQ2qjK0Pwaj6OWVrWVyA>
    <xmx:-Ge-Zz3clHW6M37UEl63ZP8fkaWIi1u_nVxqLUmJjy4LP7MJL6cZlA>
    <xmx:-Ge-Z38lGi-8zqkNlkDyxnz94I-gIrASL9-H148qaGBt8G6vD_5EpQ>
    <xmx:-Ge-Z6y4XrxbtSZndkuTW9vnzVVeUunzEPEe_8Ceo3fdxDOZBruPtva8>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Feb 2025 20:01:41 -0500 (EST)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	mario.limonciello@amd.com,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v2 2/2] platform/x86: asus-wmi: Refactor Ally suspend/resume
Date: Wed, 26 Feb 2025 14:01:29 +1300
Message-ID: <20250226010129.32043-3-luke@ljones.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226010129.32043-1-luke@ljones.dev>
References: <20250226010129.32043-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Adjust how the CSEE direct call hack is used.

The results of months of testing combined with help from ASUS to
determine the actual cause of suspend issues has resulted in this
refactoring which immensely improves the reliability for devices which
do not have the following minimum MCU FW version:
- ROG Ally X: 313
- ROG Ally 1: 319

For MCU FW versions that match the minimum or above the CSEE hack is
disabled and mcu_powersave set to on by default as there are no
negatives beyond a slightly slower device reinitialization due to the
MCU being powered off.

As this is set only at module load time, it is still possible for
mcu_powersave sysfs attributes to change it at runtime if so desired.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c                     |   4 +
 drivers/platform/x86/asus-wmi.c            | 124 ++++++++++++++-------
 include/linux/platform_data/x86/asus-wmi.h |  15 +++
 3 files changed, 104 insertions(+), 39 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 3cec622b6e68..c6b94f3d0fd9 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -620,6 +620,9 @@ static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
 		hid_warn(hdev,
 			"The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
 			min_version);
+	} else {
+		set_ally_mcu_hack(false);
+		set_ally_mcu_powersave(true);
 	}
 }
 
@@ -1426,4 +1429,5 @@ static struct hid_driver asus_driver = {
 };
 module_hid_driver(asus_driver);
 
+MODULE_IMPORT_NS("ASUS_WMI");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 38ef778e8c19..9dba88a29e2c 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -142,16 +142,20 @@ module_param(fnlock_default, bool, 0444);
 #define ASUS_MINI_LED_2024_STRONG	0x01
 #define ASUS_MINI_LED_2024_OFF		0x02
 
-/* Controls the power state of the USB0 hub on ROG Ally which input is on */
 #define ASUS_USB0_PWR_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
-/* 300ms so far seems to produce a reliable result on AC and battery */
-#define ASUS_USB0_PWR_EC0_CSEE_WAIT 1500
+/*
+ * The period required to wait after screen off/on/s2idle.check in MS.
+ * Time here greatly impacts the wake behaviour. Used in suspend/wake.
+ */
+#define ASUS_USB0_PWR_EC0_CSEE_WAIT	600
+#define ASUS_USB0_PWR_EC0_CSEE_OFF	0xB7
+#define ASUS_USB0_PWR_EC0_CSEE_ON	0xB8
 
 static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
 
 static int throttle_thermal_policy_write(struct asus_wmi *);
 
-static const struct dmi_system_id asus_ally_mcu_quirk[] = {
+static const struct dmi_system_id asus_rog_ally_device[] = {
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
@@ -274,9 +278,6 @@ struct asus_wmi {
 	u32 tablet_switch_dev_id;
 	bool tablet_switch_inverted;
 
-	/* The ROG Ally device requires the MCU USB device be disconnected before suspend */
-	bool ally_mcu_usb_switch;
-
 	enum fan_type fan_type;
 	enum fan_type gpu_fan_type;
 	enum fan_type mid_fan_type;
@@ -335,6 +336,9 @@ struct asus_wmi {
 	struct asus_wmi_driver *driver;
 };
 
+/* Global to allow setting externally without requiring driver data */
+static bool use_ally_mcu_hack;
+
 /* WMI ************************************************************************/
 
 static int asus_wmi_evaluate_method3(u32 method_id,
@@ -549,7 +553,7 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
 	return 0;
 }
 
-static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
+int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
 				 u32 *retval)
 {
 	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
@@ -1343,6 +1347,38 @@ static ssize_t nv_temp_target_show(struct device *dev,
 static DEVICE_ATTR_RW(nv_temp_target);
 
 /* Ally MCU Powersave ********************************************************/
+
+/*
+ * The HID driver needs to check MCU version and set this to false if the MCU FW
+ * version is >= the minimum requirements. New FW do not need the hacks.
+ */
+void set_ally_mcu_hack(bool enabled)
+{
+	use_ally_mcu_hack = enabled;
+	pr_info("Disabled Ally MCU suspend quirks");
+}
+EXPORT_SYMBOL_NS_GPL(set_ally_mcu_hack, "ASUS_WMI");
+
+/*
+ * mcu_powersave should be enabled always, as it is fixed in MCU FW versions:
+ * - v313 for Ally X
+ * - v319 for Ally 1
+ * The HID driver checks MCU versions and so should set this if requirements match
+ */
+void set_ally_mcu_powersave(bool enabled)
+{
+	int result, err;
+
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MCU_POWERSAVE, enabled, &result);
+	if (err)
+		pr_warn("Failed to set MCU powersave: %d\n", err);
+	if (result > 1)
+		pr_warn("Failed to set MCU powersave (result): 0x%x\n", result);
+
+	pr_info("Set mcu_powersave to enabled");
+}
+EXPORT_SYMBOL_NS_GPL(set_ally_mcu_powersave, "ASUS_WMI");
+
 static ssize_t mcu_powersave_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -4711,6 +4747,18 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_platform;
 
+	use_ally_mcu_hack = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
+				&& dmi_check_system(asus_rog_ally_device);
+	if (use_ally_mcu_hack && dmi_match(DMI_BOARD_NAME, "RC71")) {
+		/*
+		 * These steps ensure the device is in a valid good state, this is
+		 * especially important for the Ally 1 after a reboot.
+		 */
+		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
+					   ASUS_USB0_PWR_EC0_CSEE_ON);
+		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
+	}
+
 	/* ensure defaults for tunables */
 	asus->ppt_pl2_sppt = 5;
 	asus->ppt_pl1_spl = 5;
@@ -4723,8 +4771,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
 	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
 	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
-	asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
-						&& dmi_check_system(asus_ally_mcu_quirk);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
 		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
@@ -4910,34 +4956,6 @@ static int asus_hotk_resume(struct device *device)
 	return 0;
 }
 
-static int asus_hotk_resume_early(struct device *device)
-{
-	struct asus_wmi *asus = dev_get_drvdata(device);
-
-	if (asus->ally_mcu_usb_switch) {
-		/* sleep required to prevent USB0 being yanked then reappearing rapidly */
-		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB8)))
-			dev_err(device, "ROG Ally MCU failed to connect USB dev\n");
-		else
-			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
-	}
-	return 0;
-}
-
-static int asus_hotk_prepare(struct device *device)
-{
-	struct asus_wmi *asus = dev_get_drvdata(device);
-
-	if (asus->ally_mcu_usb_switch) {
-		/* sleep required to ensure USB0 is disabled before sleep continues */
-		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB7)))
-			dev_err(device, "ROG Ally MCU failed to disconnect USB dev\n");
-		else
-			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
-	}
-	return 0;
-}
-
 static int asus_hotk_restore(struct device *device)
 {
 	struct asus_wmi *asus = dev_get_drvdata(device);
@@ -4978,11 +4996,34 @@ static int asus_hotk_restore(struct device *device)
 	return 0;
 }
 
+static void asus_ally_s2idle_restore(void)
+{
+	if (use_ally_mcu_hack) {
+		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
+					   ASUS_USB0_PWR_EC0_CSEE_ON);
+		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
+	}
+}
+
+static int asus_hotk_prepare(struct device *device)
+{
+	if (use_ally_mcu_hack) {
+		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
+					   ASUS_USB0_PWR_EC0_CSEE_OFF);
+		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
+	}
+	return 0;
+}
+
+/* Use only for Ally devices due to the wake_on_ac */
+static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
+	.restore = asus_ally_s2idle_restore,
+};
+
 static const struct dev_pm_ops asus_pm_ops = {
 	.thaw = asus_hotk_thaw,
 	.restore = asus_hotk_restore,
 	.resume = asus_hotk_resume,
-	.resume_early = asus_hotk_resume_early,
 	.prepare = asus_hotk_prepare,
 };
 
@@ -5010,6 +5051,10 @@ static int asus_wmi_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
+	if (ret)
+		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
+
 	return asus_wmi_add(pdev);
 }
 
@@ -5042,6 +5087,7 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
 
 void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
 {
+	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
 	platform_device_unregister(driver->platform_device);
 	platform_driver_unregister(&driver->platform_driver);
 	used = false;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 783e2a336861..a32cb8865b2f 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -158,8 +158,23 @@
 #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
 
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
+void set_ally_mcu_hack(bool enabled);
+void set_ally_mcu_powersave(bool enabled);
+int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
 #else
+static inline void set_ally_mcu_hack(bool enabled)
+{
+	return -ENODEV;
+}
+static inline void set_ally_mcu_powersave(bool enabled)
+{
+	return -ENODEV;
+}
+static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
+{
+	return -ENODEV;
+}
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
 {
-- 
2.48.1


