Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C9B6EE44B
	for <lists+linux-input@lfdr.de>; Tue, 25 Apr 2023 16:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234176AbjDYOxT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Apr 2023 10:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbjDYOxS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Apr 2023 10:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E4612CB0
        for <linux-input@vger.kernel.org>; Tue, 25 Apr 2023 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682434341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kLJoPg7PWkt3NKopzWvH8LNe6T8cnPQZU6S8eguc6bY=;
        b=KlZQplmpIcucfVQuo9x7Z0tnY+C34h63qZAlv/XZM6fln/GzoX0GdB/d16G9VoywFSmCL/
        k5hYsrQsdIzEkfPQD8MvI4BXERBww0syBKCY8xPv2LsJu3wnPqQ9CrSxlcAsbaaGSpzEpS
        2bDoIWWuXpQQpJ6fvrKTtmvVrd5ZLqs=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-l7QHAqZdPrWfNxxKjxegHw-1; Tue, 25 Apr 2023 10:52:20 -0400
X-MC-Unique: l7QHAqZdPrWfNxxKjxegHw-1
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-b99f3aee8e0so4578186276.0
        for <linux-input@vger.kernel.org>; Tue, 25 Apr 2023 07:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682434339; x=1685026339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLJoPg7PWkt3NKopzWvH8LNe6T8cnPQZU6S8eguc6bY=;
        b=I+KyzUmelA9kEzHnD7tOArB/zqkaD1/wQgmyYn/e6GBzC0DFq8KTMMcIBnuVIzfLVh
         aiyjO5XRHMz+5OBYP4HnBnKSXEnvUdMOnWDuU5PuhyHt6Czt/VXM/65uvEWHG9ssF7Mq
         jv2vx+o8OK/AuhQkkf952NHUuo/+WWORmWoi02mmqdWMaiTYNdEoTaboowab/NXiFUV/
         suw2D3/s5a2W4eH8XW/owW76WL0IkpidbJ4MXgRPdFU94GrRbQFisSG8A9QVAjw1mVR4
         k2Pz/2+BIYezESD4f3YZknkBvcUnMtDsAjxnRJdKjL6n1Im8ve3ZNkkoz5o068WTn5qY
         C6hA==
X-Gm-Message-State: AAQBX9dLdoaGwMnGhzZYI6B3UtvU6H57vO0rquP+BcRVpMqBbbPR6spZ
        CJZyUuoknPd+0iB3LHGJ18J2zPg1Ska246H1jrmhYKoO2QDO/QoKbIygbNDZ2Bp4nOeis/tQM/P
        /cbIGZdyWNUZRy4Le90bF9lSg9VZvtmKOu8VjsSHvUGNiiZo=
X-Received: by 2002:a81:25c8:0:b0:54f:85bc:a808 with SMTP id l191-20020a8125c8000000b0054f85bca808mr11619918ywl.16.1682434339329;
        Tue, 25 Apr 2023 07:52:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZUWIEebJZW0eXoxUIUjKlLNSSbrt0ATjL2b573P+eJSp6SCOc4BnB7WIS+esdTuH+oQY1seM6VRZE9XMYCJZ8=
X-Received: by 2002:a81:25c8:0:b0:54f:85bc:a808 with SMTP id
 l191-20020a8125c8000000b0054f85bca808mr11619898ywl.16.1682434339023; Tue, 25
 Apr 2023 07:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <a3b1f768-27e9-c9d5-ad2c-c56a48522d41@endrift.com> <CAO-hwJLcWMujHXaCKdW9n2Y21rtg=7gMkzzd0K95DyC9y3W_Mw@mail.gmail.com>
In-Reply-To: <CAO-hwJLcWMujHXaCKdW9n2Y21rtg=7gMkzzd0K95DyC9y3W_Mw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 25 Apr 2023 16:52:07 +0200
Message-ID: <CAO-hwJ+4Hctv6QVSyZxKMCbDt-kFJpwU0iL6+yK60NRvwQihbQ@mail.gmail.com>
Subject: Re: Proposal: Add a means to disable kernel driver logic when
 associated hidraw is opened
To:     Vicki Pfau <vi@endrift.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Pierre-Loup Griffais <pgriffais@valvesoftware.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 24, 2023 at 3:07=E2=80=AFPM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi Vicki,
>
> On Fri, Apr 21, 2023 at 4:36=E2=80=AFAM Vicki Pfau <vi@endrift.com> wrote=
:
> >
> > Hello,
> >
> > Following up on a conversation from last year (cf. https://lore.kernel.=
org/linux-input/CAO-hwJLfY+D0NyCUCncrjcXETKwOBqj1CuHtB_mtGhYfKV0Bww@mail.gm=
ail.com/) about how to approach differing opinions about how drivers should=
 work between userspace and kernel, we're looking for a way to effectively =
stop the kernel from doing anything "smart" with a a HID device, e.g. a hid=
-sony device, when the associated hidraw is opened. At the moment, we have =
a specialized daemon that will find the mouse evdev associated with the con=
troller when it's created and inhibit it, but this is anything but ideal an=
d only handles the mouse itself, not the kernel logic in general. You can a=
lso see the hackish way this is implemented in the hid-steam driver, which =
uses an intermediary hid ll_driver to intercept the open and close commands=
 and stop passing data if the hidraw gets opened. I consider this implement=
ation to be very much a hack and an anti-pattern, and I think other HID imp=
lementers would agree, but I'm not sure there's a cleaner way to detect thi=
s in the kernel at the moment.
> >
> > I see a bit of a difference of opinion as to what should be happening h=
ere between developers on our end and the kernel end. Our position is "we h=
ave a userspace driver that does everything we want, we'd like the kernel t=
o stop trying to be smart when our driver is active", and I expect the kern=
el developer opinion is "why should you have a userspace driver at all when=
 our kernel driver is fine, and if it's not you can upstream patches?", so =
there's probably some need to find a middle ground if we want things to wor=
k well for users in the end.
>
> The main problem we have here, is that if userspace is actively using
> hidraw to configure the device, the kernel is not aware, and thus its
> state will be wrong. So my initial reaction is "we need to have ad-hoc
> and opt-in functionality for these, because the states the kernel
> needs to monitor will differ from one device to one other". But this
> opt-in could (should) be controlled from userspace through eBPF.
>
> OTOH, maybe the simplest solution would be to entirely unbind the
> device from the kernel driver when steam opens and rebinds it when it
> closes. This way the kernel will reinitialize the device itself
> properly and keep its state coherent. We can think of multiple
> solutions for disabling the driver and still keeping hidraw open, and
> guess what, eBPF is one of them :)
>
> Note though that disabling the kernel module might require some
> changes in the kernel driver itself, so maybe that's not the best path
> too. (eBPF can not change any quirks on a given device, but maybe that
> is something we can think of).
>
> >
> > We'd previously discussed an ioctl for the hidraw, or perhaps an eBPF a=
pproach, though I think at the time of that discussion, eBPF wasn't mature =
for the HID subsystem. I don't know the current state of that, or if it's p=
ossible to do this with just write access to the hidraw device (the ideal c=
ase for how we want to handle this--root is pretty much out of the question=
 for an "ideal case"). Since we still don't have a good answer for this, as=
 far as I'm aware, I'd like to try to reach an approach that's amicable for=
 both sides.
>
> Good timing. Kernel 6.3 was out just yesterday, and HID-BPF is in :)
> (well, not all use cases I envisioned are implemented, but at least
> the bulk is there).
>
> >
> > I know that the ioctl approach meant having to introduce logic for prog=
rams in userspace, but in this specific case, and possibly others, that's a=
ctually what we're looking for. Further, the reason root is out is because =
Steam isn't the OS (in most cases), and we want this to only happen when St=
eam is running. Having to run a daemon as root underneath Steam would requi=
re something like a setuid binary or custom sudo/polkit rules, which of cou=
rse need root to set up anyway. So while eBPF may fit some use cases, e.g. =
full control over the system via DE or systemd, etc, it's not what we're lo=
oking for here.
>
> I think you are dismissing eBPF too quickly :)
>
> Basically, eBPF doesn't require you to have a daemon loaded: you can
> load the BPF program, attach it to the device, pin it in the kernel
> and close your eBPF loader. So all you need is a new udev rule that
> calls for a program to load the eBPF program just at plugging time.
> Eventually, for such  "no-daemon" programs, the kernel itself will
> load those programs, and userspace can just override them if they are
> not up to date.
>
> Which means that when you load the eBPF program, you just "patched"
> the kernel with your current API.
>
> [Side note: my push for eBPF is because this is exactly the kind of
> use case I envisioned for it: an app (or set of apps) wants to tweak
> the kernel behavior only when it is started, and wants to be in
> control. If this app wants to change some behaviour, fixing the eBPF
> program is way simpler and can be done in sync with the app update
> rather than updating the API introduced in the kernel]
>
> I think the following (in pseudo-ish-code) would work for
[...]

I got a working WIP at
https://gitlab.freedesktop.org/bentiss/udev-hid-bpf/-/tree/hidraw-close

I need a couple of kernel changes to allow for the introspection of
the hidraw device from the struct hid_device and to let
hid-playstation go with the events.

We probably still want the opt-in capability, so we'd also need the
hid_hw_request() BPF hook set up, but this should give you an idea
that BPF could be a simple and elegant solution.

Cheers,
Benjamin

