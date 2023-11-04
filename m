Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC027E0F01
	for <lists+linux-input@lfdr.de>; Sat,  4 Nov 2023 12:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbjKDLSs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Nov 2023 07:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbjKDLSr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Nov 2023 07:18:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A15D44
        for <linux-input@vger.kernel.org>; Sat,  4 Nov 2023 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699096676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MsMY4/LcSNi8MII/naoQFzzgpbXIG9j67akh3eZNrek=;
        b=i0zaPa8q0U9lqZ4OoYZSfaDzrKbJ39+0cYVECd74xOwq7CZRz07+Qfs5wwJ/frP/nzIg8G
        Ps8Y7KBnsoicCOvQI0AE843Mlq/+9GgUW79PYlKPQEdIM/0P1jTPVrnlgNjKUnxDfrFqC3
        3r/3rK2+MLFicbsYDcW+XHvO724UQ74=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-gz7WdBh_P0aK39uEk8irLw-1; Sat, 04 Nov 2023 07:17:54 -0400
X-MC-Unique: gz7WdBh_P0aK39uEk8irLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE3B080F92B;
        Sat,  4 Nov 2023 11:17:53 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0CFA3502E;
        Sat,  4 Nov 2023 11:17:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Julian Sax <jsbc@gmx.de>, ahormann@gmx.net,
        Bruno Jesus <bruno.fl.jesus@gmail.com>,
        Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
        Tim Aldridge <taldridge@mac.com>,
        Rene Wagner <redhatbugzilla@callerid.de>,
        Federico Ricchiuto <fed.ricchiuto@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 4/7] HID: i2c-hid: Move i2c_hid_finish_hwreset() to after reading the report-descriptor
Date:   Sat,  4 Nov 2023 12:17:40 +0100
Message-ID: <20231104111743.14668-5-hdegoede@redhat.com>
In-Reply-To: <20231104111743.14668-1-hdegoede@redhat.com>
References: <20231104111743.14668-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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
shows that about 1 ms after the report descriptor read finishes the reset
indeed does get acked.

Move the waiting for the ack to after reading the report-descriptor,
so that the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk is no longer necessary
(on this model).

While at it drop the dbg_hid() for a malloc failure, malloc failures
already get logged extensively by malloc itself.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2247751
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index f029ddce4766..3bd0c3d77d99 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -502,6 +502,12 @@ static int i2c_hid_finish_hwreset(struct i2c_hid *ihid)
 	return ret;
 }
 
+static void i2c_hid_abort_hwreset(struct i2c_hid *ihid)
+{
+	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+	mutex_unlock(&ihid->reset_lock);
+}
+
 static void i2c_hid_get_input(struct i2c_hid *ihid)
 {
 	u16 size = le16_to_cpu(ihid->hdesc.wMaxInputLength);
@@ -746,8 +752,6 @@ static int i2c_hid_parse(struct hid_device *hid)
 
 	do {
 		ret = i2c_hid_start_hwreset(ihid);
-		if (ret == 0)
-			ret = i2c_hid_finish_hwreset(ihid);
 		if (ret)
 			msleep(1000);
 	} while (tries-- > 0 && ret);
@@ -763,9 +767,8 @@ static int i2c_hid_parse(struct hid_device *hid)
 		i2c_hid_dbg(ihid, "Using a HID report descriptor override\n");
 	} else {
 		rdesc = kzalloc(rsize, GFP_KERNEL);
-
 		if (!rdesc) {
-			dbg_hid("couldn't allocate rdesc memory\n");
+			i2c_hid_abort_hwreset(ihid);
 			return -ENOMEM;
 		}
 
@@ -776,10 +779,21 @@ static int i2c_hid_parse(struct hid_device *hid)
 					    rdesc, rsize);
 		if (ret) {
 			hid_err(hid, "reading report descriptor failed\n");
+			i2c_hid_abort_hwreset(ihid);
 			goto out;
 		}
 	}
 
+	/*
+	 * Windows directly reads the report-descriptor after sending reset
+	 * and then waits for resets completion afterwards. Some touchpads
+	 * actually wait for the report-descriptor to be read before signalling
+	 * reset completion.
+	 */
+	ret = i2c_hid_finish_hwreset(ihid);
+	if (ret)
+		goto out;
+
 	i2c_hid_dbg(ihid, "Report Descriptor: %*ph\n", rsize, rdesc);
 
 	ret = hid_parse_report(hid, rdesc, rsize);
-- 
2.41.0

