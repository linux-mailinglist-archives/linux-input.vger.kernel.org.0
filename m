Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14152E71A2
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 16:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgL2PLr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 10:11:47 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:39687 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgL2PLq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 10:11:46 -0500
X-Greylist: delayed 168421 seconds by postgrey-1.27 at vger.kernel.org; Tue, 29 Dec 2020 10:11:44 EST
Date:   Tue, 29 Dec 2020 15:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609254663;
        bh=XSM9PwOX16dnP2aXHQZF2CvC5BxmrLpSnvGzD8u4+0Y=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=wEcA2k64Z9cAkNjJE/AXweLSZVuc7d2s2x7DYaH83Hi6E1P4/0Yv8M545S+fQyVS+
         VbVwzjydqlodvvcUx9h8++qJk3Xvas3YNMC3V2AuT/DpSDS4NoT9oD4lLQbxvweQ+/
         XPUZE0VaOKveeB6TLkZ3UxW7+ZSxATEj1Uojlo8M=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 13/13] HID: playstation: report DualSense hardware and firmware version.
Message-ID: <yne0QXip_EgCtHIReHhKV2hveYKw4ct6QlQbHSRDBaI0tfcaMEt7s_-fseNx7vho_x_x3nGeqbO_uueXvMkblw8VXx9hNXQ_vFug-rdVWWo=@protonmail.com>
In-Reply-To: <CANndSK=v53UMTLrV8YSho2FRJ9_ZAWer4SmiOC0RS_pvf-bwVQ@mail.gmail.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-14-roderick@gaikai.com> <Wrry37udGNtUwRvYnSoet8ychKwk8YeD9NTEIjkfIMtrSmCXOc9h4oLcm5Uq77JV1AIgvP13uwxvXYuNAQF0jO_ZVp2M932WAPKQB5VdYGc=@protonmail.com> <CANndSKn8xFGR3Y7x3rXxjhcNn89tt55o+RyvZkTp-aMzbF-JcA@mail.gmail.com> <CANndSKmch6bdv0N8qUFdAgKBqi50Y11kdK4EFm63xr4Kct5D=A@mail.gmail.com> <3lVD85P15aERBMBIFGdOJT7p4Y8XB0pZREzvTKNJ-OX-Wt7V_pkfwGzC1h_8xboI0UA18rXrh4Ye23kFVeF1udP8FjdGoi3dMlNiE74aCN8=@protonmail.com> <CANndSK=v53UMTLrV8YSho2FRJ9_ZAWer4SmiOC0RS_pvf-bwVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

2020. december 28., h=C3=A9tf=C5=91 23:45 keltez=C3=A9ssel, Roderick Colenb=
rander =C3=ADrta:

> On Sun, Dec 27, 2020 at 2:38 PM Barnab=C3=A1s P=C5=91cze pobrn@protonmail=
.com wrote:
>
> > 2020.  december 27., vas=C3=A1rnap 23:27 keltez=C3=A9ssel, Roderick Col=
enbrander =C3=ADrta:
> >
> > > [...]
> > >
> > > > > > -         ret =3D sysfs_create_group(&hdev->dev.kobj, &ps_devic=
e_attribute_group);
> > > > > >
> > > > > >
> > > > >
> > > > > It's a minor thing, but I think `device_{add,remove}_group()` wou=
ld be better
> > > > > here in the sense that it expresses the fact that the group is ad=
ded to a device,
> > > > > not just any object better.
> > > >
> > > > Agreed, that's nicer I wasn't aware of it. I try to follow what oth=
er
> > > > hid drivers do and they all used the kobj directly, which honestly
> > > > felt nasty. Will change it to this.
> > >
> > > Actually devm_device_add_group seems to be even nicer. Surprisingly i=
t
> > > isn't widely used yet.
> > > Roderick
> >
> > Well, indeed, although I believe that shouldn't be used here. Consider
> > what happens if the hid-playstation module is unloaded. The attributes
> > of the HID device will not be unregistered, but the backing functions/e=
tc.
> > are unloaded, so reading/writing them will have undesirable effects - I=
 imagine.
> > So in either case, you'll need to use `[devm_]device_remove_group()`, a=
nd for
> > that reason I think using the devm_* variant is less efficient.
> > Please note, that I am not 100% sure this hypothesis is correct, but I'=
m pretty sure.
> > Regards,
> > Barnab=C3=A1s P=C5=91cze
>
> I did some more digging into 'devm_device_add_group' as I was curious.
> It is widely used for touchscreen drivers apparently and some other
> devices and generally used from 'probe' as you would expect. None of
> the drivers I found call devm_device_remove_group. Though, none of the
> drivers use HID.
>
> I tried using the call and it seems to work fine even after driver
> unloads/reloads without a 'devm_device_remove_group' call. I don't
> believe any sysfs entries are kept around (also based on watching the
> contents of the sysfs directory for the device). If they were I'm sure
> the kernel would have thrown some errors during a future
> 'devm_device_add_group' call as you know sysfs gets quite unhappy if
> you added a duplicate node.
>
> This makes me believe it is getting cleaned up, but I'm not sure how.
> I suspect it happens when the HID driver is unregistered
> (hid_unregister_driver) from the bus, which follows a bus rescan. When
> the driver is removed, device_driver_detach is called, which triggers
> a lot of cleanup logic in 'device_driver_release_internal'. I haven't
> traced this call, but I think its call 'devres_release_all(dev)' is
> what is doing the magic.
>
> Any thoughts?


I also did some tests and it seems you're right, I was under the impression
that "device managed" resources are tied to the lifetime of the device,
and are not released when the driver unbinds, but this assumptions seems
to be false and device managed resources are, in fact, released when a driv=
er
detaches so sorry for making you take this detour into investigating it.


Regards,
Barnab=C3=A1s P=C5=91cze
