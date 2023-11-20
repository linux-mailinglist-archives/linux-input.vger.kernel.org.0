Return-Path: <linux-input+bounces-136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA027F1D5A
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 20:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCCE728175E
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 19:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AE736AF5;
	Mon, 20 Nov 2023 19:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ivy+jPoe"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00BDA0
	for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 11:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700508816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWC7UT1Zzcw/Y2k1xOhXr9syyucSNGdXDxAuei1Stls=;
	b=Ivy+jPoe78dY/mpSiM0zqkIFh5+8xJprtmNtLD3JVXuSe9kiulK+h+TPogIzQ47AOHsTM2
	HDuMpJSpa+aefFe7C8dtzXyh2uGbHYf02VTEtYbtW96uZOezPhHeLaEJHsa55FCyWzdxVN
	wSoWLb+fmF+vRl7egvrlJS1nvFFLNhY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-Z_u3IeoCPVSa3JBplv7_CA-1; Mon, 20 Nov 2023 14:33:33 -0500
X-MC-Unique: Z_u3IeoCPVSa3JBplv7_CA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42A9985A58C;
	Mon, 20 Nov 2023 19:33:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E80E2166B26;
	Mon, 20 Nov 2023 19:33:30 +0000 (UTC)
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
Subject: [RFC v2 4/7] HID: i2c-hid: Move i2c_hid_finish_hwreset() to after reading the report-descriptor
Date: Mon, 20 Nov 2023 20:33:10 +0100
Message-ID: <20231120193313.666912-5-hdegoede@redhat.com>
In-Reply-To: <20231120193313.666912-1-hdegoede@redhat.com>
References: <20231120193313.666912-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

A recent bug made me look at Microsoft's i2c-hid docs again
and I noticed the following:

"""
4. Issue a RESET (Host Initiated Reset) to the Device.
5. Retrieve report descriptor from the device.

Note: Steps 4 and 5 may be done in parallel to optimize for time on I²C.
Since report descriptors are (a) static and (b) quite long, Windows 8 may
issue a request for 5 while it is waiting for a response from the device
on 4.
"""

Which made me think that maybe on some touchpads the reset ack is delayed
till after the report descriptor is read ?

Testing a T-BAO Tbook Air 12.5 with a 0911:5288 (SIPODEV SP1064?) touchpad,
for which the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk was first introduced,
shows that reading the report descriptor before waiting for the reset
helps with the missing reset IRQ. Now the reset does get acked properly,
but the ack sometimes still does not happen unfortunately.

Still moving the wait for ack to after reading the report-descriptor,
is probably a good idea, both to make i2c-hid's behavior closer to
Windows as well as to speed up probing i2c-hid devices.

While at it drop the dbg_hid() for a malloc failure, malloc failures
already get logged extensively by malloc itself.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2247751
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Adjust commit message to note that moving the wait-for-reset
  to after reading thr report-descriptor only partially fixes
  the missing reset IRQ problem
- Adjust for the reset_lock now being taken in the callers of
  i2c_hid_start_hwreset() / i2c_hid_finish_hwreset()
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 5e535480fed7..48582c75a51b 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -741,12 +741,9 @@ static int i2c_hid_parse(struct hid_device *hid)
 		return -EINVAL;
 	}
 
+	mutex_lock(&ihid->reset_lock);
 	do {
-		mutex_lock(&ihid->reset_lock);
 		ret = i2c_hid_start_hwreset(ihid);
-		if (ret == 0)
-			ret = i2c_hid_finish_hwreset(ihid);
-		mutex_unlock(&ihid->reset_lock);
 		if (ret)
 			msleep(1000);
 	} while (tries-- > 0 && ret);
@@ -764,8 +761,8 @@ static int i2c_hid_parse(struct hid_device *hid)
 		rdesc = kzalloc(rsize, GFP_KERNEL);
 
 		if (!rdesc) {
-			dbg_hid("couldn't allocate rdesc memory\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto abort_reset;
 		}
 
 		i2c_hid_dbg(ihid, "asking HID report descriptor\n");
@@ -775,10 +772,23 @@ static int i2c_hid_parse(struct hid_device *hid)
 					    rdesc, rsize);
 		if (ret) {
 			hid_err(hid, "reading report descriptor failed\n");
-			goto out;
+			goto abort_reset;
 		}
 	}
 
+	/*
+	 * Windows directly reads the report-descriptor after sending reset
+	 * and then waits for resets completion afterwards. Some touchpads
+	 * actually wait for the report-descriptor to be read before signalling
+	 * reset completion.
+	 */
+	ret = i2c_hid_finish_hwreset(ihid);
+abort_reset:
+	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+	mutex_unlock(&ihid->reset_lock);
+	if (ret)
+		goto out;
+
 	i2c_hid_dbg(ihid, "Report Descriptor: %*ph\n", rsize, rdesc);
 
 	ret = hid_parse_report(hid, rdesc, rsize);
-- 
2.41.0


