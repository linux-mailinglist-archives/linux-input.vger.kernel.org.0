Return-Path: <linux-input+bounces-12006-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9A9A9CE29
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 18:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FD539E4AE9
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 16:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF261A2393;
	Fri, 25 Apr 2025 16:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtgNqyPq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF961A0BCA;
	Fri, 25 Apr 2025 16:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598600; cv=none; b=eM0nNJusUul86f+CWmOOypRgkQgbkG7QovmT38OQXQPuTZdl+9aVIxjD+ayVFV7FBDbo18TWa28bIN/ibV6VSs+IZZp/SAYka9xOVoJbCu8Lp4yFoQCh6wCToKLIE1gkJVeBLXUWm3y7ROwpqMCnoGlHspGK7pl/eIT0Rr61ZnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598600; c=relaxed/simple;
	bh=7i4/x8IKTcwtudhB9CjmkK5JX9DdTZYqVkkUUgqIi7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pAglxSYXmN9Z0mfZe9oSNCJQ32TfwrYdkhUvw42rup0VWu0aypzbVoPtK2u9fzU3/xNorV//Q5T/1Lh85FGZMXxYwiAYX96zsTaUTg/1zrdGngmXwwyYMUvcbUp0eOc05C0Tpq4CfjXE4JYJHgapO678KOZsCBNfmKmlyyuksuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtgNqyPq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4101DC4CEE8;
	Fri, 25 Apr 2025 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745598600;
	bh=7i4/x8IKTcwtudhB9CjmkK5JX9DdTZYqVkkUUgqIi7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KtgNqyPqNOcaZ+x6QsbkaghX45RndHZw/CILJqa0WUxcNQOyMn7Q58z8F9hZ5C27x
	 yXBWFipXNODPTla4BlO/OfMuoqm38GO6KoOtSOLBEFAqOXp/OEM5vYIVKydNmlcxgl
	 ME9xT6KtqER6LMsff6JYuDurju/LWr2idLyfyMhg0jxMOpbvDNPXfaNWMM0bPFsYwn
	 edA00cur7DpEOgnz6QDq2AR+tq9vAUuG/vcSyxb+iyGZO2MzNY7Du45RcJ+x4zkHHb
	 eIi/nzMm05y2yGgFmd14hMtuvtNzASoNnsfxM9w1NMJZmZQ9OJZFmlk6TWQge2z8Et
	 Aiiryfp2m1lcQ==
From: Mario Limonciello <superm1@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list),
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v4 2/2] platform/x86/amd: pmf: Use META + L for screen lock command
Date: Fri, 25 Apr 2025 11:29:49 -0500
Message-ID: <20250425162949.2021325-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425162949.2021325-1-superm1@kernel.org>
References: <20250425162949.2021325-1-superm1@kernel.org>
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


