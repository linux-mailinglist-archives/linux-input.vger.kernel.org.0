Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3089912299B
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 12:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfLQLNy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Dec 2019 06:13:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40649 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726487AbfLQLNy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Dec 2019 06:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576581232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4CBEBZWML4w0UBJviNnoxCa9DozuOV0sEO5vCvdKUak=;
        b=TAAA2Qb8pzmKCZf6iXwfAIX/6ZiYMB0nOD1gfEdPYT9+/ToE2IgVhnaIBZWv9UwSHrpLvs
        xczwxTfv69UlNvFh/1n2xGno4PMroDRhBa9twxc4fsCLyMmhmVZotwRyyNIg60fuT8McfI
        QlJqZvJPdDwMo+nt2AW9396qRKa6mFI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-ASXGUzjqP3CnYz7K-QaZwg-1; Tue, 17 Dec 2019 06:13:51 -0500
X-MC-Unique: ASXGUzjqP3CnYz7K-QaZwg-1
Received: by mail-qv1-f69.google.com with SMTP id g6so3167100qvp.0
        for <linux-input@vger.kernel.org>; Tue, 17 Dec 2019 03:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4CBEBZWML4w0UBJviNnoxCa9DozuOV0sEO5vCvdKUak=;
        b=r0263x55Lvpcel/BGHr8lTEFOv2kfWJWiGIjpaWq3Zwh/JA6X4F/qVTomqkL57OVh1
         1RM/+E3UhCxGOQATgkqgG28SA+W8xhMFskrThhKK1hESmffN7ZPzRdatd/MFCrabQUOn
         xjM+CqRA3UCUaosePghd8sHY+X6U8SkHUlv6flayffp1g2JqBaTV8EgJFpivct43u+ap
         i8wIA2eSvXLdEmuUyIU6seuSY3iRMdSAUZubykt9fRpGDlqlp5h0U7ANfmRc96hw5oWn
         0K42TuPVzVxjL7345bVN1MGkvOBjtEUNgV0IGGpXUnUhgxyhOa+l/bs6STopN+WJMdb+
         Td/w==
X-Gm-Message-State: APjAAAWhv4AyXmPXfuP4/xnlDacVtz5TuZcZ9/aHJwUr6ET/etNM0LeF
        Qk5pQBrAk8d3ok75TE9iNN3WiNxZh+0bDYnU3Gw0WQ52WLxboQVVIFC+4HJ+5ACzuuzuIOxytOB
        n11iF741BZgQnhuXFUBEe62BXioJU3luzh08rxkQ=
X-Received: by 2002:a05:620a:782:: with SMTP id 2mr4382935qka.169.1576581230619;
        Tue, 17 Dec 2019 03:13:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6vJ50g5vvsapyieYqcQqtVURZHH4yOXS+fN37jLto8oNDZv28iNBnvhmDX33O923fSFhNS33IsjaxaUOmhhU=
X-Received: by 2002:a05:620a:782:: with SMTP id 2mr4382895qka.169.1576581230201;
 Tue, 17 Dec 2019 03:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20191106060648.3018478-1-djogorchock@gmail.com> <CAKF84v1MoJFURpipRaAYA-T7+ZDz=9LvmXQnNYzDHeVX3B7WbQ@mail.gmail.com>
In-Reply-To: <CAKF84v1MoJFURpipRaAYA-T7+ZDz=9LvmXQnNYzDHeVX3B7WbQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 17 Dec 2019 12:13:38 +0100
Message-ID: <CAO-hwJLUHRAqssYT78FaP5p8kkHw6EbeOUaCnXn5ji1z5UQ8Aw@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] HID: nintendo
To:     Siarhei Vishniakou <svv@google.com>
Cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        Billy Laws <blaws05@gmail.com>, Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roderick" <Roderick.Colenbrander@sony.com>,
        s.jegen@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Siarhei,

Thanks for your time reviewing the driver, but there are some missing
points below:

On Wed, Dec 11, 2019 at 2:41 AM Siarhei Vishniakou <svv@google.com> wrote:
>
> Hi Daniel,
>
> I have a couple additional suggestions for this driver, mainly around pro=
be / remove.
>
> For typical touchscreen drivers, during probe(), the following pattern is=
 followed:
>
> probe () {
>     error =3D input_register_device(info->input_dev);
>     if (error) {
>         goto some_error_label;
>     }
>     error =3D do_more_stuff();
>     if (error) {
>         goto error_after_input_register;
>     }
> error_after_input_register:
>    input_unregister_device(info->input_dev);
> some_error_label:  // pass
> }
> And likewise, "input_unregister_device" will be called in "remove".
> Searching through hid-nintendo, I don't see any calls to "input_unregiste=
r_device".

This is because Daniel used the managed version `devm_input_allocate_device=
()`:

 * Managed input devices do not need to be explicitly unregistered or
 * freed as it will be done automatically when owner device unbinds from
 * its driver (or binding fails). Once managed input device is allocated,
 * it is ready to be set up and registered in the same fashion as regular
 * input device. There are no special devm_input_device_[un]register()
 * variants, regular ones work with both managed and unmanaged devices,
 * should you need them. In most cases however, managed input device need
 * not be explicitly unregistered or freed.


>
> Another thing that I noticed is the usage of the following pattern during=
 probe:
> probe() {
>     joycon_input_create()
>     joycon_leds_create()
> }
>
> Here, each of the two above functions requires communication with the con=
troller using the commands.
> The joystick might be already sending out the event reports during this t=
ime.
> But in this case, probe() is still not finished. So there will be a mixtu=
re of commands and event reports coming in to the driver.
> Currently, this is guarded against by using joycon_ctlr_state, and all ev=
ents received while probe hasn't finished are being dropped.
>
> From the userspace, it will look like an input device is registered, but =
it is essentially guaranteed to not receive any events for some additional =
time because the events will be silently dropped (since probe is still not =
finished).
>
> I suggest rearranging the probe code to first collect all of the initiali=
zation information from the driver using commands, and then start registeri=
ng the devices with the system.
> Since currently the probe fails if some of the commands are not responded=
 to properly, this would also prevent having to register/unregister devices=
 during probe in case of errors.

Well, the code already does the initialization first, and then
registers the user-space components.
But I agree that we should register the input node last, so that when
userspace sees the input node, it will be able to look for the player
LEDs and do the association without a race. So we need to first
register power (it's independent of the rest), then LEDs, then input.

>
> Another minor suggestion is to change joycon_ctlr_state into a bool probe=
_completed (or something like bool ready_to_process), I think it would be a=
 bit more readable.

Well, right now it is a binary state, and maybe you are right, it
might be more readable. But I have a feeling we will soon need a
JOYCON_CTLR_STATE_DESTROY, and the enum will make more sense.

>
> Thanks for your hard work on this!

Thanks for the look :)

Daniel, I am still planning to do a full review on it before v5.6 gets
opened. No guarantees I'll be able to squeeze it this week, so I would
appreciate any of the previous reviewers some time to also review this
version :)

Cheers,
Benjamin

>
> =D0=B2=D1=82, 5 =D0=BD=D0=BE=D1=8F=D0=B1. 2019 =D0=B3. =D0=B2 22:06, Dani=
el J. Ogorchock <djogorchock@gmail.com>:
>>
>> This is a pretty minor change. Importantly it resolves a couple compiler
>> errors when building the driver with a version of gcc prior to 8. It
>> seems that gcc 8 and above are more relaxed about using const integers
>> to initialize other const values and in case statement matching.
>>
>> It also sets the input device's uniq value to the controller's MAC
>> address. This will be useful once gyro/accelerometer support is added in
>> the future (likely as a second input device). Since the joy-cons can
>> also be used via uart on the nintendo switch's serial rails, this is
>> also a useful mechanism for associating one joy-con between two drivers
>> (hid-nintendo and any serdev joy-con driver written to run on the
>> nintendo switch itself).
>>
>> Version 9 changes:
>>   - Fixed compiler errors on gcc versions older than 8.2
>>   - Set input device's uniq value to the controller's MAC address
>>
>> Version 8 changes:
>>   - Corrected the handshaking protocol with USB pro controllers. A
>>     handshake now occurs both prior and after the baudrate set. This
>>     doesn't appear to have a noticeable difference, but it more
>>     accurately follows documentation found online.
>>   - Fixed potential race condition which could lead to a slightly longer
>>     delay sending subcommands in rare circumstances.
>>   - Moved the rumble worker to its own workqueue, since it can block.
>>     This prevents it from having a negative impact on the default kernel
>>     workqueue. It also prevents dropped subcommands due to something
>>     else blocking the kernel workqueue. The benefit is most obvious when
>>     using multiple controllers at once, since the controller subcommand
>>     timings are very picky.
>>   - Added a patch to set the most significant bit of the hid hw version.
>>     Roderick had mentioned needing to probably do this awhile ago, but I
>>     had forgotten about it until now. This is the same thing hid-sony
>>     does. It allows SDL2 to have different mappings for the hid-nintendo
>>     driver vs the default hid mappings.
>>
>> Version 7 changes:
>>   - Changed name to hid-nintendo to fit modern naming conventions
>>   - Removed joycon_ctlr_destroy(), since it wasn't needed an could
>>     potentially invalidate a mutex while it could be in use on other
>>     threads
>>   - Implemented minor code improvements suggested by Silvan
>>   - The driver now waits to send subcommands until after receiving an
>>     input report. This significantly reduces dropped subcommands.
>>   - Reduced the number of error messages when disconnecting a
>>     controller.
>>
>> Version 6 changes:
>>   - Improved subcommand sending reliabilty
>>   - Decreased rumble period to 50ms
>>   - Added rumble queue to avoid missing ff_effects if sent too quickly
>>   - Code cleanup and minor refactoring
>>   - Added default analog stick calibration
>>
>> Version 5 changes:
>>   - Removed sysfs interface to control motor frequencies.
>>   - Improved rumble reliability by using subcommands to set it.
>>   - Changed mapping of the SL/SR triggers on the joy-cons to map to
>>     whichever triggers they lack (e.g. a left joycon's sl/sr map to
>>     TR and TR2). This allows userspace to distinguish between the
>>     normal and S triggers.
>>   - Minor refactors
>>
>> Version 4 changes:
>>   - Added support for the Home button LED for the pro controller and
>>     right joy-con
>>   - Changed name from hid-switchcon to hid-joycon
>>   - Added rumble support
>>   - Removed ctlr->type and use hdev->product instead
>>   - Use POWER_SUPPLY_CAPACITY_LEVEL enum instead of manually translating
>>     to capacity percentages
>>   - Misc. minor refactors based on v3 feedback
>>
>> Version 3 changes:
>>   - Added led_classdev support for the 4 player LEDs
>>   - Added power_supply support for the controller's battery
>>   - Made the controller number mutex static
>>   - Minor refactoring/style fixes based on Roderick's feedback from v2
>>
>> Version 2 changes:
>>   - Switched to using a synchronous method for configuring the
>>         controller.
>>   - Removed any pairing/orientation logic in the driver. Every
>>     controller now corresponds to its own input device.
>>   - Store controller button data as a single u32.
>>   - Style corrections
>>
>> Daniel J. Ogorchock (10):
>>   HID: nintendo: add nintendo switch controller driver
>>   HID: nintendo: add player led support
>>   HID: nintendo: add power supply support
>>   HID: nintendo: add home led support
>>   HID: nintendo: add rumble support
>>   HID: nintendo: improve subcommand reliability
>>   HID: nintendo: send subcommands after receiving input report
>>   HID: nintendo: reduce device removal subcommand errors
>>   HID: nintendo: patch hw version for userspace HID mappings
>>   HID: nintendo: set controller uniq to MAC
>>
>>  MAINTAINERS                |    6 +
>>  drivers/hid/Kconfig        |   24 +
>>  drivers/hid/Makefile       |    1 +
>>  drivers/hid/hid-ids.h      |    3 +
>>  drivers/hid/hid-nintendo.c | 1558 ++++++++++++++++++++++++++++++++++++
>>  5 files changed, 1592 insertions(+)
>>  create mode 100644 drivers/hid/hid-nintendo.c
>>
>> --
>> 2.23.0
>>

