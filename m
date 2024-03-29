Return-Path: <linux-input+bounces-2716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB2A892673
	for <lists+linux-input@lfdr.de>; Fri, 29 Mar 2024 22:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8182B1C21128
	for <lists+linux-input@lfdr.de>; Fri, 29 Mar 2024 21:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FEB13D8A3;
	Fri, 29 Mar 2024 21:54:55 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF14B13D8B2
	for <linux-input@vger.kernel.org>; Fri, 29 Mar 2024 21:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711749295; cv=none; b=or3Bf2zXdmtWJpMaOWWHEC7ZBCyZDNxlkX1TNhOmprpNCAJOXkLPSUepYTHzkVELMQzKqafvffsMolHNerCabuQhVtTuX8QJQOCmB/qIQzUfNhxf0VARfs+OXPV7D/NB3S5/YOHrLbun321xjFaLF7n0kwKXV3CvLR/iTP3BHaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711749295; c=relaxed/simple;
	bh=fsNI/OV1LM8iOGY/PbLxqU21/kKZr5ylTT3YGUIJAco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mBpmjRMQtNY8RvhMdAHFn/phxBTP2LSaidqjJkB9pi/CLwuZZYfISaP0S+333LPGihZfdnfYhuQFFzswtT1YrJU9btY/OZwGNvTk295pcEFVUtRCbApdX5qB7Pv5agcQprPr6GrhaEzPP/oARw5vK28mwFejE+Lc6ef3VKz6sEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-0004g3-53; Fri, 29 Mar 2024 22:54:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBW-009GM6-OR; Fri, 29 Mar 2024 22:54:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBW-00DTjq-29;
	Fri, 29 Mar 2024 22:54:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] Input: amimouse - Mark driver struct with __refdata to prevent section mismatch
Date: Fri, 29 Mar 2024 22:54:38 +0100
Message-ID:  <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=fsNI/OV1LM8iOGY/PbLxqU21/kKZr5ylTT3YGUIJAco=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmBzihOqHnZn81eACssZZdzgQdg7xrkwC6VEow9 yxUlw4mZI6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZgc4oQAKCRCPgPtYfRL+ ToYyCACwmdnXbt6TrwmoOh+B2nkWfyrrzWVfyUxW3zkvsPXP8T/AKsgEukGImJsRtI3uePRqUIj kPMUPsetw6q0F+Itl4zVSd80uIeY2m+yz5NboM1osJvtEIZYI/qazyEHDOWHqycLqolYIsafWhn gioANmPSm/qHfCxgVY62i33d1Ei/zWxZQSFlSxDVbkUcoRu315V7ItnGnSPy5FmeweFDJOxagsG tQoZETX5hK1ljQ1M5JZB7wwPhZydVrryB7AbgODOvclX1ntiVOP2Bk/7oB+I5mNc4cEyyZrk2JV /DIGF7gDnr945Lo0dlRBt5/icvM7nTcoQGPXsXJ4TMdh5szp
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via module_platform_driver_probe(). Make this
explicit to prevent the following section mismatch warning

	WARNING: modpost: drivers/input/mouse/amimouse: section mismatch in reference: amimouse_driver+0x8 (section: .data) -> amimouse_remove (section: .exit.text)

that triggers on an allmodconfig W=1 build.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/mouse/amimouse.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/amimouse.c b/drivers/input/mouse/amimouse.c
index cda0c3ff5a28..2fbbaeb76d70 100644
--- a/drivers/input/mouse/amimouse.c
+++ b/drivers/input/mouse/amimouse.c
@@ -132,7 +132,13 @@ static void __exit amimouse_remove(struct platform_device *pdev)
 	input_unregister_device(dev);
 }
 
-static struct platform_driver amimouse_driver = {
+/*
+ * amimouse_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver amimouse_driver __refdata = {
 	.remove_new = __exit_p(amimouse_remove),
 	.driver   = {
 		.name	= "amiga-mouse",

base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
-- 
2.43.0


