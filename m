Return-Path: <linux-input+bounces-15851-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3B2C27BDC
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 11:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1BF8189E860
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 10:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81A72D3728;
	Sat,  1 Nov 2025 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="B1JBuiv+"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D723E355;
	Sat,  1 Nov 2025 10:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761994042; cv=none; b=BjORtlYwDfWUL/IHSOzPDL7c+CiwKhXpY5luul8YxOQ/uwvryOiI6C8KAA2ttC9v+xjQqSNZuH+HFiQ40zQmVkiYJJKdWQhTIbhrWsswYl5xm1N0OQirPl09wUh7ycUBjdoe2qhhyoNDuOUbSNTFCSeYg6Uk1lEzLO2ViqmG86A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761994042; c=relaxed/simple;
	bh=qZNSB8N/A+v8k50MOtbjy9/8YdW8jGQAH6RO5wkg5Xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bA7wtGW5lxvhuWHXw4DhpkVfnXvc7rTZIEemsp1POv6vaTh//OZziLt2W46E5gk8KcV7s3hYJDp/QhyY4sJsraE7UAZpTII3mWNuzqwPQoiodK+X197rXyGJx+i0ZpLmaLSpLszHhAw9sqA5inzatRuW1OI1Z31Fa6ybGfTHy4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=B1JBuiv+; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 06C9C3F23B;
	Sat,  1 Nov 2025 12:47:18 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 446A13F2AF;
	Sat,  1 Nov 2025 12:47:17 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 3C5C31FDFA6;
	Sat,  1 Nov 2025 12:47:15 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761994036;
	bh=4XeEM2YT0PMFF4GTcrUqHusx4GHSY2qqSp0o9BBPPhI=; h=From:To:Subject;
	b=B1JBuiv+1peJX50fiaCNdhJOx+7FtIgce+c/biFBqkgNgGdttJwuXL39TeNxnXQ2v
	 bRK+oO1jgQRlqJHob/0WcFM1tf/XzehzGBwslJjTvw3FwClhpILmTPCwIOztJojgf3
	 NkAFsIrzQpQL2TFD0TgDrGJV9q0HAxazSOiPGVgX0e9GmOoNYR6OazEAtrDXj1FUcO
	 jGVbu0ibsnz1fuSCO2Rgp6AWmk1/j0cQLNGI0AuPolERQSONDNMa4A9LgSt9Hx9Hhr
	 0BZc66+Om+OOU0NQoQFMSIFbS92qQU+uNBlq+lA/8kSEJBK9uqMk1naNxGgwKZU50t
	 S7wmAInRDFang==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v8 02/10] HID: asus: use same report_id in response
Date: Sat,  1 Nov 2025 11:47:04 +0100
Message-ID: <20251101104712.8011-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101104712.8011-1-lkml@antheas.dev>
References: <20251101104712.8011-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176199403677.3745607.11326383290476525437@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Currently, asus_kbd_get_functions prods the device using feature
report report_id, but then is hardcoded to check the response through
FEATURE_KBD_REPORT_ID. This only works if report_id is that value
(currently true). So, use report_id in the response as well to
maintain functionality if that value changes in the future.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 7ea1037c3979..4676b7f20caf 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -422,7 +422,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
 	if (!readbuf)
 		return -ENOMEM;
 
-	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
+	ret = hid_hw_raw_request(hdev, report_id, readbuf,
 				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
 				 HID_REQ_GET_REPORT);
 	if (ret < 0) {
-- 
2.51.2



