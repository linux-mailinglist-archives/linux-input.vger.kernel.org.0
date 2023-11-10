Return-Path: <linux-input+bounces-3-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 089CA7E7F18
	for <lists+linux-input@lfdr.de>; Fri, 10 Nov 2023 18:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62C1DB21806
	for <lists+linux-input@lfdr.de>; Fri, 10 Nov 2023 17:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134E438DC8;
	Fri, 10 Nov 2023 17:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ds6ayBij"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8083C6B8
	for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 17:46:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7202810F
	for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 02:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699611563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ygk3l8mr2SoGnTkoVZZAQTw8lqxcBgUQ230fZTLWTdY=;
	b=ds6ayBijmokvZmQ0kMKAOFFi7/gxiAgWQWd52BOr98f0Dz7gTkiY2oqpQxZLZf4vbXKxxm
	ivJBUE9/omqrIVMefwkAAhntw0xlS3Od2gzykG4e+UElGbT4magbMOrrMjd2bjGD4zhdtV
	yhYxt3gNK1kJebA4o0tbHRepg+W7B2Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-E7fj6B0RMZWq99nWnHjauA-1; Fri, 10 Nov 2023 05:19:22 -0500
X-MC-Unique: E7fj6B0RMZWq99nWnHjauA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-544b5d65a1aso1479332a12.2
        for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 02:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699611561; x=1700216361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ygk3l8mr2SoGnTkoVZZAQTw8lqxcBgUQ230fZTLWTdY=;
        b=B5grXaIWE1QH9xV+Bp/L5Pn++ChBa/Ft5PDLZMrLkddJOlCf9d4yMJ5fvoyT32kxLi
         2ur1YhHj+UVYe07HGigChKAWexgT1jH6S8Yo0Gd/fYqyz2BNQ/LX9HfBWUFXc5px04Ds
         Mk1rjkPeQv03FZIcWY7Z4qxGV8MdAAx8RFDnlhKjnBwdbKpJV3RCFwAv9KR6GnwI5ZWq
         cW67QtOIyKRLIDqQs2lb1BY4kD8EWDnmxDnwJVNQKtnYlP8VVjq6stYc3F68tILaTWL/
         gYjB9PwUbZQmAVJhjJzgE2rR5UuRHRfSwZCtjTox3+ZYgZ0aqb0rHBoEcE6Kf0jnE7U9
         H3kQ==
X-Gm-Message-State: AOJu0YzdDrHBUgjJLKi7e/Rxi5w9EuiSmCiMoDbdsSpkEPFlAl+u2mRQ
	kKmma8RUgda8C43/dntC/DfaRlDx4Tc+oaRs/XYmHcgY6RpHcA/lRgEkaumfolM/v6TXyifBZWT
	i+gVeRfhBlaaEXDf1bvuYZUZcieDkoQmTTAW4Ngo=
X-Received: by 2002:a50:d7dc:0:b0:53f:f908:eda8 with SMTP id m28-20020a50d7dc000000b0053ff908eda8mr6032930edj.4.1699611561025;
        Fri, 10 Nov 2023 02:19:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpKnjrJmjHIVNoO0CYiRfc42EmMOsC1SssiG1oY30bFCaTL/f5Pqkgs9/jQAh4Rc/9bq/+1bJ+cqsDWvjgcCc=
X-Received: by 2002:a50:d7dc:0:b0:53f:f908:eda8 with SMTP id
 m28-20020a50d7dc000000b0053ff908eda8mr6032907edj.4.1699611560517; Fri, 10 Nov
 2023 02:19:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>
 <20231108062306.33f5dcd0@dryade> <CAO-hwJK_xp1A=dEOV-2v3KJAf0bRLDWNcrFQeBpgEuxT-qSBnw@mail.gmail.com>
 <ZUtTpKyP0oxWhnn8@fedora> <CAO-hwJLjtjdr2gtrOWJFPZ-38YzKB8XfhDKWf_2jUPeiaP3EcA@mail.gmail.com>
 <CAO-hwJKNcwcDGEh33NZq4kSYtoxZzg9M2nzE_hVDYNFgA4g_dg@mail.gmail.com>
 <_DEF7tHL1p_ExY7GJlJvT5gRA7ZvNnVMJuURb8_WCV-0fbYXkLN2p5zHloi6wiJPNzGEjFAkq2sjbCU633_eNF_cGm0rAbmCOOIOfwe1jWo=@protonmail.com>
 <CAO-hwJ+zm=R7NwrALaLVmfPDtMNXpj0eoQgLkiS1wa6wd+hu+A@mail.gmail.com>
 <CAO-hwJKJW5jGDdaaS8eB7kcLQUvWO_1XkOzJG4HAcaRzw1cGnQ@mail.gmail.com> <7wmtNlKuYResf5cFQ7M2QTalzIUtw0I6ohvPcz69Jo1c8flezyIlnJu1IwAgXhJ-u0NlRL3IV7HnL0Kza6fVBqd7X7jhc-Z6QCi3oqHEvpY=@protonmail.com>
In-Reply-To: <7wmtNlKuYResf5cFQ7M2QTalzIUtw0I6ohvPcz69Jo1c8flezyIlnJu1IwAgXhJ-u0NlRL3IV7HnL0Kza6fVBqd7X7jhc-Z6QCi3oqHEvpY=@protonmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 10 Nov 2023 11:19:08 +0100
Message-ID: <CAO-hwJKttorouwM2YXReH==r0Bg5c4rAisVgnDd9iOPBjbpA3w@mail.gmail.com>
Subject: Re: Requesting your attention and expertise regarding a Tablet/Kernel issue
To: David Revoy <davidrevoy@protonmail.com>
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	Eric GOUYER <folays@gmail.com>, Illia Ostapyshyn <ostapyshyn@sra.uni-hannover.de>, jkosina@suse.cz, 
	jason.gerecke@wacom.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peter Hutterer <peter.hutterer@who-t.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Nov 9, 2023 at 11:04=E2=80=AFPM David Revoy <davidrevoy@protonmail.=
com> wrote:
>
> Hi Benjamin,
>
> Thank you it works! =F0=9F=8E=89 =F0=9F=8E=89 =F0=9F=8E=89

\o/  /o\  \o/

>
> > I've pushed an update of the file[0], turns out I made several mistakes=
.
> > As a general rule of thumb, you can follow the MR I've opened at [1],
> > click on the pipeline, open the last job ("make release"), then browse
> > the artifacts and pull the file from there.
> > [...]
> > > But just to be sure, you don't have a custom configuration in place
> > > for that tablet device?
> > [...]
> > [0] https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/jobs/5139939=
2/artifacts/file/udev-hid-bpf_0.1.0.tar.xz
> > [1] https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_reques=
ts/27
>
> I tested the latest artifact on kernel 6.5.8-200.fc38.x86_64 and I also r=
emoved my custom configuration at startup (I had not much: an hwdb files fo=
r the 24 Pro =E2=88=92mainly for frame buttons=E2=88=92 and an xsetwacom ba=
sh script for each tablet).
>
> During the tests, the styluses of both 24 Pro and 16 Pro Gen2 worked perf=
ectly: right-click on upper button out-of-the-box, and the eraser tip of th=
e 16 Pro Gen2 continued to erase as expected.
>
> I could also target with xsetwacom this 'button 3' of the styluses, and I=
 tested random available shortcuts (but I'll keep default right-click).
>
> So, good job, and many thanks!
>
> I want now to write a follow-up after the first blog-post. I see it is a =
MR [1], maybe it means if it get merged it will be part of libevdev? What w=
ould you advice to write for the ones who want to benefit from the fix?

This MR will be merged into udev-hid-bpf. It's not "libevdev", the
library, per se, but we piggyback on the libevdev project some tools
that are more or less official. Right now, udev-hid-bpf is not
integrated in any distribution. It's a relatively new project.

As for the blog post, feel free to copy/extract/rewrite/link the
following. I've tried to address the couple of elements that worried
me on your initial blog post (mostly the why), and gave a rough
overview of what we have done here:

---

Here is a little bit of history of why you were encountering this bug:

First, HID is a quite old protocol and has the benefit of being "plug
and play" [0] [1].

But plug and play often means for a hardware maker: "let's do trial
and error until Windows seems to behave in a correct way".

In some other cases, Microsoft puts more restrictions on the HID part
(Windows 7 enforced touchscreens to follow a specific pattern, and
then Windows 8 did it for touchpads). And they also sometimes provide
a test suite that hardware makers have to pass to be "certified".
They have to pass the test suite by using the Windows provided generic
driver, but Windows also allows them to create a virtual HID device
and let a custom driver create that virtual HID device. Which means,
we sometimes have devices behaving badly but working perfectly fine on
Windows because there are bits missing in the device itself that are
fixed by adding an extra software layer. Sigh.

But I digress and we need to go back to the pen bits, and AFAIK, there
is no such test suite and certification.

So basically, hardware makers follow the empiric rule of "if Windows
is happy, I am too".

To do so, they have to use several events from HID [2] (quoting them):
- *Tip Switch* -> A switch located at the tip of a stylus, indicating
contact of the stylus with a surface. A pen-based system or system
extension would use this switch to enable the input of handwriting or
gesture data. The system typically maps Tip Switch to a primary button
in a non-pen context.
- *In Range* -> Indicates that a transducer is located within the
region where digitizing is possible. In Range is a bit quantity
- *Barrel Switch* -> A non-tip button located on the barrel of a
stylus. Its function is typically mapped to a system secondary button
or to a Shift key modifier that changes the Tip Switch function from
primary button to secondary button.
- *Secondary Barrel Switch* -> A second non-tip button located on the
barrel of a stylus further from the tip than the Barrel Switch. Its
function is typically mapped to a system secondary or tertiary button.
- *Eraser* -> This control is used for erasing objects. Following the
metaphor of a pencil, it is typically located opposite the writing end
of a stylus. It may be a bit switch or a pressure quantity.
- *Invert* -> A bit that indicates that the currently sensed position
originates from the end of a stylus opposite the tip.

I'm sure that by reading those, everybody should be able to
immediately know how to write a Pen HID device, and how the
interactions between the events should be. :) (If you are, please
contact me ASAP, we have plenty of kernel work to do).

So for years the state of pen devices in the Linux kernel was 2 fold:
- Wacom shipped an in-kernel driver for their own devices, that they
tested and that defined the de-facto "standard" in Linux
- the rest was trying to catch up by luck or with the help of projects
like DiGiMend, by relying on the generic HID processing of the Linux
kernel

However, they were no specification for how the events should come:
basically in the hid generic input processing each event was mapped to
a single input keycode and we had situations were we would get both
`BTN_TOOL_PEN` and `BTN_TOOL_ERASER` at the same time (because the `In
Range` and the `Eraser` bits were sent by the device at the same
time). Which means "hey, the user is interacting with a pen with both
the tail and the tip at the same time. Good luck with that!"

This led to a complex situation where userspace (libinput mostly) had
to do guesses on what is the intent of the user. But the problem is
that when you are in userspace, you don't know all of the events of
the device at the same time, so it was messy to deal with. Again,
Wacom devices were unaffected because they controlled all of the
stack: a kernel driver to fix/interpret their devices and a userspace
component, xf86-drv-wacom, in the X.org world.

Once, as you mentioned in your blog, Microsoft decided to use the
second barrel button as the "rubber" mode. The reason was practical:
people liked the rubber capability on the styluses, but they wanted to
have a separate button on the tail end of the styluses. And I suppose
that at the time, given that no other hardware vendors were capable of
having no-battery styluses but Wacom (IP protection and capabilities
of the hardware IIRC), you still had to put the battery somewhere. And
that tail end is convenient for storing such a battery. But that makes
it harder to have an eraser end because you need to link both ends of
the pen on the same IC, with a battery in the middle that is roughly
the same size as your pen's barrel. So having just 2 wires for the
battery allows you to have a separate bluetooth button on one end, and
the normal stylus on the other end, and keep the width of the pen
reasonable.

So that choice of using the second button as an eraser was made, and
the hardware makers followed: on the XP-Pen Artist Pro 24, the device
reports `Tip Switch`, `Barrel Switch`, `Eraser`, `In Range`.
Which is "correct" according to the HID Usage Table [2], but which
doesn't adhere to the recommendation Microsoft is doing [3]: the
device should report an extra `Invert` when the pen is in range with
the intent to erase...

But you can see that XP-Pen tried to adhere to it in some ways because
if you look carefully at the events coming from the device with
hid-recorder[4], you'll notice that when you are in range of the
sensor and press this button, you'll get an extra "In Range =3D 0" event
to notify that you went out of proximity of the sensor.

In kernel 5.18, with commit 87562fcd1342 ("HID: input: remove the need
for HID_QUIRK_INVERT"), I tried to remove those multiple tool states
to have a straightforward state provided by the kernel that userspace
can deal with easily. However, given that there were no regression
tests at the time for generic tablets, I wrote some based on
Microsoft's recommendation [3] and also tested on a Huion device I
have locally. And it was working fine. But I didn't have the devices
that were not sending `Invert`, which explained why it was bogus on
those devices.

This was "fixed" in kernel 6.6 with commit 276e14e6c399 ("HID: input:
Support devices sending Eraser without Invert"). Putting quotes around
"fixed" because I'm still not happy about this patch.

But the point is, from kernel 5.18, the Pen processing in the kernel
became a state machine, which means we can not have external actors
tampering with it.


Why using the ioctl EVIOCSKEYCODE is bad to remap `Eraser` to
`BTN_STYLUS2` (through tools like evmap):

Having the ability to do something doesn't mean it's the right thing
to do. And in that case, this is definitely wrong because you have to
call the ioctl after the kernel presents the device to userspace.
Which means userspace (and the kernel) already made assumptions on the
device itself. There is a high chance libinput (or the Wacom driver)
opens the device before evmap, and that it is considering that the
device doesn't have `BTN_STYLUS2`. So sending that event would break
userspace.

And in our case here, the kernel expects some state between the input
layer and its internal HID state, and remapping that HID event to
something else confuses it.

There is another side effect of this: usually end users configuring
their devices with such tools do not report back their configuration
to the kernel community. In some cases this is valid (this is my
preference and my choice), but in other cases it's not (there is a bug
here and I'm papering over it).


So, what can be done?

Basically 2 options:
1. write a kernel patch to fix that problem once and for all
2. use the brand new HID-BPF[5] capability introduced in kernel v6.3
and send me back the BPF program so I can eventually integrate the
source in the kernel tree itself and fix that problem once and for all
as well

For 1., you need:
- to be able to dig into the kernel code
- to be able to write a patch with the correct kernel standard (with a
regression test in `tools/testing/selftests/hid`, please)
- to be able to compile your own kernel and test it
- to be able to submit your contribution by email (I can suggest using
b4 for that, very nice tool)
- to be able to take reviews into account, and learn `git rebase -i`
to submit v2, v3, and potentially v10 or more in some complex cases
- to wait for the patch to be integrated into Linus' tree
- to wait for Greg to backport your patch into a stable kernel tree
- to wait for your distribution to pick up the stable tree with your patch

That's relatively easy, no? :)

OTOTH, we have 2.: HID-BPF [5]

Very quickly, eBPF [6] is a state machine inside the kernel that
allows user space to include a verified code path in the kernel to
tweak its behavior. And I adapted this for HID so you can:
- change the report descriptor of the device: this
disconnects/reconnects the device, meaning the kernel works on the new
report descriptor and is consistent with its state
- change the event flow of the device: to fix the spurious out-of-prox
event for example
- more to come

What is interesting in BPF (or eBPF), is that nowadays, libbpf
implements something named CORE (Compile Once Run Everywhere). Which
means that if I compile locally an eBPF program on my machine with my
development kernel, as long as I only use functions available from
kernel v6.3 for instance, the same compilation output (that changes
the event flow of your HID device) will work on any kernel from v6.3
unless there are some later API breakages[7].

Which means, anybody can modify the event flow of an HID device, put
the file in the filesystem, and have the device still fixed even if
they upgrade their kernel.

In the long run, I intend to include those HID-BPF fixes in the kernel
tree to centralize them, but also to be able to automatically load
them from the kernel when those devices appear.

Which means, for the reporter of such a bug you:
- can now rely on someone else to write the code, compile it and
provide the compilation result [10]
- just put that result in the filesystem to have the device tested and fixe=
d

Behind the scenes, that other knowledgeable person can take the heavy
task of submitting the kernel patch for you, but given that the code
has been tested, it's way easier to do (and to eventually re-test).

Currently, the "let's integrate that bpf program in the kernel" is not
completely done, so we use udev-hid-bpf[8][9] to give it a jump start.

And that's exactly what happened in your case David. Which is why I'm
so happy (also because I fixed the tools from an author I like and
already had the books at home :-P):

You want your device to be fixed now, but going through a regular
kernel patch means months before it's fixed in your distribution.
But with HID-BPF, I fixed it now, and you can safely upgrade the
kernel, because even if I do changes in the kernel, the HID-BPF fix
will still convert the device into something valid from the HID point
of view, and it has a regression test now. When your device will be
fixed in the future in the kernel, there is a high chance the `probe`
function of the HID-BPF program will say that it's not the correct
device, and so the program will not even load and rely on the fixed
kernel only. Transparently for you, without you having to change your
filesystem.


On my side, what's left to be done:

- First, I need to fix the tablets not sending the `Invert` usage.
Commit 276e14e6c399 ("HID: input: Support devices sending Eraser
without Invert") is IMO not good enough, and we might as well simply
say that if there is no `Invert` usage, we can convert the `Eraser`
usage into `Secondary Barrel Switch`
- then I need to fix the XP-Pen Artist Pro 16 gen 2 from the kernel
too, by replacing the `Eraser` usage with `Secondary Barrel Switch`.
Ideally I would just dump the HID-BPF program in the kernel, but this
is not available yet, so I'll probably write a small kernel driver
using the same code path as the HID-BPF program.
- then Peter and I need to write a more generic HID-BPF program to
convert "eraser mode buttons" into `Secondary Barrel Switch`,
basically unwinding what the hardware does. This can only happen when
libinput will be able to do the opposite transformation so we don't
regress. But we can rely on libwacom to tell us if this pen has a tail
end eraser or not, and then have userspace choose if they want the
button to be a button, or an eraser mode.

I think that's pretty much it.

Thanks for reading through everything :)


Cheers,
Benjamin


[0] https://who-t.blogspot.com/2018/12/understanding-hid-report-descriptors=
.html
[1] https://docs.kernel.org/hid/hidintro.html
[2] https://usb.org/sites/default/files/hut1_4.pdf
[3] https://learn.microsoft.com/en-us/windows-hardware/design/component-gui=
delines/windows-pen-states
[4] https://gitlab.freedesktop.org/libevdev/hid-tools
[5] https://docs.kernel.org/hid/hid-bpf.html
[6] https://docs.kernel.org/bpf/index.html
[7] but if API breakage happens, all that will happen is that the
HID-BPF program will not be loaded. No kernel crash involved.
[8] https://gitlab.freedesktop.org/libevdev/udev-hid-bpf
[9] https://libevdev.pages.freedesktop.org/udev-hid-bpf/tutorial.html
[10] https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/=
27



>
> Thanks again,
> David
>
> [1] https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests=
/27
>


