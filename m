Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5692EF505
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 16:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbhAHPmj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 10:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbhAHPmi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 10:42:38 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735F2C061381
        for <linux-input@vger.kernel.org>; Fri,  8 Jan 2021 07:41:58 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id n4so10136358iow.12
        for <linux-input@vger.kernel.org>; Fri, 08 Jan 2021 07:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+WthJ/eN8NtcTJKnSru8sSN7P1mbdFTFYqvxGlogESI=;
        b=flUqgLT/F7jg2TFoDVSAhkatFLz4e759wjRxMgxrqMoXxtCcpy4SVBvAjiTL1Fu65o
         2jFeY/PHMlqnMjE09r+0VB6fAKFZwZ9keW4l9u0C8oXEURpryX6/fWbeVF0huDl+spk8
         gIoOBB74RwwRoFuuYePE/br4/IecTWtNOLJAxAxA+Eq7cG0wfWhZmQVh3DuZNM5PvyZ2
         qoK1jgWwpqdUAg6oXn7/9LWUeC2MWTOMHLywXJ2qfuspKdWB4S1zf+6bhC9/CR9nFTf1
         Yt2vowEXng3fWNDbhzZE58pbLiNnILgSvfVE+5/4p0jYYZXK9ErbiC9JKvMEfCBFZxRA
         Kucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+WthJ/eN8NtcTJKnSru8sSN7P1mbdFTFYqvxGlogESI=;
        b=f0GDQZlWPhoiMcK6mdyNG1gOfkxpMrOxGHZYnFInQkreCvkCey6+28jG9egDrRxEu1
         1ESTIEWiRuSn5X4zj37a06P7J+4LIG0MKwLjuW9shjtdaKBiTlEFBH1E5PTRUGqT+Rqz
         0IQfNNJCEFXxkg81OeYFCOk+uhHURBGVLalKhBQQAGyBNNghiCah1YvcNnTGY00Jbtz3
         jJnJ6gq0nXzpGNVZB5C5hVhQytxt9YxFZW8/HzOT9hy1FyI9izJZzqs0IHO6dJ8vjIcZ
         Sz1377lwVpqFeNAVdkVrqF3NQGr93m9U8XryFb2Duqlu5n9ape0raZWkRnX3Zk9uZ1Xw
         bY7g==
X-Gm-Message-State: AOAM530LG2I2YatYyuJHvwj7/Pskr6fQUQNndE3TgAHWtZ0WjUBOISN6
        fb4xspb9kYpg0rDTfOJObcU=
X-Google-Smtp-Source: ABdhPJyaCYYr7oQ7oGeaGFYoCdJ47clIn3rDd1P9ywUiXez5VTuR5QcXeFryULOefLkSIU0YhDe8uQ==
X-Received: by 2002:a5d:9e41:: with SMTP id i1mr5886488ioi.104.1610120517840;
        Fri, 08 Jan 2021 07:41:57 -0800 (PST)
Received: from [192.168.0.118] (h134-215-152-179.mdtnwi.broadband.dynamic.tds.net. [134.215.152.179])
        by smtp.gmail.com with ESMTPSA id k9sm4901779iob.13.2021.01.08.07.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 07:41:57 -0800 (PST)
Message-ID: <be49cd57e53368062a5de07dcb7af2da0954771d.camel@gmail.com>
Subject: Re: [PATCH] HID: Ignore battery for Elan touchscreen on ASUS UX550
From:   Seth Miller <miller.seth@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 08 Jan 2021 09:41:56 -0600
In-Reply-To: <nycvar.YFH.7.76.2101081552560.13752@cbobk.fhfr.pm>
References: <CAMh5ckdy=z8j7X5BXLtpnOz2-Ha7MZqN-DvJS0e1w4CdiLJ4EQ@mail.gmail.com>
         <nycvar.YFH.7.76.2101081552560.13752@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2021-01-08 at 15:53 +0100, Jiri Kosina wrote:
> On Mon, 4 Jan 2021, Seth Miller wrote:
> 
> > Battery status is being reported for the Elan touchscreen on ASUS
> > UX550 laptops despite not having a batter. It always shows either 0
> > or
> > 1%.
> > 
> > Signed-off-by: Seth Miller <miller.seth@gmail.com>
> 
> Seth, thanks for the patch. It has, however, been line-wrapped by
> your 
> mail client, so I can't apply it as-is. Could you please fix that up
> and 
> resend?
> 
> Thanks,
> 

Jiri,
My apologies for the formatting issues. I wasn't aware Gmail's client silently inserted line breaks in plain text emails. Hopefully Evolution can do a bit better.

Signed-off-by: Seth Miller <miller.seth@gmail.com>

---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index f170feaac40b..94180c63571e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -387,6 +387,7 @@
 #define USB_DEVICE_ID_TOSHIBA_CLICK_L9W	0x0401
 #define USB_DEVICE_ID_HP_X2		0x074d
 #define USB_DEVICE_ID_HP_X2_10_COVER	0x0755
+#define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
 
 #define USB_VENDOR_ID_ELECOM		0x056e
 #define USB_DEVICE_ID_ELECOM_BM084	0x0061
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 4dca11392459..32024905fd70 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -322,6 +322,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD),
 	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{}
 };
 
-- 
2.29.2

