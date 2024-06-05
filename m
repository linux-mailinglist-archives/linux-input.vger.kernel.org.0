Return-Path: <linux-input+bounces-4115-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD888FCD12
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 14:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE5901C21CB4
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 12:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962AC1C373B;
	Wed,  5 Jun 2024 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eG94WWi7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F31C3704;
	Wed,  5 Jun 2024 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589013; cv=none; b=rl27NktEzBK0VyffQQ4uQ+M+LfwIL+Zy2XEaioIJ5TkuhO8LQ8mJOZNlSpIjzQe5z/j0sGu4/iKroLGfowpc9ZCWWI7AjtmlFT9mT6nOXyYKZn8uKkuJCAf9WCQzn4pI2Lpb8ti0qUrdqzLJgTaWK/jruvse8wEyZkLSVh1bboI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589013; c=relaxed/simple;
	bh=L9Zo/xz23EaVWj0rX+zHh4Z8GjO8zGHAvYY1+JiNaqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCKpjEByNq68vDjcWfJpOsZPAKwaiQxwZJaVAZThfwhvsnFAx4MvOxvN3/eSNMeX9MjonOfcseJGS/rfWI0p912zI0nujLymkhbPSrH8H4Xsv26myfgtIvELNqerJkfh5PEAYUZ9KTp0l2gb3O3TIApkNVV5t1MsHp26vY0rJFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eG94WWi7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5651CC4AF0B;
	Wed,  5 Jun 2024 12:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717589012;
	bh=L9Zo/xz23EaVWj0rX+zHh4Z8GjO8zGHAvYY1+JiNaqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eG94WWi7suZ0H9j1/NTcCquVkBR1MEzn4irCUa/LZmfv6V9zLED0+t6y/6kO0c7LF
	 kUeGoZDgg9eN7klqDIeIbSDNGhSxhe1oiQi6JLFS2ZS/L9Dvr4JHSFoL8pR379eG2E
	 1XEJ46FIeboqYZXQIDbDvBI0sNHkheSXLwE+0rP2skmK+MCoDWMxMj4Qn4oydqVeHj
	 8SMu9nYHmNJbdSQkIMqjM2PKU0Fo/LVRYz8ZWDkGRMfNicjSrmqQb4uqWORdei/4lx
	 hOwtj1ccD5uWnUEJ90T2RHs2kw/oBLKTQlpzRDkvYGEwVKjX4WhLgi9AlylSlFh8eP
	 hum+HfwlcdCfw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Gregor Riepl <onitake@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com,
	paulmck@kernel.org,
	tglx@linutronix.de,
	jpoimboe@kernel.org,
	rdunlap@infradead.org,
	xiongwei.song@windriver.com,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 07/18] platform/x86: touchscreen_dmi: Add support for setting touchscreen properties from cmdline
Date: Wed,  5 Jun 2024 08:02:57 -0400
Message-ID: <20240605120319.2966627-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120319.2966627-1-sashal@kernel.org>
References: <20240605120319.2966627-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.12
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 0b178b02673998f5acca5a0365a8858ca45beedb ]

On x86/ACPI platforms touchscreens mostly just work without needing any
device/model specific configuration. But in some cases (mostly with Silead
and Goodix touchscreens) it is still necessary to manually specify various
touchscreen-properties on a per model basis.

touchscreen_dmi is a special place for DMI quirks for this, but it can be
challenging for users to figure out the right property values, especially
for Silead touchscreens where non of these can be read back from
the touchscreen-controller.

ATM users can only test touchscreen properties by editing touchscreen_dmi.c
and then building a completely new kernel which makes it unnecessary
difficult for users to test and submit properties when necessary for their
laptop / tablet model.

Add support for specifying properties on the kernel commandline to allow
users to easily figure out the right settings. See the added documentation
in kernel-parameters.txt for the commandline syntax.

Cc: Gregor Riepl <onitake@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20240523143601.47555-1-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../admin-guide/kernel-parameters.txt         | 22 ++++++
 drivers/platform/x86/touchscreen_dmi.c        | 79 ++++++++++++++++++-
 2 files changed, 98 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9bfc972af2403..52497c497a9df 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1880,6 +1880,28 @@
 				Format:
 				<bus_id>,<clkrate>
 
+	i2c_touchscreen_props= [HW,ACPI,X86]
+			Set device-properties for ACPI-enumerated I2C-attached
+			touchscreen, to e.g. fix coordinates of upside-down
+			mounted touchscreens. If you need this option please
+			submit a drivers/platform/x86/touchscreen_dmi.c patch
+			adding a DMI quirk for this.
+
+			Format:
+			<ACPI_HW_ID>:<prop_name>=<val>[:prop_name=val][:...]
+			Where <val> is one of:
+			Omit "=<val>" entirely	Set a boolean device-property
+			Unsigned number		Set a u32 device-property
+			Anything else		Set a string device-property
+
+			Examples (split over multiple lines):
+			i2c_touchscreen_props=GDIX1001:touchscreen-inverted-x:
+			touchscreen-inverted-y
+
+			i2c_touchscreen_props=MSSL1680:touchscreen-size-x=1920:
+			touchscreen-size-y=1080:touchscreen-inverted-y:
+			firmware-name=gsl1680-vendor-model.fw:silead,home-button
+
 	i8042.debug	[HW] Toggle i8042 debug mode
 	i8042.unmask_kbd_data
 			[HW] Enable printing of interrupt data from the KBD port
diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index c6a10ec2c83f6..b021fb9e579e8 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -9,10 +9,13 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/ctype.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/efi_embedded_fw.h>
 #include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kstrtox.h>
 #include <linux/notifier.h>
 #include <linux/property.h>
 #include <linux/string.h>
@@ -1817,7 +1820,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 	{ }
 };
 
-static const struct ts_dmi_data *ts_data;
+static struct ts_dmi_data *ts_data;
 
 static void ts_dmi_add_props(struct i2c_client *client)
 {
@@ -1852,6 +1855,64 @@ static int ts_dmi_notifier_call(struct notifier_block *nb,
 	return 0;
 }
 
+#define MAX_CMDLINE_PROPS 16
+
+static struct property_entry ts_cmdline_props[MAX_CMDLINE_PROPS + 1];
+
+static struct ts_dmi_data ts_cmdline_data = {
+	.properties = ts_cmdline_props,
+};
+
+static int __init ts_parse_props(char *str)
+{
+	/* Save the original str to show it on syntax errors */
+	char orig_str[256];
+	char *name, *value;
+	u32 u32val;
+	int i, ret;
+
+	strscpy(orig_str, str, sizeof(orig_str));
+
+	/*
+	 * str is part of the static_command_line from init/main.c and poking
+	 * holes in that by writing 0 to it is allowed, as is taking long
+	 * lasting references to it.
+	 */
+	ts_cmdline_data.acpi_name = strsep(&str, ":");
+
+	for (i = 0; i < MAX_CMDLINE_PROPS; i++) {
+		name = strsep(&str, ":");
+		if (!name || !name[0])
+			break;
+
+		/* Replace '=' with 0 and make value point past '=' or NULL */
+		value = name;
+		strsep(&value, "=");
+		if (!value) {
+			ts_cmdline_props[i] = PROPERTY_ENTRY_BOOL(name);
+		} else if (isdigit(value[0])) {
+			ret = kstrtou32(value, 0, &u32val);
+			if (ret)
+				goto syntax_error;
+
+			ts_cmdline_props[i] = PROPERTY_ENTRY_U32(name, u32val);
+		} else {
+			ts_cmdline_props[i] = PROPERTY_ENTRY_STRING(name, value);
+		}
+	}
+
+	if (!i || str)
+		goto syntax_error;
+
+	ts_data = &ts_cmdline_data;
+	return 1;
+
+syntax_error:
+	pr_err("Invalid '%s' value for 'i2c_touchscreen_props='\n", orig_str);
+	return 1; /* "i2c_touchscreen_props=" is still a known parameter */
+}
+__setup("i2c_touchscreen_props=", ts_parse_props);
+
 static struct notifier_block ts_dmi_notifier = {
 	.notifier_call = ts_dmi_notifier_call,
 };
@@ -1859,13 +1920,25 @@ static struct notifier_block ts_dmi_notifier = {
 static int __init ts_dmi_init(void)
 {
 	const struct dmi_system_id *dmi_id;
+	struct ts_dmi_data *ts_data_dmi;
 	int error;
 
 	dmi_id = dmi_first_match(touchscreen_dmi_table);
-	if (!dmi_id)
+	ts_data_dmi = dmi_id ? dmi_id->driver_data : NULL;
+
+	if (ts_data) {
+		/*
+		 * Kernel cmdline provided data takes precedence, copy over
+		 * DMI efi_embedded_fw info if available.
+		 */
+		if (ts_data_dmi)
+			ts_data->embedded_fw = ts_data_dmi->embedded_fw;
+	} else if (ts_data_dmi) {
+		ts_data = ts_data_dmi;
+	} else {
 		return 0; /* Not an error */
+	}
 
-	ts_data = dmi_id->driver_data;
 	/* Some dmi table entries only provide an efi_embedded_fw_desc */
 	if (!ts_data->properties)
 		return 0;
-- 
2.43.0


