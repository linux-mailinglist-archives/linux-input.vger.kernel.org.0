Return-Path: <linux-input+bounces-12457-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5ABABC906
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 23:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1537D1886753
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 21:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE08421B1AB;
	Mon, 19 May 2025 21:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tU4NTW0j"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16B421B191;
	Mon, 19 May 2025 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689696; cv=none; b=CMyxyeluVZfhYS8PybuJqDr/dfAqKV5JHclhWHJ8bRpEIYvYCdSMexfEax2MHZEmkt2bq7eDJ2uq09rHNqxqyYP/uIxuecM1huzIDWNVdpGvTGLCK9OpD02xIazQQtNUT87UgsjNTTNBFterHLAZWNcD+iASa1w7clES7K4RCMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689696; c=relaxed/simple;
	bh=lH9zdZaEdr9+33s1ibwmkHyGg80s3IuWQrjin8eGuNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ht0KX2WIRyP7ZGQx3LQW3kvWellsrlM/OUyt62ZAtH9mt/ct7t6emg1n82eWp5+9DY9we8AxBdsDjptqgAft+uCH0BMrsHrRflK3yoF+yrAMxN10OVcZ1+4fkTlThgCNnNWmwEDyEtMqBcC7YdDJd/nWhku7jv+vZy2c+Khzju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tU4NTW0j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAD2C4CEE4;
	Mon, 19 May 2025 21:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747689695;
	bh=lH9zdZaEdr9+33s1ibwmkHyGg80s3IuWQrjin8eGuNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tU4NTW0jCjF5KtS2DuLafxGP1600IFe4wEsl5oYad51aOvZ/XOtJhVyhirKu9IKxW
	 P3w6P5RJpMG7DDoKVRRa4wRxuW0vCSEZeAqLRMxYGqCFe059rKrdhc5oGMoA65zBUq
	 hXjuwwVJAhXE21QG0+iN9uC8qcC70KwzDbltjqy+ZAZxUbnvl9SAumB9th9TFHFYQl
	 rE9NADQ7oofttL1tRDfuQI89Axn/eFxrzDIPrHgSTKtelr4jpmpaynWn2UcuanhTra
	 0TwF58M9fv+hVVqam2Y/ki31So1lbghI9rYrJABVpXFF9/4C+BADbVB1zpkRVGlOBe
	 sVgzf2VcZNSpw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 02/23] HID: amd_sfh: Avoid clearing reports for SRA sensor
Date: Mon, 19 May 2025 17:21:09 -0400
Message-Id: <20250519212131.1985647-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519212131.1985647-1-sashal@kernel.org>
References: <20250519212131.1985647-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.7
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit f32e8c8095490152b5bc5f467d5034387a4bbd1b ]

SRA sensor doesn't allocate any memory for reports.  Skip
trying to clear memory for that sensor in cleanup path.

Suggested-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index e9929c4aa72eb..fc48b256fc0de 100644
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
@@ -236,6 +239,8 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 cleanup:
 	amd_sfh_hid_client_deinit(privdata);
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		if (cl_data->sensor_idx[i] == SRA_IDX)
+			continue;
 		devm_kfree(dev, cl_data->feature_report[i]);
 		devm_kfree(dev, in_data->input_report[i]);
 		devm_kfree(dev, cl_data->report_descr[i]);
-- 
2.39.5


