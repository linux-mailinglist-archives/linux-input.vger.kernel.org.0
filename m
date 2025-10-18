Return-Path: <linux-input+bounces-15600-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C67BBECD60
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 12:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE1F04ECD3E
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 10:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349F72EE5FD;
	Sat, 18 Oct 2025 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="NnkaYQSV"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755112F12B5;
	Sat, 18 Oct 2025 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760782834; cv=none; b=MJpoC8m5QPGhilpbfy4YUAldMH1zAlYupBtNUoXySGMGTaEIoKqlG8Z0yQRydKxV+tUj6IWgHgBcJw5bmt7dKIrQVKqn7eMpk1QGtHgWWHtiOEirl0ueVNQWJSeJaT8qBi0hn8q/Z7pUZqf/YReD/jf/Iw42S0fhfyO75YnGaxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760782834; c=relaxed/simple;
	bh=vfkNCxmZ3FfbFVLnGdM0fIjyjQ/J2HoPeEIo/zeXWkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9Y8PY00xaGFVoJFiIAe3AC5HItkWJnawCyXBEAMdlVOAvbL/tm2d/VJHHR22scz69Lo+LavVSHIRxvLp8N7FmJVc4Tm3LX95pVkqVmnzpzJbdoGOMQRIsFqgA+kPci5NsLsjfD+BVvOVGBA6LVphGHqIcWarytEqAvweSnX+Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=NnkaYQSV; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 51488BDFB8;
	Sat, 18 Oct 2025 13:20:25 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id DB904BDDC7;
	Sat, 18 Oct 2025 13:20:24 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B59D91FC4B1;
	Sat, 18 Oct 2025 13:20:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760782824;
	bh=QiRO9WlHDWgo9VPXQOmXp8+aYWrSrjdksndf9lPZtzA=; h=From:To:Subject;
	b=NnkaYQSVPdE3vLg2B01zDdZky8SModwLJZyIgEw7sr30B8v7sgxlihFS3CnMnvf9Z
	 uvaSoxOVGrC4HXZnsdnbCqg2sVte5ANjm+vWZPmNEw+/dy2RaXGwLyhmfZ+Va9tBGu
	 Lv5vVv/mAJeE5CiiCJz25/Z1FE0l4YsVgct/xXc924SuDU/e2nLK5TNKdmsMRsNpAR
	 gS2/IxJsLmJxcLDN+LYLkOISXS4O6weWGdcY+euU7ebV7kbezfbg9BUB1/gtXDg57L
	 BCZ9NzU8IYgWl4W3rCe54hpF7OJohiwhLWPFTSHPdomEwlw31AetVVEoFOeDWyXASZ
	 OhyCaTvKeGtlQ==
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
Subject: [PATCH v7 9/9] HID: asus: add support for the asus-wmi brightness
 handler
Date: Sat, 18 Oct 2025 12:17:59 +0200
Message-ID: <20251018101759.4089-10-lkml@antheas.dev>
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
 <176078282453.1199146.7999947917705390951@linux3247.grserver.gr>
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
index 96cff7690987..c2c25825cb42 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -324,6 +324,17 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
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
2.51.0



