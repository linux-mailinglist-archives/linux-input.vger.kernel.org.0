Return-Path: <linux-input+bounces-4123-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D84798FCD89
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 14:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD99B28C90F
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 12:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AB01CC6F2;
	Wed,  5 Jun 2024 12:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEg/YgXa"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D893F1CC6ED;
	Wed,  5 Jun 2024 12:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589110; cv=none; b=g2KbPWPcDZanJ9kU2DuXYz+ggacOz5rVIoapJa4bBVr52px+VSO91YpKW1lZ9NVoiOyHdn6huQ5b3EeoKv9pZ61E1JpbwM4iF2wJKeHWjVBiCSZcFnPRzu+8VbbXTvfsyrcEHtcsuBZupTSTjIcS1jX5lax7z+V5ZydDjI1EcOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589110; c=relaxed/simple;
	bh=ewR/ZRWv1vpEoswy6fWW5fXyZ8i1q+3t2PVZL/PghkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MtI0fBvifdQD4vWxaWgRtu2YMStaWTI6z+8F9UQHlwK5EkLQpEmK9jyQwpnhDzBMpy+u8Ob2L8z4JVmFGgC2qZz/4fcinBYYXnG2rRC+7VSqLqcfF9aiTUY/MKpTTQs+i2KBTc8bHFvuoL2olhi/sUCnJ2YgY6CkzkxnoAPUj0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEg/YgXa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0B1C32781;
	Wed,  5 Jun 2024 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717589109;
	bh=ewR/ZRWv1vpEoswy6fWW5fXyZ8i1q+3t2PVZL/PghkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XEg/YgXalT8uj0MLnpNoYmuTWNdGu9cOnjXt4gidFBQu+ikDDULMT8VyVpzNdZFmb
	 USjrujcZ3L5v3FKvIViYbvNGav17uwr/PaNBmvYBEfog1zubnY/53XeVxFrq6CMkap
	 okdbdxkpTxkaAx0E8oUxI9JH3Z0VSlnuA1WnOsWqFG9wuR+WcmQepUnD1pzSoeCLPu
	 nDawyf7uBYc8f9BRQalL3CvY8obC3mCa2mSzgLdkAnY6sPmYZUKUdBBT203YnR6gUn
	 i+7riiqmRksBFR+HX5CQH6MRHX2hOhLpVn+k0kznkyxeGDg2FRnX45mwkbC09truec
	 JroXnt5U1x2hw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: hmtheboy154 <buingoc67@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	ilpo.jarvinen@linux.intel.com,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 08/14] platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro
Date: Wed,  5 Jun 2024 08:04:41 -0400
Message-ID: <20240605120455.2967445-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120455.2967445-1-sashal@kernel.org>
References: <20240605120455.2967445-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.92
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
index 0b9746db296f3..33fd360803e7a 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1364,6 +1364,17 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
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


