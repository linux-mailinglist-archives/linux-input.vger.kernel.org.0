Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5DD3305FE1
	for <lists+linux-input@lfdr.de>; Wed, 27 Jan 2021 16:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236198AbhA0PnA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jan 2021 10:43:00 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:51341 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236389AbhA0Pid (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jan 2021 10:38:33 -0500
Received: from envy.fritz.box ([82.207.222.125]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MNfgZ-1lKXcg2plz-00P1ta; Wed, 27 Jan 2021 16:35:37 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, jikos@kernel.org,
        benjamin.tissoires@redhat.com, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v1 1/3] Outsourced sensor masks to PCI driver header.
Date:   Wed, 27 Jan 2021 16:35:31 +0100
Message-Id: <20210127153533.21560-2-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127153533.21560-1-mail@richard-neumann.de>
References: <20210127153533.21560-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:S0VWvSaZeX/9QNXkqFPXc+YHIO27cHQ4V+xApgEi7fuq1fvTnV8
 cIr9OrG5oEu229hdQZ/NqAIMI2T3ceWj1VHYPyqRF+MVV3PRsMLwdfI377dmedZwZJsungY
 gXaXj09XapKra/9t57FXntqiyvGh9/1rVnldZvIjTfoQzsqq6wuUjapvpJxBTpn+2BSaWr/
 wERakmTBPC9eP2q2F+tTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t9RraiFcYrk=:0KkyimE1B5yi4UtgIMfJv9
 /Zf/bFlbXMj5It5rev+HxK+a7SiaX+SR2ljpUVr2jA3B7/aD95R1EK8G4ibXcGZYKV7f5iNmC
 pqqy64IN391+xyIU+bgCEMStpBemr3RO7UiXB/cupVhJxUo5Akz07GHpVCMGXs9PM035ICCWp
 y5XTUM6oVyTt+u+2IMS+Lw/NnuAQkBFPb8cWqi/B3qCQnGe/r/HLGqpoctiJo0OqmxaO81m+O
 193JQy081xE9Bn5ElddlEqmX7NT4O/00wqPosTW0JDmiew+jbAvJvu4EBOVU0Wzikf6ztLtWt
 qWZ24dEY2HPyotnyp9dlJvy59Wu17cTbL1MItlcfcQImmTkkgmmY1MdlRPBnH8bUYKZ6FCO4l
 FbNiHOpiC+bS1ujRnipmvA5A5qz9s79Gi+QBVLedMTSzXCuB//Ycm6CAre4u1nyp3De+lqmB6
 AqkoAAdP7A==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Outsourced the mask definitions of the four sensors into
the PCI device driver header file for later use with the quirks.
Also renamed the values from *_EN to *_MASK to emphasize that
they are actually sensor bitmasks for matching against activestatus.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 13 ++++---------
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index dbac16641662..4b0ceb2ee86a 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -20,11 +20,6 @@
 #define DRIVER_NAME	"pcie_mp2_amd"
 #define DRIVER_DESC	"AMD(R) PCIe MP2 Communication Driver"
 
-#define ACEL_EN		BIT(0)
-#define GYRO_EN		BIT(1)
-#define MAGNO_EN		BIT(2)
-#define ALS_EN		BIT(19)
-
 void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
 {
 	union sfh_cmd_param cmd_param;
@@ -79,16 +74,16 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 
 	privdata->activecontrolstatus = readl(privdata->mmio + AMD_P2C_MSG3);
 	activestatus = privdata->activecontrolstatus >> 4;
-	if (ACEL_EN  & activestatus)
+	if (ACCEL_MASK  & activestatus)
 		sensor_id[num_of_sensors++] = accel_idx;
 
-	if (GYRO_EN & activestatus)
+	if (GYRO_MASK & activestatus)
 		sensor_id[num_of_sensors++] = gyro_idx;
 
-	if (MAGNO_EN & activestatus)
+	if (MAGNO_MASK & activestatus)
 		sensor_id[num_of_sensors++] = mag_idx;
 
-	if (ALS_EN & activestatus)
+	if (ALS_MASK & activestatus)
 		sensor_id[num_of_sensors++] = als_idx;
 
 	return num_of_sensors;
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 8f8d19b2cfe5..a39f02352c3b 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -57,6 +57,20 @@ enum sensor_idx {
 	als_idx = 19
 };
 
+/**
+ * Bit masks for sensors matching.
+ * @ACCEL_MASK:	Bit mask of the accelerometer
+ * @GYRO_MASK:	Bit mask of the gyroscope
+ * @MAGNO_MASK:	Bit mask of the magnetometer
+ * @ALS_MASK:	Bit mask of the ambient light sensor
+ */
+enum sensor_mask {
+	ACCEL_MASK = BIT(accel_idx),
+	GYRO_MASK = BIT(gyro_idx),
+	MAGNO_MASK = BIT(mag_idx),
+	ALS_MASK = BIT(als_idx),
+};
+
 struct amd_mp2_dev {
 	struct pci_dev *pdev;
 	struct amdtp_cl_data *cl_data;
-- 
2.30.0

