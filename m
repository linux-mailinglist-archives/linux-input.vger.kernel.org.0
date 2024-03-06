Return-Path: <linux-input+bounces-2270-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1660873DC8
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 18:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 414D61F238D0
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 17:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A11E13BAF9;
	Wed,  6 Mar 2024 17:51:10 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A569013BAE9
	for <linux-input@vger.kernel.org>; Wed,  6 Mar 2024 17:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747470; cv=none; b=I09RQY5Cyx3WJRNftgmK9+WTffzfj08bFhu5MBsph6llXjR700VjyBOwWvaMtXyjCDUghnvTryfP9jY5KPYMPqnrABPU5Vr/9UM6s0K8m3TYImOAV9K8Ny65bCp8d/MkIEZE/nG6RtJirbg8kL4CnaDbgvBkGC2aDEZlZ/GNG3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747470; c=relaxed/simple;
	bh=X4WgGpBn1NzPFix2PE5nZ871DVdaTNhuoct3kfjsvmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sBEumvwzFxGVnEAoFDmG6rNErg7Ii3cVomzHhNQty0raJ/zq60ewbMw6CA2c2aIFlqu3G53zyTFE5DdkWZNLv+hlmVpsN6UcfpH2nOweseYzDLx778SZP8QGzbXlRXuilRlWhtFoE9Daf2cFpddAUW1PmM/0qCHE1ILrL3YhIdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhvPz-0002VO-0r; Wed, 06 Mar 2024 18:51:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhvPy-004n6k-K4; Wed, 06 Mar 2024 18:51:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhvPy-000nyE-1k;
	Wed, 06 Mar 2024 18:51:02 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 3/3] HID: surface-hid: kbd: Convert to platform remove callback returning void
Date: Wed,  6 Mar 2024 18:50:50 +0100
Message-ID:  <05d0d6ef781ebd6124a36f70cda1f90331799dc7.1709747164.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=X4WgGpBn1NzPFix2PE5nZ871DVdaTNhuoct3kfjsvmY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6Kz7zH/6x8nO1lJWbTkq6Xc/bw3q+BioyB+oB KjNsFBXy8eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeis+wAKCRCPgPtYfRL+ TsO6B/9o4i7/IO8vYjQ46Da4IKi4jmRxIGA4TVq2BD2hVrG6tbab1SA0NYVDIaeqgMaDwGQN2am KqyMARdw+7JghgZlSAhGzCeCao4TYfZNMJHzJC3+O9zcOTL/iSN203ljlS0W83DRKlLPWy8369M bIBnNppQEGe5ZtxVdy2tonxFw9c5h3CKZWMe76YykInlWXZBgPj7nf6v7raaVvF1LFbEr9ofepZ fbFHhxuZ4xxFvtqlcs5/llUUtNO+eYTX/Vs2D2w0OBu9VrNQb5HOOrlp3Bvw+Ih/7Mm/QV0/ull s8cDc1na6ksRuqe2g9UcWPcO8ai8U0SOGhpZXf2PYCnoFLqR
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
 drivers/hid/surface-hid/surface_kbd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/surface-hid/surface_kbd.c b/drivers/hid/surface-hid/surface_kbd.c
index 4fbce201db6a..8c0cbb2deb11 100644
--- a/drivers/hid/surface-hid/surface_kbd.c
+++ b/drivers/hid/surface-hid/surface_kbd.c
@@ -271,10 +271,9 @@ static int surface_kbd_probe(struct platform_device *pdev)
 	return surface_hid_device_add(shid);
 }
 
-static int surface_kbd_remove(struct platform_device *pdev)
+static void surface_kbd_remove(struct platform_device *pdev)
 {
 	surface_hid_device_destroy(platform_get_drvdata(pdev));
-	return 0;
 }
 
 static const struct acpi_device_id surface_kbd_match[] = {
@@ -285,7 +284,7 @@ MODULE_DEVICE_TABLE(acpi, surface_kbd_match);
 
 static struct platform_driver surface_kbd_driver = {
 	.probe = surface_kbd_probe,
-	.remove = surface_kbd_remove,
+	.remove_new = surface_kbd_remove,
 	.driver = {
 		.name = "surface_keyboard",
 		.acpi_match_table = surface_kbd_match,
-- 
2.43.0


