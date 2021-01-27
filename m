Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B65305FF1
	for <lists+linux-input@lfdr.de>; Wed, 27 Jan 2021 16:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235799AbhA0Pn2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jan 2021 10:43:28 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:48113 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234675AbhA0Pic (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jan 2021 10:38:32 -0500
Received: from envy.fritz.box ([82.207.222.125]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MjPYI-1lpQPo076Q-00l0mR; Wed, 27 Jan 2021 16:35:38 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, jikos@kernel.org,
        benjamin.tissoires@redhat.com, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v1 2/3] Added quirks to detect sensor masks.
Date:   Wed, 27 Jan 2021 16:35:32 +0100
Message-Id: <20210127153533.21560-3-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127153533.21560-1-mail@richard-neumann.de>
References: <20210127153533.21560-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kDvi8cjYfFSonZL1f0E7lkaDzh+WkzhFHV+zDiQbU356ECP22bq
 ZyjuSDaOgZlyf5r2UqLeSHzhVR04vUSAaDM2FJzxiA1gW8pRnL/krscnmxuig+VyXskm08/
 L4RKF44Rj2kRSdHMAiuEaWq6casijq2tdoISB6PwSjj2i64k0vMrvPnB5oRbjGSRzjA1Y+b
 Zcw6ZR968AJaqVyxOx5hA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D4tCNtou888=:CtRCdiSo15DT2HO/hl207b
 qxh8pcRc0BMcVwHx91cTPuzKisdsKwHREikzTmdxaBUaMMJwJyL7R/jMwFcbiMuRmf+TQET90
 FPMGgTvA2cwMV6uh0kDPZZ/ylThBkTpuiE4XGjof1V5z5dLDqv9YnM/cSa0/x7w9InAuK1JoK
 sZXnDMHztzg8bXR7BTIFCVveNde0NbV2zyLxDvk+Hj7tgdXJIX4e6SDiId/FbXQLIvw4qXHZp
 AMrsKBKWJ/E6yK5lkP6xNwse+dMmj+yf/d2Yynp9kWOX9VnUdCht/5qOKQ5/Haq94zWdouIc2
 M/aLAovkBS19HLsd4PZnJt6iUhVfAjSJo6CuiIqJD/E/uIc3eZvSPf2y/yyVgnp2y4kn8iI1+
 dnPhbI3IwzAhjXNy8FxObTI37H5VQZBOBiCt9/oM7pG3ZkkVgXWOs2Adx3C6SA+ZBPQra7n1w
 wsBmr+lCJQ==
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
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   |  3 ++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  1 +
 drivers/hid/amd-sfh-hid/amd_sfh_quirks.c | 55 ++++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_quirks.c

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
index 000000000000..3f6c81d8f555
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
+	struct dmi_system_id *system;
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

