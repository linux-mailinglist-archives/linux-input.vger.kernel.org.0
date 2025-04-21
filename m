Return-Path: <linux-input+bounces-11905-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 801BDA957FB
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 23:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCDD91748BF
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 21:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80AA21931B;
	Mon, 21 Apr 2025 21:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpD1ME8P"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887512192F8;
	Mon, 21 Apr 2025 21:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271143; cv=none; b=K0lyLf7FKae88VA9fuNVvNSur9WbhdXqd1upQP8kVxvWFBE8IU5NRxnPGXcw0ySmXaItxFbUu8xa5uAfdBXMPjo2HC425OaN/xDLhZt3UXXe629vT5ooxUM0fg8aDfsv5CZx+/jI+Sdi8CSykbb30xm1NbXdXmGOHb0AomTWh9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271143; c=relaxed/simple;
	bh=FROZRIdHapvR9KBbWNJFi61sURkGI86NKSTJeiz6PUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/n0BxvXX4bFNJuWtxxXekVRlZvOA8o/0pl4ZXnBG5GChMx8aRLSRunJFVbFpxNaRW2FbvoLCIpeMkOqXlMs3+lmp52BNF2Y3kWDto6VgMZXLSt1lf0NTIwfpoQwjucMqS+6tbNro/0WhBEJaHpltvfaldvsLEcjntpaD9J/nds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpD1ME8P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAD6C4CEEB;
	Mon, 21 Apr 2025 21:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271143;
	bh=FROZRIdHapvR9KBbWNJFi61sURkGI86NKSTJeiz6PUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DpD1ME8PT4m0JD2ZGC3hqZCodl6sWTvMkLJB2eWegTD6oMgsRH/Z5XKr9ro1aEidR
	 /wUFprTdVFBwIoGtybHElQqG6jg3bSofhHMFRwtWpIs23w1ccfHCWvb1fqv1KbkTJz
	 fDAWC0WHN1JiaA9kCeD8M5Vet0zLdI03eVTpfxJpSkLj4/LjrJwFLx2xwd2Uz5i02b
	 ML2pfDOTBDUeZK6x+F9FveypHtCr7SknU1OzKigFzwsYJRv9eZ1+T3GAgJrPr2c7jr
	 nPGQbdc3akq77zuSHBsvfWZ76PjNenqgmu+fxwCZpAomXabjx8sDFYht5zycdTIfPp
	 i1f2cBwdxx6vg==
From: Mario Limonciello <superm1@kernel.org>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org (open list),
	linux-input@vger.kernel.org (open list:AMD SENSOR FUSION HUB DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Yijun Shen <Yijun.Shen@dell.com>,
	Yijun Shen <Yijun_Shen@Dell.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 RESEND 1/2] HID: amd_sfh: Fix SRA sensor when it's the only sensor
Date: Mon, 21 Apr 2025 16:32:09 -0500
Message-ID: <20250421213210.1160665-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250421213210.1160665-1-superm1@kernel.org>
References: <20250421213210.1160665-1-superm1@kernel.org>
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


