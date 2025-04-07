Return-Path: <linux-input+bounces-11563-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EDAA7E48F
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 17:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD829424EE6
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 15:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE2C1FDE3D;
	Mon,  7 Apr 2025 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJllcOB6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3F81FDE2E
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039151; cv=none; b=AF7GDdeTKXLULHgACH+pD+eWgwPC4VUAIHAGeGQehjl4aW1PkhX6gBt2ToUsLMUtnYi2eoMk+Yvaf7hOnfuv4VzQv0WCruAoKJ9L26qALdA2hHmt3Yc08sMbgUsI13ZzbOqDKT36MOu/lmw/NfkChQ/8w4DHftheWjB0weiapro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039151; c=relaxed/simple;
	bh=ce3ClsriXC8LZWlvmEpmiJgErfC2vJ+4DZ1F22z7qGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOLiJtlRgOBHnltXwS3DYI21wi/WHzC4AxP6k8DSYN6tWdIpyjbHEe/mLtAwWI2CnKwZ9W7BMl/haybPdlHg+Szny8cqqlJ6T7fDgz5pMlK90v1GckTREbbnYU3Ye45ka8U6/UAs0fdLSawwCk1S9HMYxExN4dF3u9KWJLkXiE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJllcOB6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FC1C4CEEF;
	Mon,  7 Apr 2025 15:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744039151;
	bh=ce3ClsriXC8LZWlvmEpmiJgErfC2vJ+4DZ1F22z7qGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DJllcOB6ApyGl1vtf78eKhMSP9v61uoe7U/RvhVO+YB0oOvYB30QXwzyxpWqp27/f
	 1fuHh1dlQvYSLkPFddkeuL/G9cGD+ti6Z3TuJ8TKN5vpInCsZLrzlcdEovYEyWNi4s
	 A4iAjxl4U0BTNUkWBtMqpc42VJfizsQh3DGIv/Y1t4hD5/pyXDk4dhuk5x/auqpQ2h
	 b/vHDDFHmJlpno9rsiua3uwp42/KbgeXIt1aOAbVAe7RTyfLvIBRRX5bO6rGgP8HGT
	 yglQV42mDpU7F4wOrw/YYOweHIA33tDi1yOhv7q1AuVLboINJcnP/WmINSPeEFv5SY
	 2rz4JqYF37WyQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	basavaraj.natikar@amd.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v4 2/2] HID: amd_sfh: Avoid clearing reports for SRA sensor
Date: Mon,  7 Apr 2025 10:17:48 -0500
Message-ID: <20250407151835.1200867-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407151835.1200867-1-superm1@kernel.org>
References: <20250407151835.1200867-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

SRA sensor doesn't allocate any memory for reports.  Skip
trying to clear memory for that sensor in cleanup path.

Suggested-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v4:
 * One more case for amd_sfh_hid_client_deinit()
v3:
 * Less changes as amd_sfh_hid_client_deinit() covers a lot
v2:
 * New patch
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index c1bdf1e0d44af..0a9b44ce4904e 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -83,6 +83,9 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 		case ALS_IDX:
 			privdata->dev_en.is_als_present = false;
 			break;
+		case SRA_IDX:
+			privdata->dev_en.is_sra_present = false;
+			break;
 		}
 
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
@@ -237,6 +240,8 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 cleanup:
 	amd_sfh_hid_client_deinit(privdata);
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		if (cl_data->sensor_idx[i] == SRA_IDX)
+			continue;
 		devm_kfree(dev, cl_data->feature_report[i]);
 		devm_kfree(dev, in_data->input_report[i]);
 		devm_kfree(dev, cl_data->report_descr[i]);
-- 
2.43.0


