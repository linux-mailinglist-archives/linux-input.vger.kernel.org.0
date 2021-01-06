Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725162EC3C8
	for <lists+linux-input@lfdr.de>; Wed,  6 Jan 2021 20:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbhAFTSa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jan 2021 14:18:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39999 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726840AbhAFTS2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 Jan 2021 14:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609960621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kZW03CYYNY68WyUOo3YGjnMbs8Y0uQISMJf1Yyuwv54=;
        b=WWguPe27Nyq5VP3RLygMxdLwKKryzkURB66n1Y6sCHavLSK8ikIYmwZmoxfHegUqaz16MN
        qgJ0Da5bBobwUycANx9V0eMXg7sZgQQxaThKlOmD6WJJ0C4KE/0xxDl7zxDA9wvN4Dfpq/
        lYc8ITPZ6l3iOg8QJLvf3p0Pm0MTpvQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-bjh0O6sNP7Gr-nYascI03A-1; Wed, 06 Jan 2021 14:16:58 -0500
X-MC-Unique: bjh0O6sNP7Gr-nYascI03A-1
Received: by mail-ej1-f72.google.com with SMTP id k3so1667706ejr.16
        for <linux-input@vger.kernel.org>; Wed, 06 Jan 2021 11:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kZW03CYYNY68WyUOo3YGjnMbs8Y0uQISMJf1Yyuwv54=;
        b=Lq/TYm+4Hr0mVrTOf2B6GBFPSdtHUTf6nQw0Vgv3YS51ztgtcyypGJVaGfesPs68It
         ORe7Kq+GA++aPv/ibEmPW87OOtmu5ho+X1X/xi2/IfvMXC9pD35SfkcoLfrn6SqhlBcz
         6Q8Pt/p2n6OKao5yc5uQcZlQYnui+ueZdgzJZf5Y5xdDjUqiDp/6iAS2LId4GKJ34iHp
         yBkia/SCFnMMY+NFp9l+F9VjVytMrTCs4e2LFI4lwMAGSj+cBPOZ62BRb4558K7H9Iv9
         qNayBVHRvG4xAMbIlSqi1oYTokPN7h9eYOfuvnXhtjM7fwCWj34p+wUYxVPzhiFpq7GK
         H/Yg==
X-Gm-Message-State: AOAM533oWD3C/+7uIu3MvbjL5BrwWLye8ZGJGDu9lIZywDTugY6lNhe9
        rKjmCKBzCutcj041VOAwjLXH06ZpHdFPZjmjFg1pXon/yw32MmJdkk2NEZrnRLlEmOnHoszLhuH
        tPlMLM9MiSi1J1rU6gGuHtt0=
X-Received: by 2002:a17:907:4126:: with SMTP id mx6mr3848397ejb.91.1609960617489;
        Wed, 06 Jan 2021 11:16:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRv4XRjPfzqXQnoVnknm0ljP3mzn+/3THqB8xygTKCn+nmiy4sSY8G9CP4mpqFP4JKk+apGA==
X-Received: by 2002:a17:907:4126:: with SMTP id mx6mr3848385ejb.91.1609960617279;
        Wed, 06 Jan 2021 11:16:57 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id f18sm1746142edt.60.2021.01.06.11.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 11:16:56 -0800 (PST)
Subject: Re: (hid-logitech) Support for non-DJ receivers
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <filipe.lains@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <4990836470c5fb01babcf416ca6ccf9e5e21d152.camel@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <308ef1e5-16ae-899f-9d89-d63f854b12bc@redhat.com>
Date:   Wed, 6 Jan 2021 20:16:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4990836470c5fb01babcf416ca6ccf9e5e21d152.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Filipe,

On 1/6/21 8:07 PM, Filipe Laíns wrote:
> Hey,
> 
> Some of the new Logitech receivers do not have the DJ interface, this creates an
> issue userspace applications like libratbag, as seen in [1], because we can't
> identify the device based on the hidraw PID.
> 
> There are two solutions for this:
> 
> 1) Implement device discovery via the internal Logitech ID in libratbag and all
> other userspace apps.
> 
> 2) Make hid-logitech-dj export a duplicated hidraw node with internal Logitech
> ID as PID, just like it does for the DJ interface.
> 
> In case you aren't aware of what the DJ interface is, it is essentially a
> multiplexing protocol that receivers support. 6 devices could be connected to
> the same receiver, hid-logitech-dj enables the DJ mode and the receiver will
> essentially perpend the device ID to each HID report. hid-logitech-dj then
> creates a HID device for each connected device and routes the HID reports to the
> correspondent HID device.
> 
> Option 2) would be the easier on userspace, as it keeps the same interface we
> use for DJ receivers for other Logitech HID++ receivers and avoids all userspace
> apps to have to reimplement the same discovery logic.
> 
> Any thoughts?

hid-logitech-dj already supports exposing devices behind a non-DJ / non-unifying
receiver as separate HID child-devices of the receiver as we doe for DJ devices.

ATM hid-logitech-dj does not yet support the c541 PID receiver, but with some
luck that could be as simple as adding this patch to the kernel:

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 1ffcfc9a1e03..ee7051f3c926 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1877,6 +1877,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
 	 .driver_data = recvr_type_gaming_hidpp},
+	{ /* Logitech lightspeed receiver (0xc541) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		0xc541),
+	 .driver_data = recvr_type_gaming_hidpp},
 	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
 	 .driver_data = recvr_type_27mhz},

Where the second 0xc541 should really be a
USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2 define in hid-ids.h, but we
can fix that when upstreaming this.

For now if you can get the reporter of the bug to build a kernel with the
above change and test that, then that would be great. If things do not work
OOTB with this change, then we may need to do some additional work on
the kernel side, but we do already support lightspeed receivers, so
we should be able to add support for this new model too.

Regards,

Hans

[1] https://github.com/libratbag/libratbag/pull/1071



