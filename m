Return-Path: <linux-input+bounces-10445-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EA2A49EE4
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 17:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C9F53BC88E
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 16:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9B4277817;
	Fri, 28 Feb 2025 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgygkE0c"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269F5277812;
	Fri, 28 Feb 2025 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740760339; cv=none; b=hBCx9sCohdrtJ8+Fad/SWWmsuGWTcBmJNkHzZmIhpsSbXPrvv4bBnIj1mZHDkfji9zB5TvuBY+V5W1xmbQteqiHyNk3cmFWdOthvJYoQ9I/F4QbqZ2R85ufSQs+2TTTnD0TaFLC3unHl8cOioJNhvM20CSsMAHe4hVs2DmGF+kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740760339; c=relaxed/simple;
	bh=P/RcA4P+v+ljSl+5AN9FN5lP81wuZbneRs9Oo7I8WlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uH9+56X35l5alpwl+eayAc+FlpEGXIZM8r0snYxcYmYSpVL/a6nl4p9M65H8chpEdjXiWYtWrncDno7z4FwicilhA5Tswd2DgxMS5Lb7pzPoNOtf/svr5rUfpkxGNJ8RpLPjGoKhtPij2ZZHfb4PB8+F1Ai/+6g3Bvu7n7dUGng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgygkE0c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9DEC4CED6;
	Fri, 28 Feb 2025 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740760337;
	bh=P/RcA4P+v+ljSl+5AN9FN5lP81wuZbneRs9Oo7I8WlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mgygkE0cniB6CNWpyJm5orUa820AWr6Al74fOmB5Adv0DHZj4hMkEUM08Y2QU5wq+
	 xRm3tYzGsVSuA21y9YNLLypFfcoItSGIc2yrxbLlVXKIwapeE9yNJ7iiA0tfjLsraP
	 /ze+vCzXmSmdt1aHE6D+fYt/1Ctd0AABzJrhtkETmZ2HHxmi/d34ssJ7ZlrgeuN/ht
	 BhXp23mzTO+zCODQfqtbFVPXeQVdSGyAE2r5XJtfsYUI5Y3bDEaN1vFYpIGda6xn96
	 /9aJZGr3sbMi4et8+k0WkD0UTNpR/hkVmeb9YsphvaXMY1eHRmJl1tvQDnNbkU7iZO
	 VKhRjsWJubk5Q==
From: Mario Limonciello <superm1@kernel.org>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org (open list),
	linux-input@vger.kernel.org (open list:AMD SENSOR FUSION HUB DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>,
	Anson Tsao <anson.tsao@amd.com>
Subject: [PATCH 3/3] HID: amd_sfh: Don't show wrong status for amd_sfh_hpd_info()
Date: Fri, 28 Feb 2025 10:31:53 -0600
Message-ID: <20250228163153.2554935-4-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228163153.2554935-1-superm1@kernel.org>
References: <20250228163153.2554935-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

When HPD is present but has been disabled, avoid reporting HPD status
to PMF.

Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>
Tested-by: Anson Tsao <anson.tsao@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index ffb98b4c36cbd..837d59e7a6610 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -129,7 +129,7 @@ static int amd_sfh_hpd_info(u8 *user_present)
 	if (!user_present)
 		return -EINVAL;
 
-	if (!emp2 || !emp2->dev_en.is_hpd_present)
+	if (!emp2 || !emp2->dev_en.is_hpd_present || !emp2->dev_en.is_hpd_enabled)
 		return -ENODEV;
 
 	hpdstatus.val = readl(emp2->mmio + amd_get_c2p_val(emp2, 4));
-- 
2.43.0


