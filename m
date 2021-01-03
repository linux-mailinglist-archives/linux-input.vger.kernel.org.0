Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165642E8C60
	for <lists+linux-input@lfdr.de>; Sun,  3 Jan 2021 14:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbhACNzE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 08:55:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:34648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbhACNzD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 3 Jan 2021 08:55:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED00F2080D;
        Sun,  3 Jan 2021 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609682062;
        bh=rFgbjPwhakFpYCmzEMub3NjARwNhgcgryoiBToag7ww=;
        h=From:To:Cc:Subject:Date:From;
        b=rjJK6dwWUWcUeNcKCIf2NTpwpCIj1fUEPiQ5HgyGX3zi09jxTrjfz6A88X545iNez
         t+e5YtMKYo7Ekel0slRURVYpdkesQ8z+vsL+P1YaqspKLHrdEHbOiVk0RJctwVED+N
         FQfSU9bj751jy0Vk8gwzm2lxZao3N2AkVYY0gC/JCvfRO4mOwWFrcumwSe3HBAGlGa
         0hAaWaj3ZWkalZAYIgVYPkT1+kEntB3ANC1y2J8Pgp2Wxgt7YCbg1bFflea9zYtBeC
         Vnhk/a4UVwz8NBxWM74pebruiupTNpbBwTO7EM6s2WSCxqPcVsqGGpRlRwYmfnZhRO
         UpNsLVUfVcGsg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: sfh: fix address space confusion
Date:   Sun,  3 Jan 2021 14:53:55 +0100
Message-Id: <20210103135418.3645344-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The new driver uses a phys_addr_t to store a DMA address,
which does not work when the two are different size:

drivers/hid/amd-sfh-hid/amd_sfh_client.c:157:11: error: incompatible pointer types passing 'phys_addr_t *' (aka 'unsigned int *') to parameter of type 'dma_addr_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
                                                                  &cl_data->sensor_phys_addr[i],
                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dma-mapping.h:393:15: note: passing argument to parameter 'dma_handle' here
                dma_addr_t *dma_handle, gfp_t gfp)
                            ^

Change both the type and the variable name to dma_addr for consistency.

Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 8 ++++----
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h    | 2 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 2 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 3d1ccac5d99a..2ab38b715347 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -154,7 +154,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
 		cl_data->sensor_virt_addr[i] = dma_alloc_coherent(dev, sizeof(int) * 8,
-								  &cl_data->sensor_phys_addr[i],
+								  &cl_data->sensor_dma_addr[i],
 								  GFP_KERNEL);
 		cl_data->sensor_sts[i] = 0;
 		cl_data->sensor_requested_cnt[i] = 0;
@@ -187,7 +187,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		}
 		info.period = msecs_to_jiffies(AMD_SFH_IDLE_LOOP);
 		info.sensor_idx = cl_idx;
-		info.phys_address = cl_data->sensor_phys_addr[i];
+		info.dma_address = cl_data->sensor_dma_addr[i];
 
 		cl_data->report_descr[i] = kzalloc(cl_data->report_descr_sz[i], GFP_KERNEL);
 		if (!cl_data->report_descr[i]) {
@@ -212,7 +212,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		if (cl_data->sensor_virt_addr[i]) {
 			dma_free_coherent(&privdata->pdev->dev, 8 * sizeof(int),
 					  cl_data->sensor_virt_addr[i],
-					  cl_data->sensor_phys_addr[i]);
+					  cl_data->sensor_dma_addr[i]);
 		}
 		kfree(cl_data->feature_report[i]);
 		kfree(cl_data->input_report[i]);
@@ -238,7 +238,7 @@ int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 		if (cl_data->sensor_virt_addr[i]) {
 			dma_free_coherent(&privdata->pdev->dev, 8 * sizeof(int),
 					  cl_data->sensor_virt_addr[i],
-					  cl_data->sensor_phys_addr[i]);
+					  cl_data->sensor_dma_addr[i]);
 		}
 	}
 	kfree(cl_data);
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index 6be0783d885c..d7eac1728e31 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -27,7 +27,7 @@ struct amdtp_cl_data {
 	int hid_descr_size[MAX_HID_DEVICES];
 	phys_addr_t phys_addr_base;
 	u32 *sensor_virt_addr[MAX_HID_DEVICES];
-	phys_addr_t sensor_phys_addr[MAX_HID_DEVICES];
+	dma_addr_t sensor_dma_addr[MAX_HID_DEVICES];
 	u32 sensor_sts[MAX_HID_DEVICES];
 	u32 sensor_requested_cnt[MAX_HID_DEVICES];
 	u8 report_type[MAX_HID_DEVICES];
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index a51c7b76283b..dbac16641662 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -41,7 +41,7 @@ void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info i
 	cmd_param.s.buf_layout = 1;
 	cmd_param.s.buf_length = 16;
 
-	writeq(info.phys_address, privdata->mmio + AMD_C2P_MSG2);
+	writeq(info.dma_address, privdata->mmio + AMD_C2P_MSG2);
 	writel(cmd_param.ul, privdata->mmio + AMD_C2P_MSG1);
 	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
 }
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index e8be94f935b7..8f8d19b2cfe5 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -67,7 +67,7 @@ struct amd_mp2_dev {
 struct amd_mp2_sensor_info {
 	u8 sensor_idx;
 	u32 period;
-	phys_addr_t phys_address;
+	dma_addr_t dma_address;
 };
 
 void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info);
-- 
2.29.2

