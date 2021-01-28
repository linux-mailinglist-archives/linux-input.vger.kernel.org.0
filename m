Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D68A3075AB
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 13:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhA1MOS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 07:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21542 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229616AbhA1MOK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 07:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611835963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h8NcN5kXtY1Zsl5dR+fALBa/cGLhl6Yx2gp4orM0/DU=;
        b=Rz++pPJm0+ePzex4q2XQVeEiG2e6xImdnJBN8viRaAO9m0YKUhVsfpuCll1nQ7iYhudzAK
        KqARDP4nAiM1Xrj+EGRaTwN8fb6XaOjL8sST3EbYESkLL5II+PJOU/03GtOxjzJlB/SioW
        JYFBsNPeOebX3wgbjx9H85OpzHMJ47U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-sbj6L0VuMLm23_eviMZ86A-1; Thu, 28 Jan 2021 07:12:41 -0500
X-MC-Unique: sbj6L0VuMLm23_eviMZ86A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68EDD107AFDB;
        Thu, 28 Jan 2021 12:12:37 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-250.ams2.redhat.com [10.36.114.250])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CBBE05D9F6;
        Thu, 28 Jan 2021 12:12:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Richard Neumann <mail@richard-neumann.de>,
        linux-input@vger.kernel.org
Subject: [PATCH 1/3] AMD_SFH: Removed unused activecontrolstatus member from the amd_mp2_dev struct
Date:   Thu, 28 Jan 2021 13:12:17 +0100
Message-Id: <20210128121219.6381-2-hdegoede@redhat.com>
In-Reply-To: <20210128121219.6381-1-hdegoede@redhat.com>
References: <20210128121219.6381-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This value is only used once inside amd_mp2_get_sensor_num(),
so there is no need to store this in the amd_mp2_dev struct,
amd_mp2_get_sensor_num() can simple use a local variable for this.

Fixes: 4f567b9f8141 ("SFH: PCIe driver to add support of AMD sensor fusion hub")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 6 ++++--
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h | 1 -
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index dbac16641662..f3cdb4ea33da 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -76,9 +76,11 @@ void amd_stop_all_sensors(struct amd_mp2_dev *privdata)
 int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 {
 	int activestatus, num_of_sensors = 0;
+	u32 activecontrolstatus;
+
+	activecontrolstatus = readl(privdata->mmio + AMD_P2C_MSG3);
+	activestatus = activecontrolstatus >> 4;
 
-	privdata->activecontrolstatus = readl(privdata->mmio + AMD_P2C_MSG3);
-	activestatus = privdata->activecontrolstatus >> 4;
 	if (ACEL_EN  & activestatus)
 		sensor_id[num_of_sensors++] = accel_idx;
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 8f8d19b2cfe5..489415f7c22c 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -61,7 +61,6 @@ struct amd_mp2_dev {
 	struct pci_dev *pdev;
 	struct amdtp_cl_data *cl_data;
 	void __iomem *mmio;
-	u32 activecontrolstatus;
 };
 
 struct amd_mp2_sensor_info {
-- 
2.29.2

