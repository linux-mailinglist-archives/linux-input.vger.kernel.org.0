Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B5F61F133
	for <lists+linux-input@lfdr.de>; Mon,  7 Nov 2022 11:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbiKGKxk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Nov 2022 05:53:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbiKGKxj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Nov 2022 05:53:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA89F9
        for <linux-input@vger.kernel.org>; Mon,  7 Nov 2022 02:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667818369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0KEIcXE1Bk7JT1eUeHzPJb/iDt4LEbOSG6wynI8waEE=;
        b=Nt2Fg6LXTEH7z4UNZxbQCl7haXY4Y2lX3n/TFE6tS09GRt+FCJtmWyC35zwG50RdNnRaS6
        YeLouijBaqcMWwq6tdu4+Og9R7RaJ82z4SKJ/Uq5DH/+A08EtWQifQy/N/0vcYCO/EKjkz
        HbMcKHDoA4zb2Umq/SBxXABRso/Gieg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-l4WcjFzGOZORF5c1oSRM1Q-1; Mon, 07 Nov 2022 05:52:48 -0500
X-MC-Unique: l4WcjFzGOZORF5c1oSRM1Q-1
Received: by mail-lj1-f198.google.com with SMTP id s17-20020a2e98d1000000b002771cfb868eso3833146ljj.5
        for <linux-input@vger.kernel.org>; Mon, 07 Nov 2022 02:52:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KEIcXE1Bk7JT1eUeHzPJb/iDt4LEbOSG6wynI8waEE=;
        b=OOED25ycrQDn/MFgEkeW1sKP/bxnayaqwV9bhAaq21hKA/8eu4U5wKeGEQxX/eRoJ4
         /qCArBSDYMlicFdPYfq0XhmYEATjVlVp389z049mvlqAghI3rHmardAwOIWWdVug5KK9
         vP02LGCypiCsTYJgpgb5pU9eQ64axAJG+3aMqfmNNwFWEZ/Y4JodITnxyQPxTlw9km9h
         J/MD3+GYT/lEl17N8/4qRVBLwfaricHyIIOffGaYCaQSqpi3t37AD7aPeSG4nOQqEiDq
         jq4ubekTlV40NMVwWeocUroxiTbTQ3wlcJZ43ffD66bASn+nzWwJMQsle49hDl7RwInH
         PTGw==
X-Gm-Message-State: ACrzQf0sVAKR7qWL7sNqEpRgBa/cETbRObmZ+hOpII/nnqOV1IqA5/1n
        6C3E7qx72LElzjbKXzkevspmkICTItqK1rbZejOq7vqH9iQt7iyf8BXeZT9jnruSAQiztFyILMr
        ycYQJwrRxCGpuJKBOeIJVG1asIYFt2VT8a415tko=
X-Received: by 2002:a05:6512:968:b0:4ab:bfeb:d4f3 with SMTP id v8-20020a056512096800b004abbfebd4f3mr18587160lft.630.1667818366192;
        Mon, 07 Nov 2022 02:52:46 -0800 (PST)
X-Google-Smtp-Source: AMsMyM42oJ6uxeQAjEnMGuWWadltRJUAaqchCSnC6FkBxCMSKnIlj/VPaRsbEpKTOF8d9E1Y42h9bbWiV8a+znMVmUo=
X-Received: by 2002:a05:6512:968:b0:4ab:bfeb:d4f3 with SMTP id
 v8-20020a056512096800b004abbfebd4f3mr18587152lft.630.1667818365937; Mon, 07
 Nov 2022 02:52:45 -0800 (PST)
MIME-Version: 1.0
References: <ae50236e-1ce8-b526-9c17-7bc0463ebb86@redhat.com>
In-Reply-To: <ae50236e-1ce8-b526-9c17-7bc0463ebb86@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 7 Nov 2022 11:52:34 +0100
Message-ID: <CAO-hwJJUdXb1iBN7AVushaJz9LawuaO5hP8GWKucWuxzDpnCTg@mail.gmail.com>
Subject: Re: Detecting if a laptop is using a i2c/smbus or a ps/2 attached touchpad?
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Manyi Li <limanyi@uniontech.com>
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

Hi Hans,

On Mon, Nov 7, 2022 at 11:10 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Benjamin, et. al.,
>
> I have just merged a patch which adds a couple of DMI quirks to disable
> the touchpad on/off functionality of the ideapad-laptop module on some models,
> because it is causing issues there.
>
> Patch:      https://lore.kernel.org/platform-driver-x86/20221018095323.14591-1-limanyi@uniontech.com/
> Discussion: https://lore.kernel.org/platform-driver-x86/fdceb6d2-c38c-e8ff-4c19-b01521ca46c0@redhat.com/
>
> Rather then using DMI quirks I would prefer to just disable it everywhere
> where a i2c-attached touchpad is used. Be it either one only attached to
> i2c, or one of the synaptics intertouch thingies. I'm still trying to
> figure out why the ideapad-laptop module's touchpad control (which
> uses the EC + enabling/disabling the i8042 aux-port) matters for
> i2c-attached touchpads at all, so I suspect that intertouch might be
> a part of it.
>
> So now I'm wondering if there is some nice way for the ideapad-laptop
> code to check if the touchpad is intertouch and/or if it is i2c-attached
> only ...
>
> Any ideas?

TL;DR: it's a complete mess.

For mostly UEFI/BIOS compatibility, all touchpads on modern laptops
have a PS/2 interface.

But then, most of the touchpads (and of course not all) can also use
I2C or SMBus to communicate.

And this is where things are bad:

- when using i2c-hid, there is a DT entry that enumerates the
touchpad, but sometimes the manufacturers like to reuse the same DT
and just enable/disable devices in it, so it's not easy to do.
In the i2c-hid case, the PS/2 node has no idea it is not used anymore,
and thus is kept up forever

- for touchpads using SMBus (on Intel platforms only currently), the
enumeration is done at the PS/2 level: there is a byte that says that
the touchpad supports another bus or not.
This is valid for both Synaptics, and Elan, as you figured out.

But in the SMBus case there are many cases where it is not working: if
the SMBus doesn't support Host Notify (AMD platforms), or if the
enumeration is not working because the touchpad is not happy, etc...

So again, in SMBus, we can not disable the PS/2 nodes, because there
is a high chance the touchpad will not work. Not to mention that the
specific bit to enable the touchpad might also be required when coming
back from suspend (not entirely sure though).

However, in the Synaptics SMbus case, we took a safer approach
(because the SMBus driver is not standard and sometimes breaks on new
hardware), so we are using the PnP ID to selectively enable the
devices (see smbus_pnp_ids[] in drivers/input/mouse/synaptics.c)

In the Elan case, if the touchpad exports the magic bit, we forward it
to SMBus as the driver is behaving better with new devices.

As a result, from user space, it's easier to know if the device uses
smbus/i2c, simply because you can enumerate all devices.
But from the kernel, either you have to look for the ACPI tables, and
hope that the I2C bus is correctly supported in the system, or you
have to talk over PS/2 and hope that the platform supports
HostNotify...

>
> Regards,
>
> Hans
>
> p.s.
>
> Is it possible that Elan touchpads use something similar to intertouch,
> or is that a synaptics thing only (under Linux)  ?
>

Yep, see above. If the touchpad says it can be driven through SMBus,
we forward it.

Cheers,
Benjamin

