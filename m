Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B94161625
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2020 16:27:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgBQP1y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Feb 2020 10:27:54 -0500
Received: from www149.your-server.de ([78.47.15.70]:35408 "EHLO
        www149.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgBQP1x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Feb 2020 10:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hanno.de;
         s=default1911; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:To:From:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wcHYCgvIc1V4L4eqgKkfizJKSrtKfmAWPhFBpvyI6bQ=; b=CfA7MMRTU9iH7WaHpY+SpuuLuS
        wTXycQngxf33BvZiH7nz/WRHkiRUmkZEaSSOzK3Vg82OuD0KXbwIMIono5wT4BCW3bDLmCzcnIWn6
        Hw8gmHBlnkak3TwCNcC8bJrVwGhNqakK0nhRHer79drJ0t/2tRGH5Bt3GyzGdO5zOt1x2mM0GYYst
        qE72AZnmmqGYewTYW1oj/KDOj7mvQdOuO+m7FrCXxBXlIbah6fLIShjejJFIiYNVmb8vtAxfNe2l6
        4HGb7wkdGdZT+ovAJbFGOf4coUJ58T4Mb+gG8zy67Gc93LU8YVi/f/NshVFmKVKhHIct4gDsp+R8f
        f3MstsZQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www149.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <abos@hanno.de>)
        id 1j3iJJ-0004sF-OY; Mon, 17 Feb 2020 16:27:49 +0100
Received: from [62.96.7.134] (helo=[10.1.0.41])
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <abos@hanno.de>)
        id 1j3iJJ-000GeY-Jh; Mon, 17 Feb 2020 16:27:49 +0100
Subject: [PATCH 3/3] HID: hid-bigbenff: fix race condition for scheduled work
 during removal
From:   Hanno Zulla <abos@hanno.de>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
 <798ec119-ce24-e1e3-17c9-b6018b04d75f@hanno.de>
 <1c355bbe-c0fb-395c-9050-346f87eb324c@hanno.de>
Message-ID: <782af9b1-b648-bd21-b0f0-b0db22b8c0b7@hanno.de>
Date:   Mon, 17 Feb 2020 16:27:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1c355bbe-c0fb-395c-9050-346f87eb324c@hanno.de>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: abos@hanno.de
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


