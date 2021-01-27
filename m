Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B421A306106
	for <lists+linux-input@lfdr.de>; Wed, 27 Jan 2021 17:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343985AbhA0Q3Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jan 2021 11:29:25 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:51887 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343951AbhA0Q2z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jan 2021 11:28:55 -0500
Received: from envy.fritz.box ([82.207.222.125]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MhUQ7-1lZioA1xVj-00eZZg; Wed, 27 Jan 2021 17:26:05 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, jikos@kernel.org,
        benjamin.tissoires@redhat.com, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v2 2/3] Added quirks to detect sensor masks.
Date:   Wed, 27 Jan 2021 17:25:59 +0100
Message-Id: <20210127162600.35927-3-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127162600.35927-1-mail@richard-neumann.de>
References: <20210127162600.35927-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i77Dblb1rJWZkYKPVIzK+zz5/InieoczpEDSLs+R4P1CAQFoInz
 DopZHX6m1dJv0m2JgkHwjG4ZKf1Z2CH3Et2pMrqwJKppLkBPFlVYgO84z3dhlKDF5QguYbj
 Yzfq4DQV+k+evsB6EfQ14fBtV10f4bAWKxJ0hkfqCsBQuRDX0+7G5l6a/1uQsPwUYYyQtbf
 W824MKryJ7RDMwz18wd8w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vM3F1ZddobU=:CATCLo0WTokbnHfiwwVYGQ
 W9Pjd7R3niQtEVJnjX5emi9iYGKNC5tA6GtyzG96RGlukYrLHspZNsam0cqTR9zxLvk4Qyc8N
 H1E6PQCErzAgVv2WnW5aAHHzYavxUu+wltwfEo+EVfRdzGVNn+uve/9FK7xK6vUr9pE1rA8Ic
 DK5uUI9RVnyyNfN+Vf6pARuPW0dTkK1WFnDA5hS17hHJ0zYZGCX5cuzh2xEypHeyfFivpLZI9
 bTFLmj17Qi+WbHJMADaLDKTuB6QFFJicIfs6mOnjxRdM1zVLVfOFXUG+PiaMJ3GpCNNeY+Qgz
 ZB4/aotBqYwvacBt5Tju7ZLtMGWyIjCDtJ+7L6X5VMSAEY+kVJodd8RWY3QghptWEFnP+IzpG
 +OnC9l6eD7ejDdrnSI7CfAP9oAHeZSA+RB8Na14OqKMhcxU7KMtTNwRoKiXgQSRkW5dfRsXg5
 I5ju1JRokA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Added quirks file to determine the sensor masks for systems
that do not have it stored in the corresponding P2C register.
Values are based upon user reports from:

    https://bugzilla.kernel.org/show_bug.cgi?id=199715

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 drivers/hid/amd-sfh-hid/Makefile         |  1 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   |  3 ++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  1 +
 drivers/hid/amd-sfh-hid/amd_sfh_quirks.c | 55 ++++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_quirks.c

diff --git a/drivers/hid/amd-sfh-hid/Makefile b/drivers/hid/amd-sfh-hid/Makefile
index 35e704da5612..c94cf51c0af5 100644
--- a/drivers/hid/amd-sfh-hid/Makefile
+++ b/drivers/hid/amd-sfh-hid/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_AMD_SFH_HID) += amd_sfh.o
 amd_sfh-objs := amd_sfh_hid.o
 amd_sfh-objs += amd_sfh_client.o
 amd_sfh-objs += amd_sfh_pcie.o
+amd_sfh-objs += amd_sfh_quirks.o
 amd_sfh-objs += hid_descriptor/amd_sfh_hid_desc.o
 
 ccflags-y += -I $(srctree)/$(src)/
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 4b0ceb2ee86a..8f10d6d6b369 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -74,6 +74,9 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 
 	privdata->activecontrolstatus = readl(privdata->mmio + AMD_P2C_MSG3);
 	activestatus = privdata->activecontrolstatus >> 4;
+	if (!activestatus)
+		activestatus = amd_sfh_quirks_get_sensor_mask(privdata->pdev);
+
 	if (ACCEL_MASK  & activestatus)
 		sensor_id[num_of_sensors++] = accel_idx;
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index a39f02352c3b..64884e515895 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -90,4 +90,5 @@ void amd_stop_all_sensors(struct amd_mp2_dev *privdata);
 int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id);
 int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata);
 int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata);
+int amd_sfh_quirks_get_sensor_mask(struct pci_dev *pci_dev);
 #endif
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_quirks.c b/drivers/hid/amd-sfh-hid/amd_sfh_quirks.c
new file mode 100644
index 000000000000..a4f0366e7982
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_quirks.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * AMD Sensor Fusion Hub quirks
+ *
+ * Authors: Richard Neumann <mail@richard-neumann.de>
+ */
+
+#include <linux/dmi.h>
+#include <linux/pci.h>
+
+#include "amd_sfh_pcie.h"
+
+/**
+ * DMI match for HP ENVY x360 convertibles, which do not
+ * have information about the sensor mask in the P2C registers.
+ */
+static const struct dmi_system_id hp_envy_x360[] = {
+	{
+		.ident = "HP ENVY x360 Convertible 13-ag0xxx",
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8496"),
+			DMI_MATCH(DMI_BOARD_VERSION, "92.48"),
+		},
+	},
+	{
+		.ident = "HP ENVY x360 Convertible 15-cp0xxx",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8497"),
+			DMI_MATCH(DMI_BOARD_VERSION, "92.48"),
+		},
+	},
+	{ }
+};
+
+/**
+ * Returns the sensor mask for hardware, on which the
+ * sensor mask is not written into the P2C registers.
+ *
+ * Returns an appropriate sensor mask or zero per default.
+ */
+int amd_sfh_quirks_get_sensor_mask(struct pci_dev *pci_dev)
+{
+	const struct dmi_system_id *system;
+
+	system = dmi_first_match(hp_envy_x360);
+	if (system) {
+		pci_info(pci_dev, "Detected %s.\n", system->ident);
+		return ACCEL_MASK + MAGNO_MASK;
+	}
+
+	pci_warn(pci_dev, "No quirks available for this hardware.\n");
+	return 0;
+}
-- 
2.30.0

