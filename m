Return-Path: <linux-input+bounces-4018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0C8D746E
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 11:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A57041F219C0
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 09:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441893BBEB;
	Sun,  2 Jun 2024 09:03:01 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB773BBF1
	for <linux-input@vger.kernel.org>; Sun,  2 Jun 2024 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318981; cv=none; b=J88d3wFrGw0Kd/vk7p5rIsYNzqXTdfXRQshjgehTz0YZ9LG4XBP5W60NHMJpnm9nUEE56HSM9UhZT4/ROECNbG+Bm7eR2HLlC+I/UxZ16wN17VFNKO5pb/RFf28Y3B5cP4zjnDbwKTZd3eFFn+lCpvkBmHerL/AtoUEPrJ3mBnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318981; c=relaxed/simple;
	bh=UgAuMHpFIkncb10bX6YzLxaitjoHyiUwEFu7OS+KpA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QY5VjLec1wAg2/GfaezcjO9UkpLGKmA947Vy5/43pNPBzxe986NXTGQ7/T5QyHeiQbUcHr6Hi8kavXU2zmjSqJmQBiYYB1QHcLBldLMGDDjWONPju+bsyaoO70weSggOzgipWzekNPHaUs8dHgf12x5e7FLS9GS73KEu+G7Uv74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id e585c43e-20be-11ef-8e3d-005056bdf889;
	Sun, 02 Jun 2024 12:02:53 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Li Zetao <lizetao1@huawei.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-input@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Mark Pearson <markpearson@lenovo.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH v1 6/7] platform/x86: thinkpad_acpi: Use 2-argument strscpy()
Date: Sun,  2 Jun 2024 11:57:59 +0300
Message-ID: <20240602090244.1666360-7-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
References: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 2-argument strscpy(), which is not only shorter but also provides
an additional check that destination buffer is an array.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 397b409064c9..f269ca1ff771 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -7416,10 +7416,8 @@ static int __init volume_create_alsa_mixer(void)
 	data = card->private_data;
 	data->card = card;
 
-	strscpy(card->driver, TPACPI_ALSA_DRVNAME,
-		sizeof(card->driver));
-	strscpy(card->shortname, TPACPI_ALSA_SHRTNAME,
-		sizeof(card->shortname));
+	strscpy(card->driver, TPACPI_ALSA_DRVNAME);
+	strscpy(card->shortname, TPACPI_ALSA_SHRTNAME);
 	snprintf(card->mixername, sizeof(card->mixername), "ThinkPad EC %s",
 		 (thinkpad_id.ec_version_str) ?
 			thinkpad_id.ec_version_str : "(unknown)");
-- 
2.45.1


