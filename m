Return-Path: <linux-input+bounces-11488-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5388BA79A5C
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 05:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44EA6189398E
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 03:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5240B191484;
	Thu,  3 Apr 2025 03:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmO5Ip20"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B2B1898F8;
	Thu,  3 Apr 2025 03:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743649986; cv=none; b=OGH1QsZMDeXWl+gX3ooyU8dld8t7Nl78029wbLUs/MpaD4oIjV4suqBC1ZmHkHx6iPFO6da21/WM6R8KDJBnXlXtts8D6Shg4UX3KVn64eORJfBXJ6RDgxm19CwDbIi0j5vDmfQqX5tzG+lzc+OXlyAqm2dYWPemLz6bCMeC3Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743649986; c=relaxed/simple;
	bh=cfAz2y3DcHMdjlHZUxc+Uob2ZacBWNhyibtQ0HxKTfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fuB0D6aED4v7l7IdqPQntTlUiXUopbhwZ0MGumgyJPNllzygV0PzHztn48n9CKSlpEQ6M5SO2FZQeL29hhngMckH93HFa2CaUx+RvLagRuN19kNjxVHJ2mfnKuVwkNNv5FoL7OxaIus8bP/hDz1Mlpb/mX6nr/BjHNrNBWq5iWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmO5Ip20; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3342C4CEDD;
	Thu,  3 Apr 2025 03:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743649984;
	bh=cfAz2y3DcHMdjlHZUxc+Uob2ZacBWNhyibtQ0HxKTfQ=;
	h=From:To:Cc:Subject:Date:From;
	b=hmO5Ip201G/sb1PUZQ94AzlM9NDgaApPlQ8AMRHMosnr4pFeM4aq/TykgN40mLCg+
	 XW7cYX+eRkuFmfSGCq9HUG68qXGgH5qCWvoUzjFeK31uE4b/IQZnvHdSXw/gFRPe/+
	 /moJVMcXr8YPaI9dOcfJ7I3e1BL5zlejgcJUX552PbQS9K2atc7BJUkDDhoU464KY3
	 PIUMbfHWD4JeVVIOmEyo0n/KAH5Df0BWHmWOS7lFo0Zz/3cPknLwqd3QIaccgXLXCW
	 M0sxVo5hQBOQG2gX0LKc0bCdoWq4QHgBCT44/Xz4DFCucnPL/omWq/KdjoGMTlGRjV
	 gOx+YaXfGneyw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	basavaraj.natikar@amd.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	Shyam-sundar.S-k@amd.com,
	akshata.mukundshetty@amd.com
Cc: Yijun Shen <Yijun.Shen@dell.com>,
	stable@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: amd_sfh: Fix SRA sensor when it's the only sensor
Date: Wed,  2 Apr 2025 22:12:28 -0500
Message-ID: <20250403031242.1267561-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Fixes: d1c444b47100d ("HID: amd_sfh: Add support to export device operating states")
Cc: stable@vger.kernel.org
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
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


