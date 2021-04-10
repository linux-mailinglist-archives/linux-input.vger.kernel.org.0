Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9385F35AB49
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 08:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhDJGJB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 02:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhDJGJB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 02:09:01 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8423C061763
        for <linux-input@vger.kernel.org>; Fri,  9 Apr 2021 23:08:46 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id l14so6056831ljb.1
        for <linux-input@vger.kernel.org>; Fri, 09 Apr 2021 23:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YtlxBAckHEVcMTzzk1eSnqgjQve7RSRroSO9lEg7fso=;
        b=OhThh5iEjoeLawSNAlUqk65gx1iZfMpx7HG3h7vzPlbh4gZRlouUjaL8PrNXxQfAk7
         fEDeZUGSyOL6+Ok+0JSR4fYRukbeRoO9VPO46ZHLO7jk2hCiTKcQbHIo3aXHJjRC+HnQ
         0BX3UTnej7hn1WjqTjc70pRXVsFHlVAY7f9+7mE/RGuOJA0UbxwVYON2yA9QQ3/SI63p
         s4fNFzgm9jXdzrMm0bp78cGXH7TbQvzuikW9bx8hCk51zKrmtIzVDDZd23DspBz/jiCH
         8uiwKwvjJAhp2iTeBXGgTXhSJGKt9UoEUfaH1kqiB80kJwWD2o/BkffWXT969jzjF1rx
         fvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YtlxBAckHEVcMTzzk1eSnqgjQve7RSRroSO9lEg7fso=;
        b=Ii7dzLhi1TGBKj3Sv7M+Z4Aq3RhkS6Z+UqFpGuxi8boK7Wslf6Z6UFYn5U/4MmY3a0
         Twkxr0IMTC+Bkpn4cunr0K97nVI8NxXQRjEOtKRXTEnnUbhdvhdcTlTXjDvGgdTpvP0A
         MQ71Pe8/MVR/XZFxOkb4m16SBrCMPshM4L1H2CSCwfRBKObOG++KYTVwtepG+MjUJcK1
         U+vUmp6wHWDQPn/xMqoE9WEkwQsJ9DbFTd+7JT3YpjSHiDCbidSaIsJA0bK5Gv4zJ8Ql
         73hffClpCr+Iya/dTuLvufow9Fl0Ig+Tc9L6KpluO8c13olpU8JP5wA/5C2heV+KjHSd
         1Ncg==
X-Gm-Message-State: AOAM530/h8LO3iBdVw+NYxLPTT10UvP9F5TJ8HTDV0ilafcNsj+aab+g
        nJQztd9ZEZ9HlUA4NWtRslLW4A92BnoqaVzyEoSFlQ==
X-Google-Smtp-Source: ABdhPJzRQC6OQhKJ6Z94kPR5hmnw7C3mH2x/FThwj56shsx6DYDvvf2CCZi1U0mZhCFWW+/8YLIr0tPXXgyEvKSPhwo=
X-Received: by 2002:a2e:9047:: with SMTP id n7mr11459133ljg.291.1618034924829;
 Fri, 09 Apr 2021 23:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210225053204.697951-1-lzye@google.com> <1b315e2cd02f4017cc746909088cc8bc1a39024e.camel@hadess.net>
 <CAFFuddJKqkUEFdqhk8o+6K3_a42UyT934dmj002MS8deLD6fdA@mail.gmail.com>
 <CAFFudd+Y6maj=F8LwGeakvkRoh_a_s2yi_rtB4LUnY=CVrMGWA@mail.gmail.com>
 <CAEc3jaCG2NvYcNHwk7rnvw4pgmbEEeDdfvB3SdP5Vs2ROtS9kw@mail.gmail.com>
 <9f7e01a5b70a7e06c66eca4c297e3882f5243bfc.camel@hadess.net> <CAFFudd+rRgc5MnpMHDioNVxmdyu=gVy0r1s-+WyEX8q+_dSs3A@mail.gmail.com>
In-Reply-To: <CAFFudd+rRgc5MnpMHDioNVxmdyu=gVy0r1s-+WyEX8q+_dSs3A@mail.gmail.com>
From:   Chris Ye <lzye@google.com>
Date:   Fri, 9 Apr 2021 23:08:33 -0700
Message-ID: <CAFFuddKwXoQgiPnP_oj3fvYTnkOOLug61a-5WB4XYYnAWC+qwA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Input: Add "Share" button to Microsoft Xbox One controller.
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?Q?=C5=81ukasz_Patron?= <priv.luk@gmail.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Olivier_Cr=C3=AAte?= <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, trivial@kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From the product information site
https://www.xbox.com/en-US/accessories/controllers/xbox-wireless-controller
this button is referred as "Share button":
"Stay on target with textured grip and a hybrid D-pad. Seamlessly
capture and share content with a dedicated Share button. Quickly pair
with, play on, and switch between devices "
Should we override the product button name and name it "Select" in
driver?   I am ok with either way but can we have a name everyone can
agree on and move forward?

Thanks!
Chris


On Tue, Mar 23, 2021 at 2:52 PM Chris Ye <lzye@google.com> wrote:
>
> The name "Share button" is a product name from Microsoft and they choose the button to be used for "record" as the device firmware maps the button to Consumer(Record) HID usage.
> Can we accept the patch to make the "Share button" to work consistently under USB mode, same as Bluetooth mode?
>
> Thanks!
> Chris
>
> On Thu, Mar 4, 2021 at 11:18 PM Bastien Nocera <hadess@hadess.net> wrote:
>>
>> On Thu, 2021-03-04 at 20:42 -0800, Roderick Colenbrander wrote:
>> > (resend in plain text)
>> > +benjamin in a more explicit way
>> >
>> > Hi Chris,
>> >
>> > I see the need for the Record button. I wonder what makes sense from
>> > the Linux kernel perspective. For DualShock 4 and DualSense there is a
>> > Share button too (it introduced it). For DualShock 4 that was mapped
>> > to 'Select' I think per Linux gamepad spec. For DualSense in 5.12 we
>> > did the same... Though if there is a true 'Record' button we want to
>> > use moving forward. Maybe we still want to change the button
>> > definition for DualSensein 5.12 while we can...
>> >
>> > It would be good to get some consensus on these buttons.
>>
>> The XBox One Series X controller has 3 of those "middle" buttons, 2
>> equivalent to Start/Select on older controllers (that were already
>> present on older versions of the pad) and Share.
>> https://www.xbox.com/en-US/accessories/controllers/xbox-wireless-controller
>>
>> The Options buttons on the DS4 replaces Start and Select:
>> https://manuals.playstation.net/document/en/ps4/basic/pn_controller.html
>> so Share got added, but Select taken away, which is why you had to
>> label it Select in the driver.
>>
>> I don't really see how to fix that without retroactively re-adding
>> buttons to the DS4 controller ;)
>>
>> >
>> > Thanks,
>> > Roderick
>> >
>> >
>> > On Thu, Mar 4, 2021 at 6:25 PM Chris Ye <lzye@google.com> wrote:
>> > >
>> > > Hi Bastien,  just want to follow up again on this.  I've checked
>> > > again
>> > > with the Xbox team that the "Share button" is given for the product,
>> > > the HID usage profile and mapping to RECORD is what Xbox team expects
>> > > and they want the same mapping for USB.
>> > >
>> > > Thanks!
>> > > Chris
>> > >
>> > >
>> > > On Tue, Mar 2, 2021 at 3:57 PM Chris Ye <lzye@google.com> wrote:
>> > > >
>> > > > Hi Bastien,
>> > > >     The "Share button" is a name Microsoft calls it, it actually
>> > > > has
>> > > > HID descriptor defined in the bluetooth interface, which the HID
>> > > > usage
>> > > > is:
>> > > > consumer 0xB2:
>> > > > 0x05, 0x0C,        //   Usage Page (Consumer)
>> > > > 0x0A, 0xB2, 0x00,  //   Usage (Record)
>> > > > Microsoft wants the same key code to be generated consistently for
>> > > > USB
>> > > > and bluetooth.
>> > > > Thanks!
>> > > > Chris
>> > > >
>> > > >
>> > > > On Tue, Mar 2, 2021 at 1:50 AM Bastien Nocera <hadess@hadess.net>
>> > > > wrote:
>> > > > >
>> > > > > On Thu, 2021-02-25 at 05:32 +0000, Chris Ye wrote:
>> > > > > > Add "Share" button input capability and input event mapping for
>> > > > > > Microsoft Xbox One controller.
>> > > > > > Fixed Microsoft Xbox One controller share button not working
>> > > > > > under USB
>> > > > > > connection.
>> > > > > >
>> > > > > > Signed-off-by: Chris Ye <lzye@google.com>
>> > > > > > ---
>> > > > > >  drivers/input/joystick/xpad.c | 9 ++++++++-
>> > > > > >  1 file changed, 8 insertions(+), 1 deletion(-)
>> > > > > >
>> > > > > > diff --git a/drivers/input/joystick/xpad.c
>> > > > > > b/drivers/input/joystick/xpad.c
>> > > > > > index 9f0d07dcbf06..0c3374091aff 100644
>> > > > > > --- a/drivers/input/joystick/xpad.c
>> > > > > > +++ b/drivers/input/joystick/xpad.c
>> > > > > > @@ -79,6 +79,7 @@
>> > > > > >  #define MAP_DPAD_TO_BUTTONS            (1 << 0)
>> > > > > >  #define MAP_TRIGGERS_TO_BUTTONS                (1 << 1)
>> > > > > >  #define MAP_STICKS_TO_NULL             (1 << 2)
>> > > > > > +#define MAP_SHARE_BUTTON               (1 << 3)
>> > > > > >  #define DANCEPAD_MAP_CONFIG    (MAP_DPAD_TO_BUTTONS
>> > > > > > >                  \
>> > > > > >                                 MAP_TRIGGERS_TO_BUTTONS |
>> > > > > > MAP_STICKS_TO_NULL)
>> > > > > >
>> > > > > > @@ -130,6 +131,7 @@ static const struct xpad_device {
>> > > > > >         { 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0,
>> > > > > > XTYPE_XBOXONE },
>> > > > > >         { 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0,
>> > > > > > XTYPE_XBOXONE
>> > > > > > },
>> > > > > >         { 0x045e, 0x0719, "Xbox 360 Wireless Receiver",
>> > > > > > MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
>> > > > > > +       { 0x045e, 0x0b12, "Microsoft X-Box One X pad",
>> > > > > > MAP_SHARE_BUTTON, XTYPE_XBOXONE },
>> > > > > >         { 0x046d, 0xc21d, "Logitech Gamepad F310", 0,
>> > > > > > XTYPE_XBOX360 },
>> > > > > >         { 0x046d, 0xc21e, "Logitech Gamepad F510", 0,
>> > > > > > XTYPE_XBOX360 },
>> > > > > >         { 0x046d, 0xc21f, "Logitech Gamepad F710", 0,
>> > > > > > XTYPE_XBOX360 },
>> > > > > > @@ -862,6 +864,8 @@ static void xpadone_process_packet(struct
>> > > > > > usb_xpad
>> > > > > > *xpad, u16 cmd, unsigned char
>> > > > > >         /* menu/view buttons */
>> > > > > >         input_report_key(dev, BTN_START,  data[4] & 0x04);
>> > > > > >         input_report_key(dev, BTN_SELECT, data[4] & 0x08);
>> > > > > > +       if (xpad->mapping & MAP_SHARE_BUTTON)
>> > > > > > +               input_report_key(dev, KEY_RECORD, data[22] &
>> > > > > > 0x01);
>> > > > > >
>> > > > > >         /* buttons A,B,X,Y */
>> > > > > >         input_report_key(dev, BTN_A,    data[4] & 0x10);
>> > > > > > @@ -1669,9 +1673,12 @@ static int xpad_init_input(struct
>> > > > > > usb_xpad
>> > > > > > *xpad)
>> > > > > >
>> > > > > >         /* set up model-specific ones */
>> > > > > >         if (xpad->xtype == XTYPE_XBOX360 || xpad->xtype ==
>> > > > > > XTYPE_XBOX360W ||
>> > > > > > -           xpad->xtype == XTYPE_XBOXONE) {
>> > > > > > +               xpad->xtype == XTYPE_XBOXONE) {
>> > > > > >                 for (i = 0; xpad360_btn[i] >= 0; i++)
>> > > > > >                         input_set_capability(input_dev, EV_KEY,
>> > > > > > xpad360_btn[i]);
>> > > > > > +               if (xpad->mapping & MAP_SHARE_BUTTON) {
>> > > > > > +                       input_set_capability(input_dev, EV_KEY,
>> > > > > > KEY_RECORD);
>> > > > >
>> > > > > Is there not a better keycode to use than "Record"? Should a
>> > > > > "share"
>> > > > > keycode be added?
>> > > > >
>> > > > > I couldn't find a share button in the most recent USB HID Usage
>> > > > > Tables:
>> > > > > https://www.usb.org/document-library/hid-usage-tables-121
>> > > > >
>> > > > > > +               }
>> > > > > >         } else {
>> > > > > >                 for (i = 0; xpad_btn[i] >= 0; i++)
>> > > > > >                         input_set_capability(input_dev, EV_KEY,
>> > > > > > xpad_btn[i]);
>> > > > >
>> > > > >
>>
>>
