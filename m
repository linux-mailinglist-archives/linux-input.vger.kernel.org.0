Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7F30162599
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2020 12:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgBRLhw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Feb 2020 06:37:52 -0500
Received: from www149.your-server.de ([78.47.15.70]:60150 "EHLO
        www149.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbgBRLhw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Feb 2020 06:37:52 -0500
X-Greylist: delayed 423 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Feb 2020 06:37:51 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hanno.de;
         s=default1911; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=P5DWN49D92TYsuLESpqd7fS0a6DhOWs1cg95OmyVKFk=; b=oExTkIriDMLNUtj5rHDW6TvTwp
        G7NDOREH8BF/zFec6i+qf2LgUBN1zOqhSKumQ3WwEwTD3gx2qxNPgaSFFkAcp5F6yA+D8UyXJ3GYZ
        FamFZlFda1IspXFWLG92BCUovwYwPkoJaLqfDJqAGxUEjh7sdYRhgg2rUHeS04MEfwpaCgsYdz+AI
        C9p+G64Pz5puMNB3ErmOv7EGHhNis/N/xdmXfTGph1XxF66OizllzlL7Qy2rx7qVeC+tsn+LobSBr
        y4ct/MiDjKg1bOnemO7X9b7TntMriPX5OGMOB69mlbZShtZrJ/MT9jB0O4/Osk7WAS0CfA35q6Gl2
        4XwhMbTw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www149.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <kontakt@hanno.de>)
        id 1j41CG-0003st-G4; Tue, 18 Feb 2020 12:37:48 +0100
Received: from [2a04:4540:680e:4300:a894:29ae:bca2:b322]
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <kontakt@hanno.de>)
        id 1j41CG-000Cyl-Cc; Tue, 18 Feb 2020 12:37:48 +0100
Subject: [PATCH v2 1/3] HID: hid-bigbenff: fix general protection fault caused
 by double kfree
From:   Hanno Zulla <kontakt@hanno.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
 <CAO-hwJJ1sc_RAh4ytWSOmRqfVESi2dvB_Ao_Vn+6XXixxVyxrA@mail.gmail.com>
 <74d73ebc-0cff-768d-00b7-57bb9b44124f@hanno.de>
Message-ID: <266828ed-d335-d707-56ef-622fd1cc216d@hanno.de>
Date:   Tue, 18 Feb 2020 12:37:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <74d73ebc-0cff-768d-00b7-57bb9b44124f@hanno.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: kontakt@hanno.de
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

