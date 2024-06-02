Return-Path: <linux-input+bounces-4015-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEDC8D7464
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 11:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39316B21503
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 09:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9ACE381DE;
	Sun,  2 Jun 2024 09:02:56 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F968364A0
	for <linux-input@vger.kernel.org>; Sun,  2 Jun 2024 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318976; cv=none; b=HHF5SkOzOFHa2+hnLNaIC2PtLM9UIUI5I6q7jKs7DtozK5zqQwwrXzJh1xb249HLS7jA5+DUY6xPfTpRYt33lCujQYQjWha2L1j3AEtUGxZUbBdM0ZE4itxxtX6MuVjvDEA60M6cr7qBJFHo2v+O4YpIRt4HAHCJImbTUSrAObQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318976; c=relaxed/simple;
	bh=A6dVcyj3TpXvLRLkS0fzqxH5DLBjNaIzUh/UVu5B6N0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZE4QKrzdKmJ7k1H3VBTWLKrhhjOlt3mHyoOnyAtt4NgrT1ooE3p83XULNgb1wNOikZX5KLrtf1RXAPALsdWwKuEMS5LCEUHwa5rCcDjZcXbwEH0kSEejjK7lMvkbVzVMYwhDWz9Gdfh/5uyGdfFrkkxxPKsXpNENekxO//M42sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id e519696a-20be-11ef-8d47-005056bd6ce9;
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
Subject: [PATCH v1 5/7] platform/x86: think-lmi: Use 2-argument strscpy()
Date: Sun,  2 Jun 2024 11:57:58 +0300
Message-ID: <20240602090244.1666360-6-andy.shevchenko@gmail.com>
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
 drivers/platform/x86/think-lmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 0f2264bb7577..4cfb53206cb8 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -1508,7 +1508,7 @@ static struct tlmi_pwd_setting *tlmi_create_auth(const char *pwd_type,
 	if (!new_pwd)
 		return NULL;
 
-	strscpy(new_pwd->kbdlang, "us", TLMI_LANG_MAXLEN);
+	strscpy(new_pwd->kbdlang, "us");
 	new_pwd->encoding = TLMI_ENCODING_ASCII;
 	new_pwd->pwd_type = pwd_type;
 	new_pwd->role = pwd_role;
@@ -1582,7 +1582,7 @@ static int tlmi_analyze(void)
 			goto fail_clear_attr;
 		}
 		setting->index = i;
-		strscpy(setting->display_name, item, TLMI_SETTINGS_MAXLEN);
+		strscpy(setting->display_name, item);
 		/* If BIOS selections supported, load those */
 		if (tlmi_priv.can_get_bios_selections) {
 			ret = tlmi_get_bios_selections(setting->display_name,
-- 
2.45.1


