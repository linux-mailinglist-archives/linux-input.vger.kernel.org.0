Return-Path: <linux-input+bounces-10443-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15715A49EDE
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 17:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43AA83BBC10
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 16:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF8E276054;
	Fri, 28 Feb 2025 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crKACkZT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27679271818;
	Fri, 28 Feb 2025 16:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740760337; cv=none; b=tyW6L0t/eZyai1WW3qGnsmBRZPZpJBKYasSQAHXizKhfdHEQyv8k6deH6jqWab+oJO2sn9/fdHk951yJ2J9HCv26z+/iiBJDytHh8ghUXuxDDpV7A/A8vnLNMtiCZl1VmifnswD5nJDBRDzcOQuxXlBRzRssDCo3zN4Xn186ZK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740760337; c=relaxed/simple;
	bh=XQznFnMqsIPsXD0MBLr0vJJYuk07C8gbaiNgn/UDHTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udh23J6S83mEqtNPyZbwxJuCfjtT1/f/FSGH8I7ue5IRJY9AK1BzU4FdDogubwq6NBt5zkezPs7aZydfHxwqdOSpNWbRHXOmiV3ByGsby0eDL9kbf/67OO92OYAYRTY5WgqQfjdD/VqI1eozAil/K700z85GTTlwnpMblYCn5qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crKACkZT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3073C4CEE2;
	Fri, 28 Feb 2025 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740760335;
	bh=XQznFnMqsIPsXD0MBLr0vJJYuk07C8gbaiNgn/UDHTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=crKACkZTlKACFn1Zw3tj750Ml4XvQDH9aQtjwAzsup3+9gBaC6Vs5Gpn33ghp/ZUA
	 8eYgR/d/sJ9TaRHa9DfH4snimwYkPaX/kyfr4ZRB351okOne84VuDJhBzDevKsMYXB
	 2lesfdKxZNbh/8XygCQFGbRByQlwLaBjip3CRio9fzungxt708bfXUXntpqsHoxsWJ
	 FC89qEEBi7jnYq2Xx4jW74LTBNrwhxuYDEXEHb2xmQjUensTx2LEuU3XSZbt5Csc90
	 4QA39mcXjNqcHROfKYx3A1lV/dYn6cxxq1h529pUVoNEFWLhPph3F7TDkCzGMmpubV
	 h+EkYWeZbFL2w==
From: Mario Limonciello <superm1@kernel.org>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org (open list),
	linux-input@vger.kernel.org (open list:AMD SENSOR FUSION HUB DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>,
	Anson Tsao <anson.tsao@amd.com>
Subject: [PATCH 1/3] HID: amd_sfh: Allow configuring whether HPD is enabled or disabled
Date: Fri, 28 Feb 2025 10:31:51 -0600
Message-ID: <20250228163153.2554935-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228163153.2554935-1-superm1@kernel.org>
References: <20250228163153.2554935-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Human presence detection (HPD) sensor uses a camera to determine when
user is physically in front of the machine.  This might not be a
desirable behavior because it can (for example) cause the machine to
wake on approach.

Add a new sysfs file "hpd" that will control whether this sensor is
enabled. Use the value of this sysfs file to turn off HPD and prevent
it from re-enabling after resume from suspend.

Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>
Tested-by: Anson Tsao <anson.tsao@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../ABI/testing/sysfs-driver-amd-sfh          | 13 +++++
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        | 58 +++++++++++++++++++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 49 +++++++++++++++-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h |  3 +
 5 files changed, 122 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-amd-sfh

diff --git a/Documentation/ABI/testing/sysfs-driver-amd-sfh b/Documentation/ABI/testing/sysfs-driver-amd-sfh
new file mode 100644
index 0000000000000..c053126a83bb3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-amd-sfh
@@ -0,0 +1,13 @@
+What:		/sys/bus/pci/drivers/pcie_mp2_amd/*/hpd
+Date:		April 2025
+Contact:	mario.limonciello@amd.com
+Description:
+		Human presence detection (HPD) enable/disable.
+		When HPD is enabled, the device will be able to detect the
+		presence of a human and will send an interrupt that can be
+		used to wake the system from a low power state.
+		When HPD is disabled, the device will not be able to detect
+		the presence of a human.
+
+		Access: Read/Write
+		Valid values: enabled/disabled
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index 799b8686a88a4..f44a3bb2fbd4f 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -42,6 +42,7 @@ struct amd_mp2_sensor_info {
 
 struct sfh_dev_status {
 	bool is_hpd_present;
+	bool is_hpd_enabled;
 	bool is_als_present;
 	bool is_sra_present;
 };
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 48cfd0c582414..1c1fd63330c93 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -18,6 +18,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include "amd_sfh_pcie.h"
 #include "sfh1_1/amd_sfh_init.h"
@@ -330,6 +331,57 @@ static const struct dmi_system_id dmi_nodevs[] = {
 	{ }
 };
 
+static ssize_t hpd_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct amd_mp2_dev *mp2 = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", str_enabled_disabled(mp2->dev_en.is_hpd_enabled));
+}
+
+static ssize_t hpd_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	struct amd_mp2_dev *mp2 = dev_get_drvdata(dev);
+	bool enabled;
+	int ret;
+
+	ret = kstrtobool(buf, &enabled);
+	if (ret)
+		return ret;
+
+	mp2->sfh1_1_ops->toggle_hpd(mp2, enabled);
+
+	return count;
+}
+static DEVICE_ATTR_RW(hpd);
+
+static umode_t sfh_attr_is_visible(struct kobject *kobj, struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct amd_mp2_dev *mp2 = dev_get_drvdata(dev);
+
+	if (!mp2->sfh1_1_ops || !mp2->dev_en.is_hpd_present)
+		return 0;
+
+	return attr->mode;
+}
+
+static struct attribute *sfh_attrs[] = {
+	&dev_attr_hpd.attr,
+	NULL,
+};
+
+static struct attribute_group sfh_attr_group = {
+	.attrs = sfh_attrs,
+	.is_visible = sfh_attr_is_visible,
+};
+
+static const struct attribute_group *amd_sfh_groups[] = {
+	&sfh_attr_group,
+	NULL,
+};
+
 static void sfh1_1_init_work(struct work_struct *work)
 {
 	struct amd_mp2_dev *mp2 = container_of(work, struct amd_mp2_dev, work);
@@ -341,6 +393,11 @@ static void sfh1_1_init_work(struct work_struct *work)
 
 	amd_sfh_clear_intr(mp2);
 	mp2->init_done = 1;
+
+	rc = sysfs_update_group(&mp2->pdev->dev.kobj, &sfh_attr_group);
+	if (rc)
+		dev_warn(&mp2->pdev->dev, "failed to update sysfs group\n");
+
 }
 
 static void sfh_init_work(struct work_struct *work)
@@ -487,6 +544,7 @@ static struct pci_driver amd_mp2_pci_driver = {
 	.driver.pm	= &amd_mp2_pm_ops,
 	.shutdown	= amd_sfh_shutdown,
 	.remove		= amd_sfh_remove,
+	.dev_groups	= amd_sfh_groups,
 };
 module_pci_driver(amd_mp2_pci_driver);
 
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index e9929c4aa72eb..fc9c297d0db7f 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -212,6 +212,7 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 			switch (cl_data->sensor_idx[i]) {
 			case HPD_IDX:
 				privdata->dev_en.is_hpd_present = true;
+				privdata->dev_en.is_hpd_enabled = true;
 				break;
 			case ALS_IDX:
 				privdata->dev_en.is_als_present = true;
@@ -255,6 +256,10 @@ static void amd_sfh_resume(struct amd_mp2_dev *mp2)
 	}
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		/* leave HPD alone; policy is controlled by sysfs */
+		if (cl_data->sensor_idx[i] == HPD_IDX)
+			continue;
+
 		if (cl_data->sensor_sts[i] == SENSOR_DISABLED) {
 			info.sensor_idx = cl_data->sensor_idx[i];
 			mp2->mp2_ops->start(mp2, info);
@@ -285,8 +290,10 @@ static void amd_sfh_suspend(struct amd_mp2_dev *mp2)
 	}
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
-		if (cl_data->sensor_idx[i] != HPD_IDX &&
-		    cl_data->sensor_sts[i] == SENSOR_ENABLED) {
+		/* leave HPD alone; policy is controlled by sysfs */
+		if (cl_data->sensor_idx[i] == HPD_IDX)
+			continue;
+		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
 			mp2->mp2_ops->stop(mp2, cl_data->sensor_idx[i]);
 			status = amd_sfh_wait_for_response
 					(mp2, cl_data->sensor_idx[i], DISABLE_SENSOR);
@@ -304,6 +311,44 @@ static void amd_sfh_suspend(struct amd_mp2_dev *mp2)
 	amd_sfh_clear_intr(mp2);
 }
 
+void amd_sfh_toggle_hpd(struct amd_mp2_dev *mp2, bool enabled)
+{
+	struct amdtp_cl_data *cl_data = mp2->cl_data;
+	struct amd_mp2_sensor_info info;
+	int i, status;
+
+	if (mp2->dev_en.is_hpd_enabled == enabled)
+		return;
+
+	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		if (cl_data->sensor_idx[i] != HPD_IDX)
+			continue;
+		info.sensor_idx = cl_data->sensor_idx[i];
+		if (enabled) {
+			mp2->mp2_ops->start(mp2, info);
+			status = amd_sfh_wait_for_response
+					(mp2, cl_data->sensor_idx[i], ENABLE_SENSOR);
+			if (status == 0)
+				status = SENSOR_ENABLED;
+			if (status == SENSOR_ENABLED)
+				cl_data->sensor_sts[i] = SENSOR_ENABLED;
+		} else {
+			mp2->mp2_ops->stop(mp2, cl_data->sensor_idx[i]);
+			status = amd_sfh_wait_for_response
+					(mp2, cl_data->sensor_idx[i], DISABLE_SENSOR);
+			if (status == 0)
+				status = SENSOR_DISABLED;
+			if (status != SENSOR_ENABLED)
+				cl_data->sensor_sts[i] = SENSOR_DISABLED;
+		}
+		dev_dbg(&mp2->pdev->dev, "toggle sid 0x%x (%s) status 0x%x\n",
+			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+			cl_data->sensor_sts[i]);
+		break;
+	}
+	mp2->dev_en.is_hpd_enabled = enabled;
+}
+
 static void amd_mp2_pci_remove(void *privdata)
 {
 	struct amd_mp2_dev *mp2 = privdata;
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h
index 21c44990bbeba..797d206641c69 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h
@@ -15,12 +15,15 @@
 
 struct amd_sfh1_1_ops {
 	int (*init)(struct amd_mp2_dev *mp2);
+	void (*toggle_hpd)(struct amd_mp2_dev *mp2, bool enable);
 };
 
 int amd_sfh1_1_init(struct amd_mp2_dev *mp2);
+void amd_sfh_toggle_hpd(struct amd_mp2_dev *mp2, bool enabled);
 
 static const struct amd_sfh1_1_ops __maybe_unused sfh1_1_ops = {
 	.init = amd_sfh1_1_init,
+	.toggle_hpd = amd_sfh_toggle_hpd,
 };
 
 #endif
-- 
2.43.0


