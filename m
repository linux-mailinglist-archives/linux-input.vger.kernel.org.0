Return-Path: <linux-input+bounces-4114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E385B8FCCDE
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 14:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1662A1C22625
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 12:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E69A19FA6A;
	Wed,  5 Jun 2024 12:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGU04Jma"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC119FA67;
	Wed,  5 Jun 2024 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588964; cv=none; b=LZcut5Qs88TgUGk5r75h4RFixbBuAqwnBHzhFNM1xXFyqLbNJdGkFew97xXUyUoYakIyaJKIFcWcwl5uUXiML9D4RGtZ8brPNlIpKm7px/5TwwfRW64vZmu+Sr35seREKvubLOazYTpfdxu8U9KevJ+cz2e+LJ1wBjR//EYnfFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588964; c=relaxed/simple;
	bh=FiaTm6Lhhr+ZZajCYAnCyOiSQJMTvV+vgNGZSYZo+To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkHET0JqANabp8ZAa5LcSCMDlI13efZPAUf2nSkw+8RrfnqNVlvgtYfT0EFOBhOitv/EsEW3pRzOOopVZLR+PoFKmivdoXIrXDm3wEkf71PvWJHGUyJB/nGJV1ent6WUf59G+6NTEYSIMQmqwQlDcFhV9mouHok6g2xwltzoAD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGU04Jma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8147C32781;
	Wed,  5 Jun 2024 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717588963;
	bh=FiaTm6Lhhr+ZZajCYAnCyOiSQJMTvV+vgNGZSYZo+To=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TGU04Jma7Cmn/FlUknK0VCzfmvSKBBnES6hqZbKrqE5KR/2acPdY71j5GBmd/z0kT
	 VhWy2UvQFshtLltcu9I/9eCO/aKOohfwSTWHenF5/NyGKIC+YFQ7ESL0wHYS31zIRI
	 QnnqLjCLKTcJkLM0uX/t/wIxkkiJc/8EscqqgvNrH2XZCoIlrNgFIjFph+JhicNIYI
	 OvkqtVNsoNxZRuXLobERqx9DEJsDOPefzP+kdkPIrNwJ7/HlkCjcp5xTsBaszFnRNl
	 1X+Z5nfJiO+Zso+p7iqOpZt34uIbbOWWEsO7G41z0V7/zjQC4TglsiI84rirfPV/DD
	 AbqGTV26LnTow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: hmtheboy154 <buingoc67@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	ilpo.jarvinen@linux.intel.com,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 12/23] platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro
Date: Wed,  5 Jun 2024 08:01:55 -0400
Message-ID: <20240605120220.2966127-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120220.2966127-1-sashal@kernel.org>
References: <20240605120220.2966127-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.3
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


