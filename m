Return-Path: <linux-input+bounces-11496-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1044BA7A5E4
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 17:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E52317154D
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 15:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B484B14387B;
	Thu,  3 Apr 2025 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4Ndl49B"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900C51F4CBA
	for <linux-input@vger.kernel.org>; Thu,  3 Apr 2025 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743692442; cv=none; b=EKuHpS5m1VGAD/JY4GrydXo78OOYllQuwVJghItfO0DBQUclOM5N5PHlYp7QuYApsJcIfU5itGVLLHTQIu9uCZtvTdSyXAfumq8kbGPLdgKv+A/XH5LnzBh2k25E6ALRK/HjMo1mCoCbd68Ti868aLd68C/9L3u9ZG6jGc0IEq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743692442; c=relaxed/simple;
	bh=ftAyVUJYw49KOgxCqeDELl2iml8u/B0KL4wcOzXHVTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lC4cYJOemijS2Frfy6D4bAncZReeKqUwSbo3yzYR8DxKjT3KWlIt1keCbRGF048RG9MVjkSxdsqlF5KllYbNy6PHM4jEQ2vLnfX949h02hrRD/GPtUhNkr/yp1uQAcNMUGUpaBi+cc++ZgbXV6zqW+fc0NlJaJVOTIjeJuzh0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4Ndl49B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F277C4CEE3;
	Thu,  3 Apr 2025 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743692440;
	bh=ftAyVUJYw49KOgxCqeDELl2iml8u/B0KL4wcOzXHVTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d4Ndl49BcjuwpoRMgTZXjq0Y21D6DkpdabvMrvNyn+X/rmR26oey6eP/jJPnQRHlS
	 fkSYIB/BOnADywOM6wypY0v2hdD4K/Qb7SsFmsSHMWbWQrVkTA3G5rRqn24l55BKYW
	 UPxAEnwR1ewegwav8OF3kv6bV2hAzTggxxSYuWt7Ggz2Tt3ho0U29kRHhTwFT0PXps
	 3tAMeshypLcgfaVkH2KvMI2hQXC3NREMWc1m69jRRXrZ+fLN1ZULA5+tXjTIGTztU3
	 6/9AxarG6fpxzNoasU93PsbAHBCRZzVAIoxu7p3ysN7VfxVMFfZ1vJb0HYNyUUrtog
	 11LOluKh76FZg==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	basavaraj.natikar@amd.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v2 2/2] HID: amd_sfh: Cleanup all sensors when init fails
Date: Thu,  3 Apr 2025 09:59:23 -0500
Message-ID: <20250403150026.1657538-3-superm1@kernel.org>
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

If any sensors have been started when a failure occurs during client
init they are left enabled by the firmware.

As part of the cleanup routine check all sensors and if they're enabled
stop them.

Suggested-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2:
 * New patch
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index c1bdf1e0d44af..c61cc42fa7a33 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -235,12 +235,20 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 	return 0;
 
 cleanup:
-	amd_sfh_hid_client_deinit(privdata);
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
+			mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
+			status = amd_sfh_wait_for_response
+					(privdata, cl_data->sensor_idx[i], DISABLE_SENSOR);
+			cl_data->sensor_sts[i] = (status == 0) ? SENSOR_ENABLED : SENSOR_DISABLED;
+		}
+		if (cl_data->sensor_idx[i] == SRA_IDX)
+			continue;
 		devm_kfree(dev, cl_data->feature_report[i]);
 		devm_kfree(dev, in_data->input_report[i]);
 		devm_kfree(dev, cl_data->report_descr[i]);
 	}
+	amd_sfh_hid_client_deinit(privdata);
 	return rc;
 }
 
-- 
2.43.0


