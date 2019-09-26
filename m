Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFF6CBFAF0
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2019 23:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbfIZVb0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Sep 2019 17:31:26 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28523 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725810AbfIZVb0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Sep 2019 17:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569533484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=go5myio+bZTqiLMTXJTfCDVNMeXnATH/bwF6BLUF+pU=;
        b=Mj8s59ael2TEOmKv4OzcdsoGiPOULhM0gScAAfaJUfl665p8auv2aGyxZfzzSCciQrBT/Z
        mbJXj0PsPG4y7mbaOGPFHPIiNQLzkftQFNBX+3oF/NMYnktC0WzEuI7Plh0sEQsljQIa6U
        460Pq4yO3k969u3OuBGvNuk6t6+7SwE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-7SN1eddcMKewfgd9UmluIA-1; Thu, 26 Sep 2019 17:31:17 -0400
Received: by mail-qk1-f198.google.com with SMTP id s14so551151qkg.12
        for <linux-input@vger.kernel.org>; Thu, 26 Sep 2019 14:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=go5myio+bZTqiLMTXJTfCDVNMeXnATH/bwF6BLUF+pU=;
        b=KNVnCMk+HUvGWaHacHIJKx+TxYr8O9JME9B2WfNmV3hcsWtENsJn+51mrsG5kbaato
         OiOvA2BExJN93/QmmbEWrB8EWxyrrJeXi+08dqrZUr6LXCt1vL8ujKbQ+zQmkMPyxz6q
         EMHov2qU1RhMdKbiSOPr0Coq9mXOo2+fwH3YgOZmjJTm8TOlRxU98aAEMpz0ih0rc9N/
         DDS1F7bC2538ErLwwAIgXXbyIwISHfeQmmpxogv7p5ZR4zb7Gd6SOXGFAkQeSu7vxiaz
         XasOtsAw42q/VAoWSe0Ftx+c6VwF+9b8taEs1CLds4NvmxxotQWrfCD2oJ/1tYso0VtG
         023Q==
X-Gm-Message-State: APjAAAWE6rYGE+2LQEeC3gvJga3k3lQXm3xQF++NicwuTUhI3oj9B4JR
        GhKCcQHCOvrambcmNarXC/GijFdlTuzWEK+qpPks5eyW8MYuj7554io6JdNLwLivN6AH0IzqidW
        6pa/5FQtKGdZUQYXGEJcoUnPgViwFwzZgOr9gVSQ=
X-Received: by 2002:a05:620a:13d9:: with SMTP id g25mr1161121qkl.230.1569533477306;
        Thu, 26 Sep 2019 14:31:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqww/Be/QIQogo2vqVfou2YVrZgisI+ZjThXd9N/qyxFFovYT7zAlkuUu75bXVxSP/SXm4D0Z2fwn4MtKkTsP8Y=
X-Received: by 2002:a05:620a:13d9:: with SMTP id g25mr1161088qkl.230.1569533477022;
 Thu, 26 Sep 2019 14:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <fe524920-8476-540c-1b58-52c3b8b6a92d@gmail.com>
 <56C50F68-7DD6-443D-9034-5FEA19C373B7@canonical.com> <CAO-hwJJVrxuNHZE5zi-2CnTRCie6gCQOgG3jCtB=gBPkYNoptw@mail.gmail.com>
 <25BA7250-B232-4D26-ABDA-5CB99FF73768@canonical.com>
In-Reply-To: <25BA7250-B232-4D26-ABDA-5CB99FF73768@canonical.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 26 Sep 2019 23:31:04 +0200
Message-ID: <CAO-hwJLjLxTsje-uur8GY0cwJj-mC2rVL9hbdnNq9OrN=dYf6A@mail.gmail.com>
Subject: Re: Elantech touchpad breaks with older HP model
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     rility <rility3@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
X-MC-Unique: 7SN1eddcMKewfgd9UmluIA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Sep 26, 2019 at 3:16 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> [+cc KT Liao]

Well, KT left emc a few weeks (months?) ago. We do have another
contact who took over KT's work but I am a little bit hesitant pulling
his email there as I don't know if this person wants to stay in the
shadow or not.

>
> Hi Benjamin,
>
> > On Sep 26, 2019, at 18:01, Benjamin Tissoires <benjamin.tissoires@redha=
t.com> wrote:
> >
> > Hi Kai-Heng,
> >
> > On Wed, Sep 25, 2019 at 8:08 PM Kai-Heng Feng
> > <kai.heng.feng@canonical.com> wrote:
> >>
> >> [+cc Benjamin, linux-input]
> >>
> >> Hi Benjamin,
> >>
> >>> On Sep 26, 2019, at 00:00, rility <rility3@gmail.com> wrote:
> >>>
> >>> Hi Dmitry and Feng,
> >>>
> >>> I'm seeming to have some problem using my ELAN touchpad with later ke=
rnel with this commit [Input: elantech - enable SMBus on new (2018+) system=
s](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/=
drivers/input/mouse?id=3D883a2a80f79ca5c0c105605fafabd1f3df99b34c).
> >>>
> >>> This ELAN touchpad fails to be detected. It's on a 2016 HP laptop mod=
el 340 G3, though I did update the BIOS this year.
> >>
> >> So using dmi_get_bios_year() as manufacturing date is inaccurate.
> >
> > indeed. Not something I expected. But it kind of makes sense now :/
> >
> >>
> >>>
> >>> I don't really have the first knowledge of kernel development, and am=
 wondering if you can help out.
> >>>
> >>> ```
> >>>
> >>> With the latest 5.4.rc0
> >>>
> >>>
> >>>
> >>> ~ sudo dmesg | grep elan -i
> >>>
> >>> [    4.127896] psmouse serio1: elantech: assuming hardware version 4 =
(with firmware version 0x5e0f01)
> >>> [    4.142887] psmouse serio1: elantech: Synaptics capabilities query=
 result 0x70, 0x16, 0x0a.
> >>> [    4.158366] psmouse serio1: elantech: Elan sample query result 0b,=
 01, a7
> >>> [    4.191200] psmouse serio1: elantech: Trying to set up SMBus acces=
s
> >>> [    4.198630] elan_i2c 0-0015: 0-0015 supply vcc not found, using du=
mmy regulator
> >>> [    4.202104] elan_i2c 0-0015: failed to get product ID: -6
> >>> [    4.243786] elan_i2c 0-0015: failed to get product ID: -71
> >>> [    4.287117] elan_i2c 0-0015: failed to get product ID: -71
> >>> [    4.322734] elan_i2c: probe of 0-0015 failed with error -71
> >>
> >> Do you think it=E2=80=99s a bug we should work on, or we should simply=
 blacklist affected touchpad?
> >>
> >
> > It *really* looks like the touchpad is not supposed to be used under
> > SMBus. There is however a (non successful) patch I wrote for an other
> > HP laptop at https://bugzilla.kernel.org/show_bug.cgi?id=3D204771
> >
> > Rility, can you apply
> > v2-0001-Input-elan-also-provide-the-product-ID-from-PS-2-.patch in the
> > bug report above and report if this helps?
>
> Hopefully your patch can help.

As answered by Rility, it doesn't :(

>
> >
> > Blacklist IMO is never going to scale, because even if BIOS updates
> > after a couple of years are not that common, but that also means we
> > accidentally break touchpads randomly,
>
> I don=E2=80=99t think whitelist can scale in this case. There are several=
 HP laptops need to use SMBus instead of psmouse.

Either we find a generic way, either we will need a list. Having a
blacklist means that we need to break existing working devices, wait
for the users to report it, fix it, and wait for the distros to
backport the fix (or get it in stable), while having a whitelist means
we would only fix the devices that are not working, and keep those
that are somehow working in PS/2 in a usable state.
So yes, I would rather have a whitelist here.

And given the tests results here and the fact that the laptop in
https://bugzilla.kernel.org/show_bug.cgi?id=3D204771 is from 2017, I am
really leaning towards a revert of the patch ( and a backport to 5.3
stable).

>
> >
> > If the patch mentioned above doesn't really helps, I would rather
> > revert the commit introducing the dmi_get_bios_year() in elantech.c,
> > and add manually the devices that can be tested one by one.
>
> KT, can you share how Windows driver handles this situation? Is a blackli=
st or a whitelist in use?

I am honestly not sure this is a question Elan can answer. Given that
all the touchpad manufacturers ship a .inf in the Windows driver, they
*always* rely on a whitelist (because they know in advance which chip
needs what). I might be wrong and I would happily be proven to be
wrong.

Cheers,
Benjamin

>
> Kai-Heng
>
> >
> > Cheers,
> > Benjamin
> >
> >> Kai-Heng
> >>
> >>>
> >>>
> >>>
> >>>
> >>> While with the previous version of kernel.
> >>>
> >>>
> >>> ~ sudo dmesg | grep elan -i
> >>> [    4.193067] psmouse serio1: elantech: assuming hardware version 4 =
(with firmware version 0x5e0f01)
> >>> [    4.208056] psmouse serio1: elantech: Synaptics capabilities query=
 result 0x70, 0x16, 0x0a.
> >>> [    4.223009] psmouse serio1: elantech: Elan sample query result 0b,=
 01, a7
> >>> [    4.302361] input: ETPS/2 Elantech Touchpad as /devices/platform/i=
8042/serio1/input/input27
> >>>
> >>>
> >>>
> >>> ~ lspci
> >>> 00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th=
 Gen Core Processor Host Bridge/DRAM Registers (rev 08)
> >>> 00:02.0 VGA compatible controller: Intel Corporation Skylake GT2 [HD =
Graphics 520] (rev 07)
> >>> 00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200 =
v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 08)
> >>> 00:14.0 USB controller: Intel Corporation Sunrise Point-LP USB 3.0 xH=
CI Controller (rev 21)
> >>> 00:14.2 Signal processing controller: Intel Corporation Sunrise Point=
-LP Thermal subsystem (rev 21)
> >>> 00:16.0 Communication controller: Intel Corporation Sunrise Point-LP =
CSME HECI #1 (rev 21)
> >>> 00:17.0 SATA controller: Intel Corporation Sunrise Point-LP SATA Cont=
roller [AHCI mode] (rev 21)
> >>> 00:1c.0 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Ro=
ot Port #1 (rev f1)
> >>> 00:1c.4 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Ro=
ot Port #5 (rev f1)
> >>> 00:1c.5 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Ro=
ot Port #6 (rev f1)
> >>> 00:1f.0 ISA bridge: Intel Corporation Sunrise Point-LP LPC Controller=
 (rev 21)
> >>> 00:1f.2 Memory controller: Intel Corporation Sunrise Point-LP PMC (re=
v 21)
> >>> 00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (re=
v 21)
> >>> 00:1f.4 SMBus: Intel Corporation Sunrise Point-LP SMBus (rev 21)
> >>>
> >>>
> >>> ```
> >>>
> >>>
> >>>
> >>> Grateful,
> >>>
> >>> Rility
>

