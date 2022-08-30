Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4C25A6946
	for <lists+linux-input@lfdr.de>; Tue, 30 Aug 2022 19:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbiH3RKi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Aug 2022 13:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbiH3RKh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Aug 2022 13:10:37 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2411AABF0F
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 10:10:35 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id j17so9026547qtp.12
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 10:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=CmemY7wlU8bPvClpd4Fm1xtRg/TXWP/8zeggSMiVzk4=;
        b=BG8ggkaJRhHWFTKc8B76oZL01K8DxGjX4VsUjcjZKbhpFSHz4b6OBk9Slwcpvdb/wE
         z8+/N57GDgyMorDIc4d3v2zrxnYgACt6lpHFo8HPWlSFqtUo3WqmfECttZBLuYVALviQ
         75UGDMMKg8uQM5TxPd9R7A+o9sagb+jQvbW54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=CmemY7wlU8bPvClpd4Fm1xtRg/TXWP/8zeggSMiVzk4=;
        b=OLWViAqyMEXrpOG2gWGCb/4ZeBjkvZCaGbatsWuZ77AdaHea8s+2Gt9UWiTnZdtS8v
         W67VvnGZdAGjoA34IrLP8djJUuhhxxyroHbWZomRTSdiYvpzvnmGUQ+VAUSJJUDuGJyx
         T5COyYUZKX9wofYD5i9l9PCEovN+OEEfrYkurcb/xbpX4+S86u5tIjrBYGTMtDiroNnJ
         iLNw9XLTLCqodwpIxgmsOzn3TnmjR7T52YrWQl2V99tacUu+QJusn3jU1wplEyMK0XwK
         hWSKtJqvN1nD7zmGksFQBNqG8ib4atNbPv6kSyv89zk/QCZUFaTdyxxtJOahdOcT+aZn
         ZiLw==
X-Gm-Message-State: ACgBeo0R3ehXEYXWv+b2sOv0m7EO9E7bReGMLOEMuLqx4GFq5XHyhB+W
        VpKCiogEW5yvFwdyiZpTGO7YUV3PVgqvnA==
X-Google-Smtp-Source: AA6agR5WfJyqgavyjOA+tBc2hIjYOiK3gfDlEL0rp8li+E4xAusm0NbBCTUyTXn1ZF+pIsE6CR+Xlg==
X-Received: by 2002:ac8:5c09:0:b0:344:90a5:b65e with SMTP id i9-20020ac85c09000000b0034490a5b65emr15437060qti.161.1661879434006;
        Tue, 30 Aug 2022 10:10:34 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id w17-20020a05620a0e9100b006b9ab3364ffsm8107143qkm.11.2022.08.30.10.10.32
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:10:32 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id j17so9026447qtp.12
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 10:10:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1902:b0:344:4ff1:f983 with SMTP id
 w2-20020a05622a190200b003444ff1f983mr15802289qtc.65.1661879431801; Tue, 30
 Aug 2022 10:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <12042830.O9o76ZdvQC@kreacher> <1c7fa65d-47ab-b064-9087-648bcfbf4ab5@amd.com>
 <CAJZ5v0ie7B=GvhbfBsi7Zxu+=YzYKUqvUNs6dNZQfT3CRm=KPg@mail.gmail.com>
 <a2d2b61e-87c0-ee39-ea4e-3c575da0a66c@redhat.com> <CAHQZ30DjkyDT8KbsHzfwiyg6Tst9EFhtCnjx3MmwbWRerzW_6A@mail.gmail.com>
 <CAJZ5v0gXizr6szRA09fNYC0njUv-Dg7kDSu9FtmfDRgX2n45wg@mail.gmail.com> <CAHQZ30CNORQMD=URhEv3mCV8ELGYs8W6Z2tSqrLiUbxUbikauA@mail.gmail.com>
In-Reply-To: <CAHQZ30CNORQMD=URhEv3mCV8ELGYs8W6Z2tSqrLiUbxUbikauA@mail.gmail.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Tue, 30 Aug 2022 11:10:20 -0600
X-Gmail-Original-Message-ID: <CAHQZ30DjvDbvequmnWimMiCBT3txmndQaiGu12D0EKN=1MvjKQ@mail.gmail.com>
Message-ID: <CAHQZ30DjvDbvequmnWimMiCBT3txmndQaiGu12D0EKN=1MvjKQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: ACPI: Do not check ACPI_FADT_LOW_POWER_S0
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Tim Van Patten <timvp@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

So I think this is only half of the puzzle. The patches I linked above
work great if the wake bit is set. It falls apart once I add a power
resource.

i.e., given the following ACPI node:
    Device (D015)
    {
        Name (_HID, "ELAN0000")  // _HID: Hardware ID
        Name (_UID, Zero)  // _UID: Unique ID
        Name (_DDN, "ELAN Touchpad")  // _DDN: DOS Device Name
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                AddressingMode7Bit, "\\_SB.I2C0",
                0x00, ResourceConsumer, , Exclusive,
                )
            GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0028
                }
        })
        Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            PR00
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            PR00
        })
        PowerResource (PR00, 0x00, 0x0000)
        {
            Method (_STA, 0, Serialized) {} // _STA: Status
            Method (_ON, 0, Serialized) {} // _ON_: Power On
            Method (_OFF, 0, Serialized) {} // _OFF: Power Off
        }
    }

The above snippet has a power resource that can turn the device on and
off. It also uses the ExclusiveAndWake bit to signal that the IRQ can
be used to wake the system.
What ends up happening on suspend is the device_pm subsystem enables
the GPIO for wake, but the ACPI device_pm system, specifically
`acpi_dev_pm_get_state`, doesn't know the device is armed for wake and
powers off the device.

[acpi_dev_pm_get_state](https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/third_party/kernel/v5.15/drivers/acpi/device_pm.c;l=640)
uses `adev->wakeup.flags.valid` to decide if the device is armed for
wake. The `adev->wakeup` field is used to determine if the device has
a `_PRW` and associated GPE. Since we aren't using `_PRW` there is no
associated wake GPE. On suspend the ACPI device_pm subsystem puts the
device into D3Cold and thus the device can't wake the system. Ideally
`wakeup` would be true if we have a GPIO armed, and
`acpi_dev_pm_get_state` would call `_S0W`. This would put the device
into `D3Hot` so it can wake the system.

So I was thinking of having `acpi_dev_pm_get_state` check if a wakeup
IRQ is armed:

diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
index 19b33c028f356b..c68fa869dc6f75 100644
--- a/drivers/acpi/device_pm.c
+++ b/drivers/acpi/device_pm.c
@@ -634,7 +634,8 @@ static int acpi_dev_pm_get_state(struct device
*dev, struct acpi_device *adev,
                wakeup = device_may_wakeup(dev) && adev->wakeup.flags.valid
                        && adev->wakeup.sleep_state >= target_state;
        } else {
-               wakeup = adev->wakeup.flags.valid;
+               wakeup = adev->wakeup.flags.valid ||
+                        (device_may_wakeup(dev) && dev->power.wakeirq);
        }

        /*

I haven't tested this approach yet, but it seems clean and simple.

The alternative is to have the ACPI subsystem manage the Wake IRQ and
forgo calling `dev_pm_set_wake_irq` from the drivers. I'm not sure
what the best hook point is though. I'm thinking that when a driver
calls `acpi_dev_gpio_irq_get_by` we can store the wake_irq on the ACPI
node. Then in `acpi_pm_set_device_wakeup` we can arm/disarm the IRQ.
The benefit of this approach is that we call `_DSW` via
`acpi_device_sleep_wake` so we can enable/disable the device's wake
capabilities.

Or we take a hybrid approach and use `dev_pm_set_wake_irq` and still
call `_DSW`.

Thoughts?

On Fri, Aug 26, 2022 at 3:48 PM Raul Rangel <rrangel@chromium.org> wrote:
>
> So after tracing a bunch of code, I finally got a solution that I
> think will work. I just uploaded the patch train here:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/3858568.
> I'll push it to the mailing list once I do a bit more testing.
>
> Do we need to support setting the wake_irq for systems that don't use
> DT or ACPI? Ideally I would drop the following block:
>
> if (!dev->of_node && !has_acpi_companion(dev)) {
>     device_init_wakeup(dev, true);
>     dev_pm_set_wake_irq(dev, client->irq);
> }
>
> There are also a few other i2c drivers that need cleanup:
> * https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/third_party/kernel/v5.15/drivers/mfd/max8925-i2c.c;l=218
> * https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/third_party/kernel/v5.15/drivers/input/touchscreen/elants_i2c.c;l=1629
> * https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/third_party/kernel/v5.15/drivers/input/touchscreen/raydium_i2c_ts.c;l=1190
>
> I can send CLs to delete the enable_irq_wake calls from those drivers
> if we don't need to support non-DT/non-ACPI boards. Or I can send CLs
> to add the boiler plate from above. Do we even need the `disable_irq`
> calls in the suspend handlers or can the PM subsystem take care of
> that?
>
> Do we also need to handle reading the wake bit from Interrupt/IRQ ACPI
> resources? Can those actually wake the system? On AMD platforms the
> IO-APIC/PIC can't actually wake the system. It either needs to be an
> ACPI GPE or the GPIO controller. If we do need to support it, I can
> add some more plumbing.
>
> Thanks!
>
>
> On Mon, Aug 8, 2022 at 11:10 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Sat, Aug 6, 2022 at 4:20 AM Raul Rangel <rrangel@chromium.org> wrote:
> > >
> > > I do plan on coming back and updating those patches. I got derailed
> > > with other priorities.
> >
> > I'll leave it to you then.  I'm mostly interested in dropping the
> > misguided ACPI_FADT_LOW_POWER_S0 check.
> >
> > > But as Hans pointed out, we wanted to use
> > > `ExclusiveAndWake` to make the decision since not all IRQs can be wake
> > > sources while in s0i3.
> >
> > S0i3 is still S0, so all of the interrupts that work in S0 will still work.
> >
> > What really matters is whether or not enable_irq_wake() is called for
> > the given IRQ, but I'm not sufficiently familiar with the code in
> > question to comment on it any further without thorough investigation.
> >
> > And of course the device needs to be able to generate interrupts in
> > the first place and if it is power-manageable by ACPI, I would just
> > leave the wakeup handling to the generic ACPI code.
> >
> > >
> > > On Fri, Aug 5, 2022 at 12:54 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On 8/5/22 19:08, Rafael J. Wysocki wrote:
> > > > > On Fri, Aug 5, 2022 at 6:59 PM Limonciello, Mario
> > > > > <mario.limonciello@amd.com> wrote:
> > > > >>
> > > > >> On 8/5/2022 11:51, Rafael J. Wysocki wrote:
> > > > >>> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > >>>
> > > > >>> The ACPI_FADT_LOW_POWER_S0 flag merely means that it is better to
> > > > >>> use low-power S0 idle on the given platform than S3 (provided that
> > > > >>> the latter is supported) and it doesn't preclude using either of
> > > > >>> them (which of them will be used depends on the choices made by user
> > > > >>> space).
> > > > >>>
> > > > >>> Because of that, ACPI_FADT_LOW_POWER_S0 is generally not sufficient
> > > > >>> for making decisions in device drivers and so i2c_hid_acpi_probe()
> > > > >>> should not use it.
> > > > >>>
> > > > >>> Moreover, Linux always supports suspend-to-idle, so if a given
> > > > >>> device can wake up the system from suspend-to-idle, then it can be
> > > > >>> marked as wakeup capable unconditionally, so make that happen in
> > > > >>> i2c_hid_acpi_probe().
> > > > >>>
> > > > >>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > >>
> > > > >> +Raul
> > > > >> +Hans
> > > > >> +KH
> > > > >>
> > > > >> Raul had a patch that was actually going to just tear out this code
> > > > >> entirely:
> > > > >> https://lkml.kernel.org/lkml/20211220163823.1.Ie20ca47a26d3ea68124d8197b67bb1344c67f650@changeid/
> > > > >>
> > > > >> As part of that patch series discussion another suggestion had
> > > > >> transpired
> > > > >> (https://patchwork.kernel.org/project/linux-input/patch/20211220163823.2.Id022caf53d01112188308520915798f08a33cd3e@changeid/#24681016):
> > > > >>
> > > > >> ```
> > > > >> if ((acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) &&
> > > > >>             !adev->flags.power_manageable) {
> > > > >>                  device_set_wakeup_capable(dev, true);
> > > > >>                  device_set_wakeup_enable(dev, false);
> > > > >>          }
> > > > >> ```
> > > > >>
> > > > >> If this is being changed, maybe consider that suggestion to
> > > > >> check `adev->flags.power_manageable`.
> > > > >
> > > > > Fair enough, I'll send a v2 with this check added.
> > > >
> > > > Re-reading the original thread:
> > > > https://lkml.kernel.org/lkml/20211220163823.1.Ie20ca47a26d3ea68124d8197b67bb1344c67f650@changeid/T/#u
> > > >
> > > > The conclusion there was that the :
> > > >
> > > >                  device_set_wakeup_capable(dev, true);
> > > >                  device_set_wakeup_enable(dev, false);
> > > >
> > > > Calls should be made conditional on the IRQ being
> > > > marked ExclusiveAndWake instead of the ACPI_FADT_LOW_POWER_S0
> > > > check.
> > > >
> > > > Regards,
> > > >
> > > > Hans
> > > >
