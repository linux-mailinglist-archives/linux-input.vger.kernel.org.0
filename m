Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0C7D6ECCA8
	for <lists+linux-input@lfdr.de>; Mon, 24 Apr 2023 15:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbjDXNI7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Apr 2023 09:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbjDXNI6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Apr 2023 09:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404EC49F2
        for <linux-input@vger.kernel.org>; Mon, 24 Apr 2023 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682341692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XQyklqFD/wQBDDt5OP1s/2k6ZWk6QHoz7yZbUzwforM=;
        b=VHOXcUBYIlM6OISAuNYn2DTb1xzr1JQ6pkJHfVtxhFazT2KUFoO3oVCmqBUdYf19rP3g8k
        8v3UWt2tAon0bfwzu+XfH6e21HvgcQSn99fNKagQCVkX52L964JTutq7+I9BFal2xyBhY4
        Fhrd4vqMJE+eDcnKEm6/PwZPphFNbDg=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-aXLFSdlkNtmDs52i8paiYw-1; Mon, 24 Apr 2023 09:08:11 -0400
X-MC-Unique: aXLFSdlkNtmDs52i8paiYw-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-54f94262a87so31723367b3.3
        for <linux-input@vger.kernel.org>; Mon, 24 Apr 2023 06:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682341690; x=1684933690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQyklqFD/wQBDDt5OP1s/2k6ZWk6QHoz7yZbUzwforM=;
        b=byV8VyfGoq6EIqjTh67OdA25O8MGrHhxvPC28ZDKoDFB3Cksi0f53fNHmZ9Y8qnb0m
         gxU0lfaSStNfwz7jDyY2iFnscbqB7Tc4glsR932CVwVMtLQ+k1VuR1hfKzhrNEP4xKqG
         woSvtn/kV6UhBWeDev3N0Y1ro7tbtIXcOKF58LNsWLFo46fRVrZQljrrS6QOfesV2d6w
         iu3V8i8FCFCoGv5nGBMqoeOIStAOxOT3qeSflkeeI2m0vJmF2FAE6/ycgsM0dNwngZoN
         F+BhFF9NaL2Opns20FZq1KY1SBljgPHCLbE8K5EyjEAmo+5h5AmiVpEqLz63wb/C2ATI
         qdFw==
X-Gm-Message-State: AAQBX9d8VcxqnJfWs6nkptQp2cRiyxvyENmICq4C7xf0eZVxngYFQBvC
        +yS5Dj6iXJex+TFdL028RjmUHtXVjy3CK0ucHg6yaM64Dhskda9/AEl3h+MomM8fmjNi0om7htd
        Swosf/7WucXR5lyj5ALGvxA9PmsSIJc73crc+dZXifv+2UkA=
X-Received: by 2002:a0d:ebc5:0:b0:555:d531:fdf3 with SMTP id u188-20020a0debc5000000b00555d531fdf3mr8452161ywe.32.1682341690235;
        Mon, 24 Apr 2023 06:08:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350YmSTpyk9p59tB5dgBGRspvB39vgk0YdBL4S+f5NOwVRiNffJnv4gi3HcXO1IFGZD9FamXImwVIhgicLFGKzWs=
X-Received: by 2002:a0d:ebc5:0:b0:555:d531:fdf3 with SMTP id
 u188-20020a0debc5000000b00555d531fdf3mr8452130ywe.32.1682341689909; Mon, 24
 Apr 2023 06:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <a3b1f768-27e9-c9d5-ad2c-c56a48522d41@endrift.com>
In-Reply-To: <a3b1f768-27e9-c9d5-ad2c-c56a48522d41@endrift.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 24 Apr 2023 15:07:58 +0200
Message-ID: <CAO-hwJLcWMujHXaCKdW9n2Y21rtg=7gMkzzd0K95DyC9y3W_Mw@mail.gmail.com>
Subject: Re: Proposal: Add a means to disable kernel driver logic when
 associated hidraw is opened
To:     Vicki Pfau <vi@endrift.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Pierre-Loup Griffais <pgriffais@valvesoftware.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vicki,

On Fri, Apr 21, 2023 at 4:36=E2=80=AFAM Vicki Pfau <vi@endrift.com> wrote:
>
> Hello,
>
> Following up on a conversation from last year (cf. https://lore.kernel.or=
g/linux-input/CAO-hwJLfY+D0NyCUCncrjcXETKwOBqj1CuHtB_mtGhYfKV0Bww@mail.gmai=
l.com/) about how to approach differing opinions about how drivers should w=
ork between userspace and kernel, we're looking for a way to effectively st=
op the kernel from doing anything "smart" with a a HID device, e.g. a hid-s=
ony device, when the associated hidraw is opened. At the moment, we have a =
specialized daemon that will find the mouse evdev associated with the contr=
oller when it's created and inhibit it, but this is anything but ideal and =
only handles the mouse itself, not the kernel logic in general. You can als=
o see the hackish way this is implemented in the hid-steam driver, which us=
es an intermediary hid ll_driver to intercept the open and close commands a=
nd stop passing data if the hidraw gets opened. I consider this implementat=
ion to be very much a hack and an anti-pattern, and I think other HID imple=
menters would agree, but I'm not sure there's a cleaner way to detect this =
in the kernel at the moment.
>
> I see a bit of a difference of opinion as to what should be happening her=
e between developers on our end and the kernel end. Our position is "we hav=
e a userspace driver that does everything we want, we'd like the kernel to =
stop trying to be smart when our driver is active", and I expect the kernel=
 developer opinion is "why should you have a userspace driver at all when o=
ur kernel driver is fine, and if it's not you can upstream patches?", so th=
ere's probably some need to find a middle ground if we want things to work =
well for users in the end.

The main problem we have here, is that if userspace is actively using
hidraw to configure the device, the kernel is not aware, and thus its
state will be wrong. So my initial reaction is "we need to have ad-hoc
and opt-in functionality for these, because the states the kernel
needs to monitor will differ from one device to one other". But this
opt-in could (should) be controlled from userspace through eBPF.

OTOH, maybe the simplest solution would be to entirely unbind the
device from the kernel driver when steam opens and rebinds it when it
closes. This way the kernel will reinitialize the device itself
properly and keep its state coherent. We can think of multiple
solutions for disabling the driver and still keeping hidraw open, and
guess what, eBPF is one of them :)

Note though that disabling the kernel module might require some
changes in the kernel driver itself, so maybe that's not the best path
too. (eBPF can not change any quirks on a given device, but maybe that
is something we can think of).

>
> We'd previously discussed an ioctl for the hidraw, or perhaps an eBPF app=
roach, though I think at the time of that discussion, eBPF wasn't mature fo=
r the HID subsystem. I don't know the current state of that, or if it's pos=
sible to do this with just write access to the hidraw device (the ideal cas=
e for how we want to handle this--root is pretty much out of the question f=
or an "ideal case"). Since we still don't have a good answer for this, as f=
ar as I'm aware, I'd like to try to reach an approach that's amicable for b=
oth sides.

Good timing. Kernel 6.3 was out just yesterday, and HID-BPF is in :)
(well, not all use cases I envisioned are implemented, but at least
the bulk is there).

>
> I know that the ioctl approach meant having to introduce logic for progra=
ms in userspace, but in this specific case, and possibly others, that's act=
ually what we're looking for. Further, the reason root is out is because St=
eam isn't the OS (in most cases), and we want this to only happen when Stea=
m is running. Having to run a daemon as root underneath Steam would require=
 something like a setuid binary or custom sudo/polkit rules, which of cours=
e need root to set up anyway. So while eBPF may fit some use cases, e.g. fu=
ll control over the system via DE or systemd, etc, it's not what we're look=
ing for here.

I think you are dismissing eBPF too quickly :)

Basically, eBPF doesn't require you to have a daemon loaded: you can
load the BPF program, attach it to the device, pin it in the kernel
and close your eBPF loader. So all you need is a new udev rule that
calls for a program to load the eBPF program just at plugging time.
Eventually, for such  "no-daemon" programs, the kernel itself will
load those programs, and userspace can just override them if they are
not up to date.

Which means that when you load the eBPF program, you just "patched"
the kernel with your current API.

[Side note: my push for eBPF is because this is exactly the kind of
use case I envisioned for it: an app (or set of apps) wants to tweak
the kernel behavior only when it is started, and wants to be in
control. If this app wants to change some behaviour, fixing the eBPF
program is way simpler and can be done in sync with the app update
rather than updating the API introduced in the kernel]

I think the following (in pseudo-ish-code) would work for
hid-playstation with the current 6.3 kernel:
```
/*
 * variable that is set to true when steam is opening the device
 * we might as well use a map instead
 */
static bool steam_opened =3D false;

/*
 * HID unique ID used by the device we are monitoring (set during attach)
 */
static u16 hid_steam_device_id;

/*
 * take the current report descriptor, and extend it by adding more
opaque report IDs
 * for example, if the mouse is reporting on report ID 0x02, we set a
new hid collection
 * with opaque data (const) as report ID 0xf2
 */
SEC("fmod_ret/hid_bpf_rdesc_fixup")
int BPF_PROG(hid_fix_rdesc, struct hid_bpf_ctx *hctx)
{
   __u8 *data =3D hid_bpf_get_data(hctx, 0 /* offset */, 4096 /* size */);

  if (!data)
   return 0; /* EPERM check */

  /* append a new report descriptor to the current one */

  return old_size + appended;
}

SEC("fmod_ret/hid_bpf_device_event")
int BPF_PROG(disable_when_opened, struct hid_bpf_ctx *hid_ctx)
{
  __u8 *data =3D hid_bpf_get_data(hid_ctx, 0, 1);
  if (!data)
    return 0; /* EPERM check */

  if (steam_opened)
    data[0] +=3D 0xf0;

  return 0;
}

/*
 * completely untested
 */
int hid_id_from_file(struct inode *inode, struct file *file)
{
  struct hidraw_list *list;
  struct hidraw *dev;

  if (!file->private_data)
    return -EINVAL;

  list =3D file->private_data;

  if (!list->hidraw)
    return -EINVAL;

  dev =3D list->hidraw;

  return dev->hid->id;
}

SEC("fexit/hidraw_open")
int BPF_PROG(fexit_hidraw_open, struct inode *inode, struct file *file, int=
 ret)
{
  /* exit if any error happened */
  if (ret)
    return 0;

  if (hid_id_from_file(inode, file) =3D=3D hid_steam_device_id)
    steam_opened =3D true;

  return 0;
}
SEC("fenty/hidraw_release")
int BPF_PROG(fentry_hidraw_release, struct inode *inode, struct file *file)
{
  struct hidraw_list *dev;

  if (file->private_data)
    dev =3D file->private_data;

  if (hid_id_from_file(inode, file) =3D=3D hid_steam_device_id)
    steam_opened =3D false;

  return 0;
}
```

Minus the completely untested bit to go from the inode to the HID id
(which I already did once or twice IIRC), this basically diverts any
incoming report from 0x0N to 0xfN. And then in Steam, or any other
client, you can either revert that change or just handle it as if this
was a normal report from the device.

The bits to reset the kernel driver would consist in detaching the hid
report fixup and re-attaching it, which would trigger 2 reprobes of
the device from the kernel. This might require some userspace control
because we need a syscall bpf type to do so. But OTOH, this might not
be needed for some devices, given that you can pretty much design and
tailor one BPF program per device type (so you can probably handle the
"client disconnected abruptly" case from within the eBPF program
itself).

You could also handle the "steam tells eBPF to offset the report ID"
if we add one other eBPF hook in hid_hw_raw_request(). FWIW, that hook
would allow for having a HID firewall to prevent unwanted accesses to
the device.

Basically steam could call a non-declared feature on the device with a
given secret knock, and when the eBPF program sees it, it turns the
no-report mode on. (To handle the abruptly disconnected client, you
can check for the last known knock, and if it's more than 2 min for
instance, reset to the "normal" mode without report offset).

Compared to a new hidraw ioctl you get:
- immediate support on the existing 6.3 kernel
- you can change this in the future without having to wait for a new
kernel (and then supporting several kernels with different behaviors)
- you can target only tested devices (because some might need a
different offset)
- you can revise any part without bothering to change the kernel
- you will fill the dmesg with a bunch of "Unhandled reportID=3D0xf2"
with the current hid-playstation driver, so this needs to be fixed
there...
- [for the hid-playstation case, you might just change the report size
by adding 1 and setting that last extra value to 0 -> hid-playstation
will reject the report if it is not exactly the expected size, but
hidraw will forward it properly]

>
> Does anyone have opinions on how to proceed from here?
>

Basically, I have the strong belief that any kernel API you can
imagine can be implemented in eBPF first, and once this stabilized we
could think of making it an official one. But this will have the cost
of flexibility, so why really bother stabilizing it?

Cheers,
Benjamin

