Return-Path: <linux-input+bounces-11041-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B913A6B06E
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 23:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EA4F7AB842
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 22:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBA222D798;
	Thu, 20 Mar 2025 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="E4AYLUwl"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4524222D4DF;
	Thu, 20 Mar 2025 22:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742508589; cv=none; b=HysA4HeQ3RR43rLdYWZS4pPYeZVTWM1J2ZOFaBmfH8jcINXYZ8NnUeFKmH2oCT+tvc5nBlKnOG17gQRgh8A/h97ArYEOi/Qe1nq2zMTUFGYXWr1qqlbm9OaloM9ovEAmv5dFqI9SKZniYyGlI25NaGU+iHjqTwGRYQ22b6cxHPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742508589; c=relaxed/simple;
	bh=djnNW+Ux+4NW/+ysbpOiNUBA4269CCy/FguqiJntv7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbsUfKLwPuqORgLabKJp/tuR1vFcBI12gzzgWw+TrThyHHlQxZqnPLu85iQhJ23PkjyV1jFRqWEAVa3UgtKbUNP/W0cGe+lFBPO+xXMjmKMBsCxT67DyXU6pxb2YbV0b0fdROI1W7VfoMFroFqLYRBP2RQi0B21oFNgsKjQyrAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=E4AYLUwl; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 0C99F2E09503;
	Fri, 21 Mar 2025 00:09:44 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742508586;
	bh=koGWxYIwwRGUYLblcMn8tZFsk6VzzutYHcqDrvTGrdo=; h=From:To:Subject;
	b=E4AYLUwlT3Aq1JxbCIbdoCfYJhTHm1mmFpnUr5k9F/0d/gasWKdukiYAh5qarClXX
	 KqekFz6bXjw1SeLiL4JihSq70BSraHSCLcBXxOcYHluf0PiV/pqjwYWIVnTBFh/6WZ
	 cioH7zBqo2uUCB+V6anC/678MpN79nzHsHuUfZFc=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
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
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 09/11] HID: asus: add support for the asus-wmi brightness
 handler
Date: Thu, 20 Mar 2025 23:09:22 +0100
Message-ID: <20250320220924.5023-10-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320220924.5023-1-lkml@antheas.dev>
References: <20250320220924.5023-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174250858609.27031.15521540276373195671@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

If the asus-wmi brightness handler is available, send the
keyboard brightness events to it instead of passing them
to userspace. If it is not, fall back to sending them to it.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index b39d61b31ff23..546603f5193c7 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -319,6 +319,17 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
 			 usage->hid & HID_USAGE);
 	}
 
+	if (usage->type == EV_KEY && value) {
+		switch (usage->code) {
+		case KEY_KBDILLUMUP:
+			return !asus_brt_event(ASUS_BRT_UP);
+		case KEY_KBDILLUMDOWN:
+			return !asus_brt_event(ASUS_BRT_DOWN);
+		case KEY_KBDILLUMTOGGLE:
+			return !asus_brt_event(ASUS_BRT_TOGGLE);
+		}
+	}
+
 	return 0;
 }
 
-- 
2.48.1


