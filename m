Return-Path: <linux-input+bounces-16242-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F3EC734E6
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 10:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A43B84EA314
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 09:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22018327BFE;
	Thu, 20 Nov 2025 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="eqm4tbMh"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBB5327BEA;
	Thu, 20 Nov 2025 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632009; cv=none; b=oZc13JdCTzXDZSJTGv2Iuq3f6aPtITQemaG1xOq077oEz4MtnhgRRwhOdnATzAEZTv0cfPO9tZEZfn0jpB6yBzui1dKqYpVz9Pf1WYzl9a79uZ0WG44ArpdxDaT+vmBbRsUNTzgy9Yvc90Y6c1eySj5Uwpb/EYiyyzYvW1F4o6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632009; c=relaxed/simple;
	bh=QQtD3Cv2cW5rLsv0KJHjqHmPm9educrewaVznpT2Hio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHNA59cyIi1VsHM2iJrB9UdU/3n+g3VEEnVuLAnbfQQ+HUDK1VEBOQ4yqwPHe4DBFlYY5txBaiycv0Ey86S241vpbRS28e8bVR4rBHo6DLCKjGiUf2dfof/kQrhKBBinynxL17uguSL9bD2YNvsHn0rAKdtEG2a6WOPN4WIWT5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=eqm4tbMh; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 9A469BCF43;
	Thu, 20 Nov 2025 11:46:39 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 209D1BDB97;
	Thu, 20 Nov 2025 11:46:39 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 5EA941FDAE9;
	Thu, 20 Nov 2025 11:46:37 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763631998;
	bh=BbEO7TIDqF6Jws19m/+tMemkBSpiN4a08/2K4HIthXg=; h=From:To:Subject;
	b=eqm4tbMh1Ae49N2CILHihMnQm6pGjHqZ8pUiKsOhXgnPN+hA8c7XZZYx1FS0Yi7Sk
	 jqzHnSIya1mQ7loEC2z8jmcVpVltdItz026+lF/+46q6vw0EjVqF2PqZL7jDbPUS8I
	 ja+Uz1X0f4jCWEwAo1n74HXq3rXATLP4IE8Oq/wcGn1uDgB4/p3JCz8+Y4yi+BY//q
	 drRjqb9m/3fYF9ZmtHjDONYpiInMoLqKPsxasXqKSYYpti48Q21H/rG8JtzaC4ijP3
	 LdWcWW1T0V5RQT8x/sv3uUvFu0e50OWKWpNViXC7LQdrHd+0Yi2Kpr4WEMxgd5aptX
	 HmsY2bP2FGEOQ==
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
Subject: [PATCH v9 11/11] HID: asus: add support for the asus-wmi brightness
 handler
Date: Thu, 20 Nov 2025 10:46:17 +0100
Message-ID: <20251120094617.11672-12-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120094617.11672-1-lkml@antheas.dev>
References: <20251120094617.11672-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176363199831.1475413.8614376731915365312@linux3247.grserver.gr>
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
index 6a355c174f29..ff5aaebc38e3 100644
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
2.52.0



