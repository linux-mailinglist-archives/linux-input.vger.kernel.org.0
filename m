Return-Path: <linux-input+bounces-11564-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F57A7E443
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 17:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A0C3188D434
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 15:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBBE1FE468;
	Mon,  7 Apr 2025 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c60z3MNh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714901FE452;
	Mon,  7 Apr 2025 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039151; cv=none; b=XURPg3QEcl9XjwEOeeL0R7nRABWHRJrzCobFei8XosQJujEHkpi9Dbo6Z4bCHRjjPPXJh6uM2Wt47gaYMnHiwiTQAFfLPg1Hn8MFZeBRGPWkGaAPgYfErUQT9YCiwL/3A6r0z2L73DTrCQr7vVzt8qgekY7cCOH2u9bs1I4P8vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039151; c=relaxed/simple;
	bh=FROZRIdHapvR9KBbWNJFi61sURkGI86NKSTJeiz6PUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIF1shQX1jZ4TCtnxLrEjF7/nm2OFhOVSa5pTwfi6yrJ/gjBd7rMNJrXdiR3k6J130XM02Wn+Pny7zC/MqTvmolnfiepXbsRefFzCaXhf9fWEauZkpfVxeTty6/vFkEG+qa61E98w+Igrhq6sGRfqgE7ySY7byoFUJ6jPyCVl6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c60z3MNh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D264C4CEE9;
	Mon,  7 Apr 2025 15:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744039150;
	bh=FROZRIdHapvR9KBbWNJFi61sURkGI86NKSTJeiz6PUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c60z3MNhu7L9wh1TQbXSaqnosI9EJaSsLyyJGrqecVhzISwNc9+++gI31zHWPE6WM
	 OCuHfWlKELoHTE//YJPN8SW3PmVrhTgy9fVUqRl8IkX3SfDVV7n9JvJ7/X0ORTyG16
	 ipak0oEA/VspoaFzjFABNCd3BD7x9w/lv6NNDQbS28e2RSjs8LBddC9nl19liOOxDB
	 kIIixTtAgn6Vwja3Ela9l+xAN6VX03MeNvlap1I6J0RebwTYBwEdcAJoRZPZKw3V8F
	 sMlWIVIa/cZ85ltFoxpb3EzAkIuiF06gj/4aRauXn6sXsiHL6PjXhaphKw32XGNMC5
	 VcCCjwSqekhKg==
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
Subject: [PATCH v4 1/2] HID: amd_sfh: Fix SRA sensor when it's the only sensor
Date: Mon,  7 Apr 2025 10:17:47 -0500
Message-ID: <20250407151835.1200867-2-superm1@kernel.org>
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


