Return-Path: <linux-input+bounces-11116-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3FEA6CDB6
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 03:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17A101753CD
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 02:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14191FFC6E;
	Sun, 23 Mar 2025 02:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="MUkmxhwd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g5pkFG9F"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2294200130;
	Sun, 23 Mar 2025 02:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742697284; cv=none; b=XD+ZVfuhAFv+HqpCptOZEmgZp4v+GS5UIeq/gxcEz+5XlS5JLKkGP9mmWOpdXaaQwTngOlWKudm/WysoisAlrkfUN+Hyhnv7uMXFDURcWY9xtw5HFt/q3fhRwhcACAxlhY69yb7uhYiRu76nYgNfxq5/Xz8YASCBEnPahqhTKME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742697284; c=relaxed/simple;
	bh=9/wuqjb3MTDJnn7z8f5GLFPy+65RmlFRfkUX9sHRJZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9nhnqbIJ96VC9QWHKg+0QbwvbZsaZFKWBaytY0b7mgsIDz32FXE++fwa+5hFNeyjQgScNdutzV7ZBZ2tYXU8EnHoipHofdypJr8O5HwmrT/3xghLys6F+TmSkrAwpInJgP+ZOkZNdNR5GsEAUBT7mTen5wK5xZ6raFzhNolbEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=MUkmxhwd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g5pkFG9F; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8F16E254012D;
	Sat, 22 Mar 2025 22:34:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 22 Mar 2025 22:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1742697281; x=
	1742783681; bh=vD7N1Wk8INwmTT16GYi33VyKHEJFVk69v8xjdis2rrk=; b=M
	UkmxhwdhDqSzavUlhPTBQ+N9lzwzhDaVv6iEYKbhjrQ8qHCLnV33Mavv640/wozs
	LjhfnMD+MlkJ4i03vTyAjIYDjrfTVYQ+rpiiTE/czYgfWivd+UXgWB3utdlb8QB3
	PX2EVwM38ZEz2O3gP+7Couv8Rqb6/zMwWOxzNiV0zESCB2G3QUpRA+r1uslv3MkC
	CHSosXdYpuLP32Ve1oxXu0SglAk5RUXtHqxpXZZJutsuPYZBU/atCwIgTCIjX94l
	NT567mKx/9dnshPCB2ky1WMNUxf4bMCyONMc3Puctn4UIHVldQDwAPbBG47Qx2t5
	MhvgAvZ2XJoVODGWPFkZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1742697281; x=1742783681; bh=v
	D7N1Wk8INwmTT16GYi33VyKHEJFVk69v8xjdis2rrk=; b=g5pkFG9FHOb80Lbmt
	LCR+Px0vWOcuYrGfNeGKAPg80AfBywPt8MD3eB/6cYiR4+j1JYRfjetqNrHCs0KW
	fchEQzA3kerr5EQUnNDqrKSqj+xOUmbutUNIglf5I/rJ/Y1zvGl8BzltkGu0h+3s
	+e4Iobk8MERE7LY8037OGL4nq3NPimugwY2yoU1v8Su81owH+AcCN/ftWs1JVIZt
	NmOUO278yV8NBY8dTE9JmuPGhptXaU2hx2ohtSo7G6oY7mOl2UUVflsO5hTGUnxl
	Rltv2KI+eYpV8M5PobXw6uak1alwmZvcuumIW/z3xJqzGywtX/KYf/YtsKyb5+SA
	JLu8w==
X-ME-Sender: <xms:QXPfZ7XsvbBN2xsNc_WjmDBMMc7goYcnodS2dSJXKZGXWoTK0SbCMg>
    <xme:QXPfZzmDWlgYc9esdQGsPWxRzWj-CsGOBEm_RdHsGCQqOBPkTFAEQUU-Ewob35twc
    wpZx00qBhtKDf8x9Sk>
X-ME-Received: <xmr:QXPfZ3ZtW05UCyT1eSV64zXOjRPQcago91JHXS9fhiSerQ0O-rNxNYkVHE45XOjk2-CGEVWqjvT-cVtzqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepnfhukhgvucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvh
    eqnecuggftrfgrthhtvghrnhepueeuleeffeeihfelhffhheelfeffgeetuefhheevkeet
    uedugfetfeetlefhieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepuddt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrih
    hnthgvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeei
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuth
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthht
    oheplhhkmhhlsegrnhhthhgvrghsrdguvghv
X-ME-Proxy: <xmx:QXPfZ2UL8QIUwQI2zaRbv2w-s_Fc5ys9-Gh_eT--zNUNjpENx4b14A>
    <xmx:QXPfZ1lcPiT4p1Jvy1-U2Q4RDhJWOmtqFRwoYLAVYUwM-eDzrEW4Sg>
    <xmx:QXPfZzfkd0aLrJbfeHe5SfDqJxVCXx8oKGqdrDPAFmIlBJCi9TpM8w>
    <xmx:QXPfZ_EmZz8-6v0Slki13CD9LMuAPTJMzQAs5qbl2XsdHL2bb5XCrQ>
    <xmx:QXPfZ2jPI8gSU7SDrP8_tFOVNPQQ-J_6iJU-ha0OZTetcUd-RuS2qapk>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 22:34:36 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	mario.limonciello@amd.com,
	lkml@antheas.dev,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v4 2/2] platform/x86: asus-wmi: Refactor Ally suspend/resume
Date: Sun, 23 Mar 2025 15:34:21 +1300
Message-ID: <20250323023421.78012-3-luke@ljones.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250323023421.78012-1-luke@ljones.dev>
References: <20250323023421.78012-1-luke@ljones.dev>
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
 drivers/platform/x86/asus-wmi.c            | 133 +++++++++++++++------
 include/linux/platform_data/x86/asus-wmi.h |  19 +++
 3 files changed, 117 insertions(+), 39 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 599c836507ff..4b45e31f0bab 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -624,6 +624,9 @@ static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
 		hid_warn(hdev,
 			"The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
 			min_version);
+	} else {
+		set_ally_mcu_hack(ASUS_WMI_ALLY_MCU_HACK_DISABLED);
+		set_ally_mcu_powersave(true);
 	}
 }
 
@@ -1430,4 +1433,5 @@ static struct hid_driver asus_driver = {
 };
 module_hid_driver(asus_driver);
 
+MODULE_IMPORT_NS("ASUS_WMI");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 38ef778e8c19..27f11643a00d 100644
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
+static enum asus_ally_mcu_hack use_ally_mcu_hack = ASUS_WMI_ALLY_MCU_HACK_INIT;
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
@@ -1343,6 +1347,44 @@ static ssize_t nv_temp_target_show(struct device *dev,
 static DEVICE_ATTR_RW(nv_temp_target);
 
 /* Ally MCU Powersave ********************************************************/
+
+/*
+ * The HID driver needs to check MCU version and set this to false if the MCU FW
+ * version is >= the minimum requirements. New FW do not need the hacks.
+ */
+void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
+{
+	use_ally_mcu_hack = status;
+	pr_debug("%s Ally MCU suspend quirk\n",
+		 status == ASUS_WMI_ALLY_MCU_HACK_ENABLED ? "Enabled" : "Disabled");
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
+	if (err) {
+		pr_warn("Failed to set MCU powersave: %d\n", err);
+		return;
+	}
+	if (result > 1) {
+		pr_warn("Failed to set MCU powersave (result): 0x%x\n", result);
+		return;
+	}
+
+	pr_debug("%s MCU Powersave\n",
+		 enabled ? "Enabled" : "Disabled");
+}
+EXPORT_SYMBOL_NS_GPL(set_ally_mcu_powersave, "ASUS_WMI");
+
 static ssize_t mcu_powersave_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -4711,6 +4753,21 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_platform;
 
+	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_INIT) {
+		if (acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
+					&& dmi_check_system(asus_rog_ally_device))
+			use_ally_mcu_hack = ASUS_WMI_ALLY_MCU_HACK_ENABLED;
+		if (dmi_match(DMI_BOARD_NAME, "RC71")) {
+			/*
+			 * These steps ensure the device is in a valid good state, this is
+			 * especially important for the Ally 1 after a reboot.
+			 */
+			acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
+						   ASUS_USB0_PWR_EC0_CSEE_ON);
+			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
+		}
+	}
+
 	/* ensure defaults for tunables */
 	asus->ppt_pl2_sppt = 5;
 	asus->ppt_pl1_spl = 5;
@@ -4723,8 +4780,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
 	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
 	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
-	asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
-						&& dmi_check_system(asus_ally_mcu_quirk);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
 		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
@@ -4910,34 +4965,6 @@ static int asus_hotk_resume(struct device *device)
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
@@ -4978,11 +5005,34 @@ static int asus_hotk_restore(struct device *device)
 	return 0;
 }
 
+static void asus_ally_s2idle_restore(void)
+{
+	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
+		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
+					   ASUS_USB0_PWR_EC0_CSEE_ON);
+		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
+	}
+}
+
+static int asus_hotk_prepare(struct device *device)
+{
+	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
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
 
@@ -5010,6 +5060,10 @@ static int asus_wmi_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
+	if (ret)
+		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
+
 	return asus_wmi_add(pdev);
 }
 
@@ -5042,6 +5096,7 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
 
 void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
 {
+	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
 	platform_device_unregister(driver->platform_device);
 	platform_driver_unregister(&driver->platform_driver);
 	used = false;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 783e2a336861..8a515179113d 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -157,9 +157,28 @@
 #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
 #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
 
+enum asus_ally_mcu_hack {
+	ASUS_WMI_ALLY_MCU_HACK_INIT,
+	ASUS_WMI_ALLY_MCU_HACK_ENABLED,
+	ASUS_WMI_ALLY_MCU_HACK_DISABLED,
+};
+
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
+void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
+void set_ally_mcu_powersave(bool enabled);
+int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
 #else
+static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
+{
+}
+static inline void set_ally_mcu_powersave(bool enabled)
+{
+}
+static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
+{
+	return -ENODEV;
+}
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
 {
-- 
2.49.0


