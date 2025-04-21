Return-Path: <linux-input+bounces-11906-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C129A95800
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 23:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5D7A3B5F08
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 21:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1494321A44D;
	Mon, 21 Apr 2025 21:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eo9RYHb8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E082D21A43C;
	Mon, 21 Apr 2025 21:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271145; cv=none; b=BAfIDDRT/W7z0ajF/tl39fEwMMSnHJWwyrD3FBdIggwW2tQxnN124MPFyQu4dbIeOHgIMIW2nrXZXgdirz18Is1P21MH6r/f7hJ7I0a8SC2s93tOgyPuw0d8hwYkyx4jItZAHEr7BkrY1uM2lkTB/YbMrYa8wwNDU75VCdMSsd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271145; c=relaxed/simple;
	bh=ce3ClsriXC8LZWlvmEpmiJgErfC2vJ+4DZ1F22z7qGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5OwGsuzppx9bVwgjHopDPRgAq/MhLG3y9S0SpPh/106Sc/BfkUmEJ+xSKu1e4x6+XIzzxUcgqadlG347RMurPEDhafpgQ+MbxQEPRc49PvDROcDvgQxEXQz1A15QBB3i9xc9CsbhGhhg837iM/p5v400spH38cz1hC8D1rhrag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo9RYHb8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D06C4CEEA;
	Mon, 21 Apr 2025 21:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271144;
	bh=ce3ClsriXC8LZWlvmEpmiJgErfC2vJ+4DZ1F22z7qGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eo9RYHb8TpLMATn+OsvZHsObuPK9BShm+8CHk7OavKKZd7juoYHDNsxkxYFxf1pnO
	 mwEn/BiTjm/W0WZ0qMDhJT3d3mIsCLvfEwvGYpv9YKeYdNM/jSkCf4RGWSF+gqMouZ
	 uwYiJ2ib+GscW6VdW3LUo7uEHc8fk5X1RjJgOegxwEjcx/GdyfD+XOUm4aklGgmHag
	 Cf63tELcDLC5VePIk1P8xIBS2KvGcJwkU51wco+JhNb8xr6qJ6gcXBlu4d8WJB0In4
	 c03SIUZW10d/1FEt85HV4zgNSbBjRwR0ixulEDZY368N3zPtm0K59RvihAO0wwCUPd
	 ESfr0GJVcQgbA==
From: Mario Limonciello <superm1@kernel.org>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org (open list),
	linux-input@vger.kernel.org (open list:AMD SENSOR FUSION HUB DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 RESEND 2/2] HID: amd_sfh: Avoid clearing reports for SRA sensor
Date: Mon, 21 Apr 2025 16:32:10 -0500
Message-ID: <20250421213210.1160665-3-superm1@kernel.org>
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


