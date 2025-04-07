Return-Path: <linux-input+bounces-11561-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4322DA7E00A
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 15:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98C2016E49F
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 13:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3491B87F0;
	Mon,  7 Apr 2025 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udjdpZC4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C752D1B4259
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033708; cv=none; b=l1ReFQ24dxw5qRWxNjA2jWM2kCzsswrG3Q4HviSEeAjJwXnhIgednCk8st1bov0k0F0IV74jem6hDWRCgWv8QqpvECb4BuoheqY0XTd5apvk53L1v2f22N/9Zqe8N7oG1+sLjvcnHYKCelAmxFvm0fOpYl3tDqSscLWqAN5u3ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033708; c=relaxed/simple;
	bh=jsqT0R7u2MipC2EW2yx+VVPKD1zOB/+55x14k55Nbbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZQIbjCD3An47b63hOSkWkfT53pX354/R9XmwtxLj7EYTRQMMqnyYCPhccKamY6brwQBQWIK5nF6V2U/Kng/Pn7rJavgY10W/uqZ4ixSZWbBtTadcKscQZxs0uvog+cravMb4NFP1csP6VJLKkYWKqG2Aq5NNWHgtJ+k713qju8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udjdpZC4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F0DC4CEEE;
	Mon,  7 Apr 2025 13:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033708;
	bh=jsqT0R7u2MipC2EW2yx+VVPKD1zOB/+55x14k55Nbbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=udjdpZC4MhvXQG+utf8fph0v1u0NgibhJKVbIRgmqPKEbAHHv9bSyCewz1IONtH3O
	 pWIo/h+4qR8xpF9WsH0FbVnQv6DDX+XPhjgNIcFN7GO3+kZEodNBCzRdwnwhj4yN94
	 0By4Yj17gLuHTb2pWvFaxayYj8/Qg5i21vj9oWofxY+yvqTx4QTxqg32XVEldgVFTF
	 lJMTbCXV/AmxdQXx15CaL3V79PWBA3LVklzeSpdtMsC1GctYuK+ZQ2maW5KwPESXFs
	 awJd2oS34aRW+nl8aWYyjV5VgO57kPIcN5ST5/TGRHs/dokwgeDsuORH4W53gCc6Qu
	 gaZuIMt14+zDA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	basavaraj.natikar@amd.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v3 2/2] HID: amd_sfh: Avoid clearing reports for SRA sensor
Date: Mon,  7 Apr 2025 08:47:49 -0500
Message-ID: <20250407134818.805775-3-superm1@kernel.org>
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

SRA sensor doesn't allocate any memory for reports.  Skip
trying to clear memory for that sensor in cleanup path.

Suggested-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3:
 * Less changes as amd_sfh_hid_client_deinit() covers a lot
v2:
 * New patch
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index c1bdf1e0d44af..803b0894a0bd0 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -237,6 +237,8 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
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


