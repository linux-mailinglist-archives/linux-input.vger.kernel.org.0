Return-Path: <linux-input+bounces-10444-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC111A49EDF
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 17:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3CFA3BBC85
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 16:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECAE276055;
	Fri, 28 Feb 2025 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEFPTTnm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276DF27604E;
	Fri, 28 Feb 2025 16:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740760337; cv=none; b=UPjX+/EbSSXHVmc9Dm8WWbHX/gkxMaVMU6cN2T9fqiQ2KAj6tG7BtEypyz5UMMhOOclLZ+Jf1tR+lvXVsq7s4fFhHMrlExARXuPrTzTvpnnLnp/aJ2P3IFRs8CtV1tH5UDn6kG9PAovgM0MXW9JrDguO7G4/+CmXjJon9vnis8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740760337; c=relaxed/simple;
	bh=sxUFdcTRMYRjSUOo6wStxVXhp4EIP3blAGInOSQ/iV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CyRbCKqbSfWXnXFWUtlpKpISOaEIgq8kT2fU7nyi8WvGQXitWliPc83UHwwXIp+pspRgMOZxJBbS4vo4c1VRDhDrfWIHsYYjsRckr1SKGXVyot8rSnPCc9WxbouQQmKPy9KCZ8wWDpOy/gyKKXePFcWPkqFJLdvYgttyJojOk88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEFPTTnm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9E7C4CEE5;
	Fri, 28 Feb 2025 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740760336;
	bh=sxUFdcTRMYRjSUOo6wStxVXhp4EIP3blAGInOSQ/iV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NEFPTTnmIl6sOcDg/OE1J0BUrVx0SC/D5+KiMu3nNKuuVNZR5SyyygzMTC4H6KnXH
	 q241GJlgyY3fQkRU5yqLtq2kMjP0+iTtSJQ5KjodV8VUaNt56ruMHqZv4H8W12idCB
	 KArCJPWM6qU6DQcI3wYrnV2Es3qoc1DYkP0lutlZYSYdCgIpyvB9fYgCEXUNvtzhE1
	 PDqXnTR/M5sY9YjKn8NLCMKW2wLXCgLZ5c+k5oGiT11ungHkIE7g7i7eTdHSjsh8db
	 a4lZP35b4tKrMe/wlpQizJVgdaVBY0q3XU/mfIPiDxAsT9GGun/IK8JvA4712pEa5W
	 OR5zlKZIw1gKQ==
From: Mario Limonciello <superm1@kernel.org>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org (open list),
	linux-input@vger.kernel.org (open list:AMD SENSOR FUSION HUB DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>,
	Anson Tsao <anson.tsao@amd.com>
Subject: [PATCH 2/3] HID: amd_sfh: Default to HPD disabled
Date: Fri, 28 Feb 2025 10:31:52 -0600
Message-ID: <20250228163153.2554935-3-superm1@kernel.org>
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

Unless you know to look for it, HPD is a surprising behavior; particularly
because it can wake the system from suspend. It also has implications for
power consumption because sensors are left enabled.

After the sensors have been probed (and HPD is found present), explicitly
turn off HPD by default. Userspace can manually turn it on if desirable.

Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>
Tested-by: Anson Tsao <anson.tsao@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index fc9c297d0db7f..25f0ebfcbd5f5 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -213,6 +213,7 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 			case HPD_IDX:
 				privdata->dev_en.is_hpd_present = true;
 				privdata->dev_en.is_hpd_enabled = true;
+				amd_sfh_toggle_hpd(privdata, false);
 				break;
 			case ALS_IDX:
 				privdata->dev_en.is_als_present = true;
-- 
2.43.0


