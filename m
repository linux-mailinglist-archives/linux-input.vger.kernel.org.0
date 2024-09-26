Return-Path: <linux-input+bounces-6741-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAFF98702F
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 11:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BD4E2830E9
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203781AD3FD;
	Thu, 26 Sep 2024 09:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="RTMp4VY5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HLAWWkUi"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0861ACE15;
	Thu, 26 Sep 2024 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727343020; cv=none; b=Yve7cq8cEYF0dCGtuPXOLws1dXyMVb3ICgdmRYdYvNQcqwhVlyNjZJ7vi1c2mnwd2tImS2OLd7FJYbCdTP6TCPJEAZ4kCXWAYphpqLzItEcV+pS8ul4U+iIUTFTsjIhBV6tL7NXCRDPgrC9aZx8h+Q6WG9vwaKdNN12DBm0VsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727343020; c=relaxed/simple;
	bh=le9WTNCmYy/T/Tg+5sz3Rz3G3ZK3uWpCWfc0TzFQ/74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXn7bGzx6gFdDlhRq/xldHzkwAYcqo3PLb6b7ZYJTZoQPi9RF/hJrHFMeBTEhZCJmC3e74P1DxhSUxqQIqfoPCa487wOi448WwkIM9Q/kl/xVnGPtT5eBqik9uqktSgAIWKBmprMTxtlxomQBIqRuHsL6lJoV8o9nFJrIwf6Flw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=RTMp4VY5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HLAWWkUi; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 4C2FE13805B3;
	Thu, 26 Sep 2024 05:30:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 26 Sep 2024 05:30:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727343016;
	 x=1727429416; bh=T+tiUmSCQFg+L9EgMDJC4f52q5+zmhULjTumKWYKWeU=; b=
	RTMp4VY5NLxXTgkvHMmbEjU8mVkIlnXrZqrTzYHEIYJQBP3/pimvIEFTTpgRhIrh
	C/ByEpEWtcHBBmNkC3JNHciTEWu46lE9H6Rq3ym7Kb8IOZriF14CGYR6X88Sk1Nk
	w7GE0AZ9TmmB7Jhw5iAPsYFbiT4OCZuMmavmpAUkAso7ag5Lr910CeQmPWhMhYHT
	YhV7Uvk60SkPIxvbJRjjTaGHWGS2tVOlonDHi4d0Sc1oPHZr3FWoSX5zsEND/22w
	+Yy2mSJaQAkVi0h9yr0KTPeFPsHfcGrlSZIS4Y1LeGTL8rjp3sdxuRf68Hjues21
	cg/Hlue8hsqA/BZkhYDl7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727343016; x=
	1727429416; bh=T+tiUmSCQFg+L9EgMDJC4f52q5+zmhULjTumKWYKWeU=; b=H
	LAWWkUi90WmuK2jNiUUJekyXT01hPqvXtNR4JZCxn+KkaoypLmKUjaUTbXC+Tzqc
	jSTmWlqtFMZpTtbb3etzV0P/Wcwq4+jeJRPNB8BkMlx3X96JiX701wc7GJnWPSwg
	xjmJA8Y9Oll4oUrVKwki3JueX+pWdGqLanT7nmbp4kIddUx/dR11FHrRlmdKYDEd
	4mhKdixqstSzPqdDj1OlnedBpXJGO5p7LTzsc45k9jcN4W/fp6HVsvmOpcn/Be1E
	ZGBEuFHoXE42oe3G5kOq/zGGLRwmAFnrQ69NN6pfkuuRiZRRsQo+EgahFKt0YZ00
	WEELes5HL6CKNPmMQh6SQ==
X-ME-Sender: <xms:qCn1ZvT1qE5zsl62TPpIu7ihToBvjrPVGqdPuTdkp0eU5Gzn9nqPnw>
    <xme:qCn1ZgwN0OdPD_McDqA3wcRuEHLSbX6FdhPpKY8pPYbP066ENvtv7mAq38qr-HhcL
    BHBRaW112C3kaVMvFI>
X-ME-Received: <xmr:qCn1Zk2uvgXWG94DATYH5IPN6SMPmCs_svuwWH2Aqbea6QP_dmVrZw0yLWO54A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepfdfnuhhkvgcuffdrucflohhn
    vghsfdcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeduud
    etudehiedvvdevveelhfegkeefffdvfeetuefgveefgffgffeiffeitdelieenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjoh
    hnvghsrdguvghvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjih
    hkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhv
    vghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhord
    hjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggv
    ghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheptghorhgvnhhtihhnrdgthh
    grrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhuphgvrhhmudeskhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:qCn1ZvDQqHwb9LC-bbb0VHcGmx-nA1ZTzTwzTQFcCiu6HxW9UomVZA>
    <xmx:qCn1ZohaHLnjT18nYmjpZB4XpU27VpGxVas_6AFgQSVqGCndwECwMw>
    <xmx:qCn1ZjpYrzC8cPKYH90JhyWKOw-PM1BeCwE611Klg7EXP4ZC5Mi63g>
    <xmx:qCn1Zjg-AliR-iXju5GoVWadNHKwAjNoWYS6wRWX49MDlpArxiweWA>
    <xmx:qCn1ZrMNVMLvWzd3xWmd7NQLKI_3A457F1zdx4n3wPu3eQNo_B5OE5LH>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 05:30:11 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	corentin.chary@gmail.com,
	superm1@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v4 3/9] platform/x86: asus-armoury: move existing tunings to asus-armoury module
Date: Thu, 26 Sep 2024 21:29:46 +1200
Message-ID: <20240926092952.1284435-4-luke@ljones.dev>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240926092952.1284435-1-luke@ljones.dev>
References: <20240926092952.1284435-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The fw_attributes_class provides a much cleaner interface to all of the
attributes introduced to asus-wmi. This patch moves all of these extra
attributes over to fw_attributes_class, and shifts the bulk of these
definitions to a new kernel module to reduce the clutter of asus-wmi
with the intention of deprecating the asus-wmi attributes in future.

The work applies only to WMI methods which don't have a clearly defined
place within the sysfs and as a result ended up lumped together in
/sys/devices/platform/asus-nb-wmi/ with no standard API.

Where possible the fw attrs now implement defaults, min, max, scalar,
choices, etc. As en example dgpu_disable becomes:

/sys/class/firmware-attributes/asus-armoury/attributes/dgpu_disable/
├── current_value
├── display_name
├── possible_values
└── type

as do other attributes.

The ppt_* based attributes are removed in this initial patch as the
implementation is somewhat broken due to the WMI methods requiring a
set of limits on the values accepted (which is not provided by WMI).

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/Kconfig        |  13 +
 drivers/platform/x86/Makefile       |   1 +
 drivers/platform/x86/asus-armoury.c | 563 ++++++++++++++++++++++++++++
 drivers/platform/x86/asus-armoury.h | 146 ++++++++
 4 files changed, 723 insertions(+)
 create mode 100644 drivers/platform/x86/asus-armoury.c
 create mode 100644 drivers/platform/x86/asus-armoury.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3875abba5a79..dedf66e0d099 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -265,6 +265,19 @@ config ASUS_WIRELESS
 	  If you choose to compile this driver as a module the module will be
 	  called asus-wireless.
 
+config ASUS_ARMOURY
+	tristate "ASUS Armoury driver"
+	depends on ACPI_WMI
+	depends on ASUS_WMI
+	select FW_ATTR_CLASS
+	help
+	  Say Y here if you have a WMI aware Asus machine and would like to use the
+	  firmware_attributes API to control various settings typically exposed in
+	  the ASUS Armoury Crate application available on Windows.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called asus-armoury.
+
 config ASUS_WMI
 	tristate "ASUS WMI Driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b142947067..fe3e7e7dede8 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
 # ASUS
 obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
 obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
+obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
 obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
 obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
 obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
new file mode 100644
index 000000000000..39e422b16b8e
--- /dev/null
+++ b/drivers/platform/x86/asus-armoury.c
@@ -0,0 +1,563 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Asus Armoury (WMI) attributes driver. This driver uses the fw_attributes
+ * class to expose the various WMI functions that many gaming and some
+ * non-gaming ASUS laptops have available.
+ * These typically don't fit anywhere else in the sysfs such as under LED class,
+ * hwmon or other, and are set in Windows using the ASUS Armoury Crate tool.
+ *
+ * Copyright(C) 2010 Intel Corporation.
+ * Copyright(C) 2024-2024 Luke Jones <luke@ljones.dev>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/errno.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/kmod.h>
+#include <linux/kobject.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_data/x86/asus-wmi.h>
+#include <linux/types.h>
+
+#include "asus-armoury.h"
+#include "firmware_attributes_class.h"
+#include "asus-wmi.h"
+
+#define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
+
+#define ASUS_MINI_LED_MODE_MASK 0x03
+/* Standard modes for devices with only on/off */
+#define ASUS_MINI_LED_OFF 0x00
+#define ASUS_MINI_LED_ON 0x01
+/* Like "on" but the effect is more vibrant or brighter */
+#define ASUS_MINI_LED_STRONG_MODE 0x02
+/* New modes for devices with 3 mini-led mode types */
+#define ASUS_MINI_LED_2024_WEAK 0x00
+#define ASUS_MINI_LED_2024_STRONG 0x01
+#define ASUS_MINI_LED_2024_OFF 0x02
+
+/* Default limits for tunables available on ASUS ROG laptops */
+#define PPT_CPU_LIMIT_MIN 5
+#define PPT_CPU_LIMIT_MAX 150
+#define PPT_CPU_LIMIT_DEFAULT 80
+#define PPT_PLATFORM_MIN 5
+#define PPT_PLATFORM_MAX 100
+#define PPT_PLATFORM_DEFAULT 80
+#define NVIDIA_BOOST_MIN 5
+#define NVIDIA_BOOST_MAX 25
+#define NVIDIA_TEMP_MIN 75
+#define NVIDIA_TEMP_MAX 87
+
+static const struct class *fw_attr_class;
+
+struct asus_armoury_priv {
+	struct device *fw_attr_dev;
+	struct kset *fw_attr_kset;
+
+	u32 mini_led_dev_id;
+	u32 gpu_mux_dev_id;
+
+	struct mutex mutex;
+};
+
+static struct asus_armoury_priv asus_armoury = { .mutex = __MUTEX_INITIALIZER(
+							 asus_armoury.mutex) };
+
+struct fw_attrs_group {
+	bool pending_reboot;
+};
+
+static struct fw_attrs_group fw_attrs = {
+	.pending_reboot = false,
+};
+
+struct asus_attr_group {
+	const struct attribute_group *attr_group;
+	u32 wmi_devid;
+};
+
+static bool asus_wmi_is_present(u32 dev_id)
+{
+	u32 retval;
+	int status;
+
+	status = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, &retval);
+	pr_debug("%s called (0x%08x), retval: 0x%08x\n", __func__, dev_id, retval);
+
+	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
+}
+
+static void asus_set_reboot_and_signal_event(void)
+{
+	fw_attrs.pending_reboot = true;
+	kobject_uevent(&asus_armoury.fw_attr_dev->kobj, KOBJ_CHANGE);
+}
+
+static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", fw_attrs.pending_reboot);
+}
+
+static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
+
+static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
+{
+	return !strcmp(attr->attr.name, "gpu_mux_mode");
+}
+
+/**
+ * attr_int_store() - Generic store function for use with most WMI functions.
+ * @kobj: Pointer to the driver object.
+ * @kobj_attribute: Pointer to the attribute calling this function.
+ * @buf: The buffer to read from, this is parsed to `int` type.
+ * @count:
+ * @min: Minimum accepted value. Below this returns -EINVAL.
+ * @max: Maximum accepted value. Above this returns -EINVAL.
+ * @store_value: Pointer to where the parsed value should be stored.
+ * @wmi_dev: The WMI function ID to use.
+ *
+ * The WMI functions available on most ASUS laptops return a 1 as "success", and
+ * a 0 as failed. However some functions can return n > 1 for additional errors.
+ * attr_int_store() currently treats all values which are not 1 as errors, ignoring
+ * the possible differences in WMI error returns.
+ *
+ * Returns: Either count, or an error.
+ */
+static ssize_t attr_int_store(struct kobject *kobj, struct kobj_attribute *attr, const char *buf,
+			      size_t count, u32 min, u32 max, u32 *store_value, u32 wmi_dev)
+{
+	u32 result, value;
+	int err;
+
+	err = kstrtouint(buf, 10, &value);
+	if (err)
+		return err;
+
+	if (value < min || value > max)
+		return -EINVAL;
+
+	err = asus_wmi_set_devstate(wmi_dev, value, &result);
+	if (err) {
+		pr_err("Failed to set %s: %d\n", attr->attr.name, err);
+		return err;
+	}
+
+	if (result != 1) {
+		pr_err("Failed to set %s (result): 0x%x\n", attr->attr.name, result);
+		return -EIO;
+	}
+
+	if (store_value != NULL)
+		*store_value = value;
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	if (asus_bios_requires_reboot(attr))
+		asus_set_reboot_and_signal_event();
+
+	return count;
+}
+
+/* Mini-LED mode **************************************************************/
+static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
+						struct kobj_attribute *attr, char *buf)
+{
+	u32 value;
+	int err;
+
+	err = asus_wmi_get_devstate_dsts(asus_armoury.mini_led_dev_id, &value);
+	if (err)
+		return err;
+
+	value &= ASUS_MINI_LED_MODE_MASK;
+
+	/*
+	 * Remap the mode values to match previous generation mini-LED. The last gen
+	 * WMI 0 == off, while on this version WMI 2 == off (flipped).
+	 */
+	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2) {
+		switch (value) {
+		case ASUS_MINI_LED_2024_WEAK:
+			value = ASUS_MINI_LED_ON;
+			break;
+		case ASUS_MINI_LED_2024_STRONG:
+			value = ASUS_MINI_LED_STRONG_MODE;
+			break;
+		case ASUS_MINI_LED_2024_OFF:
+			value = ASUS_MINI_LED_OFF;
+			break;
+		}
+	}
+
+	return sysfs_emit(buf, "%u\n", value);
+}
+
+static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
+						 struct kobj_attribute *attr, const char *buf,
+						 size_t count)
+{
+	int result, err;
+	u32 mode;
+
+	err = kstrtou32(buf, 10, &mode);
+	if (err)
+		return err;
+
+	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE &&
+	    mode > ASUS_MINI_LED_ON)
+		return -EINVAL;
+	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2 &&
+	    mode > ASUS_MINI_LED_STRONG_MODE)
+		return -EINVAL;
+
+	/*
+	 * Remap the mode values so expected behaviour is the same as the last
+	 * generation of mini-LED with 0 == off, 1 == on.
+	 */
+	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2) {
+		switch (mode) {
+		case ASUS_MINI_LED_OFF:
+			mode = ASUS_MINI_LED_2024_OFF;
+			break;
+		case ASUS_MINI_LED_ON:
+			mode = ASUS_MINI_LED_2024_WEAK;
+			break;
+		case ASUS_MINI_LED_STRONG_MODE:
+			mode = ASUS_MINI_LED_2024_STRONG;
+			break;
+		}
+	}
+
+	err = asus_wmi_set_devstate(asus_armoury.mini_led_dev_id, mode, &result);
+	if (err) {
+		pr_warn("Failed to set mini-LED: %d\n", err);
+		return err;
+	}
+
+	if (result != 1) {
+		pr_warn("Failed to set mini-LED mode (result): 0x%x\n", result);
+		return -EIO;
+	}
+
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	return count;
+}
+
+static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
+						  struct kobj_attribute *attr, char *buf)
+{
+	switch (asus_armoury.mini_led_dev_id) {
+	case ASUS_WMI_DEVID_MINI_LED_MODE:
+		return sysfs_emit(buf, "0;1\n");
+	case ASUS_WMI_DEVID_MINI_LED_MODE2:
+		return sysfs_emit(buf, "0;1;2\n");
+	}
+
+	return sysfs_emit(buf, "0\n");
+}
+
+ATTR_GROUP_ENUM_CUSTOM(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
+
+static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
+						struct kobj_attribute *attr, const char *buf,
+						size_t count)
+{
+	int result, err;
+	u32 optimus;
+
+	err = kstrtou32(buf, 10, &optimus);
+	if (err)
+		return err;
+
+	if (optimus > 1)
+		return -EINVAL;
+
+	if (asus_wmi_is_present(ASUS_WMI_DEVID_DGPU)) {
+		err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_DGPU, &result);
+		if (err)
+			return err;
+		if (result && !optimus) {
+			err = -ENODEV;
+			pr_warn("Can not switch MUX to dGPU mode when dGPU is disabled: %02X %02X %d\n",
+				result, optimus, err);
+			return err;
+		}
+	}
+
+	if (asus_wmi_is_present(ASUS_WMI_DEVID_EGPU)) {
+		err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU, &result);
+		if (err)
+			return err;
+		if (result && !optimus) {
+			err = -ENODEV;
+			pr_warn("Can not switch MUX to dGPU mode when eGPU is enabled: %d\n",
+				err);
+			return err;
+		}
+	}
+
+	err = asus_wmi_set_devstate(asus_armoury.gpu_mux_dev_id, optimus, &result);
+	if (err) {
+		pr_err("Failed to set GPU MUX mode: %d\n", err);
+		return err;
+	}
+	/* !1 is considered a fail by ASUS */
+	if (result != 1) {
+		pr_warn("Failed to set GPU MUX mode (result): 0x%x\n", result);
+		return -EIO;
+	}
+
+	sysfs_notify(kobj, NULL, attr->attr.name);
+	asus_set_reboot_and_signal_event();
+
+	return count;
+}
+WMI_SHOW_INT(gpu_mux_mode_current_value, "%d\n", asus_armoury.gpu_mux_dev_id);
+ATTR_GROUP_BOOL_CUSTOM(gpu_mux_mode, "gpu_mux_mode", "Set the GPU display MUX mode");
+
+/*
+ * A user may be required to store the value twice, typical store first, then
+ * rescan PCI bus to activate power, then store a second time to save correctly.
+ * The reason for this is that an extra code path in the ACPI is enabled when
+ * the device and bus are powered.
+ */
+static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
+						struct kobj_attribute *attr, const char *buf,
+						size_t count)
+{
+	int result, err;
+	u32 disable;
+
+	err = kstrtou32(buf, 10, &disable);
+	if (err)
+		return err;
+
+	if (disable > 1)
+		return -EINVAL;
+
+	if (asus_armoury.gpu_mux_dev_id) {
+		err = asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &result);
+		if (err)
+			return err;
+		if (!result && disable) {
+			err = -ENODEV;
+			pr_warn("Can not disable dGPU when the MUX is in dGPU mode: %d\n", err);
+			return err;
+		}
+	}
+
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_DGPU, disable, &result);
+	if (err) {
+		pr_warn("Failed to set dGPU disable: %d\n", err);
+		return err;
+	}
+
+	if (result != 1) {
+		pr_warn("Failed to set dGPU disable (result): 0x%x\n", result);
+		return -EIO;
+	}
+
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	return count;
+}
+WMI_SHOW_INT(dgpu_disable_current_value, "%d\n", ASUS_WMI_DEVID_DGPU);
+ATTR_GROUP_BOOL_CUSTOM(dgpu_disable, "dgpu_disable", "Disable the dGPU");
+
+/* The ACPI call to enable the eGPU also disables the internal dGPU */
+static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+					       const char *buf, size_t count)
+{
+	int result, err;
+	u32 enable;
+
+	err = kstrtou32(buf, 10, &enable);
+	if (err)
+		return err;
+
+	if (enable > 1)
+		return -EINVAL;
+
+	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU_CONNECTED, &result);
+	if (err) {
+		pr_warn("Failed to get eGPU connection status: %d\n", err);
+		return err;
+	}
+
+	if (asus_armoury.gpu_mux_dev_id) {
+		err = asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &result);
+		if (err) {
+			pr_warn("Failed to get GPU MUX status: %d\n", result);
+			return result;
+		}
+		if (!result && enable) {
+			err = -ENODEV;
+			pr_warn("Can not enable eGPU when the MUX is in dGPU mode: %d\n", err);
+			return err;
+		}
+	}
+
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_EGPU, enable, &result);
+	if (err) {
+		pr_warn("Failed to set eGPU state: %d\n", err);
+		return err;
+	}
+
+	if (result != 1) {
+		pr_warn("Failed to set eGPU state (retval): 0x%x\n", result);
+		return -EIO;
+	}
+
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	return count;
+}
+WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
+ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
+
+/* Simple attribute creation */
+ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
+		       "Show the current mode of charging");
+
+ATTR_GROUP_BOOL_RW(boot_sound, "boot_sound", ASUS_WMI_DEVID_BOOT_SOUND,
+		   "Set the boot POST sound");
+ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
+		   "Set MCU powersaving mode");
+ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
+		   "Set the panel refresh overdrive");
+ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
+		   "Show the eGPU connection status");
+
+/* If an attribute does not require any special case handling add it here */
+static const struct asus_attr_group armoury_attr_groups[] = {
+	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
+	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
+	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
+
+	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
+	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
+	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
+	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
+};
+
+static int asus_fw_attr_add(void)
+{
+	int err;
+
+	err = fw_attributes_class_get(&fw_attr_class);
+	if (err)
+		goto fail_class_created;
+
+	asus_armoury.fw_attr_dev =
+		device_create(fw_attr_class, NULL, MKDEV(0, 0), NULL, "%s", DRIVER_NAME);
+
+	if (IS_ERR(asus_armoury.fw_attr_dev)) {
+		err = PTR_ERR(asus_armoury.fw_attr_dev);
+		goto fail_class_created;
+	}
+
+	asus_armoury.fw_attr_kset =
+		kset_create_and_add("attributes", NULL, &asus_armoury.fw_attr_dev->kobj);
+	if (!asus_armoury.fw_attr_dev) {
+		err = -ENOMEM;
+		pr_debug("Failed to create and add attributes\n");
+		goto err_destroy_classdev;
+	}
+
+	err = sysfs_create_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
+	if (err) {
+		pr_warn("Failed to create sysfs level attributes\n");
+		goto fail_class_created;
+	}
+
+	err = 0;
+	asus_armoury.mini_led_dev_id = 0;
+	if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE)) {
+		asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					 &mini_led_mode_attr_group);
+	} else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2)) {
+		asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE2;
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					 &mini_led_mode_attr_group);
+	}
+	if (err)
+		pr_warn("Failed to create sysfs-group for mini_led\n");
+
+	err = 0;
+	asus_armoury.gpu_mux_dev_id = 0;
+	if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX)) {
+		asus_armoury.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX;
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					 &gpu_mux_mode_attr_group);
+	} else if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX_VIVO)) {
+		asus_armoury.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX_VIVO;
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					 &gpu_mux_mode_attr_group);
+	}
+	if (err)
+		pr_warn("Failed to create sysfs-group for gpu_mux\n");
+
+	for (int i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
+		if (!asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
+			continue;
+
+		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+					 armoury_attr_groups[i].attr_group);
+		if (err)
+			pr_warn("Failed to create sysfs-group for %s\n",
+				armoury_attr_groups[i].attr_group->name);
+		else
+			pr_debug("Created sysfs-group for %s\n",
+				 armoury_attr_groups[i].attr_group->name);
+	}
+
+	return 0;
+
+err_destroy_classdev:
+	device_destroy(fw_attr_class, MKDEV(0, 0));
+
+fail_class_created:
+	fw_attributes_class_put();
+	return err;
+}
+
+/* Init / exit ****************************************************************/
+
+static int __init asus_fw_init(void)
+{
+	int err;
+
+	fw_attrs.pending_reboot = false;
+
+	err = asus_fw_attr_add();
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static void __exit asus_fw_exit(void)
+{
+	mutex_lock(&asus_armoury.mutex);
+
+	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
+	kset_unregister(asus_armoury.fw_attr_kset);
+	device_destroy(fw_attr_class, MKDEV(0, 0));
+	fw_attributes_class_put();
+
+	mutex_unlock(&asus_armoury.mutex);
+}
+
+module_init(asus_fw_init);
+module_exit(asus_fw_exit);
+
+MODULE_IMPORT_NS(ASUS_WMI);
+MODULE_AUTHOR("Luke Jones <luke@ljones.dev>");
+MODULE_DESCRIPTION("ASUS BIOS Configuration Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("wmi:" ASUS_NB_WMI_EVENT_GUID);
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
new file mode 100644
index 000000000000..b99fd136abf1
--- /dev/null
+++ b/drivers/platform/x86/asus-armoury.h
@@ -0,0 +1,146 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Definitions for kernel modules using asus-armoury driver
+ *
+ *  Copyright (c) 2024 Luke Jones <luke@ljones.dev>
+ */
+
+#ifndef _ASUS_BIOSCFG_H_
+#define _ASUS_BIOSCFG_H_
+
+#include <linux/types.h>
+#include <linux/platform_device.h>
+
+#define DRIVER_NAME "asus-armoury"
+
+static ssize_t attr_int_store(struct kobject *kobj, struct kobj_attribute *attr,
+			      const char *buf, size_t count, u32 min, u32 max,
+			      u32 *store_value, u32 wmi_dev);
+
+static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			      char *buf)
+{
+	return sysfs_emit(buf, "enumeration\n");
+}
+
+#define __ASUS_ATTR_RO(_func, _name)                                  \
+	{                                                             \
+		.attr = { .name = __stringify(_name), .mode = 0444 }, \
+		.show = _func##_##_name##_show,                       \
+	}
+
+#define __ASUS_ATTR_RO_AS(_name, _show)                               \
+	{                                                             \
+		.attr = { .name = __stringify(_name), .mode = 0444 }, \
+		.show = _show,                                        \
+	}
+
+#define __ASUS_ATTR_RW(_func, _name) \
+	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
+
+#define __WMI_STORE_INT(_attr, _min, _max, _wmi)                          \
+	static ssize_t _attr##_store(struct kobject *kobj,                \
+				     struct kobj_attribute *attr,         \
+				     const char *buf, size_t count)       \
+	{                                                                 \
+		return attr_int_store(kobj, attr, buf, count, _min, _max, \
+				      NULL, _wmi);                        \
+	}
+
+#define WMI_SHOW_INT(_attr, _fmt, _wmi)                                     \
+	static ssize_t _attr##_show(struct kobject *kobj,                   \
+				    struct kobj_attribute *attr, char *buf) \
+	{                                                                   \
+		u32 result;                                                 \
+		int err;                                                    \
+		err = asus_wmi_get_devstate_dsts(_wmi, &result);            \
+		if (err)                                                    \
+			return err;                                         \
+		return sysfs_emit(buf, _fmt,                                \
+				  result & ~ASUS_WMI_DSTS_PRESENCE_BIT);    \
+	}
+
+/* Create functions and attributes for use in other macros or on their own */
+
+#define __ATTR_CURRENT_INT_RO(_attr, _wmi)                          \
+	WMI_SHOW_INT(_attr##_current_value, "%d\n", _wmi);          \
+	static struct kobj_attribute attr_##_attr##_current_value = \
+		__ASUS_ATTR_RO(_attr, current_value)
+
+#define __ATTR_CURRENT_INT_RW(_attr, _minv, _maxv, _wmi)            \
+	__WMI_STORE_INT(_attr##_current_value, _minv, _maxv, _wmi); \
+	WMI_SHOW_INT(_attr##_current_value, "%d\n", _wmi);          \
+	static struct kobj_attribute attr_##_attr##_current_value = \
+		__ASUS_ATTR_RW(_attr, current_value)
+
+/* Shows a formatted static variable */
+#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                         \
+	static ssize_t _attrname##_##_prop##_show(                            \
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
+	{                                                                     \
+		return sysfs_emit(buf, _fmt, _val);                           \
+	}                                                                     \
+	static struct kobj_attribute attr_##_attrname##_##_prop =             \
+		__ASUS_ATTR_RO(_attrname, _prop)
+
+/* Boolean style enumeration, base macro. Requires adding show/store */
+#define __ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname)     \
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
+	__ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", _possible); \
+	static struct kobj_attribute attr_##_attrname##_type =          \
+		__ASUS_ATTR_RO_AS(type, enum_type_show);                \
+	static struct attribute *_attrname##_attrs[] = {                \
+		&attr_##_attrname##_current_value.attr,                 \
+		&attr_##_attrname##_display_name.attr,                  \
+		&attr_##_attrname##_possible_values.attr,               \
+		&attr_##_attrname##_type.attr,                          \
+		NULL                                                    \
+	};                                                              \
+	static const struct attribute_group _attrname##_attr_group = {  \
+		.name = _fsname, .attrs = _attrname##_attrs             \
+	}
+
+#define ATTR_GROUP_BOOL_RO(_attrname, _fsname, _wmi, _dispname) \
+	__ATTR_CURRENT_INT_RO(_attrname, _wmi);                 \
+	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
+
+#define ATTR_GROUP_BOOL_RW(_attrname, _fsname, _wmi, _dispname) \
+	__ATTR_CURRENT_INT_RW(_attrname, 0, 1, _wmi);           \
+	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
+
+/*
+ * Requires <name>_current_value_show(), <name>_current_value_show()
+ */
+#define ATTR_GROUP_BOOL_CUSTOM(_attrname, _fsname, _dispname)           \
+	static struct kobj_attribute attr_##_attrname##_current_value = \
+		__ASUS_ATTR_RW(_attrname, current_value);               \
+	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
+
+#define ATTR_GROUP_ENUM_INT_RO(_attrname, _fsname, _wmi, _possible, _dispname) \
+	__ATTR_CURRENT_INT_RO(_attrname, _wmi);                                \
+	__ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname)
+
+/*
+ * Requires <name>_current_value_show(), <name>_current_value_show()
+ * and <name>_possible_values_show()
+ */
+#define ATTR_GROUP_ENUM_CUSTOM(_attrname, _fsname, _dispname)             \
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);      \
+	static struct kobj_attribute attr_##_attrname##_current_value =   \
+		__ASUS_ATTR_RW(_attrname, current_value);                 \
+	static struct kobj_attribute attr_##_attrname##_possible_values = \
+		__ASUS_ATTR_RO(_attrname, possible_values);               \
+	static struct kobj_attribute attr_##_attrname##_type =            \
+		__ASUS_ATTR_RO_AS(type, enum_type_show);                  \
+	static struct attribute *_attrname##_attrs[] = {                  \
+		&attr_##_attrname##_current_value.attr,                   \
+		&attr_##_attrname##_display_name.attr,                    \
+		&attr_##_attrname##_possible_values.attr,                 \
+		&attr_##_attrname##_type.attr,                            \
+		NULL                                                      \
+	};                                                                \
+	static const struct attribute_group _attrname##_attr_group = {    \
+		.name = _fsname, .attrs = _attrname##_attrs               \
+	}
+
+#endif /* _ASUS_BIOSCFG_H_ */
-- 
2.46.1


