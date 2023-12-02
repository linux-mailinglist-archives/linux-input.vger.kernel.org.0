Return-Path: <linux-input+bounces-402-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA15801F39
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 23:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6239B1F20FCB
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 22:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB31C22313;
	Sat,  2 Dec 2023 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hQ+SwjKe"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114A2124
	for <linux-input@vger.kernel.org>; Sat,  2 Dec 2023 14:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701557187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d4iKWnrKwfTF2RpBAkXfocj1j1lGHYJY1XvhyGxbhFI=;
	b=hQ+SwjKeWJystbmf/jc+3/S+PBslHboNaOVspv6Zo5AY9Mf2WCj4gBzAfl6/Njip1Xe9qf
	04kcRN7XY+kDZ8aAkHLi2X18xCxsFx0sDIw+Za7/hirMjt+OlUJDaloYY2sX0WFZCNZaMu
	2wl2yMQbvcyNacyX51tKN59ev3A8Q3c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-RGopAkf8PO-cNUIAmOngeg-1; Sat, 02 Dec 2023 17:46:24 -0500
X-MC-Unique: RGopAkf8PO-cNUIAmOngeg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63A7185A58A;
	Sat,  2 Dec 2023 22:46:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCD4B2166B26;
	Sat,  2 Dec 2023 22:46:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Julian Sax <jsbc@gmx.de>,
	ahormann@gmx.net,
	Bruno Jesus <bruno.fl.jesus@gmail.com>,
	Dietrich <enaut.w@googlemail.com>,
	kloxdami@yahoo.com,
	Tim Aldridge <taldridge@mac.com>,
	Rene Wagner <redhatbugzilla@callerid.de>,
	Federico Ricchiuto <fed.ricchiuto@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v3 3/7] HID: i2c-hid: Switch i2c_hid_parse() to goto style error handling
Date: Sat,  2 Dec 2023 23:46:10 +0100
Message-ID: <20231202224615.24818-4-hdegoede@redhat.com>
In-Reply-To: <20231202224615.24818-1-hdegoede@redhat.com>
References: <20231202224615.24818-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Switch i2c_hid_parse() to goto style error handling.

This is a preparation patch for removing the need for
I2C_HID_QUIRK_NO_IRQ_AFTER_RESET by making i2c-hid behave
more like Windows.

Note this changes the descriptor read error path to propagate
the actual i2c_hid_read_register() error code (which is always
negative) instead of hardcoding a -EIO return.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 21d65ca32866..71d742aeaf35 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -773,23 +773,21 @@ static int i2c_hid_parse(struct hid_device *hid)
 					    rdesc, rsize);
 		if (ret) {
 			hid_err(hid, "reading report descriptor failed\n");
-			kfree(rdesc);
-			return -EIO;
+			goto out;
 		}
 	}
 
 	i2c_hid_dbg(ihid, "Report Descriptor: %*ph\n", rsize, rdesc);
 
 	ret = hid_parse_report(hid, rdesc, rsize);
+	if (ret)
+		dbg_hid("parsing report descriptor failed\n");
+
+out:
 	if (!use_override)
 		kfree(rdesc);
 
-	if (ret) {
-		dbg_hid("parsing report descriptor failed\n");
-		return ret;
-	}
-
-	return 0;
+	return ret;
 }
 
 static int i2c_hid_start(struct hid_device *hid)
-- 
2.41.0


