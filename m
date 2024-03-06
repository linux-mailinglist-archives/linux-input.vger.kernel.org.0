Return-Path: <linux-input+bounces-2269-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69664873DC7
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 18:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2539E2824B6
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 17:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1680605DC;
	Wed,  6 Mar 2024 17:51:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20075D48F
	for <linux-input@vger.kernel.org>; Wed,  6 Mar 2024 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747466; cv=none; b=aEecIT0yIy6I9gsVq0E4dadQ1hGvTgvZ5VnASyYdQp/c9JyBY/nTXpOB7WHvGma/CkMOcrdZFU6Lg4VG4e4x2p+l+R/itXcHzBc8/mGYSvsQm3Vlygr2NOmg/m6cE9oow/qecSz4ukHOLj0GMfGEGwrt5xSS9PSlDdHuvQVcORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747466; c=relaxed/simple;
	bh=X8BkERi10tX+G/I0WlhN0twyIhqVhoouN1iH+TY17Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HlgTKNbBLGYF2voddD3SrpKe5kDV6oUZqWT+H8bbws7czo9SZSmZ+5zcDyNYc/ljqj8YH4GxAHlkMjy3nUGPGpvkrjJOCQ56BOHkanWxuz67q9QQedVP6gSdNideWUXL7bpiw61BJsr5HaACjsgkggoU0W7QryUCRyoTCU+qe/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhvPt-0002LP-Ue; Wed, 06 Mar 2024 18:50:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhvPt-004n6c-Hi; Wed, 06 Mar 2024 18:50:57 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhvPt-000nxz-1V;
	Wed, 06 Mar 2024 18:50:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 1/3] HID: google: hammer: Convert to platform remove callback returning void
Date: Wed,  6 Mar 2024 18:50:48 +0100
Message-ID:  <33de82975dd3dc0c867f740ca1121d95a9eb17b2.1709747164.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1709747164.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709747164.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1870; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=X8BkERi10tX+G/I0WlhN0twyIhqVhoouN1iH+TY17Kw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6Kz4GE1x15w87fkycpFClSzWjVQZl1OPGH654 LUOIej3nSWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeis+AAKCRCPgPtYfRL+ Tkk3B/9IKjCg2FCxumlciNLQScphS206ZSTixKMkuXZlREuaIYI//sRDykdrPomuKFJwwJwMRz9 Df9AmLXXgvNlOlEEJhELVClUxMzd12knzfmk9tmASuM1FdqFItraSbvue6GF72mmrxL8/qqDE5B n3x3ACqldQhHePuCtSsHCFebhbrYVoYZIHieBu4Ll5JZ6MgiTUF1vt99//LN8yGBOm+KyaTV0Nm 4MSt4lazFm78NbTCR9BNRw/xA8rScPrGHwPuQFfoNctPY68ZRMxbkubrobAdDvxo8yvle8vvEBT GMbk+mYeXYx5CXNgoc6Lv9yrP6QZ92l3XmXydRGvmsDbxDbP
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hid/hid-google-hammer.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index c6bdb9c4ef3e..25331695ae32 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -255,7 +255,7 @@ static int cbas_ec_probe(struct platform_device *pdev)
 	return retval;
 }
 
-static int cbas_ec_remove(struct platform_device *pdev)
+static void cbas_ec_remove(struct platform_device *pdev)
 {
 	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
 
@@ -266,7 +266,6 @@ static int cbas_ec_remove(struct platform_device *pdev)
 	cbas_ec_set_input(NULL);
 
 	mutex_unlock(&cbas_ec_reglock);
-	return 0;
 }
 
 static const struct acpi_device_id cbas_ec_acpi_ids[] = {
@@ -285,7 +284,7 @@ MODULE_DEVICE_TABLE(of, cbas_ec_of_match);
 
 static struct platform_driver cbas_ec_driver = {
 	.probe = cbas_ec_probe,
-	.remove = cbas_ec_remove,
+	.remove_new = cbas_ec_remove,
 	.driver = {
 		.name = "cbas_ec",
 		.acpi_match_table = ACPI_PTR(cbas_ec_acpi_ids),
-- 
2.43.0


