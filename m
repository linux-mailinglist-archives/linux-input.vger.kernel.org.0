Return-Path: <linux-input+bounces-6705-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45611985DBE
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 15:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 740F41C243FD
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 13:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672F11C9B64;
	Wed, 25 Sep 2024 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpWcgYQL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3967E3DAC1B;
	Wed, 25 Sep 2024 12:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727266005; cv=none; b=aWm6HDcElc1mJMHJHhw4JCcrhRzg/rTkvyo25wNwdcsML9ucYDxHK7diB7Ri8puIkow7+MhbvB3RY7S+lx7i6cHttafBgIJWoE+tHnsIikG6/5wyRpuOm4XD+GmC5BEnbAiqhfqJ85eFtrX792LlA7mT8AHN/BYDGPkTSDOD7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727266005; c=relaxed/simple;
	bh=94gKqVWUHADiEypbGK8D3lONfmKJ8ZoeBsq+CcZXiyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFaJySLJPAzia7umGuTVZqmUQYNIrul+XoXp+BAvNUQPbYVUaLQSdymJWRP+Dps9OYMMsroYj7w/d4bxdhsk2GzumNwMGGblLzqXAdnEcrfpFZomeidrLL8DN4lBlbCpQqJHmXLPeeljpUu0lmEmpjyrciZ5y5kn4Ny3cH3zj10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpWcgYQL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4ACC4CED2;
	Wed, 25 Sep 2024 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727266004;
	bh=94gKqVWUHADiEypbGK8D3lONfmKJ8ZoeBsq+CcZXiyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JpWcgYQLzKCb2IaZtS3FdMDEH/sAupmPnTxaiF0xpR5IHuhx0tyUrNyocb7T6Y008
	 c03+wdH1aWQg5TrVe5wBx6I31UF1X231Fez+Gk9z9pJ5fusUWvEmzPCN74qqedsPoA
	 kIedf5T2F73YDDZbli8+ZHSbutIpCIxt3dCKynnL72Nazg/Kh50imqbaxIGCcF/p6z
	 CKnpfTPBzD/xgVu3sAn3xK+im0QdZYoxnmgiKAOVaYOj0IG7ScOTBJ+Pn2KLWzh9vF
	 tHQOMYg9ayFsHt6Ig4gKX9R8+1N8wS164Qcy7FlpqmJByXWRvgAZ2eBTkhh4lgK0iE
	 M2lgT93ZTyPuw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ckath <ckath@yandex.ru>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	ilpo.jarvinen@linux.intel.com,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 146/197] platform/x86: touchscreen_dmi: add nanote-next quirk
Date: Wed, 25 Sep 2024 07:52:45 -0400
Message-ID: <20240925115823.1303019-146-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
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


