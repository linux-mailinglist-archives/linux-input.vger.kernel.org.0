Return-Path: <linux-input+bounces-16285-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03591C7CD28
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 12:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 738473A8D61
	for <lists+linux-input@lfdr.de>; Sat, 22 Nov 2025 11:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645B02FC005;
	Sat, 22 Nov 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="YTnEtYfL"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9963817A586;
	Sat, 22 Nov 2025 11:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763809277; cv=none; b=s2GjOJxDemun0ZYOMiiDA+2paAhkVWjuPy1i8oc/WjxLDlGfYWF7dimq83kADvFsNamTqQ1++xc3n3unDPrkqcGUdOKgHVC34EYAP4gvDXztGMQyBNrjEaXOajx4M5ll5GZMT5FSRPLxb2K18641XpruynQW7VsUPKLdjR+IxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763809277; c=relaxed/simple;
	bh=CvBO7NOSKduSWWdpani7908b+/4TUsTSHK6o09rentc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNl2dV2hY4vlzZZU57QTvhPiXfKemE+xGg+jPumk6fz+9JKLbcRTP/B7f1ZUTRiwRtB9VbZYfgW8nk0tZiJ7cbGZAJ1ZnKE+VZpstURFYqyMwXPqLLsdPmrXh0CcqO7290G7Wr6jKMoDLpf2KFOCAGKq/crpQzYyW++5oKaw6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=YTnEtYfL; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 143EC3F222;
	Sat, 22 Nov 2025 13:01:08 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id F0D213F211;
	Sat, 22 Nov 2025 13:01:03 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B6385200CCE;
	Sat, 22 Nov 2025 13:01:02 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763809263;
	bh=ZtU6OA251yONwBNhK8UyOyKhCaUX23+Far7T6xgeqso=; h=From:To:Subject;
	b=YTnEtYfLFm6DG5A+l281krEAlJXzwtyGdTYRxrX2Gx9430oNhiCnstlJlJIa35cXS
	 j14ZRmA6N6mDco4KXqh0yKmfXo4fH1XhHGQ5WB0HnoQEl/MYINH2PnK0mzKXTG7q5Z
	 P/ab8seIN89Zo7P0TmZd3eDLO9Pk6WEBXKOu+hCwz0aJsU+QNodUSb4Bz9fycUUDVR
	 AcfQY8vL7KiOssFa4b/OhIK65P6IJM208V2mh8v/OzcgP954o0IGdOOpSykqDRhBeS
	 GwmDdCBV4tq1SvTXJoJd+9BLDbH13/wHDShG5CYSxMdoV81itMIyPgzEoN4jowH1Fl
	 DTbhVmgfeuZOw==
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
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v10 03/11] HID: asus: use same report_id in response
Date: Sat, 22 Nov 2025 12:00:24 +0100
Message-ID: <20251122110032.4274-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122110032.4274-1-lkml@antheas.dev>
References: <20251122110032.4274-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176380926346.358827.8588110918774998314@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Currently, asus_kbd_get_functions prods the device using feature
report report_id, but then is hardcoded to check the response through
FEATURE_KBD_REPORT_ID. This only works if report_id is that value
(currently true). So, use report_id in the response as well to
maintain functionality if that value changes in the future.

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 9004814fb0d3..c1a36a8beb35 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -424,7 +424,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
 	if (!readbuf)
 		return -ENOMEM;
 
-	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
+	ret = hid_hw_raw_request(hdev, report_id, readbuf,
 				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
 				 HID_REQ_GET_REPORT);
 	if (ret < 0) {
-- 
2.52.0



