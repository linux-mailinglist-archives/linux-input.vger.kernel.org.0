Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B203D6A8787
	for <lists+linux-input@lfdr.de>; Thu,  2 Mar 2023 18:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjCBRG4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Mar 2023 12:06:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjCBRGz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Mar 2023 12:06:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE77B3E620
        for <linux-input@vger.kernel.org>; Thu,  2 Mar 2023 09:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677776774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P+O1LqszOtLJbpRbLI2Mm/fovxni5AsK6bjZCJWG61o=;
        b=B6Noad44koKkmG9M6a2WzUTxxA5pr7chnhZAdmpsFZC8pnF2bbmRTpMQmWlGsOI2YIQt6q
        zrqAlFbgQcDagy4E0FE92/T3kYVY8y4LwTuc5EhuhyeFHzazHyxVo+OvUKvZvEszOfNNL1
        Uo7tik83XJKFYPrsBYu7SIME4b5JwL0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-sDNJddsLPjSt7nJYiSVdRg-1; Thu, 02 Mar 2023 12:06:10 -0500
X-MC-Unique: sDNJddsLPjSt7nJYiSVdRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 926953C10ECC;
        Thu,  2 Mar 2023 17:06:09 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.22.8.23])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 266D12026D4B;
        Thu,  2 Mar 2023 17:06:07 +0000 (UTC)
Date:   Thu, 2 Mar 2023 18:06:06 +0100
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
References: <20230227140758.1575-1-kaehndan@gmail.com>
 <20230227140758.1575-4-kaehndan@gmail.com>
 <Y/03to4XFXPwkGH1@smile.fi.intel.com>
 <CAP+ZCCe=f3AtxvC1Z6zPErMEG9BcnCOjApc26n_9yjq2+U72pw@mail.gmail.com>
 <Y/9oO1AE6GK6CQmp@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/9oO1AE6GK6CQmp@smile.fi.intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mar 01 2023, Andy Shevchenko wrote:
> +Cc: Hans (as some DT/ACPI interesting cases are being discussed).
> 
> On Tue, Feb 28, 2023 at 01:05:54PM -0600, Daniel Kaehn wrote:
> > On Mon, Feb 27, 2023 at 5:07 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Feb 27, 2023 at 08:07:58AM -0600, Danny Kaehn wrote:
> > > > Bind I2C and GPIO interfaces to subnodes with names
> > > > "i2c" and "gpio" if they exist, respectively. This
> > > > allows the GPIO and I2C controllers to be described
> > > > in firmware as usual. Additionally, support configuring the
> > > > I2C bus speed from the clock-frequency device property.
> > >
> > > A bit shorten indentation...
> > >
> > > Nevertheless what I realized now is that this change, despite being OF
> > > independent by used APIs, still OF-only.
> > 
> > I assumed this would practically be the case -- not because of the casing
> > reason you gave (wasn't aware of that, thanks for the FYI), but because it
> > doesn't seem that there's any way to describe USB devices connected to
> > a USB port in ACPI, at least as far as I can tell (ACPI is still largely a black
> > box to me).
> 
> That's not true :-)
> 
> Microsoft created a schema that is not part of the specification, but let's
> say a standard de facto. Linux supports that and I even played with it [1]
> to get connection of the arbitrary device to USB-2-GPIO/I²C/SPI adapter.
> 
> > But it seems reasonable that we should try to use the interface
> > in a way so that it could be described using ACPI at some point (assuming
> > that it isn't currently possible).
> > 
> > > Would it be possible to allow indexed access to child nodes as well, so if
> > > there are no names, we may still be able to use firmware nodes from the correct
> > > children?
> > 
> > Sure, you mean to fallback to using child nodes by index rather than by name
> > in the case that that device_get_named_child_node() fails?  Would we need to
> > somehow verify that those nodes are the nodes we expect them to be? (a.e.
> > node 0 is actually the i2c-controller, node 1 is actually the
> > gpio-controller).
> 
> Something like that, but I don't know if we can actually validate this without
> having a preliminary agreement (hard-coded values) that index 0 is always let's
> say I²C controller and so on.
> 
> > I don't see a reason why not, though I am curious if there is
> > precedence for this
> > strategy, a.e. in other drivers that use named child nodes. In my initial search
> > through the kernel, I don't think I found anything like this -- does that mean
> > those drivers also inherently won't work with ACPI?
> 
> If they are relying on names, yes, they won't work. It might be that some of them
> have specific ACPI approach where different description is in use.
> 
> > The only driver I can find which uses device_get_named_child_node and has
> > an acpi_device_id is drivers/platform/x86/intel/chtwc_int33fe.c
> 
> Yes, and you may notice the capitalization of the name. Also note, that relying
> on the name in ACPI like now is quite fragile due to no common standard between
> OEMs on how to name the same hardware nodes, they are free in that.
> 
> > > P.S. The problem with ACPI is that "name" of the child node will be in capital
> > > letters as it's in accordance with the specification.
> > 
> > Knowing that this is the limitation, some other potential resolutions
> > to potentially
> > consider might be:
> > 
> > - Uppercase the names of the child nodes for the DT binding -- it appears
> >   that the child node that chtwc_int33fe.c (the driver mentioned earlier)
> >   accesses does indeed have an upper-cased name -- though that driver doesn't
> >   have an of_device_id (makes sense, x86...). It seems named child nodes are
> >   always lowercase in DT bindings -- not sure if that's a rule, or just how
> >   it currently happens to be.
> 
> Not an option AFAIK, the DT and ACPI specifications are requiring conflicting
> naming schema.
> 
> Possible way is to lowering case for ACPI names, but I dunno. We need more
> opinions on this.
> 
> > - Do a case invariant compare on the names (and/or check for both lowercase
> >   and uppercase)
> 
> For ACPI it will be always capital. For DT I have no clue if they allow capital
> letters there, but I assume they don't.
> 
> > - Remove the use of child nodes, and combine the i2c and gpio nodes into the
> >     cp2112's fwnode. I didn't do this initially because I wanted to avoid
> >     namespace collisions between GPIO hogs and i2c child devices, and thought
> >     that logically made sense to keep them separate, but that was before
> >     knowing this limitation of ACPI.
> 
> Seems to me not an option at all, we need to define hardware as is. If it
> combines two devices under a hood, should be two devices under a hood in
> DT/ACPI.
> 
> [1]: https://stackoverflow.com/a/60855157/2511795

Thanks Andy for your help here, and thanks for that link.

I am trying to test Danny's patch as I want to use it for my HID CI,
being an owner of a CP2112 device myself.

The current setup is using out of the tree patches [2] which are
implementing a platform i2c-hid support and some manual addition of a
I2C-HID device on top of it. This works fine but gets busted every now
and then when the tree sees a change that conflicts with these patches.

So with Danny's series, I thought I could have an SSDT override to
declare that very same device instead of patching my kernel before
testing it.

Of course, it gets tricky because I need to run that under qemu.

I am currently stuck at the "sharing the firmware_node from usb with
HID" step and I'd like to know if you could help me.

On my laptop, if I plug the CP2112 (without using a USB hub), I can get:

$> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*            
  lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/hid/devices/0003:10C4:EA90.0079 -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-9/2-9:1.0/0003:10C4:EA90.0079
$> ls -l /sys/bus/usb/devices/2-9*/firmware_node
  lrwxrwxrwx. 1 root root 0 Mar  2 17:03 /sys/bus/usb/devices/2-9:1.0/firmware_node -> ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25
  lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/usb/devices/2-9/firmware_node -> ../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25

So AFAIU the USB device is properly assigned a firmware node. My dsdt
also shows the "Device (RHUB)" and I guess everything is fine.

However, playing with qemu is not so easy.

I am running qemu with the following arguments (well, almost because I
have a wrapper script on top of it and I also run the compiled kernel
from the current tree):

#> qemu-system-x86_64 -bios /usr/share/edk2/ovmf/OVMF_CODE.fd \
                      -netdev user,id=hostnet0 \
                      -device virtio-net-pci,netdev=hostnet0 \
                      -m 4G \
                      -enable-kvm \
                      -cpu host \
                      -device qemu-xhci -usb \
                      -device 'usb-host,vendorid=0x10c4,productid=0xea90' \
                      -cdrom ~/Downloads/Fedora-Workstation-Live-x86_64-37-1.7.iso

And this is what I get:

#> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
  lrwxrwxrwx 1 root root 0 Mar  2 16:10 /sys/bus/hid/devices/0003:10C4:EA90.0001 -> ../../../devices/pci0000:00/0000:00:06.0/usb2/2-1/2-1:1.0/0003:10C4:EA90.0001

#> ls -l /sys/bus/usb/devices/2-1*/firmware_node
  ls: cannot access '/sys/bus/usb/devices/2-1*/firmware_node': No such file or directory

Looking at the DSDT, I do not see any reference to the USB hub, so I
wonder if the firmware_node needs to be populated first in the DSDT.

Also note that if I plug the CP2112 over a docking station, I lose the
firmware_node sysfs entries on the host too.

Do you think it would be achievable to emulate that over qemu and use a
mainline kernel without patches?

Cheers,
Benjamin

[2] https://gitlab.freedesktop.org/bentiss/gitlab-kernel-ci/-/tree/master/VM

