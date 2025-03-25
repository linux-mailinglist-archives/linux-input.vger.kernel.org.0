Return-Path: <linux-input+bounces-11269-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 350CBA709A7
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 729C8189F40C
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F5B1F5434;
	Tue, 25 Mar 2025 18:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="olRXy8MT"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29AE1F4CA3;
	Tue, 25 Mar 2025 18:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928385; cv=none; b=jLiX+CKKrXDp9qR7Y1DYstXEtaap44zsVjhngdQZma9G+KOcFHU08iaM5IGXQWHXENHhyHBZtGLxXncDLfqV42QlGR7wUmx/kmr47VZunAWHS7LNhr7f8g/FbaRnBs/LJyALaM5vcJbNVBSQlkVid8Z33b7zmG3P8FBrlW2ck14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928385; c=relaxed/simple;
	bh=W9pJLnhFIf35zkQo9rH4p0zSE24DwlGqtwqFEiB/7SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DvR5HwwE46SS8pmsv6WvZlR08VsVhTYZoNBNOYw8GnYwEOhqhu3mUNwtAci26aSWAh9KKor6o174wMCrOEFIDUo0XhGPbDzlWhaG9AcHs/9kr+Hsk2C0MuWdP16ca9VuMmUoUdjDyLgkikDrffW3sjtaph/wAXs2DHIqhYvRP3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=olRXy8MT; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 2DD4D2E098C2;
	Tue, 25 Mar 2025 20:46:20 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742928381;
	bh=y58s2NqoOSS0+r/7Q1xuFckUs2twj7CZeSEpPojWvFk=; h=From:To:Subject;
	b=olRXy8MTAiED9m6+i/K/xwL+2g2bLuXoMD0D2NBHJVToQlL28Pf1Tdu4aIfG8+6wj
	 o9lh6ZEguB10FricSuXzjyu2Uwfpk/LkLqsnSlQgsPDb7rLPzH1QXMuneOm/pPw7yJ
	 hAq5CSM+6Irr1OpaWhSIb/pegRKJR81C+NcER7A0=
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
Subject: [PATCH v5 08/11] HID: asus: add support for the asus-wmi brightness
 handler
Date: Tue, 25 Mar 2025 19:45:57 +0100
Message-ID: <20250325184601.10990-9-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325184601.10990-1-lkml@antheas.dev>
References: <20250325184601.10990-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174292838126.8204.16548926258215420829@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
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
index 9497e11577f93..a4d1160460935 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -319,6 +319,17 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
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
2.49.0


