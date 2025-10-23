Return-Path: <linux-input+bounces-15687-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD7C03D4A
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 01:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 91EA54E248D
	for <lists+linux-input@lfdr.de>; Thu, 23 Oct 2025 23:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4476B26ED4F;
	Thu, 23 Oct 2025 23:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="GB8gMSfb"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952641D7E5C
	for <linux-input@vger.kernel.org>; Thu, 23 Oct 2025 23:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761261929; cv=none; b=lZegxJV8wRj88CkzvnC6XbXXsUfVC4OaOIgtXKLazkiQjGzIdt1hj4VWOBq3AE9HjkUPWE3pBqXTylpy154PCCN/cX8KfWVH9l8p7Zq5pIB0eIT1AAxbstnm7aLV30QJbR30XAOkhg7MnPBcURk+yNJ35V6W04XP7Ofj7dwpSv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761261929; c=relaxed/simple;
	bh=hrLyJFPmnWBxE5nTE4WopA6jSWRmOX1QoQXXQUd3/6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3NsSCMjSNv/jvfeMzWKgWouE7hoj3v/NMXtNSdLRnZmIbj3q99R3KwZdMDPL/cUWpkz9mshNB3JPr0jeBBGDZK4XWRBia9PggejRvg9TPpzF52DD8S0yLArg1cJmrw4nYfDeiredYkfSo0vNYIplu/skX/irB+9CgaF1Yz5qVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=GB8gMSfb; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id D8904BCF0B
	for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 02:25:23 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id D30BFC09C2
	for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 02:25:22 +0300 (EEST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 26CBF200C3E
	for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 02:25:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761261922;
	bh=v30uSgyRvLGD4h/9YY0+I2qmVjiP5xKTJlor6KYP1f0=;
	h=Received:From:Subject:To;
	b=GB8gMSfbVUUq0NBoyWDVV+oCBTt0Nn/a3PURplP4BZ9qX8ADiBJPEhdrgmxnp213S
	 tnSWY95XgLfoksxieXMOruXyetVQC0DKbUiMjkbgXEFandFg4+DVTpKXAG11Rw74mL
	 f27saKx4wy/+CqJTcx9JApjBrHum12JRaXap+wugevFf19paXME4trEPpsUAyHtgM3
	 pDOt0d+Iwl4Tg+u0jO4EfDqEadEB70U9nBzYpcenJ6ODncnRgq5/NXTJ3zwMIhI+/U
	 h1CRHcMJmLHTuKq0W8jzyD2xWnUT/CJ5vJycOLEUaelXu4juvlIOAIrEq6CRntxBO5
	 Ta+YB7+ZRbEfw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-378d50e1cccso16475401fa.0
        for <linux-input@vger.kernel.org>;
 Thu, 23 Oct 2025 16:25:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWnTiAH+NiWSpzjVPycxY5vrayq7s1ylzY+fkawBju0gptNPhmACBLfbYU/REl2cqpcC7jDamLrU9MCow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/UgN0dkg0yi4twH8Ap8V7BS4lIU8+hW0FxJyFJnaek8LtZujp
	Qpu/JYfT8pMAHOH6oFiGINzUfF1iAOPmLTBlWHHB0xVePRAJUhPkO7njA+zVWeD0wrX1FT+SlG1
	jLPW7x/nJfzfopLAem3aqUFGK4GAzbGY=
X-Google-Smtp-Source: 
 AGHT+IE21eJXwjonfat/KYGvmOxis/GubMW/f1l1oPQ785t9zs98VU+0ZeRAQDSlH38l92mFVFEiBBfoGTSrXLuFn6U=
X-Received: by 2002:a2e:a10e:0:b0:36c:f394:2ad6 with SMTP id
 38308e7fff4ca-37797826435mr90559571fa.6.1761261921419; Thu, 23 Oct 2025
 16:25:21 -0700 (PDT)
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
In-Reply-To: <b91de7c7-74b8-4cf5-82a4-f3d4eaf418d4@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 24 Oct 2025 01:25:10 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGj-yXHXBan38_NV7G5T66bnjm7om2bz_Bha35AHhtCJQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnH9vzGS9MG63MCgYyqrmvack8iJRT1nnk78qV6caMk6j2vxZBFGhkg1HE
Message-ID: 
 <CAGwozwGj-yXHXBan38_NV7G5T66bnjm7om2bz_Bha35AHhtCJQ@mail.gmail.com>
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
 <176126192254.2462210.7525076269690475898@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 24 Oct 2025 at 00:53, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 10/23/25 23:30, Antheas Kapenekakis wrote:
> > On Thu, 23 Oct 2025 at 22:05, Denis Benato <benato.denis96@gmail.com> wrote:
> >>
> >> On 10/23/25 20:06, Antheas Kapenekakis wrote:
> >>> On Thu, 23 Oct 2025 at 19:38, Denis Benato <benato.denis96@gmail.com> wrote:
> >>>> On 10/18/25 12:17, Antheas Kapenekakis wrote:
> >>>>> Currently, RGB initialization forks depending on whether a device is
> >>>>> NKEY. Then, NKEY devices are initialized using 0x5a, 0x5d, 0x5e
> >>>>> endpoints, and non-NKEY devices with 0x5a and then a
> >>>>> backlight check, which is omitted for NKEY devices.
> >>>>>
> >>>>> Remove the fork, using a common initialization sequence for both,
> >>>>> where they are both only initialized with 0x5a, then checked for
> >>>>> backlight support. This patch should not affect existing functionality.
> >>>>>
> >>>>> 0x5d and 0x5e endpoint initializations are performed by Windows
> >>>>> userspace programs associated with different usages that reside under
> >>>>> the vendor HID. Specifically, 0x5d is used by Armoury Crate, which
> >>>>> controls RGB and 0x5e by an animation program for certain Asus laptops.
> >>>>> Neither is used currently in the driver.
> >>>> What benefits do we get from removing the unused initialization?
> >>>>
> >>>> If this has never caused any troubles I don't see the reason for removing
> >>>> them. Moreover the lighting protocol is known and I might as well add
> >>>> support for it in the near future,
> >>> I already have a patch that adds RGB and delay inits that endpoint. It
> >>> got removed to make this easier to merge. See [1].
> >>>
> >>> [1] https://lore.kernel.org/lkml/20250324210151.6042-10-lkml@antheas.dev/
> >> I have to main concerns about this:
> >>
> >> 1. taking away initialization commands in one patchset to make it
> >> easier to merge another unrelated patch doesn't seem the right thing
> >> to do if the other patch it's not in the same series.
> >>
> >> I can see [1] has been removed from the set for a later moment in time,
> >> it's fine if it needs more work, just send something that function in the
> >> same way and do not remove initialization commands when unnecessary,
> >> especially since there will be for sure future development.
> > The initialization was removed as part of general cleanup. Not to make
> > it easier to merge the RGB patch. In addition, the RGB patch only runs
> > the init in a lazy fashion, so if nobody uses the RGB sysfs the init
> > does not run and the behavior is the same.
> There are a few problems here:
> 1. sope creep: either do a cleanup or solve bugs. The fact that your flow z13
> doesn't load hid-asus correctly has nothing to do with the initialization of anime.
> The fact that hid-asus is driving leds instead of asus-wmi has nothing to do with
> anime matrix initialization either.
> 2. not sending the initialization can get hardware misbehave because it
> is left in an uninitialized state.
> 3. there are absolutely zero reasons to do that. There are even less reasons
> as to do it as part of this patchset.
>
> >> 2. Your patchset resolves around keyboard backlight control and how
> >> the keyboard device is exposed to userspace: it's fine but I do not see
> >> the point in removing initialization commands that has nothing to do
> >> with the issue we are trying to solve here.
> >>
> >> Please leave 0x5E and 0x5D initialization commands where they are now.
> > I mean the second part of the patchset does that. The first part is a
> > cleanup. What would be the reason for keeping 0x5E and 0x5D? They are
> > only used when initializing those endpoints to write further commands
> > to them and for identification. The current driver does not write
> > commands to those endpoints and identifies itself over 0x5A.
> There are no bugs opened that ties initialization of devices to bugs.
> Quite the opposite: I can guarantee you that removing part of the
> init will introduce regressions.
>
> The onus is on you to provide strong evidence that the removal is
> a necessary act.
>
> Regardless it is not in the scope of this patchset: remove it.
> > I do get that it is a bit risky as some laptops might be hardcoded to
> > wait for 0x5D to turn on RGB. Which is why we had the last patch until
> > V4. But we have yet to find a laptop that has this problem, so I find
> > it difficult to justify keeping the init.
> Yes it's risky to remove initialization sequences for a device that is
> in every modern ASUS laptop and is tied to the EC.
> > Do note that you might need to add the 0x5D init to your userspace
> > program for certain laptops if you haven't already. But that is ok,
> > since in doing so you are also validating you are speaking to an Asus
> > device, which is important.
> This doesn't make much sense: why would anyone remove
> a command from the kernel, that can be very well essential to some models
> (sleep can break, for example) just to add it back in a userspace program?
>
> What does it mean I have to validate I am speaking to an asus device?
> Software selects devices by known attribute, one of them is the vid:pid....
> Beside what does this have to do with the removal of initialization commands
> from the kernel?
>
> Even late initializing devices can lead to problems. Windows doesn't do that:
> as soon as asus drivers are loaded all relevant initialization sequences are
> sent; Windows is the only officially supported OS: do not introduce commands
> flow divergence without strong reasons backing it up.

If you think keeping 0x5D init is that important, I can spin patch [1]
into this series. But then this quirk will stay in the kernel forever.
I can even add 0x5E since that does not affect newer devices, which I
care for simplifying the sequence.

Luke said these two pairs are the important ones to keep.

I'm not sure what to do.

Antheas

[1] https://lore.kernel.org/all/20250325184601.10990-12-lkml@antheas.dev/

> > Antheas
> >
> Denis
> >>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>> ---
> >>>>>  drivers/hid/hid-asus.c | 56 ++++++++++++++----------------------------
> >>>>>  1 file changed, 19 insertions(+), 37 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>>>> index a444d41e53b6..7ea1037c3979 100644
> >>>>> --- a/drivers/hid/hid-asus.c
> >>>>> +++ b/drivers/hid/hid-asus.c
> >>>>> @@ -638,50 +638,32 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>>>       unsigned char kbd_func;
> >>>>>       int ret;
> >>>>>
> >>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> >>>>> -             /* Initialize keyboard */
> >>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> >>>>> -             if (ret < 0)
> >>>>> -                     return ret;
> >>>>> -
> >>>>> -             /* The LED endpoint is initialised in two HID */
> >>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>> -             if (ret < 0)
> >>>>> -                     return ret;
> >>>>> -
> >>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>> -             if (ret < 0)
> >>>>> -                     return ret;
> >>>>> -
> >>>>> -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>>>> -                     ret = asus_kbd_disable_oobe(hdev);
> >>>>> -                     if (ret < 0)
> >>>>> -                             return ret;
> >>>>> -             }
> >>>>> -
> >>>>> -             if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> >>>>> -                     intf = to_usb_interface(hdev->dev.parent);
> >>>>> -                     udev = interface_to_usbdev(intf);
> >>>>> -                     validate_mcu_fw_version(hdev,
> >>>>> -                             le16_to_cpu(udev->descriptor.idProduct));
> >>>>> -             }
> >>>>> +     ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> >>>>> +     if (ret < 0)
> >>>>> +             return ret;
> >>>>>
> >>>>> -     } else {
> >>>>> -             /* Initialize keyboard */
> >>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> >>>>> -             if (ret < 0)
> >>>>> -                     return ret;
> >>>>> +     /* Get keyboard functions */
> >>>>> +     ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> >>>>> +     if (ret < 0)
> >>>>> +             return ret;
> >>>>>
> >>>>> -             /* Get keyboard functions */
> >>>>> -             ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> >>>>> +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>>>> +             ret = asus_kbd_disable_oobe(hdev);
> >>>>>               if (ret < 0)
> >>>>>                       return ret;
> >>>>> +     }
> >>>>>
> >>>>> -             /* Check for backlight support */
> >>>>> -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>>>> -                     return -ENODEV;
> >>>>> +     if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> >>>>> +             intf = to_usb_interface(hdev->dev.parent);
> >>>>> +             udev = interface_to_usbdev(intf);
> >>>>> +             validate_mcu_fw_version(
> >>>>> +                     hdev, le16_to_cpu(udev->descriptor.idProduct));
> >>>>>       }
> >>>>>
> >>>>> +     /* Check for backlight support */
> >>>>> +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>>>> +             return -ENODEV;
> >>>>> +
> >>>>>       drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
> >>>>>                                             sizeof(struct asus_kbd_leds),
> >>>>>                                             GFP_KERNEL);
>


