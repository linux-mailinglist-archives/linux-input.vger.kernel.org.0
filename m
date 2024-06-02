Return-Path: <linux-input+bounces-4019-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8628D7470
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 11:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D3F31C20CE7
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 09:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C7B29422;
	Sun,  2 Jun 2024 09:03:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD3E3AC1F
	for <linux-input@vger.kernel.org>; Sun,  2 Jun 2024 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318982; cv=none; b=NsWaH4U5DipCdXVWJ73sEHUmMYxT80FRU7+WAmUJHx3EJycWkrogEfbCh+GWbIpNIRd4QqXgQwj7WGOnpXTD6Is+UskiuA+jVA8MdL0E/E4FU6JUyQq7Gus2YjGE1ucZHqFbpoDwWY3l8CuGxxg8qf4Rms1qGE09ryFkznhPuZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318982; c=relaxed/simple;
	bh=Zev7O1OaJPuWxSkFHl6udbLp67nkr4VjyCzglGcW7E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aO99URxwA2v6Ie1jte0XtxVOUzNsfdRpjZylFkM1NvZDrcVB24Hn4Xunu3qdN52AEhLjH8lpgCAptATamijFQvMwN6BDHzqNGzWPMZKgLHpgmqa04ZPxDrfMGpyIv1DILAOm14WRjUZML/7U5bP4vqsDIKebMDZp23qGCVuvY00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id e4aa8b06-20be-11ef-ab01-005056bdd08f;
	Sun, 02 Jun 2024 12:02:52 +0300 (EEST)
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
Subject: [PATCH v1 4/7] platform/x86: serial-multi-instantiate: Use 2-argument strscpy()
Date: Sun,  2 Jun 2024 11:57:57 +0300
Message-ID: <20240602090244.1666360-5-andy.shevchenko@gmail.com>
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
 drivers/platform/x86/serial-multi-instantiate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 97b9c6392230..3be016cfe601 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -131,7 +131,7 @@ static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
 
 		ctlr = spi_dev->controller;
 
-		strscpy(spi_dev->modalias, inst_array[i].type, sizeof(spi_dev->modalias));
+		strscpy(spi_dev->modalias, inst_array[i].type);
 
 		ret = smi_get_irq(pdev, adev, &inst_array[i]);
 		if (ret < 0) {
@@ -205,7 +205,7 @@ static int smi_i2c_probe(struct platform_device *pdev, struct smi *smi,
 
 	for (i = 0; i < count && inst_array[i].type; i++) {
 		memset(&board_info, 0, sizeof(board_info));
-		strscpy(board_info.type, inst_array[i].type, I2C_NAME_SIZE);
+		strscpy(board_info.type, inst_array[i].type);
 		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst_array[i].type, i);
 		board_info.dev_name = name;
 
-- 
2.45.1


