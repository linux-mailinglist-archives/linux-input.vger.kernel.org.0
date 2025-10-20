Return-Path: <linux-input+bounces-15622-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CD668BF2372
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 17:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78FC234DEF8
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 15:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE65258CEF;
	Mon, 20 Oct 2025 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK5hpB0H"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65705220F5E;
	Mon, 20 Oct 2025 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975476; cv=none; b=cljUKI/yiy0A2N3aKeQxmV5TtGdYXOWSnLmS4ZfTfFYvKnADXDAf1SA5/mKM5T9qhIfIajuY6R7JJ42yefStRZ+AkG+OgFlringBybkCClKxwIlmpmboxxlMx/eWuVo+QwSKXfmeld7kd5j/cHoSDX0IVUG1P2mtl+0TWHf3SD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975476; c=relaxed/simple;
	bh=30bc6XV0MUlkQCZdmm0Njmz87jjwM681MeHs7nhEZQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=coYhCSWmtRJ4rY9c3kvRlxXMPf2tgZ3avewdHd5uGrSjzQ71xL5XI6HCZpuklDn02DI5XsnArrlw9q3W7wyRJnKbpkcLGI/mtbpmfWRVyXF9qkqZDb/byrOi/+aIQhT0DqN02AeWp6Fj+jKqbLhO9cTc2G8gxcDRUSOiLjGEDTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lK5hpB0H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62ED1C4CEF9;
	Mon, 20 Oct 2025 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760975476;
	bh=30bc6XV0MUlkQCZdmm0Njmz87jjwM681MeHs7nhEZQA=;
	h=From:To:Cc:Subject:Date:From;
	b=lK5hpB0HTYi1H05uFtMwl09HvdjGjtI1HKwThWldDWnXQK4w5uJxixiHVPW5ygcMc
	 ddBCLSpFZ8OiEhHRSr9cgh71Eb6jWyLGa1G+TF2hXLHkW+Wmj6BN+eLcER+Dr5NHQo
	 KBJRV0LMuzIR/Cgt/FbqQbOtOUJjPbbCcu3ML86Xbp7nqJwkCykMrNWJvQZBnQ+mkm
	 P5wtoZEk+K5Hery3nrP2VNG0EHkdZXAHscpKukQsHjrLyg3MedBgvFqnRD7E7yjEjN
	 sUQVF6R8se5jaJUxkgO0mKzWDFrHAM4FIaK0aVoGh4EbVb+8/MiGbUuEVz3L3xTU1Z
	 0UBZA+DWFRz7Q==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com,
	basavaraj.natikar@amd.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	stable@vger.kernel.org,
	Titas <novatitas366@gmail.com>,
	Basavaraj.Natikar@amd.com,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: amd_sfh: Stop sensor before starting
Date: Mon, 20 Oct 2025 10:50:42 -0500
Message-ID: <20251020155101.3905957-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Titas reports that the accelerometer sensor on their laptop only
works after a warm boot or unloading/reloading the amd-sfh kernel
module.

Presumably the sensor is in a bad state on cold boot and failing to
start, so explicitly stop it before starting.

Cc: stable@vger.kernel.org
Fixes: 93ce5e0231d79 ("HID: amd_sfh: Implement SFH1.1 functionality")
Reported-by: Titas <novatitas366@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220670
Tested-by: Titas <novatitas366@gmail.com>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 0a9b44ce4904e..b0bab2a1ddcc5 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -194,6 +194,8 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 		if (rc)
 			goto cleanup;
 
+		mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
+		amd_sfh_wait_for_response(privdata, cl_data->sensor_idx[i], DISABLE_SENSOR);
 		writel(0, privdata->mmio + amd_get_p2c_val(privdata, 0));
 		mp2_ops->start(privdata, info);
 		status = amd_sfh_wait_for_response
-- 
2.43.0


