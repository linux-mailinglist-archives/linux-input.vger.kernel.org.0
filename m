Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDA04E3A5A
	for <lists+linux-input@lfdr.de>; Tue, 22 Mar 2022 09:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbiCVISG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Mar 2022 04:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbiCVISE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Mar 2022 04:18:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 70501517CA
        for <linux-input@vger.kernel.org>; Tue, 22 Mar 2022 01:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647936996;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jG/7zpqyUAloOmc0F0feSU4evhIguB10duxCLGZT2vY=;
        b=Bn098LkX+dGPJH/gO5nJ55mcE6tC184i7ETizy30Sh3mgXSaKQlkEjapPf6B8MdRCjXs3/
        7JOobmeVk+3tqNWVRBft31/Xcj9wYpohvG8PmRgMiwqvHNXNAtqU63OXCfaZeBdD5YR6Rp
        Cr3KT27kx99Zqy7+w6RWy6yDFcxDFdw=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-KwAEAT87P-S6m95n8a0m5A-1; Tue, 22 Mar 2022 04:16:29 -0400
X-MC-Unique: KwAEAT87P-S6m95n8a0m5A-1
Received: by mail-pg1-f200.google.com with SMTP id bj8-20020a056a02018800b0035ec8c16f0bso8469071pgb.11
        for <linux-input@vger.kernel.org>; Tue, 22 Mar 2022 01:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jG/7zpqyUAloOmc0F0feSU4evhIguB10duxCLGZT2vY=;
        b=RmOh0txj9ZuMgH6Afkr1vk9iYvYQobiWo+5A/nh7q+7vtbKbrdN4fzmCDZP3vMCCJJ
         hEIOlOTM7oB4V1cW+3cx8ctzMHhhhlXXx4G042vrbs4RMhJc78m4MQRIzp3SDqxsf9P6
         DPrcy2Bfvj17FXup9YmBzEgso2pzJ9YujID/6+x6MjWvLxI8yJZBBzKV/AIxkVLBOmeQ
         VHZLYXZzDEyTCSleTuAP9ywDHgvrGc9DpxhcZek6N/lsDC809WYG3QMXJeZqYXaP/6B/
         lx9+fKwLOA9vCwlHbTOoUqmOVU5pGCvv30gVtMZaH2KbT/Ptd910I88dp9UYazO2c2fI
         qYvg==
X-Gm-Message-State: AOAM5311cPu8lG1fwf3tPb5enbM/7JYx6cyh+isgXgk4/3Z+b11svLIq
        nhLvvqfCSzvdp3i12STcdZGNA+U6I/eBevr2Zty946v9+Od9nFxubMtSg4uDiR4+rWZv3JCE1oS
        TArDhomiZ0aZtjPeQdnoI6uN3T5VoOhVsXYNf2V8=
X-Received: by 2002:a17:90b:4c44:b0:1c7:109c:b419 with SMTP id np4-20020a17090b4c4400b001c7109cb419mr3574766pjb.113.1647936988009;
        Tue, 22 Mar 2022 01:16:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlBPARbW3RIStjMj1Eu5lkWOKd8H1gRjPyfpy7+IGnlWC2jtvt7cEJcRlSL0ZUm93GjwJ1RZA+QGyu/aDmb5w=
X-Received: by 2002:a17:90b:4c44:b0:1c7:109c:b419 with SMTP id
 np4-20020a17090b4c4400b001c7109cb419mr3574747pjb.113.1647936987704; Tue, 22
 Mar 2022 01:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAB4aORX8BYLL9xY6XiC1P_+J4o2LQrXV8x_-3gdU1PJsdx+-aQ@mail.gmail.com>
In-Reply-To: <CAB4aORX8BYLL9xY6XiC1P_+J4o2LQrXV8x_-3gdU1PJsdx+-aQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 22 Mar 2022 09:16:16 +0100
Message-ID: <CAO-hwJ+OgLMkAy+Ms1xgHz3RTYxS+5LCSSP3njju+joTYWZMqA@mail.gmail.com>
Subject: Re: HID device initiated reset and need for device reconfiguration in
 linux driver
To:     Angela Czubak <acz@semihalf.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Angela,

On Mon, Mar 21, 2022 at 10:05 PM Angela Czubak <acz@semihalf.com> wrote:
>
> Hi Dmitry, Hi Benjamin,
>
> I am wondering if there is some mechanism already present in the linux
> kernel that would trigger
> some (re)configration process once a (device initiated?) reset has
> been detected for a HID device.
>
> My precise scenario is a case in which a haptic device decides to
> reset itself for some reason
> after it has been already probed. The default device mode is autonomous mode.
> However, since I would like to add kernel support, the driver itself
> would believe the device is
> in manual mode, and either it would generate output reports itself or
> would allow the user space
> to do so.
> This might result in doubled haptic feedback (from the device itself
> and the kernel/user initiated one).
>
> I can see that in drivers/hid/i2c-hid/i2c-hid-core.c that there is a
> point where we realise that a reset
> has happened (interrupt handler case where response size is actually
> 0). I would guess it could
> be a good place to issue some callback that would trigger all
> necessary reconfiguration (in my case
> it would be putting the device back into manual mode).
> I suppose we could add something like 'int (*reset)(struct hid_device
> *hdev)' to 'struct hid_driver'
> definition, then set it if applicable in a relevant hid-* driver, so
> that we could issue it in case of reset,
> specifically the device initiated reset.
>
> It does not seem a problem specific to haptic devices, so I am
> wondering if that would be a good
> approach, or, perhaps, there is some kind of already existing
> workaround for such situations.

FWIW, we already had a similar-ish discussion about that while
reviewing the v1 of spi-hid [0].

Basically, it seems that spi-hid devices are seeing more of those
device initiated reset, and that something needs to be done.
However, in this very specific use case, all that matters was to reset
the device, but nothing else was required (the device was already in
the correct mode).

So we decided to postpone the decision/implementation.

Now, it definitely makes sense for haptics devices to be notified
about such resets, because you enter in some inconsistent state.

Your approach of adding a new callback to struct hid_driver is the
correct one IMO, and we never implemented it until now because we
never had a strong need for it.
I think this only matters for I2C and SPI devices.
AFAICT, USB or Bluetooth devices would simply completely
remove/recreate the device in the rare cases where this happens. But
the discussions around SPI makes me think that it is way more common
in the I2C and SPI cases, so reconnecting the device is rather brutal.

Cheers,
Benjamin

>
> Any advice would be welcome :)
>
> Regards,
> Angela
>

[0] https://lore.kernel.org/linux-input/CAO-hwJLVMK9Vh9za70uFzimXv444HC5az_1Jr4ut6BDA+XSfYA@mail.gmail.com/#r

