Return-Path: <linux-input+bounces-4014-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D99D8D7461
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 11:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEDC8281D02
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 09:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE3637160;
	Sun,  2 Jun 2024 09:02:55 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B8625776
	for <linux-input@vger.kernel.org>; Sun,  2 Jun 2024 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318975; cv=none; b=mIZ9UK+TEXLUUyJgSMLAB6mwesh178iM0Bza6PnNDHphG5+J2oDQpPIt5ycYUVUpaW4X6CtZrEyqlCpP4j9vC0zLbDBBbVi2AIjRBAjxzBQxvXhr+/u0K2EuLrFMDsy4ImtmCy0lXnl5xistgFfK/NWXtBhTxYpZiMT/39axGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318975; c=relaxed/simple;
	bh=bQeuWPwSxT8QFhzr6uwQL9dUBoJgcUfr5QAmP07v+1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKP10oDuG/gyS+XoHcaftqG2xmjKYk2Rfw4uMQz9UpdQ8a5kKlZRicXEzNSOdt49gCLkM8yojuK0xOep5UzObEd1EFBGh9dBCX9n8EwHDZpp/Q0vkvdSOzp5RCX4UIEgPRxjsyq9uoKK8ufN0sPZMTeO+NkvESGTFocr1KVMaDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id e40e5ddf-20be-11ef-8d47-005056bd6ce9;
	Sun, 02 Jun 2024 12:02:51 +0300 (EEST)
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
Subject: [PATCH v1 3/7] platform/x86: intel: chtwc_int33fe: Use 2-argument strscpy()
Date: Sun,  2 Jun 2024 11:57:56 +0300
Message-ID: <20240602090244.1666360-4-andy.shevchenko@gmail.com>
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
 drivers/platform/x86/intel/chtwc_int33fe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/chtwc_int33fe.c b/drivers/platform/x86/intel/chtwc_int33fe.c
index 93f75ba1dafd..11503b1c85f3 100644
--- a/drivers/platform/x86/intel/chtwc_int33fe.c
+++ b/drivers/platform/x86/intel/chtwc_int33fe.c
@@ -270,7 +270,7 @@ cht_int33fe_register_max17047(struct device *dev, struct cht_int33fe_data *data)
 	}
 
 	memset(&board_info, 0, sizeof(board_info));
-	strscpy(board_info.type, "max17047", I2C_NAME_SIZE);
+	strscpy(board_info.type, "max17047");
 	board_info.dev_name = "max17047";
 	board_info.fwnode = fwnode;
 	data->battery_fg = i2c_acpi_new_device(dev, 1, &board_info);
@@ -361,7 +361,7 @@ static int cht_int33fe_typec_probe(struct platform_device *pdev)
 	}
 
 	memset(&board_info, 0, sizeof(board_info));
-	strscpy(board_info.type, "typec_fusb302", I2C_NAME_SIZE);
+	strscpy(board_info.type, "typec_fusb302");
 	board_info.dev_name = "fusb302";
 	board_info.fwnode = fwnode;
 	board_info.irq = fusb302_irq;
@@ -381,7 +381,7 @@ static int cht_int33fe_typec_probe(struct platform_device *pdev)
 	memset(&board_info, 0, sizeof(board_info));
 	board_info.dev_name = "pi3usb30532";
 	board_info.fwnode = fwnode;
-	strscpy(board_info.type, "pi3usb30532", I2C_NAME_SIZE);
+	strscpy(board_info.type, "pi3usb30532");
 
 	data->pi3usb30532 = i2c_acpi_new_device(dev, 3, &board_info);
 	if (IS_ERR(data->pi3usb30532)) {
-- 
2.45.1


