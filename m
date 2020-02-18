Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70A8516259B
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2020 12:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgBRLij (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Feb 2020 06:38:39 -0500
Received: from www149.your-server.de ([78.47.15.70]:32796 "EHLO
        www149.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbgBRLij (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Feb 2020 06:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hanno.de;
         s=default1911; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IEywy6y9vcxnmyN3+K+yGnkqp5XWodCv5lPz/Shbbw0=; b=E5x/+0YFz/THFHDbXVcPyyAIwI
        hjvh3NNG0PzhP4YUxv8M4bPX0DcZsTNbTaDyeSxu4ods+qg8zPCNGgXN/dcaRojZpb6Q5SPy/FD/5
        EvNCKvrkUi5zOTY0MUu+Z89hYrM5qAzvSk5HscN+VCFZw+u9OPWArYa5Nnx9RLXZeF8ToEVV+Or0p
        UnyXO2EciWk2nlxbVXgZzX+JZGbQK9wlIkriqwJzzFJqXJP81/Ff5/pbDBqbE9o++bXZJYL24WSA1
        YFFmO2+lSa0YpB/9H+pndkHVv0sn8yBGuIwa7FSEbuq4VvuaSPtea0LOLRfJrLKfqMThDm/Yd+7OM
        uFzSsQrg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www149.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <kontakt@hanno.de>)
        id 1j41D1-0003vi-2Y; Tue, 18 Feb 2020 12:38:35 +0100
Received: from [2a04:4540:680e:4300:a894:29ae:bca2:b322]
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <kontakt@hanno.de>)
        id 1j41D0-000GzS-Us; Tue, 18 Feb 2020 12:38:34 +0100
Subject: [PATCH v2 2/3] HID: hid-bigbenff: call hid_hw_stop() in case of error
From:   Hanno Zulla <kontakt@hanno.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
 <CAO-hwJJ1sc_RAh4ytWSOmRqfVESi2dvB_Ao_Vn+6XXixxVyxrA@mail.gmail.com>
 <74d73ebc-0cff-768d-00b7-57bb9b44124f@hanno.de>
 <266828ed-d335-d707-56ef-622fd1cc216d@hanno.de>
Message-ID: <002114d2-ad2f-5dfc-fa3a-25d135ee41a3@hanno.de>
Date:   Tue, 18 Feb 2020 12:38:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <266828ed-d335-d707-56ef-622fd1cc216d@hanno.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: kontakt@hanno.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25726/Mon Feb 17 15:01:07 2020)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HID: hid-bigbenff: call hid_hw_stop() in case of error

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

