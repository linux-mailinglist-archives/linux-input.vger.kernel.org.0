Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E505A1643
	for <lists+linux-input@lfdr.de>; Thu, 25 Aug 2022 18:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242154AbiHYQAG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Aug 2022 12:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242920AbiHYQAE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Aug 2022 12:00:04 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865485F49
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 09:00:02 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id o184so23763751oif.13
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=logitech.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SPdZxA+TEdiUaiUjaM70vGmaF74u8+aaEKbO12Z9gnY=;
        b=NRrbnJJlHzEPkpqRqHD+0Etl3yA58yfSFan+22KRrVPm8kLVwNY5gIw7UFRBBoqttU
         Fddf2pYe9AxZaDcP2yx8jLG8bYKHilegZdq7AD/p85CIIZv0HiZLhhCE5gOr3oJaNYTs
         CpSkjTbIp1Xy79xLVrZHmuqSMaiu1/oT5u1WHRqhbkMRs+wRFFqhu7++TTfN3UE3Vhbk
         PJCTF5+RLTQCez0a0g20NI6qRrJgQKPjNSzN1p8YoFFwzQ3oCkfC+UYyHjO+HaqtyBrr
         bziWXrzZFK23KmT+YRCp6ZovLDo4sTx0uqeSy48ZYtak7K9IGk4yrjUpZL+uRbXfPkjP
         +wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SPdZxA+TEdiUaiUjaM70vGmaF74u8+aaEKbO12Z9gnY=;
        b=WqCvam5cZA/QYRzkPgIOn5qYmQSwRzRfKKsUYbnRt7KGfyzmk1eohycbdNaKHsSBJJ
         vW/KOdG8gEbnrUx8roiKuo5MRxuXSWPPkyrKEyLBSa0oK873Mf9uRaRa5nWl5y+cBgdu
         BS+0bxMCXUAbxQ6kcrhlPYYgWLni6GyLUHSP7InVcaPmp+06DWYAjWsY+/Xiyp1scH96
         AunjNah8eEorqnLrzmz2cbySY5n4g7L7rb98jvVczAO7ZKfMoizoGs/fFcTxHo03maMb
         K6Vh04KqikMNVo+ogcY+O0+aNj+TX07ngwaV3eNzfZchAMgK1dIby0DVsv5p4q5ZGP1e
         YEOw==
X-Gm-Message-State: ACgBeo2/koqvgHXGXX0e2ZRKB5uhDldS9GY1oWkFNMFSqFW8mwFegmAx
        bmSMvztX5/e3znumzhgA9zvtywj+f5UR8J/wFJx+0g==
X-Google-Smtp-Source: AA6agR642r0h0C9eDWfwfMKBtI/dagMxoKPPpJ4df341DHxjrebMulK0od4dNSd7utHDPUXiyrvXPcag3dXfz3qmEro=
X-Received: by 2002:aca:2110:0:b0:343:26cf:c6cf with SMTP id
 16-20020aca2110000000b0034326cfc6cfmr5891545oiz.276.1661443201756; Thu, 25
 Aug 2022 09:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <4542beb149883ab5dfdcfd7f6bb4b516e5c1bcdb.camel@hadess.net>
In-Reply-To: <4542beb149883ab5dfdcfd7f6bb4b516e5c1bcdb.camel@hadess.net>
From:   Nestor Lopez Casado <nlopezcasad@logitech.com>
Date:   Thu, 25 Aug 2022 17:59:35 +0200
Message-ID: <CAE7qMrrj+rBzoAFf2FezqexgWNo+iSAd6b5NZwKFQ1C1zD_Qaw@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Enable HID++ for all the Logitech
 Bluetooth devices
To:     Bastien Nocera <hadess@hadess.net>
Cc:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        "Peter F. Patel-Schneider" <pfpschneider@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adding Peter, as he maintains Solaar, one popular application that
supports Logitech bluetooth devices.
@Peter F. Patel-Schneider
-nestor

On Thu, Aug 25, 2022 at 2:29 PM Bastien Nocera <hadess@hadess.net> wrote:
>
> Probe for HID++ support over Bluetooth for all the Logitech Bluetooth
> devices. As Logitech doesn't have a list of Bluetooth devices that
> support HID++ over Bluetooth, probe every device. The HID++ driver
> will fall back to plain HID if the device does not support HID++.
>
> Note that this change might cause upower to export 2 batteries for
> certain Bluetooth LE devices which export their battery information
> through the Bluetooth BATT profile. This particular bug is tracked at:
> https://gitlab.freedesktop.org/upower/upower/-/issues/166
>
> Tested with a Logitech Signature M650 mouse, over Bluetooth
>
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>
> Note that I could not test whether the Harmony PS3 (handled in hid-sony.c)
> or DiNovo Edge keyboard (handled in hid-input.c) devices would correctly fallback
> to those drivers in that case.
>
> Ways to test this would be appreciated (or merge this, and wait for feedback...)
>
>  drivers/hid/hid-logitech-hidpp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 81de88ab2ecc..86e7a38d8a9a 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4347,6 +4347,9 @@ static const struct hid_device_id hidpp_devices[] = {
>         { /* MX Master 3 mouse over Bluetooth */
>           HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb023),
>           .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +
> +       { /* And try to enable HID++ for all the Logitech Bluetooth devices */
> +         HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_ANY, USB_VENDOR_ID_LOGITECH, HID_ANY_ID) },
>         {}
>  };
>
> --
> 2.37.2
>
