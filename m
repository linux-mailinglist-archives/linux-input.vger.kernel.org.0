Return-Path: <linux-input+bounces-15858-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8194C27C30
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 11:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19CC3405E2C
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 10:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CFC2DA75C;
	Sat,  1 Nov 2025 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="aN2bHYtX"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E226189F3B;
	Sat,  1 Nov 2025 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761994048; cv=none; b=Sjgaa+0iOhBXlnENRTgbajH+q4r0gpP2LxAxjFgH157gya3tvNPfSR5Dt3rFTP3A8KJdcgw4nEkl3ajv/8bg/i86xduf1znmywCycYo4XQ09c/Z5SYLNIbanaQNaxiQGCirGo01zwt1ArU3xy965pwdgHG8GA7LX0OFhMYX1I8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761994048; c=relaxed/simple;
	bh=Gwa/WQk/xj079I4Ej8YkVWk2rs3/+gWOrbRhP7ZHHHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5lmc1TUaRvO+9wx4pihwoeM0koFbHdu/hcOoJ7nHFru3RNxWUw7g0IMqL9LSIn5O3XLWWD8wWYXtYocKYqqWjgi/UZGJH3ZSZNX2TG3e3sDlVqbgKHrZwgNr+5dkETuLUXxZqxBuSu88x4ckffeiSw8Si4o4al+nMe4G8j5Kkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=aN2bHYtX; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id CF52CC1B97;
	Sat,  1 Nov 2025 12:47:24 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 66D4DC1BCF;
	Sat,  1 Nov 2025 12:47:24 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 48FFD1FF536;
	Sat,  1 Nov 2025 12:47:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761994044;
	bh=sKyp44I3nTVlmUCkPmKCLcA1wkuc+IxWTQk6uSnUt2k=; h=From:To:Subject;
	b=aN2bHYtXWFGM+MF+yJfFutxiyjbusgcpeHDBYxSJPE+IKPmXqrqN7IcS8bdgDoo1E
	 J2PvTxAfvinG28M2D9bz+LGW+59ldy3eWWglsC2lfyt3jH923n9FDh++liQT5+YDaM
	 XZBlyYOFUndf/tK49NTWgy4btoMEie9ShdOHOAEfFTLzrTr5i2lxLPtAUk4LmW9Z6w
	 YFpiJr+CgIX9xOJObIg1DrwzdZiXc1iwJ6TYt3+cilm2uQSLByArSveM1G+IPw9m8/
	 4q3QDWNNixAzCvbJ7f7zxhq8Xjm0klhsdmuStx3czAuGp5bypry+AuWfgL/tIGQUo1
	 0Nd9cwD9GkamQ==
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
Subject: [PATCH v8 10/10] HID: asus: add support for the asus-wmi brightness
 handler
Date: Sat,  1 Nov 2025 11:47:12 +0100
Message-ID: <20251101104712.8011-11-lkml@antheas.dev>
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
 <176199404390.3745949.13918222675205834482@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

If the asus-wmi brightness handler is available, send the
keyboard brightness events to it instead of passing them
to userspace. If it is not, fall back to sending them to it.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Tested-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index e5d3f28c1fad..de64451e315d 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -325,6 +325,17 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
 			 usage->hid & HID_USAGE);
 	}
 
+	if (usage->type == EV_KEY && value) {
+		switch (usage->code) {
+		case KEY_KBDILLUMUP:
+			return !asus_hid_event(ASUS_EV_BRTUP);
+		case KEY_KBDILLUMDOWN:
+			return !asus_hid_event(ASUS_EV_BRTDOWN);
+		case KEY_KBDILLUMTOGGLE:
+			return !asus_hid_event(ASUS_EV_BRTTOGGLE);
+		}
+	}
+
 	return 0;
 }
 
-- 
2.51.2



