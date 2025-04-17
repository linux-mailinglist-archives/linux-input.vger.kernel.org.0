Return-Path: <linux-input+bounces-11816-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A86AA91140
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 03:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D90243AE7DC
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 01:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B411B4F0A;
	Thu, 17 Apr 2025 01:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyOGqmIS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B835B1B414A;
	Thu, 17 Apr 2025 01:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744853848; cv=none; b=Fbw4r86eDhZbr2Ey9tusG+M3CUfE2t3EJftsKa8IfVXmpxVS7C8JUt0piBcqLTs08i5Zyf8+rWl+ENh7ziD6QQCkhUXr4FaIArtlGootQ1KFYyRrEkaV3ccUvrOZB82LDUnhJVV1KfZmsOVwEsvnzk2DAiaCf9Exyi1vCC8jcZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744853848; c=relaxed/simple;
	bh=7i4/x8IKTcwtudhB9CjmkK5JX9DdTZYqVkkUUgqIi7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdtGkuPAQxxB/HZqRppikCSO0oOeIiHTtrwkyi9z1hZ4XiNk/0O4vu2TF62RHByC8AUcQukS5SWDhNjNDAk3nyphM7RmaioYOpv+e2rkCEsD0ewTFpp84lEPShRwrWBxHhRvFzxkAITt6UWrSi5n2pTyoq9N3gSAkSBGnRDT8jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyOGqmIS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD647C4CEEA;
	Thu, 17 Apr 2025 01:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744853848;
	bh=7i4/x8IKTcwtudhB9CjmkK5JX9DdTZYqVkkUUgqIi7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZyOGqmISaHO7PQ0WHYTFHQRMeZ5A0IvGst/484Tylrxx8Be3epGmnBnSZBWSvL2ge
	 IOR7GJ/zSz37c7SkQs2N3rad9NcTp0Mm08bGlGGMFaZOR/n/22uGz5ppVPIHolol5K
	 x2MhBkQci4RFBzHx6ouZtbdmrHzzxZ2GJ1iVSYyFsI/bbzmlldtbKjwBWZjX3wDJ3f
	 cJZ/zmDU1/CB3IMe89APnhces7FnPSXrct44/abGuDKGLsVIN9Uv60PJK/zjShA5Sg
	 XP8uCu7XQLRFkAd7PePzzRCt42QrQJiRri9kclbwkmZ+EY/PZpG9ibxWz8nHy/SqpN
	 WOORpIENZD5OQ==
From: Mario Limonciello <superm1@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list),
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v3 2/2] platform/x86/amd: pmf: Use META + L for screen lock command
Date: Wed, 16 Apr 2025 20:37:22 -0500
Message-ID: <20250417013722.435751-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417013722.435751-1-superm1@kernel.org>
References: <20250417013722.435751-1-superm1@kernel.org>
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

However userspace is configured for META + L as this is the default
in the PC ecosystem. Adjust the PMF driver to select the Kconfig option
that makes the input core send META + L.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3:
    * Use Kconfig from linux-input
---
 drivers/platform/x86/amd/pmf/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 25b8f7ae3abde..10089c69ce582 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -12,6 +12,7 @@ config AMD_PMF
 	depends on TEE && AMDTEE
 	depends on AMD_SFH_HID
 	depends on HAS_IOMEM
+	select INPUT_SCREENLOCK_EMULATION
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
-- 
2.43.0


