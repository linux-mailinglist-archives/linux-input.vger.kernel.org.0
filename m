Return-Path: <linux-input+bounces-14560-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B5CB4AB04
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 13:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40BEB3A706F
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 11:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0891E255F31;
	Tue,  9 Sep 2025 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nm7468IB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DBB1E5711
	for <linux-input@vger.kernel.org>; Tue,  9 Sep 2025 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757415619; cv=none; b=GSY2wO3dDweDEQpXQydZaVXEvWWRuJOYIh+jIdVu2ZD4DrISXgLV55ghbqrlIIH3Cerhhj2dR4Xk6+pb14jCtZCE9ID6IwaAGF3SX2KtFlFyLW/oNzP0XVkuC/EziekVMoUVDnZgRY+W+y46/fk7c0G84gS+qhegBmZR/bHMMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757415619; c=relaxed/simple;
	bh=/IEX7thIx+NIEBia8hdBLCn0EPZgao2od81h92KjaJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NYuwj7fYAqsR3/dBkA19LXCqTMrjY/emOzj6ITyErwGcCCRENXfvyEGvTQ4AXR5doaScISEUcR0V9YAN2rq9L/03CGeaKotpzJyn0F6DaIeZDPyEjZLS+H+k0tr2fcXqKl9v2tjN+0nP7JWoe8X2ov5rP+v2HDEd2OkBKCSP47w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nm7468IB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E90C4CEF4;
	Tue,  9 Sep 2025 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757415619;
	bh=/IEX7thIx+NIEBia8hdBLCn0EPZgao2od81h92KjaJM=;
	h=From:To:Cc:Subject:Date:From;
	b=nm7468IBawcSp5fT57jcA5rKEMQpdxHBw7ey91yH7qg+h+FCGAuDW/rM3pSmit/a2
	 MW0W+vs2x6SQMRT5aXYQIqajai+yoTPXjDNUJH4uSJo7J9MJ2GRkRgNGZaQ7/Wrzsp
	 zW45JwiYoXRVsUgSrluOKZ6j5jXAMmb9LJlMYAipOJS/NB9qsXgPEgClbohNRfbKoa
	 PHr949NwfeWAR6UR0phvqH6IbVFoxp0XLdwFXjG7MHWSwHW6TdJGP54ZAUzPXu7Ziy
	 Bl6Pdu2FRkWOTdWuThiyuZ2OlQjm/gzbnc2nOF+Z3cDsX9jLyRPlSBI+6KHWNNm0iO
	 Apv+1/XUZLpUw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: Resolve touchpad issues on Dell systems during S4
Date: Tue,  9 Sep 2025 06:00:06 -0500
Message-ID: <20250909110012.1218226-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dell systems utilize an EC-based touchpad emulation when the ACPI
touchpad _DSM is not invoked. This emulation acts as a secondary
master on the I2C bus, designed for scenarios where the I2C touchpad
driver is absent, such as in BIOS menus. Typically, loading the
i2c-hid module triggers the _DSM at initialization, disabling the
EC-based emulation.

However, if the i2c-hid module is missing from the boot kernel
used for hibernation snapshot restoration, the _DSM remains
uncalled, resulting in dual masters on the I2C bus and
subsequent arbitration errors. This issue arises when i2c-hid
resides in the rootfs instead of the kernel or initramfs.

To address this, switch from using the SYSTEM_SLEEP_PM_OPS()
macro to dedicated callbacks, introducing a specific
callback for restoring the S4 image. This callback ensures
the _DSM is invoked.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/hid/i2c-hid/i2c-hid-acpi.c |  8 ++++++++
 drivers/hid/i2c-hid/i2c-hid-core.c | 28 +++++++++++++++++++++++++++-
 drivers/hid/i2c-hid/i2c-hid.h      |  2 ++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index 1b49243adb16a..abd700a101f46 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -76,6 +76,13 @@ static int i2c_hid_acpi_get_descriptor(struct i2c_hid_acpi *ihid_acpi)
 	return hid_descriptor_address;
 }
 
+static void i2c_hid_acpi_restore_sequence(struct i2chid_ops *ops)
+{
+	struct i2c_hid_acpi *ihid_acpi = container_of(ops, struct i2c_hid_acpi, ops);
+
+	i2c_hid_acpi_get_descriptor(ihid_acpi);
+}
+
 static void i2c_hid_acpi_shutdown_tail(struct i2chid_ops *ops)
 {
 	struct i2c_hid_acpi *ihid_acpi = container_of(ops, struct i2c_hid_acpi, ops);
@@ -96,6 +103,7 @@ static int i2c_hid_acpi_probe(struct i2c_client *client)
 
 	ihid_acpi->adev = ACPI_COMPANION(dev);
 	ihid_acpi->ops.shutdown_tail = i2c_hid_acpi_shutdown_tail;
+	ihid_acpi->ops.restore_sequence = i2c_hid_acpi_restore_sequence;
 
 	ret = i2c_hid_acpi_get_descriptor(ihid_acpi);
 	if (ret < 0)
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index d3912e3f2f13a..3257aa87be898 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -961,6 +961,14 @@ static void i2c_hid_core_shutdown_tail(struct i2c_hid *ihid)
 	ihid->ops->shutdown_tail(ihid->ops);
 }
 
+static void i2c_hid_core_restore_sequence(struct i2c_hid *ihid)
+{
+	if (!ihid->ops->restore_sequence)
+		return;
+
+	ihid->ops->restore_sequence(ihid->ops);
+}
+
 static int i2c_hid_core_suspend(struct i2c_hid *ihid, bool force_poweroff)
 {
 	struct i2c_client *client = ihid->client;
@@ -1360,8 +1368,26 @@ static int i2c_hid_core_pm_resume(struct device *dev)
 	return i2c_hid_core_resume(ihid);
 }
 
+static int i2c_hid_core_pm_restore(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct i2c_hid *ihid = i2c_get_clientdata(client);
+
+	if (ihid->is_panel_follower)
+		return 0;
+
+	i2c_hid_core_restore_sequence(ihid);
+
+	return i2c_hid_core_resume(ihid);
+}
+
 const struct dev_pm_ops i2c_hid_core_pm = {
-	SYSTEM_SLEEP_PM_OPS(i2c_hid_core_pm_suspend, i2c_hid_core_pm_resume)
+	.suspend = pm_sleep_ptr(i2c_hid_core_pm_suspend),
+	.resume = pm_sleep_ptr(i2c_hid_core_pm_resume),
+	.freeze = pm_sleep_ptr(i2c_hid_core_pm_suspend),
+	.thaw = pm_sleep_ptr(i2c_hid_core_pm_resume),
+	.poweroff = pm_sleep_ptr(i2c_hid_core_pm_suspend),
+	.restore = pm_sleep_ptr(i2c_hid_core_pm_restore),
 };
 EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
 
diff --git a/drivers/hid/i2c-hid/i2c-hid.h b/drivers/hid/i2c-hid/i2c-hid.h
index 2c7b66d5caa0f..1724a435c783a 100644
--- a/drivers/hid/i2c-hid/i2c-hid.h
+++ b/drivers/hid/i2c-hid/i2c-hid.h
@@ -27,11 +27,13 @@ static inline u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 product)
  * @power_up: do sequencing to power up the device.
  * @power_down: do sequencing to power down the device.
  * @shutdown_tail: called at the end of shutdown.
+ * @restore_sequence: hibernation restore sequence.
  */
 struct i2chid_ops {
 	int (*power_up)(struct i2chid_ops *ops);
 	void (*power_down)(struct i2chid_ops *ops);
 	void (*shutdown_tail)(struct i2chid_ops *ops);
+	void (*restore_sequence)(struct i2chid_ops *ops);
 };
 
 int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
-- 
2.43.0


