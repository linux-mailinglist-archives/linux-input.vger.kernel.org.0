Return-Path: <linux-input+bounces-4129-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D198FCDD4
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 14:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 946951C20BF2
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 12:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368341D1543;
	Wed,  5 Jun 2024 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MulSHZ6G"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0EF1AC428;
	Wed,  5 Jun 2024 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589166; cv=none; b=ZUe6WasNDKt/4wsSsAcbgfJ9d1zMdn8he/eRk/2yl/oTyhbv2akmp4ItGX0nH1gmxtfUfOrbwYKa4mGJ8AtWtj84Hnw0cWuIYrksf3gtI+x6cq7x/ODs6OJam2z5VqIzPLs0Y6//QvDks1/Cdrcav1NarPl1YUyU6VSJEgo100c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589166; c=relaxed/simple;
	bh=ESOnc9fBjgjxMNcRQQtZ45fN9raXYVr1D+fYfaUJ/lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvfvlVc8qi3kMfmj5xgOGP32wjtOzp9h6U28gRTc/LIr/0ik+773E10Xljo4J4q+d6RP0Ao673oP8d+qAlBm3r0DBF2ix7k+NfT4b4stS5XOFfkbncNBxDFcFc8D3qrn//Dj92XRV9R//dnEG2NJb8F9Cc1odIM0ERWNwLyMTow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MulSHZ6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A3AC4AF08;
	Wed,  5 Jun 2024 12:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717589165;
	bh=ESOnc9fBjgjxMNcRQQtZ45fN9raXYVr1D+fYfaUJ/lw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MulSHZ6Ge0SAIwuYabF9hMscyepsCnaWoShh5vZAsNK3Ij1wb7vZKOACR/NBnL1JP
	 lcyIIgHdgzMs2fUBH1MJoL7MTkmH49aWeFr8nnrie3RqUUArPN9RArWMOBWV8LyE1a
	 H6rnyAxkjCVzatuKKXl1fWlFZogu6gngEhf0eAG9Zx7CunY0NDXR5NT43c2VwSnANs
	 mXNtge2w89xgAiyH+SBmTYEYjhM1sTZmm4q2skEH+tFCqazthzFGFf0Fx+3XZlQx5o
	 xgMvjogsJspGitXOiYoTEkEpFIvbK7tKDo7JBj03h3XsJwJL5sqBjF6imDxK2yUBho
	 wQyuRVFZyUL6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: hmtheboy154 <buingoc67@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	ilpo.jarvinen@linux.intel.com,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 6/8] platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro
Date: Wed,  5 Jun 2024 08:05:49 -0400
Message-ID: <20240605120554.2968012-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120554.2968012-1-sashal@kernel.org>
References: <20240605120554.2968012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.218
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
index 30ad533b92914..7fb2603acc06a 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1280,6 +1280,17 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
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


