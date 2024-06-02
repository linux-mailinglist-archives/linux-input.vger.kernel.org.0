Return-Path: <linux-input+bounces-4020-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 095618D7475
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 11:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D6D41F21BE3
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 09:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED3042052;
	Sun,  2 Jun 2024 09:03:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C64540858
	for <linux-input@vger.kernel.org>; Sun,  2 Jun 2024 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318985; cv=none; b=rmRl4bTCJuk70oNHN0HHoLISzaeRao+rjb1gC5H0j6OsPPoGtyZH+aaFBUnmUQehjwta3+CPLn62GdzA8QOfNtfe0sYQ5OaW+xgq5cwczK1OyiAxl1bqFL6HrK2QKmODPx5vhCjJqKALgbHRTwYilL68O/MKNX8vPI3mD3jx5M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318985; c=relaxed/simple;
	bh=kjAyPZMiSO/QOUSk3fdxY5FJ/AeIhJLqhUfXYyQ05PA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m924ZsnGnY58cz7o8pUrmQn+xtTUlaiLY6s1nkURy1dGoYtoqVvITGJNMyGLYpAqlDJFEmiMnSaR0t0FaVy7DNhJD3+9OEfpEXGKVt+IikQmXox8qKo/+09D/3Ry37oxIGizvFdxpPBR0rW9K6WNVgNQH5ZGzy/yk8uQL5jKnEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id e5f4102e-20be-11ef-8d47-005056bd6ce9;
	Sun, 02 Jun 2024 12:02:54 +0300 (EEST)
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
Subject: [PATCH v1 7/7] platform/x86: touchscreen_dmi: Use 2-argument strscpy()
Date: Sun,  2 Jun 2024 11:58:00 +0300
Message-ID: <20240602090244.1666360-8-andy.shevchenko@gmail.com>
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
 drivers/platform/x86/touchscreen_dmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 2d9ca2292ea1..879a63e4ecd0 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1907,7 +1907,7 @@ static int __init ts_parse_props(char *str)
 	u32 u32val;
 	int i, ret;
 
-	strscpy(orig_str, str, sizeof(orig_str));
+	strscpy(orig_str, str);
 
 	/*
 	 * str is part of the static_command_line from init/main.c and poking
-- 
2.45.1


