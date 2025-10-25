Return-Path: <linux-input+bounces-15723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D08AC08D54
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 09:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB90E1C66406
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 07:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537FE2D3EDD;
	Sat, 25 Oct 2025 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="LswuqSoq"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267E43BB4A
	for <linux-input@vger.kernel.org>; Sat, 25 Oct 2025 07:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761376872; cv=none; b=PLQtZpr6MmCfraurh/l6V6XvnzeEZKYM77Vmmsv30pBXiIcbU/97BKHqSiseNEKfG/3TdufoLfcMAY50sxiSaYX0KiTdNgPzGNG+Gxghmz9G7C/lGdgi3NovM/pBXAntBuZXrqXjEPMDgtc0MSF8eBL+B7lW8YDXCezPuMMUY04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761376872; c=relaxed/simple;
	bh=pwdhPPhvKbz0V738IUqB7hjR3lvtvn4qqpzuR8UYO/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zzovlb1D/xcy1hh4WeYpTuQcc331XwkhUmXRm9MRoiT5I96cMFOQcPTkjMiyJC/v1nm1arB5b/qtPvtdhJ1bn67zctZtxZCDArP69hYJJJGETfNBrQ2V+T3LLGTrNzeRMUHQHckGUdPmiOzLIsOtigmRwnmhLh5eTAMVRY7Mpd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=LswuqSoq; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 2A6BDBDCAA
	for <linux-input@vger.kernel.org>; Sat, 25 Oct 2025 10:21:07 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 5E31FBDFDD
	for <linux-input@vger.kernel.org>; Sat, 25 Oct 2025 10:21:03 +0300 (EEST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 95DCA200CC4
	for <linux-input@vger.kernel.org>; Sat, 25 Oct 2025 10:21:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761376863;
	bh=9MUl27cO2Ei8YeDg730+/6CR+6BK14eULrrNspxGizU=;
	h=Received:From:Subject:To;
	b=LswuqSoqUt/wzfXcKHDJM4P11kiGdAxUHHlg59yfhkMT7qk57wMRcdOLUDpphW5Ak
	 2uACeoK8VGx96S3Tooh3jIhbJNDnqzxkROdEHkCDKMOVNZzjcNsZAaYDGT4tbgDpU4
	 bjmBIiqj/wxkBPXuYJCW5wYe852UCIyhKuDufFeBIegwqxBCygqVYuw8AJke2zXQs/
	 sdOvAA6tSKHnYPAmPK5UOHMQm5mSHNmIAH1nAoOCH+GjdOKSAtc3fvSZAc1S+blJGO
	 bwZYUwLzFb1O/ZQFnYr8JI36BP4gOu6iRzPJx3abXcbZfxVVJgDA+EYykHT49ln0Kf
	 EGUdVyCiW2oww==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-378d50e1cccso31529661fa.0
        for <linux-input@vger.kernel.org>;
 Sat, 25 Oct 2025 00:21:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCULY6Wk6/xoiLMb/93wfigIxOrJBqJXCXMz6gZwcqxWMoY3mWoeIBeoWqIr5qNVVQIvsVRrNpwAnL2i9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdOo7fDlNHPWU5BvBsDrtj2YbAeMcBwzXG2AMIur+7SeVO6k6Q
	zOWtVs5TN5aPMPkDH9D5hLNpWr73aWCWjR8+8J05y6opG7XKKaQmzzzsnhNrb53b9JqeTo+h9Nx
	cfzgQgHqmEWuvv2GKE4lV/xrx7TAndaU=
X-Google-Smtp-Source: 
 AGHT+IEW4LlQ1v+uLQvZDipQIO4SZSe1WPbzjQCR+anQew6Mq+O7WD/iW877zNG6d2qsrO0cs2jlCGCfEMZzJdTfycI=
X-Received: by 2002:a05:651c:1595:b0:375:f6b9:c962 with SMTP id
 38308e7fff4ca-377978263edmr92266791fa.3.1761376861512; Sat, 25 Oct 2025
 00:21:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018101759.4089-1-lkml@antheas.dev>
 <20251018101759.4089-2-lkml@antheas.dev>
 <e6328da3-8099-4540-9cb0-4fc28b359ee7@gmail.com>
 <CAGwozwG+gf09PQf9o9YkKFYVgVn-1w5CDVrpOe4uFavVYCNijQ@mail.gmail.com>
 <3947f772-691b-46a2-af68-15825e7f4939@gmail.com>
 <CAGwozwFbQWyuQB6EwLMLon5muff2WudR+oVL62DqP_MXGW+p-Q@mail.gmail.com>
 <b91de7c7-74b8-4cf5-82a4-f3d4eaf418d4@gmail.com>
 <CAGwozwGj-yXHXBan38_NV7G5T66bnjm7om2bz_Bha35AHhtCJQ@mail.gmail.com>
 <CAGwozwEh32XMcGJPKMRBWd63ybYOxW1Wx4QjU-QErjQgLHwX2g@mail.gmail.com>
 <0d18666a-78e1-4e69-8fd2-f15052db0cee@gmail.com>
 <CAGwozwHyC8P4KzZFY7t=WF3ANiJ4q6HgbiAMUNAGHE899Jd6rQ@mail.gmail.com>
 <ee179dc9-e7ac-4b64-a58c-93da5f7f4057@gmail.com>
In-Reply-To: <ee179dc9-e7ac-4b64-a58c-93da5f7f4057@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 25 Oct 2025 09:20:50 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwG3kk3z+7Ev4p21VsB8jChRPqSZmu5Cxu1RhRRtr3bnuA@mail.gmail.com>
X-Gm-Features: AWmQ_bnGzzPP3dpoJD1W6gEj3wJbCOfiLBKj6MGe1qbs4_FJhYJgc8Yk6mMDi3k
Message-ID: 
 <CAGwozwG3kk3z+7Ev4p21VsB8jChRPqSZmu5Cxu1RhRRtr3bnuA@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] HID: asus: simplify RGB init sequence
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176137686299.1917905.17419415257182354429@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 25 Oct 2025 at 03:25, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 10/24/25 23:20, Antheas Kapenekakis wrote:
> > On Fri, 24 Oct 2025 at 20:53, Denis Benato <benato.denis96@gmail.com> wrote:
> >>
> >> On 10/24/25 18:20, Antheas Kapenekakis wrote:
> >>> On Fri, 24 Oct 2025 at 01:25, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >>>> On Fri, 24 Oct 2025 at 00:53, Denis Benato <benato.denis96@gmail.com> wrote:
> >>>>> On 10/23/25 23:30, Antheas Kapenekakis wrote:
> >>>>>> On Thu, 23 Oct 2025 at 22:05, Denis Benato <benato.denis96@gmail.com> wrote:
> >>>>>>> On 10/23/25 20:06, Antheas Kapenekakis wrote:
> >>>>>>>> On Thu, 23 Oct 2025 at 19:38, Denis Benato <benato.denis96@gmail.com> wrote:
> >>>>>>>>> On 10/18/25 12:17, Antheas Kapenekakis wrote:
> >>>>>>>>>> Currently, RGB initialization forks depending on whether a device is
> >>>>>>>>>> NKEY. Then, NKEY devices are initialized using 0x5a, 0x5d, 0x5e
> >>>>>>>>>> endpoints, and non-NKEY devices with 0x5a and then a
> >>>>>>>>>> backlight check, which is omitted for NKEY devices.
> >>>>>>>>>>
> >>>>>>>>>> Remove the fork, using a common initialization sequence for both,
> >>>>>>>>>> where they are both only initialized with 0x5a, then checked for
> >>>>>>>>>> backlight support. This patch should not affect existing functionality.
> >>>>>>>>>>
> >>>>>>>>>> 0x5d and 0x5e endpoint initializations are performed by Windows
> >>>>>>>>>> userspace programs associated with different usages that reside under
> >>>>>>>>>> the vendor HID. Specifically, 0x5d is used by Armoury Crate, which
> >>>>>>>>>> controls RGB and 0x5e by an animation program for certain Asus laptops.
> >>>>>>>>>> Neither is used currently in the driver.
> >>>>>>>>> What benefits do we get from removing the unused initialization?
> >>>>>>>>>
> >>>>>>>>> If this has never caused any troubles I don't see the reason for removing
> >>>>>>>>> them. Moreover the lighting protocol is known and I might as well add
> >>>>>>>>> support for it in the near future,
> >>>>>>>> I already have a patch that adds RGB and delay inits that endpoint. It
> >>>>>>>> got removed to make this easier to merge. See [1].
> >>>>>>>>
> >>>>>>>> [1] https://lore.kernel.org/lkml/20250324210151.6042-10-lkml@antheas.dev/
> >>>>>>> I have to main concerns about this:
> >>>>>>>
> >>>>>>> 1. taking away initialization commands in one patchset to make it
> >>>>>>> easier to merge another unrelated patch doesn't seem the right thing
> >>>>>>> to do if the other patch it's not in the same series.
> >>>>>>>
> >>>>>>> I can see [1] has been removed from the set for a later moment in time,
> >>>>>>> it's fine if it needs more work, just send something that function in the
> >>>>>>> same way and do not remove initialization commands when unnecessary,
> >>>>>>> especially since there will be for sure future development.
> >>>>>> The initialization was removed as part of general cleanup. Not to make
> >>>>>> it easier to merge the RGB patch. In addition, the RGB patch only runs
> >>>>>> the init in a lazy fashion, so if nobody uses the RGB sysfs the init
> >>>>>> does not run and the behavior is the same.
> >>>>> There are a few problems here:
> >>>>> 1. sope creep: either do a cleanup or solve bugs. The fact that your flow z13
> >>>>> doesn't load hid-asus correctly has nothing to do with the initialization of anime.
> >>>>> The fact that hid-asus is driving leds instead of asus-wmi has nothing to do with
> >>>>> anime matrix initialization either.
> >>>>> 2. not sending the initialization can get hardware misbehave because it
> >>>>> is left in an uninitialized state.
> >>>>> 3. there are absolutely zero reasons to do that. There are even less reasons
> >>>>> as to do it as part of this patchset.
> >>>>>
> >>>>>>> 2. Your patchset resolves around keyboard backlight control and how
> >>>>>>> the keyboard device is exposed to userspace: it's fine but I do not see
> >>>>>>> the point in removing initialization commands that has nothing to do
> >>>>>>> with the issue we are trying to solve here.
> >>>>>>>
> >>>>>>> Please leave 0x5E and 0x5D initialization commands where they are now.
> >>>>>> I mean the second part of the patchset does that. The first part is a
> >>>>>> cleanup. What would be the reason for keeping 0x5E and 0x5D? They are
> >>>>>> only used when initializing those endpoints to write further commands
> >>>>>> to them and for identification. The current driver does not write
> >>>>>> commands to those endpoints and identifies itself over 0x5A.
> >>>>> There are no bugs opened that ties initialization of devices to bugs.
> >>>>> Quite the opposite: I can guarantee you that removing part of the
> >>>>> init will introduce regressions.
> >>>>>
> >>>>> The onus is on you to provide strong evidence that the removal is
> >>>>> a necessary act.
> >>>>>
> >>>>> Regardless it is not in the scope of this patchset: remove it.
> >>>>>> I do get that it is a bit risky as some laptops might be hardcoded to
> >>>>>> wait for 0x5D to turn on RGB. Which is why we had the last patch until
> >>>>>> V4. But we have yet to find a laptop that has this problem, so I find
> >>>>>> it difficult to justify keeping the init.
> >>>>> Yes it's risky to remove initialization sequences for a device that is
> >>>>> in every modern ASUS laptop and is tied to the EC.
> >>>>>> Do note that you might need to add the 0x5D init to your userspace
> >>>>>> program for certain laptops if you haven't already. But that is ok,
> >>>>>> since in doing so you are also validating you are speaking to an Asus
> >>>>>> device, which is important.
> >>>>> This doesn't make much sense: why would anyone remove
> >>>>> a command from the kernel, that can be very well essential to some models
> >>>>> (sleep can break, for example) just to add it back in a userspace program?
> >>>>>
> >>>>> What does it mean I have to validate I am speaking to an asus device?
> >>>>> Software selects devices by known attribute, one of them is the vid:pid....
> >>>>> Beside what does this have to do with the removal of initialization commands
> >>>>> from the kernel?
> >>>>>
> >>>>> Even late initializing devices can lead to problems. Windows doesn't do that:
> >>>>> as soon as asus drivers are loaded all relevant initialization sequences are
> >>>>> sent; Windows is the only officially supported OS: do not introduce commands
> >>>>> flow divergence without strong reasons backing it up.
> >>>> If you think keeping 0x5D init is that important, I can spin patch [1]
> >>>> into this series. But then this quirk will stay in the kernel forever.
> >>>> I can even add 0x5E since that does not affect newer devices, which I
> >>>> care for simplifying the sequence.
> >> Fully initializing the device tied to the EC in the same windows does
> >> is not a "quirk". Please stop calling it that.
> >>
> >> It will stay on the kernel until we have strong evidence that it is causing
> >> problems, at that point we simply avoid doing it for problematic laptops.
> >>
> >> If adding other commands doesn't introduce regressions or are otherwise
> >> easy to bisect and makes more hardware working please do.
> > It is not an init sequence. It is a handshake with the userspace
> > program that proves to the program it is talking with a genuine asus
> > device and to the device with the correct program. For all devices
> > that I have tested it seems to NOOP.
> The MCU doesn't distinguish between userspace or kernel space:
> "it is a handshake" => yeah handshakes are part of initialization procedures.
> "with the userspace program [...]" => MCU does not care where data is coming from.
>
> Anyway further discussion is useless. We understood you are against
> keeping commands that that you believe  are useless, but sometimes
> software is like life: you have to accept compromises.
> > 0x5a is the only one used for a driver and it does brightness control.
> > 0x5d/0x5e are used with userspace Windows programs. 0x5d does RGB.
> > Moreover, the application 0xff310076 only has a single report ID under
> > it, 0x5a. 0x5d and 0x5e belong to different hid applications that are
> > not currently checked by the driver (but when they exist they reside
> > under the same hid endpoint, with a multi-application collection that
> > bifurcates in Windows to multiple hid devices).
> The MCU works as a state machine where the status is updated
> on sleep, power on and power off: not sending initialization commands
> will confuse (some) hardware. If not now in a few years when some user will
> migrate away from whatever debian 12 they are running.
>
> Those commands are not simple commands to "just init the device" as you
> are depicting here. Stop doing that.
> > So it makes sense to remove the redundant handshakes. If some laptops
> > require 0x5d to enable shortcuts as Luke said, I have a patch that
> > does that and is straightforward to do. But since the shortcut
> > response comes from the 0x5a endpoint, I find it unlikely for it to
> > require a handshake over a different endpoint to init.
> So you want to remove some code, that has caused no troubles, on
> the assumption that such removal won't have any visible consequence,
> but you have a patch ready to restore the previous behavior in case
> something goes wrong? It doesn't matter if you find it unlikely or not:
> either there is a strong reason to remove it or there is not: you finding
> such removal "unlikely" to break anything down the line is not a strong
> reason to remove it. The fact that you don't like some code is not a strong
> reason to remove it either.
>
> Antheas... your flow z13 isn't loading correctly. Focus on the issue
> at hands. Please.
>

If that initialization means that much to you I will re-add the patch
that runs it on old laptops. No need to crash out

> >>>> Luke said these two pairs are the important ones to keep.
> >>>>
> >>>> I'm not sure what to do.
> >>> I was asked by a 2025 Asus Zenbook Duo user to add his IDs in [1]. In
> >>> doing so, I updated the rgb and legacy init patches for the new series
> >>> and added a quirk for early init of the duo keyboards.
> >> I will take a look when I can, but if you haven't removed anything
> >> that shouldn't pose any risk. None that I can think of at the moment anyway.
> >>> The series is 14 patches long, I don't think my email can take it :(
> >> linux.dev accounts for maintainers are provided free of charge
> >> and I had to ask for an account too. I suggest you do the same.
> >>> Should we merge the first part of this series with the legacy init,
> >>> then do the backlight refactor, and finally the new Duo stuff + rgb?
> >> I think so. My only doubt is about the per_app quirk. Other than
> >> that looks good and solves one problem while also better representing
> >> the hardware, so I can't think of any blockers.
> >>> Antheas
> >>>
> >> Thanks,
> >> Denis
> >>>> Antheas
> >>>>
> >>>> [1] https://lore.kernel.org/all/20250325184601.10990-12-lkml@antheas.dev/
> >>>>
> >>>>>> Antheas
> >>>>>>
> >>>>> Denis
> >>>>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>>>>>>> ---
> >>>>>>>>>>  drivers/hid/hid-asus.c | 56 ++++++++++++++----------------------------
> >>>>>>>>>>  1 file changed, 19 insertions(+), 37 deletions(-)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>>>>>>>>> index a444d41e53b6..7ea1037c3979 100644
> >>>>>>>>>> --- a/drivers/hid/hid-asus.c
> >>>>>>>>>> +++ b/drivers/hid/hid-asus.c
> >>>>>>>>>> @@ -638,50 +638,32 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>>>>>>>>       unsigned char kbd_func;
> >>>>>>>>>>       int ret;
> >>>>>>>>>>
> >>>>>>>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> >>>>>>>>>> -             /* Initialize keyboard */
> >>>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> >>>>>>>>>> -             if (ret < 0)
> >>>>>>>>>> -                     return ret;
> >>>>>>>>>> -
> >>>>>>>>>> -             /* The LED endpoint is initialised in two HID */
> >>>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>>>>>>> -             if (ret < 0)
> >>>>>>>>>> -                     return ret;
> >>>>>>>>>> -
> >>>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>>>>>>> -             if (ret < 0)
> >>>>>>>>>> -                     return ret;
> >>>>>>>>>> -
> >>>>>>>>>> -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>>>>>>>>> -                     ret = asus_kbd_disable_oobe(hdev);
> >>>>>>>>>> -                     if (ret < 0)
> >>>>>>>>>> -                             return ret;
> >>>>>>>>>> -             }
> >>>>>>>>>> -
> >>>>>>>>>> -             if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> >>>>>>>>>> -                     intf = to_usb_interface(hdev->dev.parent);
> >>>>>>>>>> -                     udev = interface_to_usbdev(intf);
> >>>>>>>>>> -                     validate_mcu_fw_version(hdev,
> >>>>>>>>>> -                             le16_to_cpu(udev->descriptor.idProduct));
> >>>>>>>>>> -             }
> >>>>>>>>>> +     ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> >>>>>>>>>> +     if (ret < 0)
> >>>>>>>>>> +             return ret;
> >>>>>>>>>>
> >>>>>>>>>> -     } else {
> >>>>>>>>>> -             /* Initialize keyboard */
> >>>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> >>>>>>>>>> -             if (ret < 0)
> >>>>>>>>>> -                     return ret;
> >>>>>>>>>> +     /* Get keyboard functions */
> >>>>>>>>>> +     ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> >>>>>>>>>> +     if (ret < 0)
> >>>>>>>>>> +             return ret;
> >>>>>>>>>>
> >>>>>>>>>> -             /* Get keyboard functions */
> >>>>>>>>>> -             ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> >>>>>>>>>> +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>>>>>>>>> +             ret = asus_kbd_disable_oobe(hdev);
> >>>>>>>>>>               if (ret < 0)
> >>>>>>>>>>                       return ret;
> >>>>>>>>>> +     }
> >>>>>>>>>>
> >>>>>>>>>> -             /* Check for backlight support */
> >>>>>>>>>> -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>>>>>>>>> -                     return -ENODEV;
> >>>>>>>>>> +     if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> >>>>>>>>>> +             intf = to_usb_interface(hdev->dev.parent);
> >>>>>>>>>> +             udev = interface_to_usbdev(intf);
> >>>>>>>>>> +             validate_mcu_fw_version(
> >>>>>>>>>> +                     hdev, le16_to_cpu(udev->descriptor.idProduct));
> >>>>>>>>>>       }
> >>>>>>>>>>
> >>>>>>>>>> +     /* Check for backlight support */
> >>>>>>>>>> +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>>>>>>>>> +             return -ENODEV;
> >>>>>>>>>> +
> >>>>>>>>>>       drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
> >>>>>>>>>>                                             sizeof(struct asus_kbd_leds),
> >>>>>>>>>>                                             GFP_KERNEL);
>


