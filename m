Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0756D67197C
	for <lists+linux-input@lfdr.de>; Wed, 18 Jan 2023 11:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjARKpf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Jan 2023 05:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjARKoA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Jan 2023 05:44:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E218611D6
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 01:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674035408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ekqaAGVHn5lsNsby5X1WXEtZvyYCj4CzjjlIaOH2e9I=;
        b=CSlMN7oRbU8Hp9eMp49y71S5rC4kQSoLv3S4t9Od2wxfwhncjDL8frT2OPICrVGA2JvcYT
        1mI9Lue5p5VHFlsObnPvPEYXsnd3/h+13W5bshK0p/boUhLNHdEfm6CHhL8uwYSXlu0FRe
        NSAzZIylOWCuD71RXcxcIwy7HEgIUT4=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-N5ZU0p-WMC2tTaimAl2NHw-1; Wed, 18 Jan 2023 04:50:07 -0500
X-MC-Unique: N5ZU0p-WMC2tTaimAl2NHw-1
Received: by mail-il1-f198.google.com with SMTP id h4-20020a056e021b8400b0030d901a84d9so23624602ili.6
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 01:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekqaAGVHn5lsNsby5X1WXEtZvyYCj4CzjjlIaOH2e9I=;
        b=iJ8TQlXUyI2hHg1qR+LRlh3O+VwcXKhfJQeWB4yXbl6AthK0ekuJACZN+lZ7B7wzqz
         /eJUKiINa64IehGy2yMQWIk3tPdjkL6qvoTrgpc+xmc8YCn6quSPtKn5VTIFy08mzvOL
         O+j3zUV2K/v1lyEM9HjPUqvZ4yILiirVqdse7CVHv1COrfKx8dwL3J62JGTY7fGUA94j
         0oY+SX54aWNwhMekuEbxeq1Ht2TU5m0eEWQo1YxhFgAtXb1eY2re0CeTtJUJlkmX20CK
         HNB4Sy2nmuuB96FpebL8sMmokcqgeL3Q0pNdRWID/mA2i6zPvHMFinkEy+JBNg8joQAu
         wFqw==
X-Gm-Message-State: AFqh2kpwcGMavdB2EdRg7wipiBccaurIJCOEjlcJENQzviDDQqwlu+no
        qyBCtLITN4AGKMQKaPGO7sEQ+yxaWraKT1zW4ZEYQGy01Qyx3zp5zRIBk5XYNwN9V9gD4vpVEWE
        v8rzLRFe3ZGfdFPn3p980MwiRfR2S7tMAky8ttfk=
X-Received: by 2002:a02:c984:0:b0:3a0:7a0b:fcc with SMTP id b4-20020a02c984000000b003a07a0b0fccmr448423jap.106.1674035407022;
        Wed, 18 Jan 2023 01:50:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuFdpCs8xaAFrJJK3/17Lu8n/8pHgKIs0fo3byjnvosyRSj8soAeBwATrJIsEgQxjEga2Z8oCIhaVFDJNlXWNI=
X-Received: by 2002:a02:c984:0:b0:3a0:7a0b:fcc with SMTP id
 b4-20020a02c984000000b003a07a0b0fccmr448419jap.106.1674035406826; Wed, 18 Jan
 2023 01:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20221219105521.73467-1-benjamin.tissoires@redhat.com>
In-Reply-To: <20221219105521.73467-1-benjamin.tissoires@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 18 Jan 2023 10:49:55 +0100
Message-ID: <CAO-hwJ+4zit=65oS6Q9aBp3GZiVaOP3f__tcT+1VSRx=1hcxrg@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: enable trackstick of Asus ExpertBook B2502
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 19, 2022 at 11:55 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> This device has a trackstick that is sent through the same HID device
> than the touchpad.
> Unfortunately there are 2 mice attached to that device descriptor, with
> the first one for the touchpad when the second is for the trackstick.
>
> Force all devices to be exported.
>
> Cc: stable@vger.kernel.org # 5.8+
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2154204
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

FTR, this patch was already taken through
4eab1c2fe06c98a4dff258dd64800b6986c101e9, so we can safely ditch it.

Cheers,
Benjamin

> ---
>  drivers/hid/hid-multitouch.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 91a4d3fc30e0..91ac72b32d45 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1860,6 +1860,12 @@ static const struct hid_device_id mt_devices[] = {
>                         USB_VENDOR_ID_ASUSTEK,
>                         USB_DEVICE_ID_ASUSTEK_T304_KEYBOARD) },
>
> +       /* Asus ExpertBook with trackstick */
> +       { .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
> +               HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
> +                       USB_VENDOR_ID_ELAN,
> +                       0x3148) },
> +
>         /* Atmel panels */
>         { .driver_data = MT_CLS_SERIAL,
>                 MT_USB_DEVICE(USB_VENDOR_ID_ATMEL,
> --
> 2.38.1
>

