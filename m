Return-Path: <linux-input+bounces-10990-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25984A698F6
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 20:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0EC748075B
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 19:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9704A21C9E4;
	Wed, 19 Mar 2025 19:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="xCK9QSCa"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16267213245;
	Wed, 19 Mar 2025 19:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411625; cv=none; b=o/WHB4FeyOvxT0aTnaX4GTmJ7hbIPrj+1iRV7NlduyBfJU7s6+VShChFsLEF+nAHj4qpogDjj3bfUaqB2N9bcdIwTNAEtMMU+wkmpxwXDLhiek/IB2DbJQ7j1qRcvfFb+Vqt3GddGXyAk2xNbKLPAJBQA63uI55nxw6tUe7M3Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411625; c=relaxed/simple;
	bh=nKFqyLzOdYQnNuMPN3sgxEFLTbsdKrn6taQM0OsAxpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hX1JpYcUIil6KiIU0OXuG7bYiRZhu5OfUDooyQ7L+UdkAD2lWAwMZr/aD85Co993QGi2VqZZfbJvznsvaRLj71+lLUyRV9r0mW/zg5o8mlTbvBWea+07v9kRsUXfOQGEzGn+KEC5nL6l8fUqd1Pxj9NrX+xi/GCY3B3AJRlIUsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=xCK9QSCa; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id DA1BC2E095FC;
	Wed, 19 Mar 2025 21:13:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742411622;
	bh=PwqR14CHjxSDk9sBzaWs7Lu53Z3+jZPrApkkTu2mA+o=; h=From:To:Subject;
	b=xCK9QSCakX6od9Qqjg3G+S5vl+dFjcAQ26mEawUql83320u7y4JTay0LiuiKNckHL
	 WfF0SlFZYKH4hG8EEoakj7Nzga/QJy8ropoIQrwz1yaOx9m/u6cLsm2wvlJkpSt7ue
	 OEjFW5EwUa8AXjbwTrpMjRRd9uYxRVzJh7E6rRe0=
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
Subject: [PATCH 11/11] HID: asus: add support for the asus-wmi brightness
 handler
Date: Wed, 19 Mar 2025 20:13:19 +0100
Message-ID: <20250319191320.10092-12-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319191320.10092-1-lkml@antheas.dev>
References: <20250319191320.10092-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174241162198.8599.7017674513815027462@linux1587.grserver.gr>
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
index 5aae4466c0d63..b1ae0716005d2 100644
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


