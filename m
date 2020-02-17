Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 382CB161620
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2020 16:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbgBQPZ6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Feb 2020 10:25:58 -0500
Received: from www149.your-server.de ([78.47.15.70]:34078 "EHLO
        www149.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbgBQPZ6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Feb 2020 10:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hanno.de;
         s=default1911; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:To:From:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=P5DWN49D92TYsuLESpqd7fS0a6DhOWs1cg95OmyVKFk=; b=D2lB239xIof0jQmbs+GSHfSNbe
        CMoDIL7ln0iQ7lJIMnWDjDJmJlzg8vxPAO8N1/n6EqKTVSx1FRDIB9SF5OSc3lFkpPIb3XVMywhIk
        2J6E9UFfXCDohvAIJdetYWPzVAAdrZlaVrsNVB0YunW94QPcZdLFyLjOR8fITnEP8W1YsRGFNj0sc
        DdO/Y3OJRNQxo9P7UvID3Ty9gR8ttOXTto6cDLlsFLmLNdz0wgucfiNd4yUmmcVK5pg+9BToxclTF
        HrdOY63IXqFjuVYPbhucOAn0L6r1UwTtJ7yB3UL0EEmFSraFoiRwtRnlDbQMvhGbuQnIdH8quq5S1
        Zr3xR+bQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www149.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <abos@hanno.de>)
        id 1j3iHS-0004ld-Q4; Mon, 17 Feb 2020 16:25:54 +0100
Received: from [62.96.7.134] (helo=[10.1.0.41])
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <abos@hanno.de>)
        id 1j3iHS-00080q-MV; Mon, 17 Feb 2020 16:25:54 +0100
Subject: [PATCH 1/3] HID: hid-bigbenff: fix general protection fault caused by
 double kfree
From:   Hanno Zulla <abos@hanno.de>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
Message-ID: <798ec119-ce24-e1e3-17c9-b6018b04d75f@hanno.de>
Date:   Mon, 17 Feb 2020 16:25:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: abos@hanno.de
X-Virus-Scanned: Clear (ClamAV 0.102.1/25726/Mon Feb 17 15:01:07 2020)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HID: hid-bigbenff: fix general protection fault caused by double kfree

The struct *bigben was allocated via devm_kzalloc() and then used as a
parameter in input_ff_create_memless(). This caused a double kfree
during removal of the device, since both the managed resource API and
ml_ff_destroy() in drivers/input/ff-memless.c would call kfree() on it.

Signed-off-by: Hanno Zulla <kontakt@hanno.de>
---
 drivers/hid/hid-bigbenff.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
index 3f6abd190df4..f7e85bacb688 100644
--- a/drivers/hid/hid-bigbenff.c
+++ b/drivers/hid/hid-bigbenff.c
@@ -220,10 +220,16 @@ static void bigben_worker(struct work_struct *work)
 static int hid_bigben_play_effect(struct input_dev *dev, void *data,
 			 struct ff_effect *effect)
 {
-	struct bigben_device *bigben = data;
+	struct hid_device *hid = input_get_drvdata(dev);
+	struct bigben_device *bigben = hid_get_drvdata(hid);
 	u8 right_motor_on;
 	u8 left_motor_force;
 
+	if (!bigben) {
+		hid_err(hid, "no device data\n");
+		return 0;
+	}
+
 	if (effect->type != FF_RUMBLE)
 		return 0;
 
@@ -341,7 +347,7 @@ static int bigben_probe(struct hid_device *hid,
 
 	INIT_WORK(&bigben->worker, bigben_worker);
 
-	error = input_ff_create_memless(hidinput->input, bigben,
+	error = input_ff_create_memless(hidinput->input, NULL,
 		hid_bigben_play_effect);
 	if (error)
 		return error;
-- 
2.20.1

