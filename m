Return-Path: <linux-input+bounces-4117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1EE8FCD1B
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 14:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C23E28CA2E
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 12:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6AF194AE5;
	Wed,  5 Jun 2024 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+s4/j/u"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181AA194ADD;
	Wed,  5 Jun 2024 12:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589016; cv=none; b=dYu58bbLvHPk55ZXJjFof5gpXfbKHH4mQ3FJ6ZsfpbidhP55PwDBan5ErkYIY/tbVkuK0yBzeSbBe26Z+a20Kfb/Nv0Jezr1M6R9MTvT6gaELqOgFLFxKprm32DzrMx04fK2miywIu0rxjpObh/IQ+AqfLXniuYQAOhqrfS/co8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589016; c=relaxed/simple;
	bh=FiaTm6Lhhr+ZZajCYAnCyOiSQJMTvV+vgNGZSYZo+To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bl9V6tdss+e4GF3c8gk/xZN5ZjS0v6nD6Db8OdPs8jbG4CPOWtEG27F9Qq7Z34Ta8qguC9lIADgThZud1dNIV+D4Yt3ik8MdpgwrI542KrL3eyCWhtDrw1+QbZmm3yGOsVRe2A/lJD7vAKSGWMWB0dhEBX4Teu1g5o++D1pAiY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+s4/j/u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF66AC32786;
	Wed,  5 Jun 2024 12:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717589015;
	bh=FiaTm6Lhhr+ZZajCYAnCyOiSQJMTvV+vgNGZSYZo+To=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z+s4/j/ulCP/WF1kJGI5SIbHR/eObiwtl+GbSq66ayvBp2BzbgVTQ1edKX3gs7wMc
	 iF8xN5GjY63fYhJB8xg+lsJRDIj9QbvsbpgHwsttco5K4GNzAhZ75LLjTfxZtQXGAn
	 ggyS5UoicK4nZmjtoK7smu4WxdN3SMBdL7VlVeRZnFxpC/SXdtpTHxKbdo0KkAw7qE
	 MmRdZvpAER0hNlX1D2LF+YYjEVQliFiPONqUDbcQxjpio4Cv/5SmtFS9Vj1evLb3jO
	 A8lYvwMRVOkOOqXy0af8vsaI3+tlZj6k9O2eXszmXHUOQAGSH/DfoRSYyi7uqw6bzt
	 gZfpoy8pKW9FA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: hmtheboy154 <buingoc67@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	ilpo.jarvinen@linux.intel.com,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 09/18] platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro
Date: Wed,  5 Jun 2024 08:02:59 -0400
Message-ID: <20240605120319.2966627-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120319.2966627-1-sashal@kernel.org>
References: <20240605120319.2966627-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.12
Content-Transfer-Encoding: 8bit

From: hmtheboy154 <buingoc67@gmail.com>

[ Upstream commit 3050052613790e75b5e4a8536930426b0a8b0774 ]

The "EZpad 6s Pro" uses the same touchscreen as the "EZpad 6 Pro B",
unlike the "Ezpad 6 Pro" which has its own touchscreen.

Signed-off-by: hmtheboy154 <buingoc67@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20240527091447.248849-3-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/touchscreen_dmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 6c03e7daadd4d..2d9ca2292ea19 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1404,6 +1404,17 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_DATE, "04/24/2018"),
 		},
 	},
+	{
+		/* Jumper EZpad 6s Pro */
+		.driver_data = (void *)&jumper_ezpad_6_pro_b_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Jumper"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Ezpad"),
+			/* Above matches are too generic, add bios match */
+			DMI_MATCH(DMI_BIOS_VERSION, "E.WSA116_8.E1.042.bin"),
+			DMI_MATCH(DMI_BIOS_DATE, "01/08/2020"),
+		},
+	},
 	{
 		/* Jumper EZpad 6 m4 */
 		.driver_data = (void *)&jumper_ezpad_6_m4_data,
-- 
2.43.0


