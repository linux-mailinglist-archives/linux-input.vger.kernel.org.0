Return-Path: <linux-input+bounces-11495-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9F4A7A5E2
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 17:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ECF117136D
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 15:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7FE24E4A0;
	Thu,  3 Apr 2025 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sn7xApin"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6323D2505B4;
	Thu,  3 Apr 2025 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743692439; cv=none; b=GtrvzQe3UcVXwRZSTivDFExod4gnqDfacR9OYq6F9a2GM0a/f0NVrADqBAcgIA3db4QlWe6IXCZZ3Gx5gmQjmtVH6tp6Jy/zbW8jlv+D2bkjpcHFoj2bJpxHgAk4j2SWP8vl90U4l1wjJ7qCGdJ4cYygVA3NHHZvYOAgZQRswpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743692439; c=relaxed/simple;
	bh=FROZRIdHapvR9KBbWNJFi61sURkGI86NKSTJeiz6PUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aObRHcqz7GHVImJNUbqdy7JD1pbiJbQvxRaJWzCMm9DMWO98lg1MQaNI/kjAyIaajRsWMF0GGVlaWbjA+uW6cT3PtqVtrpJlb081PLrvoytyzFK5f2wqmcIGZFs85tgoXTQ14GlZ+FF/BL0flJ/WrEi+suq5ZVfi5uapk3oxPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sn7xApin; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1D6C4CEE7;
	Thu,  3 Apr 2025 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743692439;
	bh=FROZRIdHapvR9KBbWNJFi61sURkGI86NKSTJeiz6PUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sn7xApinBte/+Bk28irUd3T0YH3S5fcjL6rlIxvQEpZQoB3u2cdAB6h5UOEp5aF+A
	 l2zA5TzNHdmBASxLhPhUXOUPg5KvSJ5XIut6rE+oG0icbxEG8h3UgphZH71jOiDHgK
	 wpsDq9KUkEqBtdghcynRDvT8M3rp8JQ375atkR+RRk9bCHIkvbWrqDNpCmkzY2tYHB
	 XW21MSANOBzBYYLbqKzs9bLSOSZ71lYn1dQCN7VAf4wR4Odz65t2IlUWZ4ld1RLY0c
	 IcAjDkw2XU/5gfji5oQFxCeSlza+JnDpMmtf5TpkrqSRLw2myTAWGl9Xb9Sy9K7AH0
	 +ilEALnE4Ez1w==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	basavaraj.natikar@amd.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	akshata.mukundshetty@amd.com,
	Shyam-sundar.S-k@amd.com
Cc: Yijun Shen <Yijun.Shen@dell.com>,
	Yijun Shen <Yijun_Shen@Dell.com>,
	stable@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v2 1/2] HID: amd_sfh: Fix SRA sensor when it's the only sensor
Date: Thu,  3 Apr 2025 09:59:22 -0500
Message-ID: <20250403150026.1657538-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403150026.1657538-1-superm1@kernel.org>
References: <20250403150026.1657538-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

On systems that only have an SRA sensor connected to SFH the sensor
doesn't get enabled due to a bad optimization condition of breaking
the sensor walk loop.

This optimization is unnecessary in the first place because if there
is only one device then the loop only runs once. Drop the condition
and explicitly mark sensor as enabled.

Reported-by: Yijun Shen <Yijun.Shen@dell.com>
Tested-By: Yijun Shen <Yijun_Shen@Dell.com>
Fixes: d1c444b47100d ("HID: amd_sfh: Add support to export device operating states")
Cc: stable@vger.kernel.org
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2:
 * Add tag
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 25f0ebfcbd5f5..c1bdf1e0d44af 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -134,9 +134,6 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
 		cl_data->sensor_sts[i] = SENSOR_DISABLED;
 
-		if (cl_data->num_hid_devices == 1 && cl_data->sensor_idx[0] == SRA_IDX)
-			break;
-
 		if (cl_data->sensor_idx[i] == SRA_IDX) {
 			info.sensor_idx = cl_data->sensor_idx[i];
 			writel(0, privdata->mmio + amd_get_p2c_val(privdata, 0));
@@ -145,8 +142,10 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 				(privdata, cl_data->sensor_idx[i], ENABLE_SENSOR);
 
 			cl_data->sensor_sts[i] = (status == 0) ? SENSOR_ENABLED : SENSOR_DISABLED;
-			if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
+			if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
+				cl_data->is_any_sensor_enabled = true;
 				privdata->dev_en.is_sra_present = true;
+			}
 			continue;
 		}
 
-- 
2.43.0


