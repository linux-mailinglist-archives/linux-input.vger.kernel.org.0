Return-Path: <linux-input+bounces-6700-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 002B7985B52
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 14:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3D9528696D
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 12:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC871BC9FE;
	Wed, 25 Sep 2024 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0rLCupY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6CA1BC9F7;
	Wed, 25 Sep 2024 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727264891; cv=none; b=F8Brce31sC2h/BzQX7Y5iA8YPMELbjXLe5cjPLSavaa+6wB2EcaugSBqew8sKpa0Ld9iYxN06yP9R95HMC0lPqbf/+RAbzNZNOz+HFhRMSUARV7KlG39rhIBU9wdCJy8y3+14YDMKo09OgqqL/mtAhB7vA8js9Q8iIyyxvawf70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727264891; c=relaxed/simple;
	bh=94gKqVWUHADiEypbGK8D3lONfmKJ8ZoeBsq+CcZXiyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJ3ccvWb+kW4Z2y9H4Ki+ZIUz9E+/S1CrJlXH5NG0qBOxkqxwXxLMTnXlk52TgNs6IcpwB/GLKG9Ng+8k3IB8ErozeMkQNkI+bsstJlYPbIl6kAMyhgdc1L4t9LGRuBgyjzVbzlJDmqiFC3rCPjynSCW7L9mTGNH/CxiIsvKmNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0rLCupY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2682AC4CEC7;
	Wed, 25 Sep 2024 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727264891;
	bh=94gKqVWUHADiEypbGK8D3lONfmKJ8ZoeBsq+CcZXiyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u0rLCupY5GtOczeNlrlrN5otj7GEr7Nq+FuS3CbVkj3unsPfqYb39SICB3aDJOIHz
	 ykKDzAlu1S5gUV3/bfCUJW+lcYur72XqArwQBcxGr59K/SqPXoMhxTE7JBzcKOFqxA
	 wT6gHP6It1JLp3ssGY9goH8iNh8HehLkPKFTkUS4Iw1c8lse3J4tbdzLc6A8/XCCtZ
	 wnKEvR4vfbqU29UuRQ3eNpOJnbj+W+Ms0b7oYXfrYzylnG11Erfw934IoyW5Ws3I0c
	 xK2LarUW4W7piNWMj45UT01/tAq58mNst+vynHVrelx5ogucfiDFIfye0sSfdxipQx
	 Gpw/LyqbwaHjw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ckath <ckath@yandex.ru>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	ilpo.jarvinen@linux.intel.com,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 174/244] platform/x86: touchscreen_dmi: add nanote-next quirk
Date: Wed, 25 Sep 2024 07:26:35 -0400
Message-ID: <20240925113641.1297102-174-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
Content-Transfer-Encoding: 8bit

From: Ckath <ckath@yandex.ru>

[ Upstream commit c11619af35bae5884029bd14170c3e4b55ddf6f3 ]

Add touschscreen info for the nanote next (UMPC-03-SR).

After checking with multiple owners the DMI info really is this generic.

Signed-off-by: Ckath <ckath@yandex.ru>
Link: https://lore.kernel.org/r/e8dda83a-10ae-42cf-a061-5d29be0d193a@yandex.ru
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index f74af0a689f20..0a39f68c641d1 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -840,6 +840,21 @@ static const struct ts_dmi_data rwc_nanote_p8_data = {
 	.properties = rwc_nanote_p8_props,
 };
 
+static const struct property_entry rwc_nanote_next_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 5),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 5),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1785),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1145),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-rwc-nanote-next.fw"),
+	{ }
+};
+
+static const struct ts_dmi_data rwc_nanote_next_data = {
+	.acpi_name = "MSSL1680:00",
+	.properties = rwc_nanote_next_props,
+};
+
 static const struct property_entry schneider_sct101ctm_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
@@ -1589,6 +1604,17 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_SKU, "0001")
 		},
 	},
+	{
+		/* RWC NANOTE NEXT */
+		.driver_data = (void *)&rwc_nanote_next_data,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "To be filled by O.E.M."),
+			DMI_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
+			DMI_MATCH(DMI_BOARD_VENDOR, "To be filled by O.E.M."),
+			/* Above matches are too generic, add bios-version match */
+			DMI_MATCH(DMI_BIOS_VERSION, "S8A70R100-V005"),
+		},
+	},
 	{
 		/* Schneider SCT101CTM */
 		.driver_data = (void *)&schneider_sct101ctm_data,
-- 
2.43.0


