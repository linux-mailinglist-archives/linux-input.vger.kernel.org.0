Return-Path: <linux-input+bounces-11566-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E764DA7E4AB
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 17:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB47316922D
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 15:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C6F201258;
	Mon,  7 Apr 2025 15:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nj7fN0Mt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0357D2010E5;
	Mon,  7 Apr 2025 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039658; cv=none; b=mDi/t9gJHjyyj1YXaV3Stxoi77LBEYF23NIy80rmK7etHuS3z9KHDQfoTnB0ugfRAjBvMkH6FvL9snIYkf2dAo9ok1/ICR3KLKdq+TNmZq6d5XnFAxc0FlpmIG4cY2CCDtSf3vNevhlat9ekyFcBdQX0P6j2X0IccM132Xpn/qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039658; c=relaxed/simple;
	bh=qQsZexYccx4FgFlElnzxUAZ919mneXYpXEL1vk8tYKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3NZzG2UVl61PZQSky5B049uQOFwHr2tjMYMkpl4HWLDxUq1RydU6Y0k6YnVmtzHkTUz/nnDnK8becNUZlWSvozCWGJRl/NNnH7qfu+4J/mm0z9FtohLHqgdBULaWjMNMKVTyl1iz8dBkpqtPzZjDEWDLC2R+Tytc+OggdZOxOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nj7fN0Mt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A98C4CEE9;
	Mon,  7 Apr 2025 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744039657;
	bh=qQsZexYccx4FgFlElnzxUAZ919mneXYpXEL1vk8tYKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nj7fN0Mt+FxJFsBNPMWZFJ5I0DOHruIiKuYIVUCeniU/qUyabxtjOwvews0MGdXqc
	 311LtPLtqTHT62IcJDCKYqtF6voEK1uB9rX23tdutypV6vVSz9sl+FR0lXmyH4fziG
	 XSI0UNdsYKgDPwYHpf7YeS+9GBBIJ03ck0Fis8XxblmTXPSWgjWAuHzGbvvRDSayTE
	 CvHJEOxmS7Um4DlEJAPg/bly/yQNrzWBmc/aAeskMepkqBRkLKJMMDwvG0K1At+FmM
	 CPy1CcKS7kaMwYpnKxXlWQBEBC/n9L+RXQD4HTb9Q3nZCHPNXH+dVatM5zItSOoWJw
	 oheK4NwGLrvrQ==
From: Mario Limonciello <superm1@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list),
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 2/2] platform/x86/amd: pmf: Use meta + L for screen lock command
Date: Mon,  7 Apr 2025 10:27:05 -0500
Message-ID: <20250407152705.1222469-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407152705.1222469-1-superm1@kernel.org>
References: <20250407152705.1222469-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

In practice userspace software doesn't react to KEY_SCREENLOCK by default.
So any time that the PMF policies would suggest to lock the screen (for
example from an HPD sensor event) userspace isn't configured to do it.

However userspace is configured for meta + L as this is the default
in the PC ecosystem. Adjust the PMF driver to send meta + L.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2:
 * Use helper from linux-input
---
 drivers/platform/x86/amd/pmf/tee-if.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 20521d1f28f22..4bda905c3ba5c 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -170,7 +170,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				amd_pmf_update_uevents(dev, KEY_SUSPEND);
 				break;
 			case 2:
-				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
+				input_report_lock_sequence(dev->pmf_idev);
 				break;
 			default:
 				dev_err(dev->dev, "Invalid PMF policy system state: %d\n", val);
@@ -441,8 +441,9 @@ int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
 	dev->pmf_idev->phys = "amd-pmf/input0";
 
 	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SLEEP);
-	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SCREENLOCK);
 	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SUSPEND);
+	input_set_capability(dev->pmf_idev, EV_KEY, KEY_L);
+	input_set_capability(dev->pmf_idev, EV_KEY, KEY_LEFTMETA);
 
 	err = input_register_device(dev->pmf_idev);
 	if (err) {
-- 
2.43.0


