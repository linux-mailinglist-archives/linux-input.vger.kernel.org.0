Return-Path: <linux-input+bounces-11560-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5CDA7E009
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 15:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E99A16DEAE
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 13:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F351B6D06;
	Mon,  7 Apr 2025 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KP3UYSiM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F571B424D;
	Mon,  7 Apr 2025 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033707; cv=none; b=svudGh0SqOqlZi6/dnwZ+BCR3wnPPpE4U9QHH+OFp0duNj87WY5JzppW26K2cu7JfSL7ilemE1mIyeF6MIKPiED4aN7Zx1yfuYaJAfkrKeGzWm4XQChQRsr/X2d6Rqk3QVkVRnNrAUvwuoTcU2et1RwU/gh2nrtOu5m/gPy2xOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033707; c=relaxed/simple;
	bh=FROZRIdHapvR9KBbWNJFi61sURkGI86NKSTJeiz6PUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+gVo//cofUEMQ21vZm4MdEyUR4OP56yT1FXLkybk3+Ckt21sFjLLW6uCDNMow+L9ssu6Ob7zjdSfJ7rHSVVI+lf6dZO7r7n/j4p7CFkHH7BKubFaZ1Mj7A4ZmipQmgp7TdmTqbwhDE3yxizdU5jp0sE+o3ip9ooXdOPHG0c3Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KP3UYSiM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D731C4CEE7;
	Mon,  7 Apr 2025 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033707;
	bh=FROZRIdHapvR9KBbWNJFi61sURkGI86NKSTJeiz6PUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KP3UYSiMY/nqTgxqI7fVMkcBiPs7fMe7OOXhNv1heby+WmqOdand8oi1ade56j1Ei
	 0BvyjNdqwq7aezQzfYj8slb91wnwHUimonpJequIWnDHciKnoGAiSwoDSPcmG72HnG
	 tGCXT8T9fbIH5WRzirdf5yXBE7H4QE92LcCoulk8yTOLavfAIyFEgruBj5btx2MfzF
	 5UkWb+59qSr3dYE53Pv52iltfkiRPHbgSvTA4M4fEFSdOjiw9RLHjTgbvelpwScDeH
	 DsociLCqnNkdJSktUWhEYFl2NibNMabC0n1yLZWNhAomsoMTyuecp/9W+AnguklmeG
	 YnBpMOmOaoMNA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	basavaraj.natikar@amd.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	Shyam-sundar.S-k@amd.com,
	akshata.mukundshetty@amd.com
Cc: Yijun Shen <Yijun.Shen@dell.com>,
	Yijun Shen <Yijun_Shen@Dell.com>,
	stable@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 1/2] HID: amd_sfh: Fix SRA sensor when it's the only sensor
Date: Mon,  7 Apr 2025 08:47:48 -0500
Message-ID: <20250407134818.805775-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407134818.805775-1-superm1@kernel.org>
References: <20250407134818.805775-1-superm1@kernel.org>
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


