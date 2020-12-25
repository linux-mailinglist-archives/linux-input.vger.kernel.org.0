Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD802E2B51
	for <lists+linux-input@lfdr.de>; Fri, 25 Dec 2020 12:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgLYLUd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Dec 2020 06:20:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24000 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729152AbgLYLUc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Dec 2020 06:20:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608895145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AEmiUq7DsWmMOHVa4ySNvYgag95tK2sAE5w4V8r+XKM=;
        b=BbThJHrlmBidaW0spWMOFrfw2Q3SMuF+kSMObJIjpHWVm2dk5yAjAJjgHo2Y349Wbv30ve
        kw4+t+UNdPCvKqpyNOdmkTplV6NK4zTOdqWfQNjb9l5EKTzaOQftUiSa7sNNeScWyN4AO1
        qC60/2bnsmrvv7Gt+RxX67WP3oJiZc4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-qq43I0e7OQ-phCoimvtZwA-1; Fri, 25 Dec 2020 06:19:03 -0500
X-MC-Unique: qq43I0e7OQ-phCoimvtZwA-1
Received: by mail-ej1-f70.google.com with SMTP id y14so1903888ejf.11
        for <linux-input@vger.kernel.org>; Fri, 25 Dec 2020 03:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AEmiUq7DsWmMOHVa4ySNvYgag95tK2sAE5w4V8r+XKM=;
        b=nMVbd7OMB4WaZzp3nNHpqUGdEAkwNoGRwx6ZARn9XTlYnhPnMSI3vq3bfHnr5ecxeu
         cgTEYqzREtayMpMAChNF/7xe+Uh+C1xrstOAPrvnCqXhYLrg43e/2w+hhhA2Dn0SXy7K
         sxKh0reF9xLF4/8g0JgavyfFUVFOj6xzMyl2dYn6WEAZohBFpM3WnfjUVADcvLq498bA
         9XTxHAgTg7uRlZyQ2VJp3HgGj1D01V+sH1ZZvUXUBBneijtnoBTPWTlJaHMa6R/ZcPC8
         E1mvREUSi5g9UdAes/cCwnj+W5cbdiaE3WYFr4ZDPaWOLzV+RpjWaZcabO+/Gvi6VpBY
         eTGg==
X-Gm-Message-State: AOAM531wz3lwgBME8CuX+lkB99QmljOUemkklw7Ya0rZ8mKW5WSCB9Tv
        0HZfbo2JXWwaIVzM4OcJLW8QnX1FkQ5eNAS1U5oGpGzfXCjmoHZ5zA0+4E+4wyDpm8I86jtAxsr
        ofVnEYGEQqUbrlAkWQOIuC0eMX6gUYPC/VWqhUxIZRpOVeYcxFrdqCq6vKlT0uKrOIna1fC+mPP
        Y=
X-Received: by 2002:a17:907:20a4:: with SMTP id pw4mr30848106ejb.499.1608895142495;
        Fri, 25 Dec 2020 03:19:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqgrtkdGQAJ9FBpw30f7yU6GI+2cPC3OT+LFe1XQpyr44qtldgplctOhxPccrCa5dDEZ1gvg==
X-Received: by 2002:a17:907:20a4:: with SMTP id pw4mr30848095ejb.499.1608895142180;
        Fri, 25 Dec 2020 03:19:02 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id r21sm21304266eds.91.2020.12.25.03.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Dec 2020 03:19:01 -0800 (PST)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add swap-x-y quirk for
 Goodix touchscreen on Estar Beauty HD tablet
To:     Christopher Piggott <cpiggott@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20201224135158.10976-1-hdegoede@redhat.com>
 <CANgRfon2PC8EY4H=DOzey++VqbQ-S9uG986zLWKR2hFm2E2P_A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c39a741a-aaa0-c79c-9885-5d4d3bc958d0@redhat.com>
Date:   Fri, 25 Dec 2020 12:19:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CANgRfon2PC8EY4H=DOzey++VqbQ-S9uG986zLWKR2hFm2E2P_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 12/24/20 3:02 PM, Christopher Piggott wrote:
> Hans, I have the almost the exact same problem with a Xenarc 705T that has an eGalax controller on it.  In this case, it's not just a swap of X and Y, it's actually rotated 90 degrees.  I have been searching for a more generic solution to this problem.  I'm wondering if there's a more generic way to do this, up in maybe hid-input or somewhere, and I'm also wondering if it's at all feasible to do it so that you don't specify swapxy, rotation, and size transformations.  In my mind this calls for an affine transform, where if somebody really needs to manipulate this they specify a matrix.  I can see wanting to have parameters like you added to make it easier for people, but I would just make those parameters formulate an affine transformation matrix that could also be specified explicitly as x1, x2, y1, y1.
> 
> At one point in time, the eGalax driver handled this with a swapxy.  Somebody somewhere along the line thought that the eGalax driver could be discarded in lieu of standard handling in hid, but without the ability to transform that's not the case.  In my particular case, I'm actually doing this for android, where these drivers aren't even loaded as modules (so it's kind of a pain).
> 
> What do you think?

Any transformation which you need because of the touchscreen and LCD panel orientation
not matching can be achieved through the swap-x-y and invert-x and invert-y device properties
defined in:

Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml

Note that swap-x-y will also swap the width/height and min/max properties for the
touchscreen. So you specify the min and max values as reported by the controller and
since the touchscreen is mounted 90 degrees rotated those will then be swapped
before being reported to userspace.

This is all handled by the generic touchscreen-properties helpers from:
drivers/input/touchscreen/of_touchscreen.c
(touchscreen_parse_properties, touchscreen_report_pos and others)

You can find plenty examples of drivers using those.

The proper solution for this would be to convert the driver which you are
using to use these helpers, see e.g. commit fafef982c735 ("Input: goodix - 
use generic touchscreen_properties"), in combination with setting the
properties needed for your device in the devicetree of your device.

And yes if you need this with a standard HID device then the 
drivers/hid/hid-multitouch.c properly needs to get support for the
helpers from drivers/input/touchscreen/of_touchscreen.c . Which is not
entirely trivial, but should be not that hard to do.

Regards,

Hans





> 
> 
> 
> On Thu, Dec 24, 2020 at 8:55 AM Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     The Estar Beauty HD (MID 7316R) tablet uses a Goodix touchscreen,
>     with the X and Y coordinates swapped compared to the LCD panel.
> 
>     Add a touchscreen_dmi entry for this adding a "touchscreen-swapped-x-y"
>     device-property to the i2c-client instantiated for this device before
>     the driver binds.
> 
>     This is the first entry of a Goodix touchscreen to touchscreen_dmi.c,
>     so far DMI quirks for Goodix touchscreen's have been added directly
>     to drivers/input/touchscreen/goodix.c. Currently there are 3
>     DMI tables in goodix.c:
>     1. rotated_screen[] for devices where the touchscreen is rotated
>        180 degrees vs the LCD panel
>     2. inverted_x_screen[] for devices where the X axis is inverted
>     3. nine_bytes_report[] for devices which use a non standard touch
>        report size
> 
>     Arguably only 3. really needs to be inside the driver and the other
>     2 cases are better handled through the generic touchscreen DMI quirk
>     mechanism from touchscreen_dmi.c, which allows adding device-props to
>     any i2c-client. Esp. now that goodix.c is using the generic
>     touchscreen_properties code.
> 
>     Alternative to the approach from this patch we could add a 4th
>     dmi_system_id table for devices with swapped-x-y axis to goodix.c,
>     but that seems undesirable.
> 
>     Cc: Bastien Nocera <hadess@hadess.net <mailto:hadess@hadess.net>>
>     Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com <mailto:dmitry.torokhov@gmail.com>>
>     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>     ---
>      drivers/platform/x86/touchscreen_dmi.c | 18 ++++++++++++++++++
>      1 file changed, 18 insertions(+)
> 
>     diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
>     index 5783139d0a11..c4de932302d6 100644
>     --- a/drivers/platform/x86/touchscreen_dmi.c
>     +++ b/drivers/platform/x86/touchscreen_dmi.c
>     @@ -263,6 +263,16 @@ static const struct ts_dmi_data digma_citi_e200_data = {
>             .properties     = digma_citi_e200_props,
>      };
> 
>     +static const struct property_entry estar_beauty_hd_props[] = {
>     +       PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
>     +       { }
>     +};
>     +
>     +static const struct ts_dmi_data estar_beauty_hd_data = {
>     +       .acpi_name      = "GDIX1001:00",
>     +       .properties     = estar_beauty_hd_props,
>     +};
>     +
>      static const struct property_entry gp_electronic_t701_props[] = {
>             PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
>             PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
>     @@ -942,6 +952,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>                             DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
>                     },
>             },
>     +       {
>     +               /* Estar Beauty HD (MID 7316R) */
>     +               .driver_data = (void *)&estar_beauty_hd_data,
>     +               .matches = {
>     +                       DMI_MATCH(DMI_SYS_VENDOR, "Estar"),
>     +                       DMI_MATCH(DMI_PRODUCT_NAME, "eSTAR BEAUTY HD Intel Quad core"),
>     +               },
>     +       },
>             {
>                     /* GP-electronic T701 */
>                     .driver_data = (void *)&gp_electronic_t701_data,
>     -- 
>     2.28.0
> 

