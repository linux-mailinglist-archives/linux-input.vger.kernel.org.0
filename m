Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB7F161622
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2020 16:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgBQP0s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Feb 2020 10:26:48 -0500
Received: from www149.your-server.de ([78.47.15.70]:34788 "EHLO
        www149.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgBQP0s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Feb 2020 10:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hanno.de;
         s=default1911; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:To:From:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Bb4OdgL+FDT36bk2A4nHd/zr93kNst/7y92D3y2OBd0=; b=Zn+oCkzUO5VaWdajzLkIySEex5
        BPBHU/QGBcRWeHLwRb5CN9+69ovJuCvgdT9LEBd2m6PXzAoUb51qzltqAkS9hrVA+cLfu4nFKhgQS
        zzASf8KcJ0YI5Y62ZyFWS4hENFOLVW1HVlNYSe8rdpRkzeX5DgvJOK+NKOcYlwetiAyKG/na26tUu
        qWpI2jxFzPmBCKr0u8Qkf9X31OTAgJSBLQXAH04ZA534/Eg+D8nn+a/wpfVlOccWt585FiEEq8QVy
        AKPJlyhz423sUmRiDVp4VhpasDVtXwWSTJHqVdC38O/i9bU5x16nHWh5DQGHJf3Fm0q4wD5xdFhv/
        q4kg80zg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www149.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <abos@hanno.de>)
        id 1j3iIG-0004oz-CY; Mon, 17 Feb 2020 16:26:44 +0100
Received: from [62.96.7.134] (helo=[10.1.0.41])
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <abos@hanno.de>)
        id 1j3iIG-000Bhk-7i; Mon, 17 Feb 2020 16:26:44 +0100
Subject: [PATCH 2/3] HID: hid-bigbenff: call hid_hw_stop() in case of error
From:   Hanno Zulla <abos@hanno.de>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
 <798ec119-ce24-e1e3-17c9-b6018b04d75f@hanno.de>
Message-ID: <1c355bbe-c0fb-395c-9050-346f87eb324c@hanno.de>
Date:   Mon, 17 Feb 2020 16:26:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <798ec119-ce24-e1e3-17c9-b6018b04d75f@hanno.de>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: abos@hanno.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25726/Mon Feb 17 15:01:07 2020)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[PATCH 2/3] HID: hid-bigbenff: call hid_hw_stop() in case of error

It's required to call hid_hw_stop() once hid_hw_start() was called
previously, so error cases need to handle this. Also, hid_hw_close() is
not necessary during removal.

Signed-off-by: Hanno Zulla <kontakt@hanno.de>
---
 drivers/hid/hid-bigbenff.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
index f7e85bacb688..f8c552b64a89 100644
--- a/drivers/hid/hid-bigbenff.c
+++ b/drivers/hid/hid-bigbenff.c
@@ -305,7 +305,6 @@ static void bigben_remove(struct hid_device *hid)
 	struct bigben_device *bigben = hid_get_drvdata(hid);
 
 	cancel_work_sync(&bigben->worker);
-	hid_hw_close(hid);
 	hid_hw_stop(hid);
 }
 
@@ -350,7 +349,7 @@ static int bigben_probe(struct hid_device *hid,
 	error = input_ff_create_memless(hidinput->input, NULL,
 		hid_bigben_play_effect);
 	if (error)
-		return error;
+		goto error_hw_stop;
 
 	name_sz = strlen(dev_name(&hid->dev)) + strlen(":red:bigben#") + 1;
 
@@ -360,8 +359,10 @@ static int bigben_probe(struct hid_device *hid,
 			sizeof(struct led_classdev) + name_sz,
 			GFP_KERNEL
 		);
-		if (!led)
-			return -ENOMEM;
+		if (!led) {
+			error = -ENOMEM;
+			goto error_hw_stop;
+		}
 		name = (void *)(&led[1]);
 		snprintf(name, name_sz,
 			"%s:red:bigben%d",
@@ -375,7 +376,7 @@ static int bigben_probe(struct hid_device *hid,
 		bigben->leds[n] = led;
 		error = devm_led_classdev_register(&hid->dev, led);
 		if (error)
-			return error;
+			goto error_hw_stop;
 	}
 
 	/* initial state: LED1 is on, no rumble effect */
@@ -389,6 +390,10 @@ static int bigben_probe(struct hid_device *hid,
 	hid_info(hid, "LED and force feedback support for BigBen gamepad\n");
 
 	return 0;
+
+error_hw_stop:
+	hid_hw_stop(hid);
+	return error;
 }
 
 static __u8 *bigben_report_fixup(struct hid_device *hid, __u8 *rdesc,
-- 
2.20.1

