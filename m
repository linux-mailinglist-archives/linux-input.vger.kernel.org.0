Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 662CBBEF2C
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2019 12:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfIZKBx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Sep 2019 06:01:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60633 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725806AbfIZKBx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Sep 2019 06:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569492112;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wFaPUsYwstwy/LZ8vnIKTAOD3j1lFg8F7K/1+A9k2tc=;
        b=QZicYujlysCQpCAXfb3CghJRVq6WPxQOAXY5m4PYXipXr4Vvux5wHp44HSLkfnQd9y8jaI
        KlVmt550PAa4KRBWVTvJwIe8CZU82R3k6Gu+NIUepx8HQWw1cSDOrLqh5FGWlXTR08qdcx
        MN/A7eG725tE6IfUD6uz6dCvprDVCL0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262--BWQ142HNDeb2QAs7Gk0sQ-1; Thu, 26 Sep 2019 06:01:50 -0400
Received: by mail-qk1-f199.google.com with SMTP id b67so1850492qkc.1
        for <linux-input@vger.kernel.org>; Thu, 26 Sep 2019 03:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wFaPUsYwstwy/LZ8vnIKTAOD3j1lFg8F7K/1+A9k2tc=;
        b=V6UnkGLtopeTl4q9FyVhEc7CIoo77zuwPWlEJuuCHCgoLvK1/D08bZ6E17a1vakFrZ
         N+qgB64TaAs8iMHZoo1AxGLjDYDe8F8Ee2D2TnpFpX92ZSl+ZY8z40cY6TzAxPqv/8nu
         Ay+AK5YGTBrpVE+9y0Gd/93F6zUgzVEg4NpIBb345Ctk6TBP6APckPgs/Zjv/+0mbgn8
         3K+/gaiaWpLAI+eOQlCqq65XyQQ40rthdxuXOW80p86zoHaH5DX4h0MCkSK3jazvXGTd
         wvmlnyHLoUfdjPHsDBTHwbJjOzun5ghSeBjJ4IgVrbmD7sPq7aqSF80FqgVrQGa/4CpO
         Ncjw==
X-Gm-Message-State: APjAAAVvTLzq00+lreiPV750WeQx4X03DVDvM9n6fX/XVFO/HiFCldz8
        WDHz5edXuwmS4Tfp4Q8SUeJrQND57VQ5tVKM1+tUghgBBFQgwSgX4hdlYN2RgTTO8sWnRvw0+8p
        hFqDE6BilGVOOCua5nnXwKnuzYrMwF4X7H0poP+M=
X-Received: by 2002:ac8:3059:: with SMTP id g25mr2961369qte.154.1569492108704;
        Thu, 26 Sep 2019 03:01:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzl9+2wK7BkhsDwMaN6BLAF3ZqVxIxoPtBDiX0YLw4oy3t6dy6MPwAQaKFRtWNw2JZzpznMHE98X+oozwyVovk=
X-Received: by 2002:ac8:3059:: with SMTP id g25mr2961235qte.154.1569492107028;
 Thu, 26 Sep 2019 03:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <fe524920-8476-540c-1b58-52c3b8b6a92d@gmail.com> <56C50F68-7DD6-443D-9034-5FEA19C373B7@canonical.com>
In-Reply-To: <56C50F68-7DD6-443D-9034-5FEA19C373B7@canonical.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 26 Sep 2019 12:01:35 +0200
Message-ID: <CAO-hwJJVrxuNHZE5zi-2CnTRCie6gCQOgG3jCtB=gBPkYNoptw@mail.gmail.com>
Subject: Re: Elantech touchpad breaks with older HP model
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     rility <rility3@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
X-MC-Unique: -BWQ142HNDeb2QAs7Gk0sQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kai-Heng,

On Wed, Sep 25, 2019 at 8:08 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> [+cc Benjamin, linux-input]
>
> Hi Benjamin,
>
> > On Sep 26, 2019, at 00:00, rility <rility3@gmail.com> wrote:
> >
> > Hi Dmitry and Feng,
> >
> > I'm seeming to have some problem using my ELAN touchpad with later kern=
el with this commit [Input: elantech - enable SMBus on new (2018+) systems]=
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/dr=
ivers/input/mouse?id=3D883a2a80f79ca5c0c105605fafabd1f3df99b34c).
> >
> > This ELAN touchpad fails to be detected. It's on a 2016 HP laptop model=
 340 G3, though I did update the BIOS this year.
>
> So using dmi_get_bios_year() as manufacturing date is inaccurate.

indeed. Not something I expected. But it kind of makes sense now :/

>
> >
> > I don't really have the first knowledge of kernel development, and am w=
ondering if you can help out.
> >
> > ```
> >
> > With the latest 5.4.rc0
> >
> >
> >
> > ~ sudo dmesg | grep elan -i
> >
> > [    4.127896] psmouse serio1: elantech: assuming hardware version 4 (w=
ith firmware version 0x5e0f01)
> > [    4.142887] psmouse serio1: elantech: Synaptics capabilities query r=
esult 0x70, 0x16, 0x0a.
> > [    4.158366] psmouse serio1: elantech: Elan sample query result 0b, 0=
1, a7
> > [    4.191200] psmouse serio1: elantech: Trying to set up SMBus access
> > [    4.198630] elan_i2c 0-0015: 0-0015 supply vcc not found, using dumm=
y regulator
> > [    4.202104] elan_i2c 0-0015: failed to get product ID: -6
> > [    4.243786] elan_i2c 0-0015: failed to get product ID: -71
> > [    4.287117] elan_i2c 0-0015: failed to get product ID: -71
> > [    4.322734] elan_i2c: probe of 0-0015 failed with error -71
>
> Do you think it=E2=80=99s a bug we should work on, or we should simply bl=
acklist affected touchpad?
>

It *really* looks like the touchpad is not supposed to be used under
SMBus. There is however a (non successful) patch I wrote for an other
HP laptop at https://bugzilla.kernel.org/show_bug.cgi?id=3D204771

Rility, can you apply
v2-0001-Input-elan-also-provide-the-product-ID-from-PS-2-.patch in the
bug report above and report if this helps?

Blacklist IMO is never going to scale, because even if BIOS updates
after a couple of years are not that common, but that also means we
accidentally break touchpads randomly,

If the patch mentioned above doesn't really helps, I would rather
revert the commit introducing the dmi_get_bios_year() in elantech.c,
and add manually the devices that can be tested one by one.

Cheers,
Benjamin

> Kai-Heng
>
> >
> >
> >
> >
> > While with the previous version of kernel.
> >
> >
> > ~ sudo dmesg | grep elan -i
> > [    4.193067] psmouse serio1: elantech: assuming hardware version 4 (w=
ith firmware version 0x5e0f01)
> > [    4.208056] psmouse serio1: elantech: Synaptics capabilities query r=
esult 0x70, 0x16, 0x0a.
> > [    4.223009] psmouse serio1: elantech: Elan sample query result 0b, 0=
1, a7
> > [    4.302361] input: ETPS/2 Elantech Touchpad as /devices/platform/i80=
42/serio1/input/input27
> >
> >
> >
> > ~ lspci
> > 00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th G=
en Core Processor Host Bridge/DRAM Registers (rev 08)
> > 00:02.0 VGA compatible controller: Intel Corporation Skylake GT2 [HD Gr=
aphics 520] (rev 07)
> > 00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200 v5=
/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 08)
> > 00:14.0 USB controller: Intel Corporation Sunrise Point-LP USB 3.0 xHCI=
 Controller (rev 21)
> > 00:14.2 Signal processing controller: Intel Corporation Sunrise Point-L=
P Thermal subsystem (rev 21)
> > 00:16.0 Communication controller: Intel Corporation Sunrise Point-LP CS=
ME HECI #1 (rev 21)
> > 00:17.0 SATA controller: Intel Corporation Sunrise Point-LP SATA Contro=
ller [AHCI mode] (rev 21)
> > 00:1c.0 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root=
 Port #1 (rev f1)
> > 00:1c.4 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root=
 Port #5 (rev f1)
> > 00:1c.5 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root=
 Port #6 (rev f1)
> > 00:1f.0 ISA bridge: Intel Corporation Sunrise Point-LP LPC Controller (=
rev 21)
> > 00:1f.2 Memory controller: Intel Corporation Sunrise Point-LP PMC (rev =
21)
> > 00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev =
21)
> > 00:1f.4 SMBus: Intel Corporation Sunrise Point-LP SMBus (rev 21)
> >
> >
> > ```
> >
> >
> >
> > Grateful,
> >
> > Rility
> >
>

