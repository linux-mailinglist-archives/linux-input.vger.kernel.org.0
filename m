Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31A2B1625A1
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2020 12:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgBRLjg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Feb 2020 06:39:36 -0500
Received: from www149.your-server.de ([78.47.15.70]:33724 "EHLO
        www149.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgBRLjf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Feb 2020 06:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hanno.de;
         s=default1911; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wcHYCgvIc1V4L4eqgKkfizJKSrtKfmAWPhFBpvyI6bQ=; b=I3VnMukWF6WKccKYTWKGE5U/37
        H+zGYvm56+lr/H+x2RwJcjbzZCCT+464sdhj3IfIAxHeuVzsbrmfRMi69tp2RAgSugiRpf8/S2/Hc
        zG7Pim+/RREpz7ZHDnqXXHrXb8L0FJxulAMh0br3SMSWNBNeMNhGvbViNEaAfGh2zbgEFqmHWY66T
        RCkBbkYU/jazB9pYqD8b2wiuJVPS76ZeLfw2yY7C9ad/WFB+iFq/29GooGWkR5yIipdxDcNmo1mSH
        Fmb6Wd68po5MEwUJaOap+qPYdXBH64gY2VEmmFwoVymmWCii5ktG7DjKaGRSN+bllwoW7YhDQHgXI
        +LJCDLYA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www149.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <kontakt@hanno.de>)
        id 1j41Dv-0003z0-UM; Tue, 18 Feb 2020 12:39:32 +0100
Received: from [2a04:4540:680e:4300:a894:29ae:bca2:b322]
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <kontakt@hanno.de>)
        id 1j41Dv-000LjW-Px; Tue, 18 Feb 2020 12:39:31 +0100
Subject: [PATCH v2 3/3] HID: hid-bigbenff: fix race condition for scheduled
 work during removal
From:   Hanno Zulla <kontakt@hanno.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
 <CAO-hwJJ1sc_RAh4ytWSOmRqfVESi2dvB_Ao_Vn+6XXixxVyxrA@mail.gmail.com>
 <74d73ebc-0cff-768d-00b7-57bb9b44124f@hanno.de>
 <266828ed-d335-d707-56ef-622fd1cc216d@hanno.de>
 <002114d2-ad2f-5dfc-fa3a-25d135ee41a3@hanno.de>
Message-ID: <7b9cc0d7-a128-b056-4d3c-1bc16c4643f3@hanno.de>
Date:   Tue, 18 Feb 2020 12:39:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <002114d2-ad2f-5dfc-fa3a-25d135ee41a3@hanno.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: kontakt@hanno.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25726/Mon Feb 17 15:01:07 2020)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HID: hid-bigbenff: fix race condition for scheduled work during removal

It's possible that there is scheduled work left while the device is
already being removed, which can cause a kernel crash. Adding a flag
will avoid this.

Signed-off-by: Hanno Zulla <kontakt@hanno.de>
---
 drivers/hid/hid-bigbenff.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
index f8c552b64a89..db6da21ade06 100644
--- a/drivers/hid/hid-bigbenff.c
+++ b/drivers/hid/hid-bigbenff.c
@@ -174,6 +174,7 @@ static __u8 pid0902_rdesc_fixed[] = {
 struct bigben_device {
 	struct hid_device *hid;
 	struct hid_report *report;
+	bool removed;
 	u8 led_state;         /* LED1 = 1 .. LED4 = 8 */
 	u8 right_motor_on;    /* right motor off/on 0/1 */
 	u8 left_motor_force;  /* left motor force 0-255 */
@@ -190,6 +191,9 @@ static void bigben_worker(struct work_struct *work)
 		struct bigben_device, worker);
 	struct hid_field *report_field = bigben->report->field[0];
 
+	if (bigben->removed)
+		return;
+
 	if (bigben->work_led) {
 		bigben->work_led = false;
 		report_field->value[0] = 0x01; /* 1 = led message */
@@ -304,6 +308,7 @@ static void bigben_remove(struct hid_device *hid)
 {
 	struct bigben_device *bigben = hid_get_drvdata(hid);
 
+	bigben->removed = true;
 	cancel_work_sync(&bigben->worker);
 	hid_hw_stop(hid);
 }
@@ -324,6 +329,7 @@ static int bigben_probe(struct hid_device *hid,
 		return -ENOMEM;
 	hid_set_drvdata(hid, bigben);
 	bigben->hid = hid;
+	bigben->removed = false;
 
 	error = hid_parse(hid);
 	if (error) {
-- 
2.20.1



