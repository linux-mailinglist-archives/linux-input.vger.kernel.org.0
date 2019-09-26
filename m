Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22996BFAE1
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2019 23:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfIZVQJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Sep 2019 17:16:09 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24610 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725905AbfIZVQI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Sep 2019 17:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569532567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tLs6zVnMzEX/RphrWLcG/UGH0mHt/DISCwJ7FoXlCZs=;
        b=Z+FwHuT0h7+53l4s3IQA6YRfamwOUgdiOqs9KCIOUkfxGHLCGgaFJsJhBsKg4D3y654MzT
        Hkq4iKTT2ABwSb3wjcel73FFsqYsQfNuFJFYJJO4NGGSq2wn57u11oCIPP7EyT1XPQTk3w
        P7Jd7e9MBRdMhmE4rKi+E27q2cfM0WY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-fi4HuXw3M3Oe8JXKYW5KXA-1; Thu, 26 Sep 2019 17:16:05 -0400
Received: by mail-qk1-f198.google.com with SMTP id v143so490671qka.21
        for <linux-input@vger.kernel.org>; Thu, 26 Sep 2019 14:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tLs6zVnMzEX/RphrWLcG/UGH0mHt/DISCwJ7FoXlCZs=;
        b=JV2faVJZPJYD7ShWwDmyp6cq7DornOQHAPwXwl2+Hst2e4TlQ9pjkSEiB4CtV4kDii
         2V5BPpZPligXOlJj3bWMFToNjAJE9qLVWyGiUvDygftV/YD+KYKVG2ogpYpanVeWLOj+
         Lzb0l+uf2hwtdEBhvntjHHPHv1wuB+0SX7jSW1tze8kMgVAl4L2lWqeiyWNOyk2O9xOF
         WyCy5RHE0HxjgFoUrniou0zWL5XZKCwJpuuxgvBIc3q4Kn1on97p/8HoWzb4+43yb3Mo
         xdUTGFDl0zBjxyJYx/5C8rd/90LRXMRY+jvB/JvpU0tNOBU+t5oN5jfR0C8qDIhTUoL9
         bDDA==
X-Gm-Message-State: APjAAAV+YTfxrcUJCW3NmEKXvTftaOem3uH/B68wCq0Hbw14O3UJge6G
        pYAS4KCncZ0bHzEHMpm8dftbF7IE3O4hUC6xpmqkgaeHkMSfFxySGbmv3TvhZUC3ljaRmZmexEk
        XLs6KW7oBQ45wsuZwvfATPR/7rwEZLfuSYQ1JqKs=
X-Received: by 2002:ac8:1194:: with SMTP id d20mr6445905qtj.294.1569532565149;
        Thu, 26 Sep 2019 14:16:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwa+byu3dHMVkzl2UsgXLCFrknzHlSgCu2PICTxIf8hV0XqARBglXGtOrtBQB9vzcEl8JsRwyPBFcVY1F/cRtc=
X-Received: by 2002:ac8:1194:: with SMTP id d20mr6445866qtj.294.1569532564714;
 Thu, 26 Sep 2019 14:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <fe524920-8476-540c-1b58-52c3b8b6a92d@gmail.com>
 <56C50F68-7DD6-443D-9034-5FEA19C373B7@canonical.com> <CAO-hwJJVrxuNHZE5zi-2CnTRCie6gCQOgG3jCtB=gBPkYNoptw@mail.gmail.com>
 <c8b04a3e-22e2-bc1f-bec2-24e7f2d10083@gmail.com>
In-Reply-To: <c8b04a3e-22e2-bc1f-bec2-24e7f2d10083@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 26 Sep 2019 23:15:53 +0200
Message-ID: <CAO-hwJKhexNrNTejpv7H57SUzBmmADNF0VYOVVO-Teh8yVtacQ@mail.gmail.com>
Subject: Re: Elantech touchpad breaks with older HP model
To:     rility <rility3@gmail.com>
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
X-MC-Unique: fi4HuXw3M3Oe8JXKYW5KXA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 26, 2019 at 5:42 PM rility <rility3@gmail.com> wrote:
>
>
> On 9/26/19 6:01 PM, Benjamin Tissoires wrote:
> > Hi Kai-Heng,
> >
> > On Wed, Sep 25, 2019 at 8:08 PM Kai-Heng Feng
> > <kai.heng.feng@canonical.com> wrote:
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
> >> So using dmi_get_bios_year() as manufacturing date is inaccurate.
> > indeed. Not something I expected. But it kind of makes sense now :/
> >
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
> >> Do you think it=E2=80=99s a bug we should work on, or we should simply=
 blacklist affected touchpad?
> >>
> > It *really* looks like the touchpad is not supposed to be used under
> > SMBus. There is however a (non successful) patch I wrote for an other
> > HP laptop at https://bugzilla.kernel.org/show_bug.cgi?id=3D204771
> >
> > Rility, can you apply
> > v2-0001-Input-elan-also-provide-the-product-ID-from-PS-2-.patch in the
> > bug report above and report if this helps?
>
> I tested the patch applied on 5.4 and the touchpad still fails to start.
>
> The logs are similar.
>
> ~ sudo dmesg | grep elan -i
> [    4.191687] psmouse serio1: elantech: assuming hardware version 4
> (with firmware version 0x5e0f01)
> [    4.206565] psmouse serio1: elantech: Synaptics capabilities query
> result 0x70, 0x16, 0x0a.
> [    4.221495] psmouse serio1: elantech: Elan sample query result 0b, 01,=
 a7
> [    4.251876] psmouse serio1: elantech: Trying to set up SMBus access
> [    4.310231] elan_i2c 0-0015: 0-0015 supply vcc not found, using dummy
> regulator
> [    4.320552] elan_i2c 0-0015: failed to get product ID: -71
> [    4.365460] elan_i2c 0-0015: failed to get product ID: -71
> [    4.411115] elan_i2c 0-0015: failed to get product ID: -71
> [    4.449716] elan_i2c: probe of 0-0015 failed with error -71

Thanks a lot for the *very* fast test :)

So you are definitively in the same situation than the kernel BZ I
mentioned. And AFAICT in the kernel BZ the laptop was manufactured in
2017, which would match the fact that the dmi_get_bios_date() call is
inaccurate for what we want to do.

If you have a few cycle to spare, it would be interesting to see that
you also can't enable the touchpad with my second patch applied on top
of the first (the one called
0001-WIP-Input-elan_i2c-disable-all-SMBus-calls-in-probe.patch in the
kernel BZ). But I honestly thing this would just confirm what we
discovered already: your touchpad is not compatible with the current
elan_i2c driver.

Cheers,
Benjamin


>
> Rility
>
> > Blacklist IMO is never going to scale, because even if BIOS updates
> > after a couple of years are not that common, but that also means we
> > accidentally break touchpads randomly,
> >
> > If the patch mentioned above doesn't really helps, I would rather
> > revert the commit introducing the dmi_get_bios_year() in elantech.c,
> > and add manually the devices that can be tested one by one.
> >
> > Cheers,
> > Benjamin
> >
> >> Kai-Heng
> >>
> >>
> >>
> >> While with the previous version of kernel.
> >>
> >>
> >> ~ sudo dmesg | grep elan -i
> >> [    4.193067] psmouse serio1: elantech: assuming hardware version 4 (=
with firmware version 0x5e0f01)
> >> [    4.208056] psmouse serio1: elantech: Synaptics capabilities query =
result 0x70, 0x16, 0x0a.
> >> [    4.223009] psmouse serio1: elantech: Elan sample query result 0b, =
01, a7
> >> [    4.302361] input: ETPS/2 Elantech Touchpad as /devices/platform/i8=
042/serio1/input/input27
> >>
> >>
> >>
> >> ~ lspci
> >> 00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th =
Gen Core Processor Host Bridge/DRAM Registers (rev 08)
> >> 00:02.0 VGA compatible controller: Intel Corporation Skylake GT2 [HD G=
raphics 520] (rev 07)
> >> 00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200 v=
5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 08)
> >> 00:14.0 USB controller: Intel Corporation Sunrise Point-LP USB 3.0 xHC=
I Controller (rev 21)
> >> 00:14.2 Signal processing controller: Intel Corporation Sunrise Point-=
LP Thermal subsystem (rev 21)
> >> 00:16.0 Communication controller: Intel Corporation Sunrise Point-LP C=
SME HECI #1 (rev 21)
> >> 00:17.0 SATA controller: Intel Corporation Sunrise Point-LP SATA Contr=
oller [AHCI mode] (rev 21)
> >> 00:1c.0 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Roo=
t Port #1 (rev f1)
> >> 00:1c.4 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Roo=
t Port #5 (rev f1)
> >> 00:1c.5 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Roo=
t Port #6 (rev f1)
> >> 00:1f.0 ISA bridge: Intel Corporation Sunrise Point-LP LPC Controller =
(rev 21)
> >> 00:1f.2 Memory controller: Intel Corporation Sunrise Point-LP PMC (rev=
 21)
> >> 00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev=
 21)
> >> 00:1f.4 SMBus: Intel Corporation Sunrise Point-LP SMBus (rev 21)
> >>
> >> ```
> >>
> >> Grateful,
> >>
> >> Rility
> >>

