Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6E12681670
	for <lists+linux-input@lfdr.de>; Mon, 30 Jan 2023 17:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236977AbjA3QbE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Jan 2023 11:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236058AbjA3Qa7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Jan 2023 11:30:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C790437F36
        for <linux-input@vger.kernel.org>; Mon, 30 Jan 2023 08:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675096208;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0gbchshCiCUzHhxwy/9PZo7zji5Ew4s8Bgxl9mssz+M=;
        b=Kq52tDToDkxehrjXgqwDJbC8Plv3xduP9s1iT3wzMNNFOUYyJ5f/38VR89w6DSKrHJgLhD
        aWGO0moy+QuPzD1xEe/Siiy5oPnGbXHoh0e/Miz//gxmtnIHqVX+2Q+Oh6elTFLOu5+mMT
        ZA3O+93dzjoY5+7BMa2XG6urFecOerE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-12-1B4leYQFP3uB1Gx7nrY5vQ-1; Mon, 30 Jan 2023 11:29:51 -0500
X-MC-Unique: 1B4leYQFP3uB1Gx7nrY5vQ-1
Received: by mail-yb1-f197.google.com with SMTP id i17-20020a25be91000000b0082663f3eecbso1566875ybk.2
        for <linux-input@vger.kernel.org>; Mon, 30 Jan 2023 08:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gbchshCiCUzHhxwy/9PZo7zji5Ew4s8Bgxl9mssz+M=;
        b=qhim7cQkvNQ0qbpzE3KhyGdoSYc91IaQ2sEdLzzjLizoz4YMH7Y6X5VcAX50Eu1fwd
         ucpmEmwUCPQ4vnIoO7QZFGK0LhMSQ9v/Zgyji/335rESC+IaSGfUmk6WMzQD5PVV2JIj
         r14sTzLXpgunAzLAw8w0Gy7poA4EpKOYsg52DUY+/nf8WTEq83q8XeHCCrewHLr+CYyH
         nmUQyu855dYOydymM3noWoQZRY+03l+TD/7Sr+RGH60TOtSEJVe2yaIKeJ5XnpemHrLw
         xSNgJRyeJqb5/zgFsM6elEyWg1bUMS+bVOifuKGwEdF57p0ZBnxD34CMeyBoOSVd4iUx
         OJJg==
X-Gm-Message-State: AO0yUKVcYq+dunczHllGG9i7dEK3tbpwNHEuoaLUshowAGMxXtNYuuNt
        9e6H6VVYg53WsOG7d9wCgEYHwL47eWYd2VOKxlidKjs8kEug23VkCakyO/uK/NF2FPkbxzGbPgR
        MQHsWZZ3Ph5wCt6Cuea06cnkuCvpfRW+8ASR/bR0=
X-Received: by 2002:a81:dce:0:b0:508:a938:b992 with SMTP id 197-20020a810dce000000b00508a938b992mr1953489ywn.184.1675096191267;
        Mon, 30 Jan 2023 08:29:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+R1cpa/mCT5wgq4Y3Z4w/Eqv9bCMmDb9SvKeaOCu6uht5aw0RRaKYPgJEKI++SFeqG6OF1TDshgEzAYyo7uS0=
X-Received: by 2002:a81:dce:0:b0:508:a938:b992 with SMTP id
 197-20020a810dce000000b00508a938b992mr1953482ywn.184.1675096191035; Mon, 30
 Jan 2023 08:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20230128202622.12676-1-kaehndan@gmail.com>
In-Reply-To: <20230128202622.12676-1-kaehndan@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 30 Jan 2023 17:29:40 +0100
Message-ID: <CAO-hwJKeG-mpHCvOyQhu5Yh0daLZxq7d8bVfwmi6W0VUQWmwHQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] DeviceTree Support for USB-HID Devices and CP2112
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Danny,

On Sat, Jan 28, 2023 at 9:26 PM Danny Kaehn <kaehndan@gmail.com> wrote:
>
> This patchset allows USB-HID devices to have DeviceTree bindings through sharing
> the USB of_node with the HID driver, and adds such a binding and driver
> implementation for the CP2112 USB to SMBus Bridge (which necessitated the
> USB-HID change). This change allows a CP2112 permanently attached in hardware to
> be described in DT and interoperate with other drivers, and exposed the threaded
> interrupt bug fixed in patch 0003.

That series is very interesting. I always wondered how I could declare
an I2C device attached to the CP2112 over USB. Ideally if you can make
this compatible with ACPI SSDT, that would be even better :) (one can
always dream).

>
> Plese correct if the assumption made that there is a 1:1 correlation between
> a USB device and its HID device is not always true. If so, patch 0002 would
> then need to be reworked.

I am not sure I understand patch 2 completely, but if your assumption
is that each struct usb_interface can have at most one hid device, it
seems that it is the case. However, nothing prevents another hid
driver to add one more hid device on top of that USB dev. For
instance, hid-logitech-dj does that: when it enumerates the devices
connected to the wireless receiver, it creates matching HID devices
with the parent being the current HID dev.

AFAICT, we already have DT enumeration for i2c-hid devices, so
probably your solution is correct. Though the DT enumeration in
i2c-hid-of.c relies on .of_match_table, which seems a little bit more
integrated than this series (but I don't know enough of DT
unfortunately).

So I personally won't push against that series, but I'd still like to
have a rough idea on what is missing in patch 2 if we consider that
your assumption might not always be the case.

Maybe (just random brain fart) we could have a separate usbhid-of.c in
the usbhid subdir that builds up the same OF matching that
i2c-hid-of.c is doing?

Cheers,
Benjamin

>
>
> Danny Kaehn (4):
>   dt-bindings: hid: Add CP2112 HID USB to SMBus Bridge
>   Share USB device devicetree node with child HID device
>   Fix CP2112 driver not registering GPIO IRQ chip as threaded
>   CP2112 Devicetree Support
>
>  .../bindings/hid/silabs,cp2112.yaml           | 82 +++++++++++++++++++
>  drivers/hid/hid-cp2112.c                      | 10 +++
>  drivers/hid/usbhid/hid-core.c                 |  2 +
>  3 files changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hid/silabs,cp2112.yaml
>
> --
> 2.25.1
>

