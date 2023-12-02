Return-Path: <linux-input+bounces-403-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 330DA801F3B
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 23:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98364B20B03
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 22:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B9522319;
	Sat,  2 Dec 2023 22:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nl/O//vJ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C5DA4
	for <linux-input@vger.kernel.org>; Sat,  2 Dec 2023 14:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701557189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YjAz/l3mkMDuMuxQCNSACL++RvtBxgwXQ8EqiOs1loU=;
	b=Nl/O//vJYy9j/KFEfw+0ua0/9eupfSwLdG8PqZgWEhC2MJotDwglvE/lB7/1MGFgIDeqK1
	+iYt8n13xo3mN/niX02Ku/PpswB/dZa8loxRdyFUTRUo2dx+7phmAR0h5eKAud9q7MhcSA
	2ym+NDBdbxH5s7HOsA3qO9uLolEEaHg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-akf23SNTNP6a7bvzSXTang-1; Sat, 02 Dec 2023 17:46:25 -0500
X-MC-Unique: akf23SNTNP6a7bvzSXTang-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EEA680C344;
	Sat,  2 Dec 2023 22:46:25 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9651A2166B26;
	Sat,  2 Dec 2023 22:46:23 +0000 (UTC)
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
Subject: [PATCH v3 4/7] HID: i2c-hid: Move i2c_hid_finish_hwreset() to after reading the report-descriptor
Date: Sat,  2 Dec 2023 23:46:11 +0100
Message-ID: <20231202224615.24818-5-hdegoede@redhat.com>
In-Reply-To: <20231202224615.24818-1-hdegoede@redhat.com>
References: <20231202224615.24818-1-hdegoede@redhat.com>
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
Changes in v3:
- Use goto abort_reset instead of return on i2c_hid_start_hwreset()
  failure, so that the mutex gets properly unlocked

Changes in v2:
- Adjust commit message to note that moving the wait-for-reset
  to after reading thr report-descriptor only partially fixes
  the missing reset IRQ problem
- Adjust for the reset_lock now being taken in the callers of
  i2c_hid_start_hwreset() / i2c_hid_finish_hwreset()
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 71d742aeaf35..400c15a180b5 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -725,11 +725,10 @@ static int i2c_hid_parse(struct hid_device *hid)
 	struct i2c_client *client = hid->driver_data;
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct i2c_hid_desc *hdesc = &ihid->hdesc;
+	char *rdesc = NULL, *use_override = NULL;
 	unsigned int rsize;
-	char *rdesc;
 	int ret;
 	int tries = 3;
-	char *use_override;
 
 	i2c_hid_dbg(ihid, "entering %s\n", __func__);
 
@@ -739,18 +738,15 @@ static int i2c_hid_parse(struct hid_device *hid)
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
 
 	if (ret)
-		return ret;
+		goto abort_reset;
 
 	use_override = i2c_hid_get_dmi_hid_report_desc_override(client->name,
 								&rsize);
@@ -762,8 +758,8 @@ static int i2c_hid_parse(struct hid_device *hid)
 		rdesc = kzalloc(rsize, GFP_KERNEL);
 
 		if (!rdesc) {
-			dbg_hid("couldn't allocate rdesc memory\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto abort_reset;
 		}
 
 		i2c_hid_dbg(ihid, "asking HID report descriptor\n");
@@ -773,10 +769,23 @@ static int i2c_hid_parse(struct hid_device *hid)
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


