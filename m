Return-Path: <linux-input+bounces-15594-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 534EEBECD36
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 12:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01C103B2376
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 10:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F832EBB8A;
	Sat, 18 Oct 2025 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="HLHvW1M2"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51F32874E3;
	Sat, 18 Oct 2025 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760782818; cv=none; b=iS1jyS057dfCrjKMehMUxJLAbIK5/r8Vjnu5Pe4phHp82otcfgM8Z8+XwtefXlab6jwR9OYhhYR4Ykf/TOULOe+A1i9mLdacloBXGDX+lZKHa+4PdPmaEYAa2lNxNxE4y/qpnvBMl60KwAoouBzy+sSauqKXnrgzK4aTaqXvqsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760782818; c=relaxed/simple;
	bh=QUOjiyrN5Jz4OHsKui+Yh/o1imWgGlSsxl79kT35OXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NfIX6WSGABgVvqR3P9tx3NowMV7hb/SvXlcOQwhHsaqoiml+TmhzcPfsFEieWbiC/3juDusEV+JgMT+Z1ejxkZKmQ343QY57WJR1QThSjtvMII5BWNNwv8o+mvNw+Tnxz7EaMbw+36xuF5g9PSWTEjREiqeNxX7o4X+BUKi7I9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=HLHvW1M2; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 4C6775E49E;
	Sat, 18 Oct 2025 13:20:10 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 10EE15E4C9;
	Sat, 18 Oct 2025 13:20:09 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 571291FEC82;
	Sat, 18 Oct 2025 13:20:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760782808;
	bh=I6P2Hzo8eJMR1NdjMvS2Ra8dEujH0rd/PamslOwA858=; h=From:To:Subject;
	b=HLHvW1M2U0hlDjDvenu8SaH+tU51pYHgNJdmMQ5mslAfpmoMbhzZefcsIwknuzX4B
	 X0j8zhnM8nXHbr7LcVB+zyw1Ghcgte20E82+1+8NbnJ5yWfzrC5YpI5V/bGiS5AQ8k
	 5VLKhwOe4x9n6q89oPJs/wvOY4DcKr6SG6mltXYgwq7OcXaNBIB3hd9ZQJ49B+k99j
	 79Dof/as3R5GLRb3OrioA3rGaGe0rfIbpy0ytc3eN0toHLz2noFk8lFczDoDbrinX0
	 GjwiX/kHKSmMDPn4dzTxoUeAnB7ADZzcvz3DPfU+tkq1v+BSuv42Dc5ZgsNQO0s5DY
	 /ZILBWNMqc+Qw==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 89.150.168.222) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
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
Subject: [PATCH v7 2/9] HID: asus: use same report_id in response
Date: Sat, 18 Oct 2025 12:17:52 +0200
Message-ID: <20251018101759.4089-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018101759.4089-1-lkml@antheas.dev>
References: <20251018101759.4089-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176078280817.1198223.8882297339370901917@linux3247.grserver.gr>
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
2.51.0



