Return-Path: <linux-input+bounces-4119-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE5F8FCD5C
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 14:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 241471C2366B
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 12:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6471C7D6E;
	Wed,  5 Jun 2024 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lf8F589+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931B91C7D67;
	Wed,  5 Jun 2024 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589063; cv=none; b=cKdg1N9P3i0vev8pAY3xCUmBu4RjG/cjJpvdnMooj6B68aAMK26nBRlSd50nVsRFqiiqdCUySSIjURY1zijnkaUHXeEJgqKN9SLImnHFyxQLZV58OENMLHb+GJ85vSN5TowOnMWM+hxHt3SrXSzmnWaSGGwnS8Eef6Yg4YhLFEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589063; c=relaxed/simple;
	bh=782V0fyWGKwAmBL6YA2tfjFO6gnb69Eg4QQ3yLukVQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkPuA+ag7+rvUR5VhkuVs59SznPxx/MgwB0dFX4SXhZxxV3dfuok3K3uS412RmFWJ2znK/mQjAoymYhBIBBSiDIv2KotpRlyNTWRR27v0UHnJTBWdMr9MFTgnTk5jqnRNAhXxN2jonGO3lunIjT9rSNW4n9Gz8CNQb97HPkDgx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lf8F589+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB16C32781;
	Wed,  5 Jun 2024 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717589063;
	bh=782V0fyWGKwAmBL6YA2tfjFO6gnb69Eg4QQ3yLukVQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lf8F589+H8IQyacSLg9OL+APiFpWBR/Qi3RDYfEa8xPMRigoR9Oe1mAnrKGLfZxP8
	 BOBVOLtlD9yKHq9zPqjVNdcpA/x+XSxXGMn1Mu6d1fW+a8opUQfnI+tbwm7ek0Jar/
	 gwSc/G7L2gTKWvE4H6lKxShuWIi0oiPzeNGD7lZa63tF8gzUpAp/gNMTafZCfq/+DF
	 UQpRmH5vbyHJnycIKz6YO22e6KZifOnxsaI/1QWvfhRZ+wue2qYWK8w0YQgsfHFkQ5
	 sMyvfVFaC6NMZZyfYG1pN8Shmni6KkFwr0wjDf3H6pRkW0q9e8UEMOVaedDLbcaSw6
	 o4ufxSJF0zmhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: hmtheboy154 <buingoc67@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	ilpo.jarvinen@linux.intel.com,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 08/18] platform/x86: touchscreen_dmi: Add info for GlobalSpace SolT IVW 11.6" tablet
Date: Wed,  5 Jun 2024 08:03:47 -0400
Message-ID: <20240605120409.2967044-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120409.2967044-1-sashal@kernel.org>
References: <20240605120409.2967044-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
Content-Transfer-Encoding: 8bit

From: hmtheboy154 <buingoc67@gmail.com>

[ Upstream commit 7c8639aa41343fd7b3dbe09baf6b0791fcc407a1 ]

This is a tablet created by GlobalSpace Technologies Limited
which uses an Intel Atom x5-Z8300, 4GB of RAM & 64GB of storage.

Link: https://web.archive.org/web/20171102141952/http://globalspace.in/11.6-device.html
Signed-off-by: hmtheboy154 <buingoc67@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20240527091447.248849-2-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index dc244e17754e6..86e8d78ae7c1b 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -905,6 +905,22 @@ static const struct ts_dmi_data schneider_sct101ctm_data = {
 	.properties	= schneider_sct101ctm_props,
 };
 
+static const struct property_entry globalspace_solt_ivw116_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 7),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 22),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1723),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1077),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-globalspace-solt-ivw116.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data globalspace_solt_ivw116_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= globalspace_solt_ivw116_props,
+};
+
 static const struct property_entry techbite_arc_11_6_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 5),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 7),
@@ -1632,6 +1648,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
 		},
 	},
+	{
+		/* GlobalSpace SoLT IVW 11.6" */
+		.driver_data = (void *)&globalspace_solt_ivw116_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Globalspace Tech Pvt Ltd"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "SolTIVW"),
+			DMI_MATCH(DMI_PRODUCT_SKU, "PN20170413488"),
+		},
+	},
 	{
 		/* Techbite Arc 11.6 */
 		.driver_data = (void *)&techbite_arc_11_6_data,
-- 
2.43.0


