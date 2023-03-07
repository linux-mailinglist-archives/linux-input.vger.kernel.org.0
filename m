Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47E176AE3AE
	for <lists+linux-input@lfdr.de>; Tue,  7 Mar 2023 16:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjCGPCZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Mar 2023 10:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjCGPBq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Mar 2023 10:01:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE196A9C9
        for <linux-input@vger.kernel.org>; Tue,  7 Mar 2023 06:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678200543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cqeh1cnHkI8hSmi75qFP5czF6puTCaAntwBTSJfFU2g=;
        b=SEwQ/0NVCDniXTbfQ5mlmyciUZwfzHqoL6xB7TT+oD/PriBp/cGMEnagOvvvyJrD0Z59pk
        1VIgCxbh7cdygyHm4rUmZkWEruxJY0eGXaIyq7boLsWu0Tk3VWiFd0GUYB84AZuTawPOjZ
        H2fJz5og5uF9UqmuGTVmunmUGGv0fwc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-M1xaZq3yM5Kv_aWTSm67Qw-1; Tue, 07 Mar 2023 09:48:57 -0500
X-MC-Unique: M1xaZq3yM5Kv_aWTSm67Qw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B3FC101A52E;
        Tue,  7 Mar 2023 14:48:56 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.22.8.23])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id BF3951121314;
        Tue,  7 Mar 2023 14:48:54 +0000 (UTC)
Date:   Tue, 7 Mar 2023 15:48:52 +0100
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Daniel Kaehn <kaehndan@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com>
References: <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
 <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
 <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
 <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
 <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mar 07 2023, Daniel Kaehn wrote:
> On Tue, Mar 7, 2023 at 7:17 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On Mar 06 2023, Andy Shevchenko wrote:
> > > On Mon, Mar 06, 2023 at 01:40:16PM -0600, Daniel Kaehn wrote:
> > >
> > > ...
> > >
> > > > Device (SE9)
> > > > {
> > > >     Name (_ADR, 0x001D0001) // _ADR: Address
> > > >     Device (RHUB)
> > > >     {
> > > >         Name (_ADR, Zero)
> > > >         Device (CP2) // the USB-hid & CP2112 shared node
> > > >         {
> > > >             Name (_ADR, One)
> > > >         }
> > > >     }
> > > > }
> > > >
> > > > If I'm understanding correctly, this adds the SE9 device as function 1
> > > > of PCI device 0x1d,
> > >
> > > To be precise this does not add the device. It adds a description of
> > > the companion device in case the real one will appear on the PCI bus
> > > with BDF 00:1d.1.
> > >
> > > > then RHUB as the USB controller it provides, and finally, CP2 as the
> > > > USB device attached to port 1 of the controller.
> > > >
> > > > With this as the loaded dsdt table, the USB device now has a firmware_node :)
> > > > #> cat /sys/bus/usb/devices/3-1:1.0/firmware_node/path
> > > > \_SB_.PCI0.SE9_.RHUB.CP2_
> > > >
> > > > After applying my patches, the HID device also references this node:
> > > > #> cat /sys/bus/hid/devices/0003:10C4:EA90.0003/firmware_node/path
> > > > \_SB_.PCI0.SE9_.RHUB.CP2_
> > > >
> >
> > Great! Thanks a lot for that. Turns out that with both of your inputs I
> > can also do the same, but without the need for OVMF and DSDT patching,
> > with just an SSDT override.
> >
> Ah, interesting.. I tried the SSDT override route initially, but tried
> applying it
> through EFI variables and through configfs, neither of which worked since
> they appeared to be applied after the relevant drivers were already loaded
> (at least that was my suspicion). I wonder if loading the overlay through the
> initramfs was the key.

Yeah, there were a few items missing from a "blank" qemu:
- loading the SSDT overlay in the initramfs so it's seen before anything
  else
- actually define the description of the device in the DSDT at the
  matching PCI bus address
- your patch :)

> 
> > Turns out that the override documentation [1] mentions "This option
> > allows loading of user defined SSDTs from initrd and it is useful when
> > the system does not support EFI or ..."
> >
> > FWIW, I am attaching my full DSDT override in case it is valuable:
> > (on my system, the default USB controller (non-xhc) is at PCI address
> > 1.2, which explains the slight difference). It can be loaded in the same
> > way you are overriding the full DSDT, but with just that compilation
> > output:
> >
> > ---
> > DefinitionBlock ("cp2112.aml", "SSDT", 5, "", "CP2112", 1)
> > {
> >   External (_SB_.PCI0, DeviceObj)
> >
> >   Scope (\_SB_.PCI0)
> >   {
> >     Device (USB0)
> >     {
> >       Name (_ADR, 0x00010002) // _ADR: Address
> >       Device (RHUB)
> >       {
> >         Name (_ADR, Zero)
> >         Device (CP21) // the USB-hid & CP2112 shared node
> >         {
> >           Name (_ADR, One)
> >           Device (I2C)
> >           {
> >             Name (_ADR, Zero)
> >             Name (_STA, 0x0F)
> >           }
> >
> >           Device (GPIO)
> >           {
> >             Name (_ADR, One)
> >             Name (_STA, 0x0F)
> >           }
> >         }
> >       }
> >     }
> >   }
> 
> To get this to work -- I assume you had to change the driver to look
> for uppercase
> "GPIO" and "I2C", or some similar change?
> 
> 
> >
> >   Scope (\_SB_.PCI0.USB0.RHUB.CP21.I2C)
> >   {
> >     Device (TPD0)
> >     {
> >       Name (_HID, "RMI40001")
> >       Name (_CID, "PNP0C50")
> >       Name (_STA, 0x0F)
> >
> >       Name (SBFB, ResourceTemplate ()
> >       {
> >           I2cSerialBusV2 (0x00c, ControllerInitiated, 100000,
> >               AddressingMode7Bit, "\\_SB_.PCI0.USB0.RHUB.CP21.I2C",
> >               0x00, ResourceConsumer,, Exclusive,
> >               )
> >       })
> >       Name (SBFG, ResourceTemplate ()
> >       {
> >           GpioInt (Level, ActiveLow, Exclusive, PullDefault, 0x0000,
> >               "\\_SB_.PCI0.USB0.RHUB.CP21.GPIO", 0x00, ResourceConsumer, ,
> >               )
> >               {   // Pin list
> >                   0x0002
> >               }
> >       })
> >       Method(_CRS, 0x0, NotSerialized)
> >       {
> >         Return (ConcatenateResTemplate (SBFB, SBFG))
> >       }
> >
> >       Method(_DSM, 0x4, Serialized)
> >       {
> >         // DSM UUID
> >         switch (ToBuffer (Arg0))
> >         {
> >           // ACPI DSM UUID for HIDI2C
> >           case (ToUUID ("3CDFF6F7-4267-4555-AD05-B30A3D8938DE"))
> >           {
> >               // DSM Function
> >               switch (ToInteger (Arg2))
> >               {
> >                   // Function 0: Query function, return based on revision
> >                   case(0)
> >                   {
> >                       // DSM Revision
> >                       switch (ToInteger (Arg1))
> >                       {
> >                           // Revision 1: Function 1 supported
> >                           case (1)
> >                           {
> >                               Return (Buffer (One) { 0x03 })
> >                           }
> >
> >                           default
> >                           {
> >                               // Revision 2+: no functions supported
> >                               Return (Buffer (One) { 0x00 })
> >                           }
> >                       }
> >                   }
> >
> >                   // Function 1 : HID Function
> >                   case(1)
> >                   {
> >                       // HID Descriptor Address
> >                       Return (0x0020)
> >                   }
> >
> >                   default
> >                   {
> >                       // Functions 2+: not supported
> >                       Return (Buffer (One) { 0x00 })
> >                   }
> >               }
> >           }
> >
> >           default
> >           {
> >               // No other GUIDs supported
> >               Return (Buffer (One) { 0x00 })
> >           }
> >         }
> >       }
> >     }
> >   }
> > }
> > ---
> >
> > This almost works. Almost because the I2C device is correctly created,
> > but I have an issue with the GpioInt call which is not properly set by
> > the kernel and which returns -EDEFER. /o\
> >
> 
> Ahh, yep, I've had this issue as well -- I suspect the issue you're
> having is that the
> CP2112 driver initializes the i2c controller before the gpiochip, and
> if any i2c devices
> on the bus depend on the CP2112's gpio, the probe will never succeed!
> I have made
> and been testing with a patch to fix this, but since it was midway
> through submitting
> this series, thought it might be bad practice to "tack on" additional
> patches to a patchset
> mid-review (since it only causes an issue in some (admittedly fairly
> common) use-cases)
> so I was going to send it as an individual patch once (if) these were applied.
> 

I don't think this is the issue. When the device is initially probed,
the I2C acpi implementation tries to attach an IRQ, but failed at it,
returning -EPROBE_DEFER, which makes the device being retried a few
times.

After I get my shell available I even get the pr_err I included few
seconds later, for a last attempt by the kernel to bind it when
everything has settled.

So I can see that the device gets probed, and that all ACPI resources
are tried to get the IRQ.
Right now, I see that it's attempting to bind to the acpi resource in 
acpi_dev_resource_interrupt() (in file drivers/acpi/resources.c), but
instead of having a ACPI_RESOURCE_TYPE_EXTENDED_IRQ I only get a
ACPI_RESOURCE_TYPE_GPIO for the GpioInt() definition in the _CRS method.

So I am missing the proper transition from GpioInt to IRQ in the acpi.

Note that I tried applying what was describe at
Documentation/firmware_guide/acpi/gpio-properties.rst but the _DSD
method doesn't seem to be properly applied to the CP2112 GPIO, which is
highly suspicious.

> If you think that would be necessary to include for these to merge,
> I'd be happy to append
> it to this review. I also have another patch which adds i2c bus
> recovery to the driver, but
> that seems independent enough that it should be sent on its own.

As I mentioned above I don't think the issue is in the ordering of the
I2C vs gpio resources.

> 
> > > > With this all said -- I noticed iasl prints this statement when trying
> > > > to create a node with a lowercase name:
> > > > "At least one lower case letter found in NameSeg, ASL is case
> > > > insensitive - converting to upper case (GPIO)"
> > >
> > > Yes, because it should be in the upper case.
> > >
> > > > I wonder if this suggests that adding a call to toupper() to
> > > > acpi_fwnode_get_named_child_node would be
> > > > an appropriate solution for the node name casing issue....
> > >
> > > I dunno. You need to ask in the linux-acpi@ mailing list.
> > > To me this is corner case that can't be easily solved
> > > (because two different specifications treat it differently.
> > >
> > > You also need to ask DT people about capital letters there.
> > > And my guts tell me that it's probably also carved in the spec
> > > as "must be lower case" or alike.
> >
> > FWIW while trying to enable this, at some point I named the I2C and the
> > GPIO entries "I2C0" and "GPI0" (with the number '0', not the letter
> > 'o'), and it was not working as you would expect.
> >
> > It is commonly accepted in the ACPI world that the names do not carry
> > meaning AFAICT, and so I think I agree with Andy's initial comment
> > regarding using indexes, not names to also fetch the I2C and GPIO nodes.
> > You can probably have a fallback mechanism for when "i2c" is not
> > present, or simply check if you are in DT or not and use the names only
> > if we are in DT.
> 
> More and more, after actually seeing and working with ACPI, I suspect that
> you both are right. Maybe (hopefully) though, there is some unified way that can
> be made to do this, so that individual drivers won't have to directly code for /
> be aware of the differences in the firmware languages (at least, that seemed
> to be the intent of the fw_node/device api in the first place). Maybe a
> `device_get_child_by_name_or_index` (terribly long name) sort of function
> might fill in that gap?

I don't know. Though the _DSD documentation I mentioned above looks very
similar to what you are describing in the DT case, so maybe the ACPI
folks will just tell us "why don't you use XXXX?" and we will have the
solution :) (we can't be the first to have that same issue TBH)

> 
> I plan to send an email asking this question more generically to ACPI & DT folks
> as Andy suggested, so hopefully there will be some ideas.
> 
> >
> > Thanks a lot to both of you, this will be tremendously helpful to me.
> >
> > Cheers,
> > Benjamin
> >
> Thanks for testing this out! Glad that ACPI support ended up being worked into
> this after all :)

Cheers,
Benjamin

