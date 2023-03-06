Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0A76AC3D4
	for <lists+linux-input@lfdr.de>; Mon,  6 Mar 2023 15:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbjCFOuF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Mar 2023 09:50:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjCFOtn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Mar 2023 09:49:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CE0C14B
        for <linux-input@vger.kernel.org>; Mon,  6 Mar 2023 06:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678114105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=faPXJSe0+gv3R0mr/8CzaPHHvG2xcRRC3nAmCU6HMMY=;
        b=IaYQ0qsD2usUMmj1g5rEcQDg7N0u0U3+XDaOOyIZWtQX3hIL9GHk2Fs8JFyC1kpT8KS0eW
        U1wMA9+HjaULYlooEBV72seQDD5rGvt6dn+KIHeHZ6aeJmUzX4pSXDQF5xOV2bxYU6eiue
        gz7+axZaeha1GCjegvUTPTGrLv7pfxs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-3Rv0pYZ8OguAGfXacVloDQ-1; Mon, 06 Mar 2023 09:48:23 -0500
X-MC-Unique: 3Rv0pYZ8OguAGfXacVloDQ-1
Received: by mail-qt1-f198.google.com with SMTP id t22-20020ac86a16000000b003bd1c0f74cfso5274458qtr.20
        for <linux-input@vger.kernel.org>; Mon, 06 Mar 2023 06:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678114102;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faPXJSe0+gv3R0mr/8CzaPHHvG2xcRRC3nAmCU6HMMY=;
        b=4CNUak0EfG2qo41Y9uH5D2cJUjPbDOYIflBWiTCwPNvQ5tOMtEbRwdYDnJHSY4OSFR
         uDlqWeoe4vUaRR35xBxvVLc/AFNddphKlRDgaxVQifFAX+u+obDpAinuiOXzZJB3q3uJ
         22pfJIShY0M6KLzox5WrluoEw8WZBgIHjwcJbia6doclt1iItKS0nTyK/ijcs65l8XYB
         TQXfIg/EYAHOq9sw0jOQ234J+jt+p/eWbUdA7QBRh6oxdQ58+joGq+OROfF9bl+377EI
         BD6XB7OS13dfz3TXpXaAyGw/GekfplW3Et8pGUi544POQ29xitoDcQEOaSefQKqdoFyW
         KHiA==
X-Gm-Message-State: AO0yUKW6cvH9w9FdSNzF/7mICqJMBl0MPNiKZblr6ZCnxrShkLcqD/e1
        ytn5oXgrsMK42NTUaNrjpCGZusGUFyUmdRuhExqnkJ8viOpSAiXqUGfj3mdcz0V0jA8uU8pNqu7
        l9HMl9fIlekO3O4othIgvd+A=
X-Received: by 2002:ac8:5955:0:b0:3bf:cfa6:8851 with SMTP id 21-20020ac85955000000b003bfcfa68851mr19319248qtz.20.1678114102207;
        Mon, 06 Mar 2023 06:48:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/C+RDYWZlWGBXxIgvMUmaQ84Ybrjg2zzxAGmKTbOvvf4TxW8uP2kd4mHaytgmHj14jd5O2NA==
X-Received: by 2002:ac8:5955:0:b0:3bf:cfa6:8851 with SMTP id 21-20020ac85955000000b003bfcfa68851mr19319206qtz.20.1678114101767;
        Mon, 06 Mar 2023 06:48:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:2bc:381::432? ([2a01:e0a:2bc:381::432])
        by smtp.gmail.com with ESMTPSA id l6-20020ac84a86000000b003ba11bfe4fcsm7570967qtq.28.2023.03.06.06.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:48:21 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------XlOJqMvXxgp1YTDKkEZuE2SQ"
Message-ID: <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
Date:   Mon, 6 Mar 2023 15:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
References: <20230227140758.1575-1-kaehndan@gmail.com>
 <20230227140758.1575-4-kaehndan@gmail.com>
 <Y/03to4XFXPwkGH1@smile.fi.intel.com>
 <CAP+ZCCe=f3AtxvC1Z6zPErMEG9BcnCOjApc26n_9yjq2+U72pw@mail.gmail.com>
 <Y/9oO1AE6GK6CQmp@smile.fi.intel.com>
 <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
 <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
 <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
Content-Language: en-US
In-Reply-To: <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.
--------------XlOJqMvXxgp1YTDKkEZuE2SQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On Mon, Mar 6, 2023 at 2:07 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 06, 2023 at 01:36:51PM +0100, Benjamin Tissoires wrote:
> > On Mon, Mar 6, 2023 at 11:49 AM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Mar 02, 2023 at 06:06:06PM +0100, Benjamin Tissoires wrote:
> > > > On Mar 01 2023, Andy Shevchenko wrote:
> > > > > On Tue, Feb 28, 2023 at 01:05:54PM -0600, Daniel Kaehn wrote:
>
> ...
>
> [1]: https://stackoverflow.com/a/60855157/2511795
>
> > > > Thanks Andy for your help here, and thanks for that link.
> > > >
> > > > I am trying to test Danny's patch as I want to use it for my HID CI,
> > > > being an owner of a CP2112 device myself.
> > > >
> > > > The current setup is using out of the tree patches [2] which are
> > > > implementing a platform i2c-hid support and some manual addition of a
> > > > I2C-HID device on top of it. This works fine but gets busted every now
> > > > and then when the tree sees a change that conflicts with these patches.
> > > >
> > > > So with Danny's series, I thought I could have an SSDT override to
> > > > declare that very same device instead of patching my kernel before
> > > > testing it.
> > > >
> > > > Of course, it gets tricky because I need to run that under qemu.
> > > >
> > > > I am currently stuck at the "sharing the firmware_node from usb with
> > > > HID" step and I'd like to know if you could help me.
> > > >
> > > > On my laptop, if I plug the CP2112 (without using a USB hub), I can get:
> > > >
> > > > $> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
> > > >   lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/hid/devices/0003:10C4:EA90.0079 -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-9/2-9:1.0/0003:10C4:EA90.0079
> > > > $> ls -l /sys/bus/usb/devices/2-9*/firmware_node
> > > >   lrwxrwxrwx. 1 root root 0 Mar  2 17:03 /sys/bus/usb/devices/2-9:1.0/firmware_node -> ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25
> > > >   lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/usb/devices/2-9/firmware_node -> ../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25
> > > >
> > > > So AFAIU the USB device is properly assigned a firmware node. My dsdt
> > > > also shows the "Device (RHUB)" and I guess everything is fine.
> > >
> > > Yes, so far so good.
> > >
> > > > However, playing with qemu is not so easy.
> > > >
> > > > I am running qemu with the following arguments (well, almost because I
> > > > have a wrapper script on top of it and I also run the compiled kernel
> > > > from the current tree):
> > > >
> > > > #> qemu-system-x86_64 -bios /usr/share/edk2/ovmf/OVMF_CODE.fd \
> > > >                       -netdev user,id=hostnet0 \
> > > >                       -device virtio-net-pci,netdev=hostnet0 \
> > > >                       -m 4G \
> > > >                       -enable-kvm \
> > > >                       -cpu host \
> > > >                       -device qemu-xhci -usb \
> > > >                       -device 'usb-host,vendorid=0x10c4,productid=0xea90' \
> > > >                       -cdrom ~/Downloads/Fedora-Workstation-Live-x86_64-37-1.7.iso
> > >
> > > Side question, where can I get those blobs from (EDKII and Fedora Live CD)?
> > > I'm using Debian unstable.
> >
> > You can install the ovmf package in debian[3], which should have a
> > similar file.
> > For the Fedora livecd -> https://getfedora.org/fr/workstation/download/
> > but any other distribution with a recent enough kernel should show the
> > same.
>
> Thank you!
>
> > > > And this is what I get:
> > > >
> > > > #> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
> > > >   lrwxrwxrwx 1 root root 0 Mar  2 16:10 /sys/bus/hid/devices/0003:10C4:EA90.0001 -> ../../../devices/pci0000:00/0000:00:06.0/usb2/2-1/2-1:1.0/0003:10C4:EA90.0001
> > > >
> > > > #> ls -l /sys/bus/usb/devices/2-1*/firmware_node
> > > >   ls: cannot access '/sys/bus/usb/devices/2-1*/firmware_node': No such file or directory
> > > >
> > > > Looking at the DSDT, I do not see any reference to the USB hub, so I
> > > > wonder if the firmware_node needs to be populated first in the DSDT.
> > >
> > > So, where QEMU takes DSDT (ACPI tables in general) from? Can you patch that?
> > > I believe that's the problem in qemu.
> >
> > That's a good question and it's one I am not sure I have the answer to.
> > I would have assumed that the DSDT was in the OVMF firmware, but given
> > that we can arbitrarily add command line arguments, I believe it
> > probably just provides a baseline and then we are screwed. The OVMF bios
> > is compiled only once, so I doubt there is any mechanism to
> > enable/disable a component in the DSDT, or make it dynamically
> > generated.
>
> We have two ways of filling missing parts:
> 1) update the original source of DSDT (firmware or bootloader,
>    whichever provides that);
> 2) adding an overlay.
>
> The 2) works _if and only if_ there is *no* existing object in the tables.
> In such cases, you can simply provide a *full* hierarchy. See an example of
> PCI devices in the kernel documentation on how to do that. I believe something
> similar can be done for USB.

Please find attached the dsdt from the Qemu VM.


And after looking at it, your comments below, I think I am understanding
what is happening (on the qemu side at least):

#> grep PCI0.S /sys/bus/acpi/devices/*/path
/sys/bus/acpi/devices/device:02/path:\_SB_.PCI0.S00_
/sys/bus/acpi/devices/device:03/path:\_SB_.PCI0.S10_
/sys/bus/acpi/devices/device:04/path:\_SB_.PCI0.S18_
/sys/bus/acpi/devices/device:05/path:\_SB_.PCI0.S20_
/sys/bus/acpi/devices/device:06/path:\_SB_.PCI0.S28_
/sys/bus/acpi/devices/device:07/path:\_SB_.PCI0.S30_
/sys/bus/acpi/devices/device:08/path:\_SB_.PCI0.S38_
/sys/bus/acpi/devices/device:09/path:\_SB_.PCI0.S40_
/sys/bus/acpi/devices/device:0a/path:\_SB_.PCI0.S48_
/sys/bus/acpi/devices/device:0b/path:\_SB_.PCI0.S50_
/sys/bus/acpi/devices/device:0c/path:\_SB_.PCI0.S58_
/sys/bus/acpi/devices/device:0d/path:\_SB_.PCI0.S60_
/sys/bus/acpi/devices/device:0e/path:\_SB_.PCI0.S68_
/sys/bus/acpi/devices/device:0f/path:\_SB_.PCI0.S70_
/sys/bus/acpi/devices/device:10/path:\_SB_.PCI0.S78_
/sys/bus/acpi/devices/device:11/path:\_SB_.PCI0.S80_
/sys/bus/acpi/devices/device:12/path:\_SB_.PCI0.S88_
/sys/bus/acpi/devices/device:13/path:\_SB_.PCI0.S90_
/sys/bus/acpi/devices/device:14/path:\_SB_.PCI0.S98_
/sys/bus/acpi/devices/device:15/path:\_SB_.PCI0.SA0_
/sys/bus/acpi/devices/device:16/path:\_SB_.PCI0.SA8_
/sys/bus/acpi/devices/device:17/path:\_SB_.PCI0.SB0_
/sys/bus/acpi/devices/device:18/path:\_SB_.PCI0.SB8_
/sys/bus/acpi/devices/device:19/path:\_SB_.PCI0.SC0_
/sys/bus/acpi/devices/device:1a/path:\_SB_.PCI0.SC8_
/sys/bus/acpi/devices/device:1b/path:\_SB_.PCI0.SD0_
/sys/bus/acpi/devices/device:1c/path:\_SB_.PCI0.SD8_
/sys/bus/acpi/devices/device:1d/path:\_SB_.PCI0.SE0_
/sys/bus/acpi/devices/device:1e/path:\_SB_.PCI0.SE8_
/sys/bus/acpi/devices/device:1f/path:\_SB_.PCI0.SF0_
/sys/bus/acpi/devices/device:20/path:\_SB_.PCI0.SF8_

And those translate on the DSDT as (for the S30/S38 chunk I am
interested in):

             Device (S30)
             {
                 Name (_ADR, 0x00060000)  // _ADR: Address
                 Name (ASUN, 0x06)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }

                 Name (_SUN, 0x06)  // _SUN: Slot User Number
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }
             }

             Device (S38)
             {
                 Name (_ADR, 0x00070000)  // _ADR: Address
                 Name (ASUN, 0x07)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }

                 Name (_SUN, 0x07)  // _SUN: Slot User Number
                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
                 {
                     PCEJ (BSEL, _SUN)
                 }
             }

The forwarded USB node is actually on device:07 -> S30_, and as much as
I'd like it to be a regular USB hub, this looks like a virtio node entry
that allows to forward a physical device to the VM.

So IMO, the missing piece might rely on the virtio-usb code which
doesn't export the firmware node, which means I can not extend the
device with an SSDT overlay ATM because the USB node doesn't have the
fw_node.

>
> > > > Also note that if I plug the CP2112 over a docking station, I lose the
> > > > firmware_node sysfs entries on the host too.
> > >
> > > This seems like a lack of firmware node propagating in the USB hub code in
> > > the Linux kernel.
> >
> > That would make a lot of sense.
> >
> > FWIW, in the VM I see a firmware node on the pci controller itself:
> > #> ls -l /sys/devices/pci0000\:00/0000\:00\:06.0/firmware_node
> >   lrwxrwxrwx 1 root root 0 Mar  6 12:24 /sys/devices/pci0000:00/0000:00:06.0/firmware_node -> ../../LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/device:07
> >
> > And one the host, through a USB hub:
> >
> > #> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
> >   lrwxrwxrwx. 1 root root 0 Mar  6 13:26 /sys/bus/hid/devices/0003:10C4:EA90.007C -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-8/2-8.2/2-8.2.4/2-8.2.4:1.0/0003:10C4:EA90.007C
> > #> ls -l /sys/bus/usb/devices/2-8*/firmware_node
> >   lrwxrwxrwx. 1 root root 0 Mar  2 16:53 /sys/bus/usb/devices/2-8:1.0/firmware_node -> ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:1e
> >   lrwxrwxrwx. 1 root root 0 Mar  2 16:53 /sys/bus/usb/devices/2-8/firmware_node -> ../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:1e
> >
> > Note that the firmware node propagation stopped at 2-8, and 2.8.2 is not
> > having a firmware node.
>
> It would be nice if you can run `grep -H 15 /sys/bus/acpi/devices/*/status`,

This command (both on the host and on the VM) does not show any USB
device or even the PCI USB controller itself (PNP0A08 or PNP0A03).

> filter out unneeded ones, and for the rest also print their paths:
> `cat filtered_list_of_acpi_devs | while read p; do grep -H . $p/path; done`

see above for the VM case, and in the host:

#> grep XHC /sys/bus/acpi/devices/*/path
/sys/bus/acpi/devices/device:15/path:\_SB_.PCI0.XHC_
/sys/bus/acpi/devices/device:16/path:\_SB_.PCI0.XHC_.RHUB
/sys/bus/acpi/devices/device:17/path:\_SB_.PCI0.XHC_.RHUB.HS01
/sys/bus/acpi/devices/device:18/path:\_SB_.PCI0.XHC_.RHUB.HS02
/sys/bus/acpi/devices/device:19/path:\_SB_.PCI0.XHC_.RHUB.HS03
/sys/bus/acpi/devices/device:1a/path:\_SB_.PCI0.XHC_.RHUB.HS04
/sys/bus/acpi/devices/device:1b/path:\_SB_.PCI0.XHC_.RHUB.HS05
/sys/bus/acpi/devices/device:1c/path:\_SB_.PCI0.XHC_.RHUB.HS06
/sys/bus/acpi/devices/device:1d/path:\_SB_.PCI0.XHC_.RHUB.HS07
/sys/bus/acpi/devices/device:1e/path:\_SB_.PCI0.XHC_.RHUB.HS08
/sys/bus/acpi/devices/device:1f/path:\_SB_.PCI0.XHC_.RHUB.SS01
/sys/bus/acpi/devices/device:20/path:\_SB_.PCI0.XHC_.RHUB.SS02
/sys/bus/acpi/devices/device:21/path:\_SB_.PCI0.XHC_.RHUB.SS03
/sys/bus/acpi/devices/device:22/path:\_SB_.PCI0.XHC_.RHUB.SS04
/sys/bus/acpi/devices/device:23/path:\_SB_.PCI0.XHC_.RHUB.SS05
/sys/bus/acpi/devices/device:24/path:\_SB_.PCI0.XHC_.RHUB.SS06
/sys/bus/acpi/devices/device:25/path:\_SB_.PCI0.XHC_.RHUB.HS09
/sys/bus/acpi/devices/device:26/path:\_SB_.PCI0.XHC_.RHUB.HS10
/sys/bus/acpi/devices/device:27/path:\_SB_.PCI0.XHC_.RHUB.USR1
/sys/bus/acpi/devices/device:28/path:\_SB_.PCI0.XHC_.RHUB.USR2
/sys/bus/acpi/devices/device:85/path:\_SB_.PCI0.TXHC
/sys/bus/acpi/devices/device:86/path:\_SB_.PCI0.TXHC.RHUB
/sys/bus/acpi/devices/device:87/path:\_SB_.PCI0.TXHC.RHUB.HS01
/sys/bus/acpi/devices/device:88/path:\_SB_.PCI0.TXHC.RHUB.SS01
/sys/bus/acpi/devices/device:89/path:\_SB_.PCI0.TXHC.RHUB.SS02
/sys/bus/acpi/devices/device:8a/path:\_SB_.PCI0.TXHC.RHUB.SS03
/sys/bus/acpi/devices/device:8b/path:\_SB_.PCI0.TXHC.RHUB.SS04

Which is coherent with the ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:1e
I get when looking at the USB port.


>
> With this we will see what devices are actually present and up and running
> in the system and what their paths in the ACPI namespace.

So it seems that the USB hub functionality is not creating fw_nodes for
its children. But I am not sure this is a battle we want to fight right
now, because it doesn't make a lot of sense IMO to add an SSDT overlay
on a hub.

>
> > > > Do you think it would be achievable to emulate that over qemu and use a
> > > > mainline kernel without patches?
> > >
> > > As long as qemu provides correct DSDT it should work I assume.
> >
> > Just to be sure I understand, for this to work, we need the DSDT to
> > export a "Device(RHUB)"?
>
> Not sure I understand the term "export" here. We need a description
> of the (to describe) missing parts.

Yes, I meant "to describe" it.

>
> > Or if we fix the USB fw_node propagation, could we just overwrite
> > "\_SB_.PCI0.S30_"?  "\_SB_.PCI0.S30_" is the name the ACPI is giving to
> > the USB port in my VM case AFAIU.
>
> I have no idea what is the S30 node.

That gave me the hint I needed, I think. The problem must be in the
virtio drivers, where it doesn't attach the fw_node to the components it
creates. We probably need kind of the same patch Danny is sending in 2/3
in this series, but for virtio.

Cheers,
Benjamin

>
> [2] https://gitlab.freedesktop.org/bentiss/gitlab-kernel-ci/-/tree/master/VM
> [3] https://packages.debian.org/buster/all/ovmf/filelist
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

--------------XlOJqMvXxgp1YTDKkEZuE2SQ
Content-Type: text/x-dsl; charset=UTF-8; name="dsdt.dsl"
Content-Disposition: attachment; filename="dsdt.dsl"
Content-Transfer-Encoding: base64

LyoKICogSW50ZWwgQUNQSSBDb21wb25lbnQgQXJjaGl0ZWN0dXJlCiAqIEFNTC9BU0wrIERp
c2Fzc2VtYmxlciB2ZXJzaW9uIDIwMjIwMzMxICg2NC1iaXQgdmVyc2lvbikKICogQ29weXJp
Z2h0IChjKSAyMDAwIC0gMjAyMiBJbnRlbCBDb3Jwb3JhdGlvbgogKiAKICogRGlzYXNzZW1i
bGluZyB0byBzeW1ib2xpYyBBU0wrIG9wZXJhdG9ycwogKgogKiBEaXNhc3NlbWJseSBvZiBk
c2R0LmRhdCwgVGh1IE1hciAgMiAxNToxNjozOSAyMDIzCiAqCiAqIE9yaWdpbmFsIFRhYmxl
IEhlYWRlcjoKICogICAgIFNpZ25hdHVyZSAgICAgICAgIkRTRFQiCiAqICAgICBMZW5ndGgg
ICAgICAgICAgIDB4MDAwMDE3OTUgKDYwMzcpCiAqICAgICBSZXZpc2lvbiAgICAgICAgIDB4
MDEgKioqKiAzMi1iaXQgdGFibGUgKFYxKSwgbm8gNjQtYml0IG1hdGggc3VwcG9ydAogKiAg
ICAgQ2hlY2tzdW0gICAgICAgICAweERFCiAqICAgICBPRU0gSUQgICAgICAgICAgICJCT0NI
UyAiCiAqICAgICBPRU0gVGFibGUgSUQgICAgICJCWFBDICAgICIKICogICAgIE9FTSBSZXZp
c2lvbiAgICAgMHgwMDAwMDAwMSAoMSkKICogICAgIENvbXBpbGVyIElEICAgICAgIkJYUEMi
CiAqICAgICBDb21waWxlciBWZXJzaW9uIDB4MDAwMDAwMDEgKDEpCiAqLwpEZWZpbml0aW9u
QmxvY2sgKCIiLCAiRFNEVCIsIDEsICJCT0NIUyAiLCAiQlhQQyAgICAiLCAweDAwMDAwMDAx
KQp7CiAgICBTY29wZSAoXCkKICAgIHsKICAgICAgICBPcGVyYXRpb25SZWdpb24gKERCRywg
U3lzdGVtSU8sIDB4MDQwMiwgT25lKQogICAgICAgIEZpZWxkIChEQkcsIEJ5dGVBY2MsIE5v
TG9jaywgUHJlc2VydmUpCiAgICAgICAgewogICAgICAgICAgICBEQkdCLCAgIDgKICAgICAg
ICB9CgogICAgICAgIE1ldGhvZCAoREJVRywgMSwgTm90U2VyaWFsaXplZCkKICAgICAgICB7
CiAgICAgICAgICAgIFRvSGV4U3RyaW5nIChBcmcwLCBMb2NhbDApCiAgICAgICAgICAgIFRv
QnVmZmVyIChMb2NhbDAsIExvY2FsMCkKICAgICAgICAgICAgTG9jYWwxID0gKFNpemVPZiAo
TG9jYWwwKSAtIE9uZSkKICAgICAgICAgICAgTG9jYWwyID0gWmVybwogICAgICAgICAgICBX
aGlsZSAoKExvY2FsMiA8IExvY2FsMSkpCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
IERCR0IgPSBEZXJlZk9mIChMb2NhbDAgW0xvY2FsMl0pCiAgICAgICAgICAgICAgICBMb2Nh
bDIrKwogICAgICAgICAgICB9CgogICAgICAgICAgICBEQkdCID0gMHgwQQogICAgICAgIH0K
ICAgIH0KCiAgICBTY29wZSAoX1NCKQogICAgewogICAgICAgIERldmljZSAoUENJMCkKICAg
ICAgICB7CiAgICAgICAgICAgIE5hbWUgKF9ISUQsIEVpc2FJZCAoIlBOUDBBMDMiKSAvKiBQ
Q0kgQnVzICovKSAgLy8gX0hJRDogSGFyZHdhcmUgSUQKICAgICAgICAgICAgTmFtZSAoX0FE
UiwgWmVybykgIC8vIF9BRFI6IEFkZHJlc3MKICAgICAgICAgICAgTmFtZSAoX1VJRCwgWmVy
bykgIC8vIF9VSUQ6IFVuaXF1ZSBJRAogICAgICAgIH0KICAgIH0KCiAgICBTY29wZSAoX1NC
KQogICAgewogICAgICAgIERldmljZSAoSFBFVCkKICAgICAgICB7CiAgICAgICAgICAgIE5h
bWUgKF9ISUQsIEVpc2FJZCAoIlBOUDAxMDMiKSAvKiBIUEVUIFN5c3RlbSBUaW1lciAqLykg
IC8vIF9ISUQ6IEhhcmR3YXJlIElECiAgICAgICAgICAgIE5hbWUgKF9VSUQsIFplcm8pICAv
LyBfVUlEOiBVbmlxdWUgSUQKICAgICAgICAgICAgT3BlcmF0aW9uUmVnaW9uIChIUFRNLCBT
eXN0ZW1NZW1vcnksIDB4RkVEMDAwMDAsIDB4MDQwMCkKICAgICAgICAgICAgRmllbGQgKEhQ
VE0sIERXb3JkQWNjLCBMb2NrLCBQcmVzZXJ2ZSkKICAgICAgICAgICAgewogICAgICAgICAg
ICAgICAgVkVORCwgICAzMiwgCiAgICAgICAgICAgICAgICBQUkQsICAgIDMyCiAgICAgICAg
ICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoX1NUQSwgMCwgTm90U2VyaWFsaXplZCkgIC8v
IF9TVEE6IFN0YXR1cwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBMb2NhbDAgPSBW
RU5EIC8qIFxfU0JfLkhQRVQuVkVORCAqLwogICAgICAgICAgICAgICAgTG9jYWwxID0gUFJE
IC8qIFxfU0JfLkhQRVQuUFJEXyAqLwogICAgICAgICAgICAgICAgTG9jYWwwID4+PSAweDEw
CiAgICAgICAgICAgICAgICBJZiAoKChMb2NhbDAgPT0gWmVybykgfHwgKExvY2FsMCA9PSAw
eEZGRkYpKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBSZXR1cm4g
KFplcm8pCiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgSWYgKCgoTG9jYWwx
ID09IFplcm8pIHx8IChMb2NhbDEgPiAweDA1RjVFMTAwKSkpCiAgICAgICAgICAgICAgICB7
CiAgICAgICAgICAgICAgICAgICAgUmV0dXJuIChaZXJvKQogICAgICAgICAgICAgICAgfQoK
ICAgICAgICAgICAgICAgIFJldHVybiAoMHgwRikKICAgICAgICAgICAgfQoKICAgICAgICAg
ICAgTmFtZSAoX0NSUywgUmVzb3VyY2VUZW1wbGF0ZSAoKSAgLy8gX0NSUzogQ3VycmVudCBS
ZXNvdXJjZSBTZXR0aW5ncwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBNZW1vcnkz
MkZpeGVkIChSZWFkT25seSwKICAgICAgICAgICAgICAgICAgICAweEZFRDAwMDAwLCAgICAg
ICAgIC8vIEFkZHJlc3MgQmFzZQogICAgICAgICAgICAgICAgICAgIDB4MDAwMDA0MDAsICAg
ICAgICAgLy8gQWRkcmVzcyBMZW5ndGgKICAgICAgICAgICAgICAgICAgICApCiAgICAgICAg
ICAgIH0pCiAgICAgICAgfQogICAgfQoKICAgIFNjb3BlIChfU0IuUENJMCkKICAgIHsKICAg
ICAgICBEZXZpY2UgKElTQSkKICAgICAgICB7CiAgICAgICAgICAgIE5hbWUgKF9BRFIsIDB4
MDAwMTAwMDApICAvLyBfQURSOiBBZGRyZXNzCiAgICAgICAgICAgIE9wZXJhdGlvblJlZ2lv
biAoUDQwQywgUENJX0NvbmZpZywgMHg2MCwgMHgwNCkKICAgICAgICB9CiAgICB9CgogICAg
U2NvcGUgKF9TQi5QQ0kwLklTQSkKICAgIHsKICAgICAgICBEZXZpY2UgKEtCRCkKICAgICAg
ICB7CiAgICAgICAgICAgIE5hbWUgKF9ISUQsIEVpc2FJZCAoIlBOUDAzMDMiKSAvKiBJQk0g
RW5oYW5jZWQgS2V5Ym9hcmQgKDEwMS8xMDIta2V5LCBQUy8yIE1vdXNlKSAqLykgIC8vIF9I
SUQ6IEhhcmR3YXJlIElECiAgICAgICAgICAgIE5hbWUgKF9TVEEsIDB4MEYpICAvLyBfU1RB
OiBTdGF0dXMKICAgICAgICAgICAgTmFtZSAoX0NSUywgUmVzb3VyY2VUZW1wbGF0ZSAoKSAg
Ly8gX0NSUzogQ3VycmVudCBSZXNvdXJjZSBTZXR0aW5ncwogICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICBJTyAoRGVjb2RlMTYsCiAgICAgICAgICAgICAgICAgICAgMHgwMDYwLCAg
ICAgICAgICAgICAvLyBSYW5nZSBNaW5pbXVtCiAgICAgICAgICAgICAgICAgICAgMHgwMDYw
LCAgICAgICAgICAgICAvLyBSYW5nZSBNYXhpbXVtCiAgICAgICAgICAgICAgICAgICAgMHgw
MSwgICAgICAgICAgICAgICAvLyBBbGlnbm1lbnQKICAgICAgICAgICAgICAgICAgICAweDAx
LCAgICAgICAgICAgICAgIC8vIExlbmd0aAogICAgICAgICAgICAgICAgICAgICkKICAgICAg
ICAgICAgICAgIElPIChEZWNvZGUxNiwKICAgICAgICAgICAgICAgICAgICAweDAwNjQsICAg
ICAgICAgICAgIC8vIFJhbmdlIE1pbmltdW0KICAgICAgICAgICAgICAgICAgICAweDAwNjQs
ICAgICAgICAgICAgIC8vIFJhbmdlIE1heGltdW0KICAgICAgICAgICAgICAgICAgICAweDAx
LCAgICAgICAgICAgICAgIC8vIEFsaWdubWVudAogICAgICAgICAgICAgICAgICAgIDB4MDEs
ICAgICAgICAgICAgICAgLy8gTGVuZ3RoCiAgICAgICAgICAgICAgICAgICAgKQogICAgICAg
ICAgICAgICAgSVJRTm9GbGFncyAoKQogICAgICAgICAgICAgICAgICAgIHsxfQogICAgICAg
ICAgICB9KQogICAgICAgIH0KCiAgICAgICAgRGV2aWNlIChNT1UpCiAgICAgICAgewogICAg
ICAgICAgICBOYW1lIChfSElELCBFaXNhSWQgKCJQTlAwRjEzIikgLyogUFMvMiBNb3VzZSAq
LykgIC8vIF9ISUQ6IEhhcmR3YXJlIElECiAgICAgICAgICAgIE5hbWUgKF9TVEEsIDB4MEYp
ICAvLyBfU1RBOiBTdGF0dXMKICAgICAgICAgICAgTmFtZSAoX0NSUywgUmVzb3VyY2VUZW1w
bGF0ZSAoKSAgLy8gX0NSUzogQ3VycmVudCBSZXNvdXJjZSBTZXR0aW5ncwogICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICBJUlFOb0ZsYWdzICgpCiAgICAgICAgICAgICAgICAgICAg
ezEyfQogICAgICAgICAgICB9KQogICAgICAgIH0KCiAgICAgICAgRGV2aWNlIChGREMwKQog
ICAgICAgIHsKICAgICAgICAgICAgTmFtZSAoX0hJRCwgRWlzYUlkICgiUE5QMDcwMCIpKSAg
Ly8gX0hJRDogSGFyZHdhcmUgSUQKICAgICAgICAgICAgTmFtZSAoX0NSUywgUmVzb3VyY2VU
ZW1wbGF0ZSAoKSAgLy8gX0NSUzogQ3VycmVudCBSZXNvdXJjZSBTZXR0aW5ncwogICAgICAg
ICAgICB7CiAgICAgICAgICAgICAgICBJTyAoRGVjb2RlMTYsCiAgICAgICAgICAgICAgICAg
ICAgMHgwM0YyLCAgICAgICAgICAgICAvLyBSYW5nZSBNaW5pbXVtCiAgICAgICAgICAgICAg
ICAgICAgMHgwM0YyLCAgICAgICAgICAgICAvLyBSYW5nZSBNYXhpbXVtCiAgICAgICAgICAg
ICAgICAgICAgMHgwMCwgICAgICAgICAgICAgICAvLyBBbGlnbm1lbnQKICAgICAgICAgICAg
ICAgICAgICAweDA0LCAgICAgICAgICAgICAgIC8vIExlbmd0aAogICAgICAgICAgICAgICAg
ICAgICkKICAgICAgICAgICAgICAgIElPIChEZWNvZGUxNiwKICAgICAgICAgICAgICAgICAg
ICAweDAzRjcsICAgICAgICAgICAgIC8vIFJhbmdlIE1pbmltdW0KICAgICAgICAgICAgICAg
ICAgICAweDAzRjcsICAgICAgICAgICAgIC8vIFJhbmdlIE1heGltdW0KICAgICAgICAgICAg
ICAgICAgICAweDAwLCAgICAgICAgICAgICAgIC8vIEFsaWdubWVudAogICAgICAgICAgICAg
ICAgICAgIDB4MDEsICAgICAgICAgICAgICAgLy8gTGVuZ3RoCiAgICAgICAgICAgICAgICAg
ICAgKQogICAgICAgICAgICAgICAgSVJRTm9GbGFncyAoKQogICAgICAgICAgICAgICAgICAg
IHs2fQogICAgICAgICAgICAgICAgRE1BIChDb21wYXRpYmlsaXR5LCBOb3RCdXNNYXN0ZXIs
IFRyYW5zZmVyOCwgKQogICAgICAgICAgICAgICAgICAgIHsyfQogICAgICAgICAgICB9KQog
ICAgICAgICAgICBEZXZpY2UgKEZMUEEpCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
IE5hbWUgKF9BRFIsIFplcm8pICAvLyBfQURSOiBBZGRyZXNzCiAgICAgICAgICAgICAgICBO
YW1lIChfRkRJLCBQYWNrYWdlICgweDEwKSAgLy8gX0ZESTogRmxvcHB5IERyaXZlIEluZm9y
bWF0aW9uCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgWmVybywgCiAg
ICAgICAgICAgICAgICAgICAgMHgwNSwgCiAgICAgICAgICAgICAgICAgICAgMHg0RiwgCiAg
ICAgICAgICAgICAgICAgICAgMHgzMCwgCiAgICAgICAgICAgICAgICAgICAgT25lLCAKICAg
ICAgICAgICAgICAgICAgICAweEFGLCAKICAgICAgICAgICAgICAgICAgICAweDAyLCAKICAg
ICAgICAgICAgICAgICAgICAweDI1LCAKICAgICAgICAgICAgICAgICAgICAweDAyLCAKICAg
ICAgICAgICAgICAgICAgICAweDEyLCAKICAgICAgICAgICAgICAgICAgICAweDFCLCAKICAg
ICAgICAgICAgICAgICAgICAweEZGLCAKICAgICAgICAgICAgICAgICAgICAweDZDLCAKICAg
ICAgICAgICAgICAgICAgICAweEY2LCAKICAgICAgICAgICAgICAgICAgICAweDBGLCAKICAg
ICAgICAgICAgICAgICAgICAweDA4CiAgICAgICAgICAgICAgICB9KQogICAgICAgICAgICB9
CgogICAgICAgICAgICBOYW1lIChfRkRFLCBCdWZmZXIgKDB4MTQpICAvLyBfRkRFOiBGbG9w
cHkgRGlzayBFbnVtZXJhdGUKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgLyogMDAw
MCAqLyAgMHgwMSwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwg
IC8vIC4uLi4uLi4uCiAgICAgICAgICAgICAgICAvKiAwMDA4ICovICAweDAwLCAweDAwLCAw
eDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAgLy8gLi4uLi4uLi4KICAgICAg
ICAgICAgICAgIC8qIDAwMTAgKi8gIDB4MDIsIDB4MDAsIDB4MDAsIDB4MDAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAvLyAuLi4uCiAgICAgICAgICAgIH0pCiAgICAgICAgfQoKICAg
ICAgICBEZXZpY2UgKExQVDEpCiAgICAgICAgewogICAgICAgICAgICBOYW1lIChfSElELCBF
aXNhSWQgKCJQTlAwNDAwIikgLyogU3RhbmRhcmQgTFBUIFBhcmFsbGVsIFBvcnQgKi8pICAv
LyBfSElEOiBIYXJkd2FyZSBJRAogICAgICAgICAgICBOYW1lIChfVUlELCBPbmUpICAvLyBf
VUlEOiBVbmlxdWUgSUQKICAgICAgICAgICAgTmFtZSAoX1NUQSwgMHgwRikgIC8vIF9TVEE6
IFN0YXR1cwogICAgICAgICAgICBOYW1lIChfQ1JTLCBSZXNvdXJjZVRlbXBsYXRlICgpICAv
LyBfQ1JTOiBDdXJyZW50IFJlc291cmNlIFNldHRpbmdzCiAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgIElPIChEZWNvZGUxNiwKICAgICAgICAgICAgICAgICAgICAweDAzNzgsICAg
ICAgICAgICAgIC8vIFJhbmdlIE1pbmltdW0KICAgICAgICAgICAgICAgICAgICAweDAzNzgs
ICAgICAgICAgICAgIC8vIFJhbmdlIE1heGltdW0KICAgICAgICAgICAgICAgICAgICAweDA4
LCAgICAgICAgICAgICAgIC8vIEFsaWdubWVudAogICAgICAgICAgICAgICAgICAgIDB4MDgs
ICAgICAgICAgICAgICAgLy8gTGVuZ3RoCiAgICAgICAgICAgICAgICAgICAgKQogICAgICAg
ICAgICAgICAgSVJRTm9GbGFncyAoKQogICAgICAgICAgICAgICAgICAgIHs3fQogICAgICAg
ICAgICB9KQogICAgICAgIH0KCiAgICAgICAgRGV2aWNlIChDT00xKQogICAgICAgIHsKICAg
ICAgICAgICAgTmFtZSAoX0hJRCwgRWlzYUlkICgiUE5QMDUwMSIpIC8qIDE2NTUwQS1jb21w
YXRpYmxlIENPTSBTZXJpYWwgUG9ydCAqLykgIC8vIF9ISUQ6IEhhcmR3YXJlIElECiAgICAg
ICAgICAgIE5hbWUgKF9VSUQsIE9uZSkgIC8vIF9VSUQ6IFVuaXF1ZSBJRAogICAgICAgICAg
ICBOYW1lIChfU1RBLCAweDBGKSAgLy8gX1NUQTogU3RhdHVzCiAgICAgICAgICAgIE5hbWUg
KF9DUlMsIFJlc291cmNlVGVtcGxhdGUgKCkgIC8vIF9DUlM6IEN1cnJlbnQgUmVzb3VyY2Ug
U2V0dGluZ3MKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgSU8gKERlY29kZTE2LAog
ICAgICAgICAgICAgICAgICAgIDB4MDNGOCwgICAgICAgICAgICAgLy8gUmFuZ2UgTWluaW11
bQogICAgICAgICAgICAgICAgICAgIDB4MDNGOCwgICAgICAgICAgICAgLy8gUmFuZ2UgTWF4
aW11bQogICAgICAgICAgICAgICAgICAgIDB4MDAsICAgICAgICAgICAgICAgLy8gQWxpZ25t
ZW50CiAgICAgICAgICAgICAgICAgICAgMHgwOCwgICAgICAgICAgICAgICAvLyBMZW5ndGgK
ICAgICAgICAgICAgICAgICAgICApCiAgICAgICAgICAgICAgICBJUlFOb0ZsYWdzICgpCiAg
ICAgICAgICAgICAgICAgICAgezR9CiAgICAgICAgICAgIH0pCiAgICAgICAgfQoKICAgICAg
ICBEZXZpY2UgKFJUQykKICAgICAgICB7CiAgICAgICAgICAgIE5hbWUgKF9ISUQsIEVpc2FJ
ZCAoIlBOUDBCMDAiKSAvKiBBVCBSZWFsLVRpbWUgQ2xvY2sgKi8pICAvLyBfSElEOiBIYXJk
d2FyZSBJRAogICAgICAgICAgICBOYW1lIChfQ1JTLCBSZXNvdXJjZVRlbXBsYXRlICgpICAv
LyBfQ1JTOiBDdXJyZW50IFJlc291cmNlIFNldHRpbmdzCiAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgIElPIChEZWNvZGUxNiwKICAgICAgICAgICAgICAgICAgICAweDAwNzAsICAg
ICAgICAgICAgIC8vIFJhbmdlIE1pbmltdW0KICAgICAgICAgICAgICAgICAgICAweDAwNzAs
ICAgICAgICAgICAgIC8vIFJhbmdlIE1heGltdW0KICAgICAgICAgICAgICAgICAgICAweDAx
LCAgICAgICAgICAgICAgIC8vIEFsaWdubWVudAogICAgICAgICAgICAgICAgICAgIDB4MDgs
ICAgICAgICAgICAgICAgLy8gTGVuZ3RoCiAgICAgICAgICAgICAgICAgICAgKQogICAgICAg
ICAgICAgICAgSVJRTm9GbGFncyAoKQogICAgICAgICAgICAgICAgICAgIHs4fQogICAgICAg
ICAgICB9KQogICAgICAgIH0KICAgIH0KCiAgICBTY29wZSAoX1NCLlBDSTApCiAgICB7CiAg
ICAgICAgT3BlcmF0aW9uUmVnaW9uIChQQ1NULCBTeXN0ZW1JTywgMHhBRTAwLCAweDA4KQog
ICAgICAgIEZpZWxkIChQQ1NULCBEV29yZEFjYywgTm9Mb2NrLCBXcml0ZUFzWmVyb3MpCiAg
ICAgICAgewogICAgICAgICAgICBQQ0lVLCAgIDMyLCAKICAgICAgICAgICAgUENJRCwgICAz
MgogICAgICAgIH0KCiAgICAgICAgT3BlcmF0aW9uUmVnaW9uIChTRUosIFN5c3RlbUlPLCAw
eEFFMDgsIDB4MDQpCiAgICAgICAgRmllbGQgKFNFSiwgRFdvcmRBY2MsIE5vTG9jaywgV3Jp
dGVBc1plcm9zKQogICAgICAgIHsKICAgICAgICAgICAgQjBFSiwgICAzMgogICAgICAgIH0K
CiAgICAgICAgT3BlcmF0aW9uUmVnaW9uIChCTk1SLCBTeXN0ZW1JTywgMHhBRTEwLCAweDA4
KQogICAgICAgIEZpZWxkIChCTk1SLCBEV29yZEFjYywgTm9Mb2NrLCBXcml0ZUFzWmVyb3Mp
CiAgICAgICAgewogICAgICAgICAgICBCTlVNLCAgIDMyLCAKICAgICAgICAgICAgUElEWCwg
ICAzMgogICAgICAgIH0KCiAgICAgICAgTXV0ZXggKEJMQ0ssIDB4MDApCiAgICAgICAgTWV0
aG9kIChQQ0VKLCAyLCBOb3RTZXJpYWxpemVkKQogICAgICAgIHsKICAgICAgICAgICAgQWNx
dWlyZSAoQkxDSywgMHhGRkZGKQogICAgICAgICAgICBCTlVNID0gQXJnMAogICAgICAgICAg
ICBCMEVKID0gKE9uZSA8PCBBcmcxKQogICAgICAgICAgICBSZWxlYXNlIChCTENLKQogICAg
ICAgICAgICBSZXR1cm4gKFplcm8pCiAgICAgICAgfQoKICAgICAgICBNZXRob2QgKEFJRFgs
IDIsIE5vdFNlcmlhbGl6ZWQpCiAgICAgICAgewogICAgICAgICAgICBBY3F1aXJlIChCTENL
LCAweEZGRkYpCiAgICAgICAgICAgIEJOVU0gPSBBcmcwCiAgICAgICAgICAgIFBJRFggPSAo
T25lIDw8IEFyZzEpCiAgICAgICAgICAgIExvY2FsMCA9IFBJRFggLyogXF9TQl8uUENJMC5Q
SURYICovCiAgICAgICAgICAgIFJlbGVhc2UgKEJMQ0spCiAgICAgICAgICAgIFJldHVybiAo
TG9jYWwwKQogICAgICAgIH0KCiAgICAgICAgTWV0aG9kIChQRFNNLCA2LCBTZXJpYWxpemVk
KQogICAgICAgIHsKICAgICAgICAgICAgSWYgKChBcmcwID09IFRvVVVJRCAoImU1YzkzN2Qw
LTM1NTMtNGQ3YS05MTE3LWVhNGQxOWMzNDM0ZCIpIC8qIERldmljZSBMYWJlbGluZyBJbnRl
cmZhY2UgKi8pKQogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBMb2NhbDAgPSBBSURY
IChBcmc0LCBBcmc1KQogICAgICAgICAgICAgICAgSWYgKChBcmcyID09IFplcm8pKQogICAg
ICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIElmICgoQXJnMSA9PSAweDAyKSkK
ICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgIElmICghKChM
b2NhbDAgPT0gWmVybykgfCAoTG9jYWwwID09IDB4RkZGRkZGRkYpKSkKICAgICAgICAgICAg
ICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgUmV0dXJuIChCdWZm
ZXIgKE9uZSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMHg4MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC8vIC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0pCiAgICAg
ICAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICAgICB9CgogICAgICAgICAg
ICAgICAgICAgIFJldHVybiAoQnVmZmVyIChPbmUpCiAgICAgICAgICAgICAgICAgICAgewog
ICAgICAgICAgICAgICAgICAgICAgICAgMHgwMCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC8vIC4KICAgICAgICAgICAgICAgICAgICB9KQogICAgICAg
ICAgICAgICAgfQogICAgICAgICAgICAgICAgRWxzZUlmICgoQXJnMiA9PSAweDA3KSkKICAg
ICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBMb2NhbDEgPSBQYWNrYWdlICgw
eDAyKQogICAgICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBaZXJvLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICIiCiAgICAgICAgICAg
ICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICAgICBMb2NhbDEgW1plcm9dID0gTG9j
YWwwCiAgICAgICAgICAgICAgICAgICAgUmV0dXJuIChMb2NhbDEpCiAgICAgICAgICAgICAg
ICB9CiAgICAgICAgICAgIH0KICAgICAgICB9CiAgICB9CgogICAgU2NvcGUgKF9TQikKICAg
IHsKICAgICAgICBTY29wZSAoUENJMCkKICAgICAgICB7CiAgICAgICAgICAgIE1ldGhvZCAo
X1BSVCwgMCwgTm90U2VyaWFsaXplZCkgIC8vIF9QUlQ6IFBDSSBSb3V0aW5nIFRhYmxlCiAg
ICAgICAgICAgIHsKICAgICAgICAgICAgICAgIExvY2FsMCA9IFBhY2thZ2UgKDB4ODApIHt9
CiAgICAgICAgICAgICAgICBMb2NhbDEgPSBaZXJvCiAgICAgICAgICAgICAgICBXaGlsZSAo
KExvY2FsMSA8IDB4ODApKQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAg
IExvY2FsMiA9IChMb2NhbDEgPj4gMHgwMikKICAgICAgICAgICAgICAgICAgICBMb2NhbDMg
PSAoKExvY2FsMSArIExvY2FsMikgJiAweDAzKQogICAgICAgICAgICAgICAgICAgIElmICgo
TG9jYWwzID09IFplcm8pKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
ICAgICAgICAgTG9jYWw0ID0gUGFja2FnZSAoMHgwNCkKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBaZXJvLCAKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBaZXJvLCAKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBMTktELCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBaZXJv
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgICAgfQoK
ICAgICAgICAgICAgICAgICAgICBJZiAoKExvY2FsMyA9PSBPbmUpKQogICAgICAgICAgICAg
ICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgSWYgKChMb2NhbDEgPT0gMHgwNCkp
CiAgICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAg
IExvY2FsNCA9IFBhY2thZ2UgKDB4MDQpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBaZXJvLCAKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWmVybywgCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIExOS1MsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBaZXJvCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQogICAgICAg
ICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgICAgICAgIEVsc2UKICAgICAg
ICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgTG9jYWw0
ID0gUGFja2FnZSAoMHgwNCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB7CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFplcm8sIAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBaZXJvLCAKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTE5LQSwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFplcm8KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAg
ICAgICAgICAgIH0KICAgICAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgICAg
IElmICgoTG9jYWwzID09IDB4MDIpKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgICAgICAgICAgTG9jYWw0ID0gUGFja2FnZSAoMHgwNCkKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBaZXJvLCAK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBaZXJvLCAKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBMTktCLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBaZXJvCiAgICAgICAgICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAg
ICAgfQoKICAgICAgICAgICAgICAgICAgICBJZiAoKExvY2FsMyA9PSAweDAzKSkKICAgICAg
ICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgIExvY2FsNCA9IFBhY2th
Z2UgKDB4MDQpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgWmVybywgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgWmVybywgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTE5LQywgCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgWmVybwogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfQogICAgICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICAgICAgTG9j
YWw0IFtaZXJvXSA9ICgoTG9jYWwyIDw8IDB4MTApIHwgMHhGRkZGKQogICAgICAgICAgICAg
ICAgICAgIExvY2FsNCBbT25lXSA9IChMb2NhbDEgJiAweDAzKQogICAgICAgICAgICAgICAg
ICAgIExvY2FsMCBbTG9jYWwxXSA9IExvY2FsNAogICAgICAgICAgICAgICAgICAgIExvY2Fs
MSsrCiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgUmV0dXJuIChMb2NhbDAp
CiAgICAgICAgICAgIH0KICAgICAgICB9CgogICAgICAgIEZpZWxkIChQQ0kwLklTQS5QNDBD
LCBCeXRlQWNjLCBOb0xvY2ssIFByZXNlcnZlKQogICAgICAgIHsKICAgICAgICAgICAgUFJR
MCwgICA4LCAKICAgICAgICAgICAgUFJRMSwgICA4LCAKICAgICAgICAgICAgUFJRMiwgICA4
LCAKICAgICAgICAgICAgUFJRMywgICA4CiAgICAgICAgfQoKICAgICAgICBNZXRob2QgKElR
U1QsIDEsIE5vdFNlcmlhbGl6ZWQpCiAgICAgICAgewogICAgICAgICAgICBJZiAoKDB4ODAg
JiBBcmcwKSkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgUmV0dXJuICgweDA5KQog
ICAgICAgICAgICB9CgogICAgICAgICAgICBSZXR1cm4gKDB4MEIpCiAgICAgICAgfQoKICAg
ICAgICBNZXRob2QgKElRQ1IsIDEsIFNlcmlhbGl6ZWQpCiAgICAgICAgewogICAgICAgICAg
ICBOYW1lIChQUlIwLCBSZXNvdXJjZVRlbXBsYXRlICgpCiAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgIEludGVycnVwdCAoUmVzb3VyY2VDb25zdW1lciwgTGV2ZWwsIEFjdGl2ZUhp
Z2gsIFNoYXJlZCwgLCwgX1kwMCkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
ICAgICAweDAwMDAwMDAwLAogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9KQogICAg
ICAgICAgICBDcmVhdGVEV29yZEZpZWxkIChQUlIwLCBcX1NCLklRQ1IuX1kwMC5fSU5ULCBQ
UlJJKSAgLy8gX0lOVDogSW50ZXJydXB0cwogICAgICAgICAgICBJZiAoKEFyZzAgPCAweDgw
KSkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgUFJSSSA9IEFyZzAKICAgICAgICAg
ICAgfQoKICAgICAgICAgICAgUmV0dXJuIChQUlIwKSAvKiBcX1NCXy5JUUNSLlBSUjAgKi8K
ICAgICAgICB9CgogICAgICAgIERldmljZSAoTE5LQSkKICAgICAgICB7CiAgICAgICAgICAg
IE5hbWUgKF9ISUQsIEVpc2FJZCAoIlBOUDBDMEYiKSAvKiBQQ0kgSW50ZXJydXB0IExpbmsg
RGV2aWNlICovKSAgLy8gX0hJRDogSGFyZHdhcmUgSUQKICAgICAgICAgICAgTmFtZSAoX1VJ
RCwgWmVybykgIC8vIF9VSUQ6IFVuaXF1ZSBJRAogICAgICAgICAgICBOYW1lIChfUFJTLCBS
ZXNvdXJjZVRlbXBsYXRlICgpICAvLyBfUFJTOiBQb3NzaWJsZSBSZXNvdXJjZSBTZXR0aW5n
cwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBJbnRlcnJ1cHQgKFJlc291cmNlQ29u
c3VtZXIsIExldmVsLCBBY3RpdmVIaWdoLCBTaGFyZWQsICwsICkKICAgICAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgICAgICAweDAwMDAwMDA1LAogICAgICAgICAgICAgICAgICAg
IDB4MDAwMDAwMEEsCiAgICAgICAgICAgICAgICAgICAgMHgwMDAwMDAwQiwKICAgICAgICAg
ICAgICAgIH0KICAgICAgICAgICAgfSkKICAgICAgICAgICAgTWV0aG9kIChfU1RBLCAwLCBO
b3RTZXJpYWxpemVkKSAgLy8gX1NUQTogU3RhdHVzCiAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgIFJldHVybiAoSVFTVCAoUFJRMCkpCiAgICAgICAgICAgIH0KCiAgICAgICAgICAg
IE1ldGhvZCAoX0RJUywgMCwgTm90U2VyaWFsaXplZCkgIC8vIF9ESVM6IERpc2FibGUgRGV2
aWNlCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIFBSUTAgfD0gMHg4MAogICAgICAg
ICAgICB9CgogICAgICAgICAgICBNZXRob2QgKF9DUlMsIDAsIE5vdFNlcmlhbGl6ZWQpICAv
LyBfQ1JTOiBDdXJyZW50IFJlc291cmNlIFNldHRpbmdzCiAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgIFJldHVybiAoSVFDUiAoUFJRMCkpCiAgICAgICAgICAgIH0KCiAgICAgICAg
ICAgIE1ldGhvZCAoX1NSUywgMSwgTm90U2VyaWFsaXplZCkgIC8vIF9TUlM6IFNldCBSZXNv
dXJjZSBTZXR0aW5ncwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBDcmVhdGVEV29y
ZEZpZWxkIChBcmcwLCAweDA1LCBQUlJJKQogICAgICAgICAgICAgICAgUFJRMCA9IFBSUkkg
LyogXF9TQl8uTE5LQS5fU1JTLlBSUkkgKi8KICAgICAgICAgICAgfQogICAgICAgIH0KCiAg
ICAgICAgRGV2aWNlIChMTktCKQogICAgICAgIHsKICAgICAgICAgICAgTmFtZSAoX0hJRCwg
RWlzYUlkICgiUE5QMEMwRiIpIC8qIFBDSSBJbnRlcnJ1cHQgTGluayBEZXZpY2UgKi8pICAv
LyBfSElEOiBIYXJkd2FyZSBJRAogICAgICAgICAgICBOYW1lIChfVUlELCBPbmUpICAvLyBf
VUlEOiBVbmlxdWUgSUQKICAgICAgICAgICAgTmFtZSAoX1BSUywgUmVzb3VyY2VUZW1wbGF0
ZSAoKSAgLy8gX1BSUzogUG9zc2libGUgUmVzb3VyY2UgU2V0dGluZ3MKICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgSW50ZXJydXB0IChSZXNvdXJjZUNvbnN1bWVyLCBMZXZlbCwg
QWN0aXZlSGlnaCwgU2hhcmVkLCAsLCApCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAg
ICAgICAgICAgMHgwMDAwMDAwNSwKICAgICAgICAgICAgICAgICAgICAweDAwMDAwMDBBLAog
ICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMEIsCiAgICAgICAgICAgICAgICB9CiAgICAg
ICAgICAgIH0pCiAgICAgICAgICAgIE1ldGhvZCAoX1NUQSwgMCwgTm90U2VyaWFsaXplZCkg
IC8vIF9TVEE6IFN0YXR1cwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBSZXR1cm4g
KElRU1QgKFBSUTEpKQogICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRob2QgKF9ESVMs
IDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfRElTOiBEaXNhYmxlIERldmljZQogICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICBQUlExIHw9IDB4ODAKICAgICAgICAgICAgfQoKICAgICAg
ICAgICAgTWV0aG9kIChfQ1JTLCAwLCBOb3RTZXJpYWxpemVkKSAgLy8gX0NSUzogQ3VycmVu
dCBSZXNvdXJjZSBTZXR0aW5ncwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBSZXR1
cm4gKElRQ1IgKFBSUTEpKQogICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRob2QgKF9T
UlMsIDEsIE5vdFNlcmlhbGl6ZWQpICAvLyBfU1JTOiBTZXQgUmVzb3VyY2UgU2V0dGluZ3MK
ICAgICAgICAgICAgewogICAgICAgICAgICAgICAgQ3JlYXRlRFdvcmRGaWVsZCAoQXJnMCwg
MHgwNSwgUFJSSSkKICAgICAgICAgICAgICAgIFBSUTEgPSBQUlJJIC8qIFxfU0JfLkxOS0Iu
X1NSUy5QUlJJICovCiAgICAgICAgICAgIH0KICAgICAgICB9CgogICAgICAgIERldmljZSAo
TE5LQykKICAgICAgICB7CiAgICAgICAgICAgIE5hbWUgKF9ISUQsIEVpc2FJZCAoIlBOUDBD
MEYiKSAvKiBQQ0kgSW50ZXJydXB0IExpbmsgRGV2aWNlICovKSAgLy8gX0hJRDogSGFyZHdh
cmUgSUQKICAgICAgICAgICAgTmFtZSAoX1VJRCwgMHgwMikgIC8vIF9VSUQ6IFVuaXF1ZSBJ
RAogICAgICAgICAgICBOYW1lIChfUFJTLCBSZXNvdXJjZVRlbXBsYXRlICgpICAvLyBfUFJT
OiBQb3NzaWJsZSBSZXNvdXJjZSBTZXR0aW5ncwogICAgICAgICAgICB7CiAgICAgICAgICAg
ICAgICBJbnRlcnJ1cHQgKFJlc291cmNlQ29uc3VtZXIsIExldmVsLCBBY3RpdmVIaWdoLCBT
aGFyZWQsICwsICkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAweDAw
MDAwMDA1LAogICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMEEsCiAgICAgICAgICAgICAg
ICAgICAgMHgwMDAwMDAwQiwKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfSkKICAg
ICAgICAgICAgTWV0aG9kIChfU1RBLCAwLCBOb3RTZXJpYWxpemVkKSAgLy8gX1NUQTogU3Rh
dHVzCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIFJldHVybiAoSVFTVCAoUFJRMikp
CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoX0RJUywgMCwgTm90U2VyaWFs
aXplZCkgIC8vIF9ESVM6IERpc2FibGUgRGV2aWNlCiAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgIFBSUTIgfD0gMHg4MAogICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRob2Qg
KF9DUlMsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfQ1JTOiBDdXJyZW50IFJlc291cmNlIFNl
dHRpbmdzCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIFJldHVybiAoSVFDUiAoUFJR
MikpCiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoX1NSUywgMSwgTm90U2Vy
aWFsaXplZCkgIC8vIF9TUlM6IFNldCBSZXNvdXJjZSBTZXR0aW5ncwogICAgICAgICAgICB7
CiAgICAgICAgICAgICAgICBDcmVhdGVEV29yZEZpZWxkIChBcmcwLCAweDA1LCBQUlJJKQog
ICAgICAgICAgICAgICAgUFJRMiA9IFBSUkkgLyogXF9TQl8uTE5LQy5fU1JTLlBSUkkgKi8K
ICAgICAgICAgICAgfQogICAgICAgIH0KCiAgICAgICAgRGV2aWNlIChMTktEKQogICAgICAg
IHsKICAgICAgICAgICAgTmFtZSAoX0hJRCwgRWlzYUlkICgiUE5QMEMwRiIpIC8qIFBDSSBJ
bnRlcnJ1cHQgTGluayBEZXZpY2UgKi8pICAvLyBfSElEOiBIYXJkd2FyZSBJRAogICAgICAg
ICAgICBOYW1lIChfVUlELCAweDAzKSAgLy8gX1VJRDogVW5pcXVlIElECiAgICAgICAgICAg
IE5hbWUgKF9QUlMsIFJlc291cmNlVGVtcGxhdGUgKCkgIC8vIF9QUlM6IFBvc3NpYmxlIFJl
c291cmNlIFNldHRpbmdzCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIEludGVycnVw
dCAoUmVzb3VyY2VDb25zdW1lciwgTGV2ZWwsIEFjdGl2ZUhpZ2gsIFNoYXJlZCwgLCwgKQog
ICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMDUsCiAgICAg
ICAgICAgICAgICAgICAgMHgwMDAwMDAwQSwKICAgICAgICAgICAgICAgICAgICAweDAwMDAw
MDBCLAogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9KQogICAgICAgICAgICBNZXRo
b2QgKF9TVEEsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfU1RBOiBTdGF0dXMKICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgUmV0dXJuIChJUVNUIChQUlEzKSkKICAgICAgICAgICAg
fQoKICAgICAgICAgICAgTWV0aG9kIChfRElTLCAwLCBOb3RTZXJpYWxpemVkKSAgLy8gX0RJ
UzogRGlzYWJsZSBEZXZpY2UKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgUFJRMyB8
PSAweDgwCiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoX0NSUywgMCwgTm90
U2VyaWFsaXplZCkgIC8vIF9DUlM6IEN1cnJlbnQgUmVzb3VyY2UgU2V0dGluZ3MKICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgUmV0dXJuIChJUUNSIChQUlEzKSkKICAgICAgICAg
ICAgfQoKICAgICAgICAgICAgTWV0aG9kIChfU1JTLCAxLCBOb3RTZXJpYWxpemVkKSAgLy8g
X1NSUzogU2V0IFJlc291cmNlIFNldHRpbmdzCiAgICAgICAgICAgIHsKICAgICAgICAgICAg
ICAgIENyZWF0ZURXb3JkRmllbGQgKEFyZzAsIDB4MDUsIFBSUkkpCiAgICAgICAgICAgICAg
ICBQUlEzID0gUFJSSSAvKiBcX1NCXy5MTktELl9TUlMuUFJSSSAqLwogICAgICAgICAgICB9
CiAgICAgICAgfQoKICAgICAgICBEZXZpY2UgKExOS1MpCiAgICAgICAgewogICAgICAgICAg
ICBOYW1lIChfSElELCBFaXNhSWQgKCJQTlAwQzBGIikgLyogUENJIEludGVycnVwdCBMaW5r
IERldmljZSAqLykgIC8vIF9ISUQ6IEhhcmR3YXJlIElECiAgICAgICAgICAgIE5hbWUgKF9V
SUQsIDB4MDQpICAvLyBfVUlEOiBVbmlxdWUgSUQKICAgICAgICAgICAgTmFtZSAoX1BSUywg
UmVzb3VyY2VUZW1wbGF0ZSAoKSAgLy8gX1BSUzogUG9zc2libGUgUmVzb3VyY2UgU2V0dGlu
Z3MKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgSW50ZXJydXB0IChSZXNvdXJjZUNv
bnN1bWVyLCBMZXZlbCwgQWN0aXZlSGlnaCwgU2hhcmVkLCAsLCApCiAgICAgICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICAgICAgMHgwMDAwMDAwOSwKICAgICAgICAgICAgICAgIH0K
ICAgICAgICAgICAgfSkKICAgICAgICAgICAgTWV0aG9kIChfU1RBLCAwLCBOb3RTZXJpYWxp
emVkKSAgLy8gX1NUQTogU3RhdHVzCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIFJl
dHVybiAoMHgwQikKICAgICAgICAgICAgfQoKICAgICAgICAgICAgTWV0aG9kIChfRElTLCAw
LCBOb3RTZXJpYWxpemVkKSAgLy8gX0RJUzogRGlzYWJsZSBEZXZpY2UKICAgICAgICAgICAg
ewogICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRob2QgKF9DUlMsIDAsIE5vdFNlcmlh
bGl6ZWQpICAvLyBfQ1JTOiBDdXJyZW50IFJlc291cmNlIFNldHRpbmdzCiAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgIFJldHVybiAoX1BSUykgLyogXF9TQl8uTE5LUy5fUFJTICov
CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoX1NSUywgMSwgTm90U2VyaWFs
aXplZCkgIC8vIF9TUlM6IFNldCBSZXNvdXJjZSBTZXR0aW5ncwogICAgICAgICAgICB7CiAg
ICAgICAgICAgIH0KICAgICAgICB9CiAgICB9CgogICAgU2NvcGUgKF9TQikKICAgIHsKICAg
ICAgICBEZXZpY2UgKFxfU0IuUENJMC5QUkVTKQogICAgICAgIHsKICAgICAgICAgICAgTmFt
ZSAoX0hJRCwgRWlzYUlkICgiUE5QMEEwNiIpIC8qIEdlbmVyaWMgQ29udGFpbmVyIERldmlj
ZSAqLykgIC8vIF9ISUQ6IEhhcmR3YXJlIElECiAgICAgICAgICAgIE5hbWUgKF9VSUQsICJD
UFUgSG90cGx1ZyByZXNvdXJjZXMiKSAgLy8gX1VJRDogVW5pcXVlIElECiAgICAgICAgICAg
IE11dGV4IChDUExLLCAweDAwKQogICAgICAgICAgICBOYW1lIChfQ1JTLCBSZXNvdXJjZVRl
bXBsYXRlICgpICAvLyBfQ1JTOiBDdXJyZW50IFJlc291cmNlIFNldHRpbmdzCiAgICAgICAg
ICAgIHsKICAgICAgICAgICAgICAgIElPIChEZWNvZGUxNiwKICAgICAgICAgICAgICAgICAg
ICAweEFGMDAsICAgICAgICAgICAgIC8vIFJhbmdlIE1pbmltdW0KICAgICAgICAgICAgICAg
ICAgICAweEFGMDAsICAgICAgICAgICAgIC8vIFJhbmdlIE1heGltdW0KICAgICAgICAgICAg
ICAgICAgICAweDAxLCAgICAgICAgICAgICAgIC8vIEFsaWdubWVudAogICAgICAgICAgICAg
ICAgICAgIDB4MEMsICAgICAgICAgICAgICAgLy8gTGVuZ3RoCiAgICAgICAgICAgICAgICAg
ICAgKQogICAgICAgICAgICB9KQogICAgICAgICAgICBPcGVyYXRpb25SZWdpb24gKFBSU1Qs
IFN5c3RlbUlPLCAweEFGMDAsIDB4MEMpCiAgICAgICAgICAgIEZpZWxkIChQUlNULCBCeXRl
QWNjLCBOb0xvY2ssIFdyaXRlQXNaZXJvcykKICAgICAgICAgICAgewogICAgICAgICAgICAg
ICAgT2Zmc2V0ICgweDA0KSwgCiAgICAgICAgICAgICAgICBDUEVOLCAgIDEsIAogICAgICAg
ICAgICAgICAgQ0lOUywgICAxLCAKICAgICAgICAgICAgICAgIENSTVYsICAgMSwgCiAgICAg
ICAgICAgICAgICBDRUowLCAgIDEsIAogICAgICAgICAgICAgICAgQ0VKRiwgICAxLCAKICAg
ICAgICAgICAgICAgIE9mZnNldCAoMHgwNSksIAogICAgICAgICAgICAgICAgQ0NNRCwgICA4
CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIEZpZWxkIChQUlNULCBEV29yZEFjYywgTm9M
b2NrLCBQcmVzZXJ2ZSkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgQ1NFTCwgICAz
MiwgCiAgICAgICAgICAgICAgICBPZmZzZXQgKDB4MDgpLCAKICAgICAgICAgICAgICAgIENE
QVQsICAgMzIKICAgICAgICAgICAgfQoKICAgICAgICAgICAgTWV0aG9kIChfSU5JLCAwLCBT
ZXJpYWxpemVkKSAgLy8gX0lOSTogSW5pdGlhbGl6ZQogICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICBDU0VMID0gWmVybwogICAgICAgICAgICB9CiAgICAgICAgfQoKICAgICAgICBE
ZXZpY2UgKFxfU0IuQ1BVUykKICAgICAgICB7CiAgICAgICAgICAgIE5hbWUgKF9ISUQsICJB
Q1BJMDAxMCIgLyogUHJvY2Vzc29yIENvbnRhaW5lciBEZXZpY2UgKi8pICAvLyBfSElEOiBI
YXJkd2FyZSBJRAogICAgICAgICAgICBOYW1lIChfQ0lELCBFaXNhSWQgKCJQTlAwQTA1Iikg
LyogR2VuZXJpYyBDb250YWluZXIgRGV2aWNlICovKSAgLy8gX0NJRDogQ29tcGF0aWJsZSBJ
RAogICAgICAgICAgICBNZXRob2QgKENURlksIDIsIE5vdFNlcmlhbGl6ZWQpCiAgICAgICAg
ICAgIHsKICAgICAgICAgICAgICAgIElmICgoQXJnMCA9PSBaZXJvKSkKICAgICAgICAgICAg
ICAgIHsKICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKEMwMDAsIEFyZzEpCiAgICAgICAg
ICAgICAgICB9CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoQ1NUQSwgMSwg
U2VyaWFsaXplZCkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgQWNxdWlyZSAoXF9T
Qi5QQ0kwLlBSRVMuQ1BMSywgMHhGRkZGKQogICAgICAgICAgICAgICAgXF9TQi5QQ0kwLlBS
RVMuQ1NFTCA9IEFyZzAKICAgICAgICAgICAgICAgIExvY2FsMCA9IFplcm8KICAgICAgICAg
ICAgICAgIElmICgoXF9TQi5QQ0kwLlBSRVMuQ1BFTiA9PSBPbmUpKQogICAgICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgICAgIExvY2FsMCA9IDB4MEYKICAgICAgICAgICAgICAg
IH0KCiAgICAgICAgICAgICAgICBSZWxlYXNlIChcX1NCLlBDSTAuUFJFUy5DUExLKQogICAg
ICAgICAgICAgICAgUmV0dXJuIChMb2NhbDApCiAgICAgICAgICAgIH0KCiAgICAgICAgICAg
IE1ldGhvZCAoQ0VKMCwgMSwgU2VyaWFsaXplZCkKICAgICAgICAgICAgewogICAgICAgICAg
ICAgICAgQWNxdWlyZSAoXF9TQi5QQ0kwLlBSRVMuQ1BMSywgMHhGRkZGKQogICAgICAgICAg
ICAgICAgXF9TQi5QQ0kwLlBSRVMuQ1NFTCA9IEFyZzAKICAgICAgICAgICAgICAgIFxfU0Iu
UENJMC5QUkVTLkNFSjAgPSBPbmUKICAgICAgICAgICAgICAgIFJlbGVhc2UgKFxfU0IuUENJ
MC5QUkVTLkNQTEspCiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoQ1NDTiwg
MCwgU2VyaWFsaXplZCkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgQWNxdWlyZSAo
XF9TQi5QQ0kwLlBSRVMuQ1BMSywgMHhGRkZGKQogICAgICAgICAgICAgICAgTmFtZSAoQ05F
VywgUGFja2FnZSAoMHhGRikge30pCiAgICAgICAgICAgICAgICBMb2NhbDMgPSBaZXJvCiAg
ICAgICAgICAgICAgICBMb2NhbDQgPSBPbmUKICAgICAgICAgICAgICAgIFdoaWxlICgoTG9j
YWw0ID09IE9uZSkpCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgTG9j
YWw0ID0gWmVybwogICAgICAgICAgICAgICAgICAgIExvY2FsMCA9IE9uZQogICAgICAgICAg
ICAgICAgICAgIExvY2FsMSA9IFplcm8KICAgICAgICAgICAgICAgICAgICBXaGlsZSAoKChM
b2NhbDAgPT0gT25lKSAmJiAoTG9jYWwzIDwgT25lKSkpCiAgICAgICAgICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgICAgICAgICBMb2NhbDAgPSBaZXJvCiAgICAgICAgICAgICAg
ICAgICAgICAgIFxfU0IuUENJMC5QUkVTLkNTRUwgPSBMb2NhbDMKICAgICAgICAgICAgICAg
ICAgICAgICAgXF9TQi5QQ0kwLlBSRVMuQ0NNRCA9IFplcm8KICAgICAgICAgICAgICAgICAg
ICAgICAgSWYgKChcX1NCLlBDSTAuUFJFUy5DREFUIDwgTG9jYWwzKSkKICAgICAgICAgICAg
ICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgQnJlYWsKICAgICAg
ICAgICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgICAgICAgICAgSWYgKChMb2Nh
bDEgPT0gMHhGRikpCiAgICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIExvY2FsNCA9IE9uZQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
QnJlYWsKICAgICAgICAgICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgICAgICAg
ICAgTG9jYWwzID0gXF9TQi5QQ0kwLlBSRVMuQ0RBVAogICAgICAgICAgICAgICAgICAgICAg
ICBJZiAoKFxfU0IuUENJMC5QUkVTLkNJTlMgPT0gT25lKSkKICAgICAgICAgICAgICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgQ05FVyBbTG9jYWwxXSA9IExv
Y2FsMwogICAgICAgICAgICAgICAgICAgICAgICAgICAgTG9jYWwxKysKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIExvY2FsMCA9IE9uZQogICAgICAgICAgICAgICAgICAgICAgICB9
CiAgICAgICAgICAgICAgICAgICAgICAgIEVsc2VJZiAoKFxfU0IuUENJMC5QUkVTLkNSTVYg
PT0gT25lKSkKICAgICAgICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQ1RGWSAoTG9jYWwzLCAweDAzKQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXF9TQi5QQ0kwLlBSRVMuQ1JNViA9IE9uZQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTG9jYWwwID0gT25lCiAgICAgICAgICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAg
ICAgICAgICAgICAgIExvY2FsMysrCiAgICAgICAgICAgICAgICAgICAgfQoKICAgICAgICAg
ICAgICAgICAgICBMb2NhbDIgPSBaZXJvCiAgICAgICAgICAgICAgICAgICAgV2hpbGUgKChM
b2NhbDIgPCBMb2NhbDEpKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
ICAgICAgICAgTG9jYWwzID0gRGVyZWZPZiAoQ05FVyBbTG9jYWwyXSkKICAgICAgICAgICAg
ICAgICAgICAgICAgQ1RGWSAoTG9jYWwzLCBPbmUpCiAgICAgICAgICAgICAgICAgICAgICAg
IERlYnVnID0gTG9jYWwzCiAgICAgICAgICAgICAgICAgICAgICAgIFxfU0IuUENJMC5QUkVT
LkNTRUwgPSBMb2NhbDMKICAgICAgICAgICAgICAgICAgICAgICAgXF9TQi5QQ0kwLlBSRVMu
Q0lOUyA9IE9uZQogICAgICAgICAgICAgICAgICAgICAgICBMb2NhbDIrKwogICAgICAgICAg
ICAgICAgICAgIH0KICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBSZWxlYXNl
IChcX1NCLlBDSTAuUFJFUy5DUExLKQogICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRo
b2QgKENPU1QsIDQsIFNlcmlhbGl6ZWQpCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
IEFjcXVpcmUgKFxfU0IuUENJMC5QUkVTLkNQTEssIDB4RkZGRikKICAgICAgICAgICAgICAg
IFxfU0IuUENJMC5QUkVTLkNTRUwgPSBBcmcwCiAgICAgICAgICAgICAgICBcX1NCLlBDSTAu
UFJFUy5DQ01EID0gT25lCiAgICAgICAgICAgICAgICBcX1NCLlBDSTAuUFJFUy5DREFUID0g
QXJnMQogICAgICAgICAgICAgICAgXF9TQi5QQ0kwLlBSRVMuQ0NNRCA9IDB4MDIKICAgICAg
ICAgICAgICAgIFxfU0IuUENJMC5QUkVTLkNEQVQgPSBBcmcyCiAgICAgICAgICAgICAgICBS
ZWxlYXNlIChcX1NCLlBDSTAuUFJFUy5DUExLKQogICAgICAgICAgICB9CgogICAgICAgICAg
ICBQcm9jZXNzb3IgKEMwMDAsIDB4MDAsIDB4MDAwMDAwMDAsIDB4MDApCiAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgIE1ldGhvZCAoX1NUQSwgMCwgU2VyaWFsaXplZCkgIC8vIF9T
VEE6IFN0YXR1cwogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFJldHVy
biAoQ1NUQSAoWmVybykpCiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgTmFt
ZSAoX01BVCwgQnVmZmVyICgweDA4KSAgLy8gX01BVDogTXVsdGlwbGUgQVBJQyBUYWJsZSBF
bnRyeQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAweDAwLCAweDA4
LCAweDAwLCAweDAwLCAweDAxLCAweDAwLCAweDAwLCAweDAwICAgLy8gLi4uLi4uLi4KICAg
ICAgICAgICAgICAgIH0pCiAgICAgICAgICAgICAgICBNZXRob2QgKF9PU1QsIDMsIFNlcmlh
bGl6ZWQpICAvLyBfT1NUOiBPU1BNIFN0YXR1cyBJbmRpY2F0aW9uCiAgICAgICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICAgICAgQ09TVCAoWmVybywgQXJnMCwgQXJnMSwgQXJnMikK
ICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfQogICAgICAgIH0KICAgIH0KCiAgICBN
ZXRob2QgKFxfR1BFLl9FMDIsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfRXh4OiBFZGdlLVRy
aWdnZXJlZCBHUEUsIHh4PTB4MDAtMHhGRgogICAgewogICAgICAgIFxfU0IuQ1BVUy5DU0NO
ICgpCiAgICB9CgogICAgU2NvcGUgKF9HUEUpCiAgICB7CiAgICAgICAgTmFtZSAoX0hJRCwg
IkFDUEkwMDA2IiAvKiBHUEUgQmxvY2sgRGV2aWNlICovKSAgLy8gX0hJRDogSGFyZHdhcmUg
SUQKICAgICAgICBNZXRob2QgKF9FMDEsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfRXh4OiBF
ZGdlLVRyaWdnZXJlZCBHUEUsIHh4PTB4MDAtMHhGRgogICAgICAgIHsKICAgICAgICAgICAg
QWNxdWlyZSAoXF9TQi5QQ0kwLkJMQ0ssIDB4RkZGRikKICAgICAgICAgICAgXF9TQi5QQ0kw
LlBDTlQgKCkKICAgICAgICAgICAgUmVsZWFzZSAoXF9TQi5QQ0kwLkJMQ0spCiAgICAgICAg
fQogICAgfQoKICAgIFNjb3BlIChcX1NCLlBDSTApCiAgICB7CiAgICAgICAgTmFtZSAoX0NS
UywgUmVzb3VyY2VUZW1wbGF0ZSAoKSAgLy8gX0NSUzogQ3VycmVudCBSZXNvdXJjZSBTZXR0
aW5ncwogICAgICAgIHsKICAgICAgICAgICAgV29yZEJ1c051bWJlciAoUmVzb3VyY2VQcm9k
dWNlciwgTWluRml4ZWQsIE1heEZpeGVkLCBQb3NEZWNvZGUsCiAgICAgICAgICAgICAgICAw
eDAwMDAsICAgICAgICAgICAgIC8vIEdyYW51bGFyaXR5CiAgICAgICAgICAgICAgICAweDAw
MDAsICAgICAgICAgICAgIC8vIFJhbmdlIE1pbmltdW0KICAgICAgICAgICAgICAgIDB4MDBG
RiwgICAgICAgICAgICAgLy8gUmFuZ2UgTWF4aW11bQogICAgICAgICAgICAgICAgMHgwMDAw
LCAgICAgICAgICAgICAvLyBUcmFuc2xhdGlvbiBPZmZzZXQKICAgICAgICAgICAgICAgIDB4
MDEwMCwgICAgICAgICAgICAgLy8gTGVuZ3RoCiAgICAgICAgICAgICAgICAsLCApCiAgICAg
ICAgICAgIElPIChEZWNvZGUxNiwKICAgICAgICAgICAgICAgIDB4MENGOCwgICAgICAgICAg
ICAgLy8gUmFuZ2UgTWluaW11bQogICAgICAgICAgICAgICAgMHgwQ0Y4LCAgICAgICAgICAg
ICAvLyBSYW5nZSBNYXhpbXVtCiAgICAgICAgICAgICAgICAweDAxLCAgICAgICAgICAgICAg
IC8vIEFsaWdubWVudAogICAgICAgICAgICAgICAgMHgwOCwgICAgICAgICAgICAgICAvLyBM
ZW5ndGgKICAgICAgICAgICAgICAgICkKICAgICAgICAgICAgV29yZElPIChSZXNvdXJjZVBy
b2R1Y2VyLCBNaW5GaXhlZCwgTWF4Rml4ZWQsIFBvc0RlY29kZSwgRW50aXJlUmFuZ2UsCiAg
ICAgICAgICAgICAgICAweDAwMDAsICAgICAgICAgICAgIC8vIEdyYW51bGFyaXR5CiAgICAg
ICAgICAgICAgICAweDAwMDAsICAgICAgICAgICAgIC8vIFJhbmdlIE1pbmltdW0KICAgICAg
ICAgICAgICAgIDB4MENGNywgICAgICAgICAgICAgLy8gUmFuZ2UgTWF4aW11bQogICAgICAg
ICAgICAgICAgMHgwMDAwLCAgICAgICAgICAgICAvLyBUcmFuc2xhdGlvbiBPZmZzZXQKICAg
ICAgICAgICAgICAgIDB4MENGOCwgICAgICAgICAgICAgLy8gTGVuZ3RoCiAgICAgICAgICAg
ICAgICAsLCAsIFR5cGVTdGF0aWMsIERlbnNlVHJhbnNsYXRpb24pCiAgICAgICAgICAgIFdv
cmRJTyAoUmVzb3VyY2VQcm9kdWNlciwgTWluRml4ZWQsIE1heEZpeGVkLCBQb3NEZWNvZGUs
IEVudGlyZVJhbmdlLAogICAgICAgICAgICAgICAgMHgwMDAwLCAgICAgICAgICAgICAvLyBH
cmFudWxhcml0eQogICAgICAgICAgICAgICAgMHgwRDAwLCAgICAgICAgICAgICAvLyBSYW5n
ZSBNaW5pbXVtCiAgICAgICAgICAgICAgICAweEZGRkYsICAgICAgICAgICAgIC8vIFJhbmdl
IE1heGltdW0KICAgICAgICAgICAgICAgIDB4MDAwMCwgICAgICAgICAgICAgLy8gVHJhbnNs
YXRpb24gT2Zmc2V0CiAgICAgICAgICAgICAgICAweEYzMDAsICAgICAgICAgICAgIC8vIExl
bmd0aAogICAgICAgICAgICAgICAgLCwgLCBUeXBlU3RhdGljLCBEZW5zZVRyYW5zbGF0aW9u
KQogICAgICAgICAgICBEV29yZE1lbW9yeSAoUmVzb3VyY2VQcm9kdWNlciwgUG9zRGVjb2Rl
LCBNaW5GaXhlZCwgTWF4Rml4ZWQsIENhY2hlYWJsZSwgUmVhZFdyaXRlLAogICAgICAgICAg
ICAgICAgMHgwMDAwMDAwMCwgICAgICAgICAvLyBHcmFudWxhcml0eQogICAgICAgICAgICAg
ICAgMHgwMDBBMDAwMCwgICAgICAgICAvLyBSYW5nZSBNaW5pbXVtCiAgICAgICAgICAgICAg
ICAweDAwMEJGRkZGLCAgICAgICAgIC8vIFJhbmdlIE1heGltdW0KICAgICAgICAgICAgICAg
IDB4MDAwMDAwMDAsICAgICAgICAgLy8gVHJhbnNsYXRpb24gT2Zmc2V0CiAgICAgICAgICAg
ICAgICAweDAwMDIwMDAwLCAgICAgICAgIC8vIExlbmd0aAogICAgICAgICAgICAgICAgLCwg
LCBBZGRyZXNzUmFuZ2VNZW1vcnksIFR5cGVTdGF0aWMpCiAgICAgICAgICAgIERXb3JkTWVt
b3J5IChSZXNvdXJjZVByb2R1Y2VyLCBQb3NEZWNvZGUsIE1pbkZpeGVkLCBNYXhGaXhlZCwg
Tm9uQ2FjaGVhYmxlLCBSZWFkV3JpdGUsCiAgICAgICAgICAgICAgICAweDAwMDAwMDAwLCAg
ICAgICAgIC8vIEdyYW51bGFyaXR5CiAgICAgICAgICAgICAgICAweEMwMDAwMDAwLCAgICAg
ICAgIC8vIFJhbmdlIE1pbmltdW0KICAgICAgICAgICAgICAgIDB4RkVCRkZGRkYsICAgICAg
ICAgLy8gUmFuZ2UgTWF4aW11bQogICAgICAgICAgICAgICAgMHgwMDAwMDAwMCwgICAgICAg
ICAvLyBUcmFuc2xhdGlvbiBPZmZzZXQKICAgICAgICAgICAgICAgIDB4M0VDMDAwMDAsICAg
ICAgICAgLy8gTGVuZ3RoCiAgICAgICAgICAgICAgICAsLCAsIEFkZHJlc3NSYW5nZU1lbW9y
eSwgVHlwZVN0YXRpYykKICAgICAgICAgICAgUVdvcmRNZW1vcnkgKFJlc291cmNlUHJvZHVj
ZXIsIFBvc0RlY29kZSwgTWluRml4ZWQsIE1heEZpeGVkLCBDYWNoZWFibGUsIFJlYWRXcml0
ZSwKICAgICAgICAgICAgICAgIDB4MDAwMDAwMDAwMDAwMDAwMCwgLy8gR3JhbnVsYXJpdHkK
ICAgICAgICAgICAgICAgIDB4MDAwMDAwMDE0MDAwMDAwMCwgLy8gUmFuZ2UgTWluaW11bQog
ICAgICAgICAgICAgICAgMHgwMDAwMDAwMUJGRkZGRkZGLCAvLyBSYW5nZSBNYXhpbXVtCiAg
ICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwMDAwMDAsIC8vIFRyYW5zbGF0aW9uIE9mZnNl
dAogICAgICAgICAgICAgICAgMHgwMDAwMDAwMDgwMDAwMDAwLCAvLyBMZW5ndGgKICAgICAg
ICAgICAgICAgICwsICwgQWRkcmVzc1JhbmdlTWVtb3J5LCBUeXBlU3RhdGljKQogICAgICAg
IH0pCiAgICAgICAgRGV2aWNlIChHUEUwKQogICAgICAgIHsKICAgICAgICAgICAgTmFtZSAo
X0hJRCwgIlBOUDBBMDYiIC8qIEdlbmVyaWMgQ29udGFpbmVyIERldmljZSAqLykgIC8vIF9I
SUQ6IEhhcmR3YXJlIElECiAgICAgICAgICAgIE5hbWUgKF9VSUQsICJHUEUwIHJlc291cmNl
cyIpICAvLyBfVUlEOiBVbmlxdWUgSUQKICAgICAgICAgICAgTmFtZSAoX1NUQSwgMHgwQikg
IC8vIF9TVEE6IFN0YXR1cwogICAgICAgICAgICBOYW1lIChfQ1JTLCBSZXNvdXJjZVRlbXBs
YXRlICgpICAvLyBfQ1JTOiBDdXJyZW50IFJlc291cmNlIFNldHRpbmdzCiAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgIElPIChEZWNvZGUxNiwKICAgICAgICAgICAgICAgICAgICAw
eEFGRTAsICAgICAgICAgICAgIC8vIFJhbmdlIE1pbmltdW0KICAgICAgICAgICAgICAgICAg
ICAweEFGRTAsICAgICAgICAgICAgIC8vIFJhbmdlIE1heGltdW0KICAgICAgICAgICAgICAg
ICAgICAweDAxLCAgICAgICAgICAgICAgIC8vIEFsaWdubWVudAogICAgICAgICAgICAgICAg
ICAgIDB4MDQsICAgICAgICAgICAgICAgLy8gTGVuZ3RoCiAgICAgICAgICAgICAgICAgICAg
KQogICAgICAgICAgICB9KQogICAgICAgIH0KCiAgICAgICAgRGV2aWNlIChQSFBSKQogICAg
ICAgIHsKICAgICAgICAgICAgTmFtZSAoX0hJRCwgIlBOUDBBMDYiIC8qIEdlbmVyaWMgQ29u
dGFpbmVyIERldmljZSAqLykgIC8vIF9ISUQ6IEhhcmR3YXJlIElECiAgICAgICAgICAgIE5h
bWUgKF9VSUQsICJQQ0kgSG90cGx1ZyByZXNvdXJjZXMiKSAgLy8gX1VJRDogVW5pcXVlIElE
CiAgICAgICAgICAgIE5hbWUgKF9TVEEsIDB4MEIpICAvLyBfU1RBOiBTdGF0dXMKICAgICAg
ICAgICAgTmFtZSAoX0NSUywgUmVzb3VyY2VUZW1wbGF0ZSAoKSAgLy8gX0NSUzogQ3VycmVu
dCBSZXNvdXJjZSBTZXR0aW5ncwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBJTyAo
RGVjb2RlMTYsCiAgICAgICAgICAgICAgICAgICAgMHhBRTAwLCAgICAgICAgICAgICAvLyBS
YW5nZSBNaW5pbXVtCiAgICAgICAgICAgICAgICAgICAgMHhBRTAwLCAgICAgICAgICAgICAv
LyBSYW5nZSBNYXhpbXVtCiAgICAgICAgICAgICAgICAgICAgMHgwMSwgICAgICAgICAgICAg
ICAvLyBBbGlnbm1lbnQKICAgICAgICAgICAgICAgICAgICAweDE4LCAgICAgICAgICAgICAg
IC8vIExlbmd0aAogICAgICAgICAgICAgICAgICAgICkKICAgICAgICAgICAgfSkKICAgICAg
ICB9CiAgICB9CgogICAgU2NvcGUgKFwpCiAgICB7CiAgICAgICAgTmFtZSAoX1MzLCBQYWNr
YWdlICgweDA0KSAgLy8gX1MzXzogUzMgU3lzdGVtIFN0YXRlCiAgICAgICAgewogICAgICAg
ICAgICBPbmUsIAogICAgICAgICAgICBPbmUsIAogICAgICAgICAgICBaZXJvLCAKICAgICAg
ICAgICAgWmVybwogICAgICAgIH0pCiAgICAgICAgTmFtZSAoX1M0LCBQYWNrYWdlICgweDA0
KSAgLy8gX1M0XzogUzQgU3lzdGVtIFN0YXRlCiAgICAgICAgewogICAgICAgICAgICAweDAy
LCAKICAgICAgICAgICAgMHgwMiwgCiAgICAgICAgICAgIFplcm8sIAogICAgICAgICAgICBa
ZXJvCiAgICAgICAgfSkKICAgICAgICBOYW1lIChfUzUsIFBhY2thZ2UgKDB4MDQpICAvLyBf
UzVfOiBTNSBTeXN0ZW0gU3RhdGUKICAgICAgICB7CiAgICAgICAgICAgIFplcm8sIAogICAg
ICAgICAgICBaZXJvLCAKICAgICAgICAgICAgWmVybywgCiAgICAgICAgICAgIFplcm8KICAg
ICAgICB9KQogICAgfQoKICAgIFNjb3BlIChcX1NCLlBDSTApCiAgICB7CiAgICAgICAgRGV2
aWNlIChGV0NGKQogICAgICAgIHsKICAgICAgICAgICAgTmFtZSAoX0hJRCwgIlFFTVUwMDAy
IikgIC8vIF9ISUQ6IEhhcmR3YXJlIElECiAgICAgICAgICAgIE5hbWUgKF9TVEEsIDB4MEIp
ICAvLyBfU1RBOiBTdGF0dXMKICAgICAgICAgICAgTmFtZSAoX0NSUywgUmVzb3VyY2VUZW1w
bGF0ZSAoKSAgLy8gX0NSUzogQ3VycmVudCBSZXNvdXJjZSBTZXR0aW5ncwogICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICBJTyAoRGVjb2RlMTYsCiAgICAgICAgICAgICAgICAgICAg
MHgwNTEwLCAgICAgICAgICAgICAvLyBSYW5nZSBNaW5pbXVtCiAgICAgICAgICAgICAgICAg
ICAgMHgwNTEwLCAgICAgICAgICAgICAvLyBSYW5nZSBNYXhpbXVtCiAgICAgICAgICAgICAg
ICAgICAgMHgwMSwgICAgICAgICAgICAgICAvLyBBbGlnbm1lbnQKICAgICAgICAgICAgICAg
ICAgICAweDBDLCAgICAgICAgICAgICAgIC8vIExlbmd0aAogICAgICAgICAgICAgICAgICAg
ICkKICAgICAgICAgICAgfSkKICAgICAgICB9CiAgICB9CgogICAgU2NvcGUgKFxfU0IpCiAg
ICB7CiAgICAgICAgU2NvcGUgKFBDSTApCiAgICAgICAgewogICAgICAgICAgICBOYW1lIChC
U0VMLCBaZXJvKQogICAgICAgICAgICBEZXZpY2UgKFMwMCkKICAgICAgICAgICAgewogICAg
ICAgICAgICAgICAgTmFtZSAoX0FEUiwgWmVybykgIC8vIF9BRFI6IEFkZHJlc3MKICAgICAg
ICAgICAgICAgIE5hbWUgKEFTVU4sIFplcm8pCiAgICAgICAgICAgICAgICBNZXRob2QgKF9E
U00sIDQsIFNlcmlhbGl6ZWQpICAvLyBfRFNNOiBEZXZpY2UtU3BlY2lmaWMgTWV0aG9kCiAg
ICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUmV0dXJuIChQRFNNIChBcmcw
LCBBcmcxLCBBcmcyLCBBcmczLCBCU0VMLCBBU1VOKSkKICAgICAgICAgICAgICAgIH0KICAg
ICAgICAgICAgfQoKICAgICAgICAgICAgRGV2aWNlIChTMTApCiAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgIE5hbWUgKF9BRFIsIDB4MDAwMjAwMDApICAvLyBfQURSOiBBZGRyZXNz
CiAgICAgICAgICAgICAgICBOYW1lIChBU1VOLCAweDAyKQogICAgICAgICAgICAgICAgTWV0
aG9kIChfRFNNLCA0LCBTZXJpYWxpemVkKSAgLy8gX0RTTTogRGV2aWNlLVNwZWNpZmljIE1l
dGhvZAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFJldHVybiAoUERT
TSAoQXJnMCwgQXJnMSwgQXJnMiwgQXJnMywgQlNFTCwgQVNVTikpCiAgICAgICAgICAgICAg
ICB9CgogICAgICAgICAgICAgICAgTWV0aG9kIChfUzFELCAwLCBOb3RTZXJpYWxpemVkKSAg
Ly8gX1MxRDogUzEgRGV2aWNlIFN0YXRlCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAg
ICAgICAgICAgUmV0dXJuIChaZXJvKQogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAg
ICAgIE1ldGhvZCAoX1MyRCwgMCwgTm90U2VyaWFsaXplZCkgIC8vIF9TMkQ6IFMyIERldmlj
ZSBTdGF0ZQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFJldHVybiAo
WmVybykKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBNZXRob2QgKF9TM0Qs
IDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfUzNEOiBTMyBEZXZpY2UgU3RhdGUKICAgICAgICAg
ICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBSZXR1cm4gKFplcm8pCiAgICAgICAgICAg
ICAgICB9CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIERldmljZSAoUzE4KQogICAgICAg
ICAgICB7CiAgICAgICAgICAgICAgICBOYW1lIChfQURSLCAweDAwMDMwMDAwKSAgLy8gX0FE
UjogQWRkcmVzcwogICAgICAgICAgICAgICAgTmFtZSAoQVNVTiwgMHgwMykKICAgICAgICAg
ICAgICAgIE1ldGhvZCAoX0RTTSwgNCwgU2VyaWFsaXplZCkgIC8vIF9EU006IERldmljZS1T
cGVjaWZpYyBNZXRob2QKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBS
ZXR1cm4gKFBEU00gKEFyZzAsIEFyZzEsIEFyZzIsIEFyZzMsIEJTRUwsIEFTVU4pKQogICAg
ICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIE5hbWUgKF9TVU4sIDB4MDMpICAvLyBf
U1VOOiBTbG90IFVzZXIgTnVtYmVyCiAgICAgICAgICAgICAgICBNZXRob2QgKF9FSjAsIDEs
IE5vdFNlcmlhbGl6ZWQpICAvLyBfRUp4OiBFamVjdCBEZXZpY2UsIHg9MC05CiAgICAgICAg
ICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUENFSiAoQlNFTCwgX1NVTikKICAgICAg
ICAgICAgICAgIH0KICAgICAgICAgICAgfQoKICAgICAgICAgICAgRGV2aWNlIChTMjApCiAg
ICAgICAgICAgIHsKICAgICAgICAgICAgICAgIE5hbWUgKF9BRFIsIDB4MDAwNDAwMDApICAv
LyBfQURSOiBBZGRyZXNzCiAgICAgICAgICAgICAgICBOYW1lIChBU1VOLCAweDA0KQogICAg
ICAgICAgICAgICAgTWV0aG9kIChfRFNNLCA0LCBTZXJpYWxpemVkKSAgLy8gX0RTTTogRGV2
aWNlLVNwZWNpZmljIE1ldGhvZAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAg
ICAgIFJldHVybiAoUERTTSAoQXJnMCwgQXJnMSwgQXJnMiwgQXJnMywgQlNFTCwgQVNVTikp
CiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgTmFtZSAoX1NVTiwgMHgwNCkg
IC8vIF9TVU46IFNsb3QgVXNlciBOdW1iZXIKICAgICAgICAgICAgICAgIE1ldGhvZCAoX0VK
MCwgMSwgTm90U2VyaWFsaXplZCkgIC8vIF9FSng6IEVqZWN0IERldmljZSwgeD0wLTkKICAg
ICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBQQ0VKIChCU0VMLCBfU1VOKQog
ICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9CgogICAgICAgICAgICBEZXZpY2UgKFMy
OCkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTmFtZSAoX0FEUiwgMHgwMDA1MDAw
MCkgIC8vIF9BRFI6IEFkZHJlc3MKICAgICAgICAgICAgICAgIE5hbWUgKEFTVU4sIDB4MDUp
CiAgICAgICAgICAgICAgICBNZXRob2QgKF9EU00sIDQsIFNlcmlhbGl6ZWQpICAvLyBfRFNN
OiBEZXZpY2UtU3BlY2lmaWMgTWV0aG9kCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAg
ICAgICAgICAgUmV0dXJuIChQRFNNIChBcmcwLCBBcmcxLCBBcmcyLCBBcmczLCBCU0VMLCBB
U1VOKSkKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBOYW1lIChfU1VOLCAw
eDA1KSAgLy8gX1NVTjogU2xvdCBVc2VyIE51bWJlcgogICAgICAgICAgICAgICAgTWV0aG9k
IChfRUowLCAxLCBOb3RTZXJpYWxpemVkKSAgLy8gX0VKeDogRWplY3QgRGV2aWNlLCB4PTAt
OQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFBDRUogKEJTRUwsIF9T
VU4pCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIERldmlj
ZSAoUzMwKQogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBOYW1lIChfQURSLCAweDAw
MDYwMDAwKSAgLy8gX0FEUjogQWRkcmVzcwogICAgICAgICAgICAgICAgTmFtZSAoQVNVTiwg
MHgwNikKICAgICAgICAgICAgICAgIE1ldGhvZCAoX0RTTSwgNCwgU2VyaWFsaXplZCkgIC8v
IF9EU006IERldmljZS1TcGVjaWZpYyBNZXRob2QKICAgICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICAgICBSZXR1cm4gKFBEU00gKEFyZzAsIEFyZzEsIEFyZzIsIEFyZzMsIEJT
RUwsIEFTVU4pKQogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIE5hbWUgKF9T
VU4sIDB4MDYpICAvLyBfU1VOOiBTbG90IFVzZXIgTnVtYmVyCiAgICAgICAgICAgICAgICBN
ZXRob2QgKF9FSjAsIDEsIE5vdFNlcmlhbGl6ZWQpICAvLyBfRUp4OiBFamVjdCBEZXZpY2Us
IHg9MC05CiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUENFSiAoQlNF
TCwgX1NVTikKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfQoKICAgICAgICAgICAg
RGV2aWNlIChTMzgpCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIE5hbWUgKF9BRFIs
IDB4MDAwNzAwMDApICAvLyBfQURSOiBBZGRyZXNzCiAgICAgICAgICAgICAgICBOYW1lIChB
U1VOLCAweDA3KQogICAgICAgICAgICAgICAgTWV0aG9kIChfRFNNLCA0LCBTZXJpYWxpemVk
KSAgLy8gX0RTTTogRGV2aWNlLVNwZWNpZmljIE1ldGhvZAogICAgICAgICAgICAgICAgewog
ICAgICAgICAgICAgICAgICAgIFJldHVybiAoUERTTSAoQXJnMCwgQXJnMSwgQXJnMiwgQXJn
MywgQlNFTCwgQVNVTikpCiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgTmFt
ZSAoX1NVTiwgMHgwNykgIC8vIF9TVU46IFNsb3QgVXNlciBOdW1iZXIKICAgICAgICAgICAg
ICAgIE1ldGhvZCAoX0VKMCwgMSwgTm90U2VyaWFsaXplZCkgIC8vIF9FSng6IEVqZWN0IERl
dmljZSwgeD0wLTkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBQQ0VK
IChCU0VMLCBfU1VOKQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9CgogICAgICAg
ICAgICBEZXZpY2UgKFM0MCkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTmFtZSAo
X1NVTiwgMHgwOCkgIC8vIF9TVU46IFNsb3QgVXNlciBOdW1iZXIKICAgICAgICAgICAgICAg
IE5hbWUgKF9BRFIsIDB4MDAwODAwMDApICAvLyBfQURSOiBBZGRyZXNzCiAgICAgICAgICAg
ICAgICBNZXRob2QgKF9FSjAsIDEsIE5vdFNlcmlhbGl6ZWQpICAvLyBfRUp4OiBFamVjdCBE
ZXZpY2UsIHg9MC05CiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUENF
SiAoQlNFTCwgX1NVTikKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBNZXRo
b2QgKF9EU00sIDQsIFNlcmlhbGl6ZWQpICAvLyBfRFNNOiBEZXZpY2UtU3BlY2lmaWMgTWV0
aG9kCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUmV0dXJuIChQRFNN
IChBcmcwLCBBcmcxLCBBcmcyLCBBcmczLCBCU0VMLCBfU1VOKSkKICAgICAgICAgICAgICAg
IH0KICAgICAgICAgICAgfQoKICAgICAgICAgICAgRGV2aWNlIChTNDgpCiAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgIE5hbWUgKF9TVU4sIDB4MDkpICAvLyBfU1VOOiBTbG90IFVz
ZXIgTnVtYmVyCiAgICAgICAgICAgICAgICBOYW1lIChfQURSLCAweDAwMDkwMDAwKSAgLy8g
X0FEUjogQWRkcmVzcwogICAgICAgICAgICAgICAgTWV0aG9kIChfRUowLCAxLCBOb3RTZXJp
YWxpemVkKSAgLy8gX0VKeDogRWplY3QgRGV2aWNlLCB4PTAtOQogICAgICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgICAgIFBDRUogKEJTRUwsIF9TVU4pCiAgICAgICAgICAgICAg
ICB9CgogICAgICAgICAgICAgICAgTWV0aG9kIChfRFNNLCA0LCBTZXJpYWxpemVkKSAgLy8g
X0RTTTogRGV2aWNlLVNwZWNpZmljIE1ldGhvZAogICAgICAgICAgICAgICAgewogICAgICAg
ICAgICAgICAgICAgIFJldHVybiAoUERTTSAoQXJnMCwgQXJnMSwgQXJnMiwgQXJnMywgQlNF
TCwgX1NVTikpCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0KCiAgICAgICAgICAg
IERldmljZSAoUzUwKQogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBOYW1lIChfU1VO
LCAweDBBKSAgLy8gX1NVTjogU2xvdCBVc2VyIE51bWJlcgogICAgICAgICAgICAgICAgTmFt
ZSAoX0FEUiwgMHgwMDBBMDAwMCkgIC8vIF9BRFI6IEFkZHJlc3MKICAgICAgICAgICAgICAg
IE1ldGhvZCAoX0VKMCwgMSwgTm90U2VyaWFsaXplZCkgIC8vIF9FSng6IEVqZWN0IERldmlj
ZSwgeD0wLTkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBQQ0VKIChC
U0VMLCBfU1VOKQogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIE1ldGhvZCAo
X0RTTSwgNCwgU2VyaWFsaXplZCkgIC8vIF9EU006IERldmljZS1TcGVjaWZpYyBNZXRob2QK
ICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBSZXR1cm4gKFBEU00gKEFy
ZzAsIEFyZzEsIEFyZzIsIEFyZzMsIEJTRUwsIF9TVU4pKQogICAgICAgICAgICAgICAgfQog
ICAgICAgICAgICB9CgogICAgICAgICAgICBEZXZpY2UgKFM1OCkKICAgICAgICAgICAgewog
ICAgICAgICAgICAgICAgTmFtZSAoX1NVTiwgMHgwQikgIC8vIF9TVU46IFNsb3QgVXNlciBO
dW1iZXIKICAgICAgICAgICAgICAgIE5hbWUgKF9BRFIsIDB4MDAwQjAwMDApICAvLyBfQURS
OiBBZGRyZXNzCiAgICAgICAgICAgICAgICBNZXRob2QgKF9FSjAsIDEsIE5vdFNlcmlhbGl6
ZWQpICAvLyBfRUp4OiBFamVjdCBEZXZpY2UsIHg9MC05CiAgICAgICAgICAgICAgICB7CiAg
ICAgICAgICAgICAgICAgICAgUENFSiAoQlNFTCwgX1NVTikKICAgICAgICAgICAgICAgIH0K
CiAgICAgICAgICAgICAgICBNZXRob2QgKF9EU00sIDQsIFNlcmlhbGl6ZWQpICAvLyBfRFNN
OiBEZXZpY2UtU3BlY2lmaWMgTWV0aG9kCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAg
ICAgICAgICAgUmV0dXJuIChQRFNNIChBcmcwLCBBcmcxLCBBcmcyLCBBcmczLCBCU0VMLCBf
U1VOKSkKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfQoKICAgICAgICAgICAgRGV2
aWNlIChTNjApCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIE5hbWUgKF9TVU4sIDB4
MEMpICAvLyBfU1VOOiBTbG90IFVzZXIgTnVtYmVyCiAgICAgICAgICAgICAgICBOYW1lIChf
QURSLCAweDAwMEMwMDAwKSAgLy8gX0FEUjogQWRkcmVzcwogICAgICAgICAgICAgICAgTWV0
aG9kIChfRUowLCAxLCBOb3RTZXJpYWxpemVkKSAgLy8gX0VKeDogRWplY3QgRGV2aWNlLCB4
PTAtOQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFBDRUogKEJTRUws
IF9TVU4pCiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgTWV0aG9kIChfRFNN
LCA0LCBTZXJpYWxpemVkKSAgLy8gX0RTTTogRGV2aWNlLVNwZWNpZmljIE1ldGhvZAogICAg
ICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFJldHVybiAoUERTTSAoQXJnMCwg
QXJnMSwgQXJnMiwgQXJnMywgQlNFTCwgX1NVTikpCiAgICAgICAgICAgICAgICB9CiAgICAg
ICAgICAgIH0KCiAgICAgICAgICAgIERldmljZSAoUzY4KQogICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICBOYW1lIChfU1VOLCAweDBEKSAgLy8gX1NVTjogU2xvdCBVc2VyIE51bWJl
cgogICAgICAgICAgICAgICAgTmFtZSAoX0FEUiwgMHgwMDBEMDAwMCkgIC8vIF9BRFI6IEFk
ZHJlc3MKICAgICAgICAgICAgICAgIE1ldGhvZCAoX0VKMCwgMSwgTm90U2VyaWFsaXplZCkg
IC8vIF9FSng6IEVqZWN0IERldmljZSwgeD0wLTkKICAgICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICAgICBQQ0VKIChCU0VMLCBfU1VOKQogICAgICAgICAgICAgICAgfQoKICAg
ICAgICAgICAgICAgIE1ldGhvZCAoX0RTTSwgNCwgU2VyaWFsaXplZCkgIC8vIF9EU006IERl
dmljZS1TcGVjaWZpYyBNZXRob2QKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
ICAgICBSZXR1cm4gKFBEU00gKEFyZzAsIEFyZzEsIEFyZzIsIEFyZzMsIEJTRUwsIF9TVU4p
KQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9CgogICAgICAgICAgICBEZXZpY2Ug
KFM3MCkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTmFtZSAoX1NVTiwgMHgwRSkg
IC8vIF9TVU46IFNsb3QgVXNlciBOdW1iZXIKICAgICAgICAgICAgICAgIE5hbWUgKF9BRFIs
IDB4MDAwRTAwMDApICAvLyBfQURSOiBBZGRyZXNzCiAgICAgICAgICAgICAgICBNZXRob2Qg
KF9FSjAsIDEsIE5vdFNlcmlhbGl6ZWQpICAvLyBfRUp4OiBFamVjdCBEZXZpY2UsIHg9MC05
CiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUENFSiAoQlNFTCwgX1NV
TikKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBNZXRob2QgKF9EU00sIDQs
IFNlcmlhbGl6ZWQpICAvLyBfRFNNOiBEZXZpY2UtU3BlY2lmaWMgTWV0aG9kCiAgICAgICAg
ICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUmV0dXJuIChQRFNNIChBcmcwLCBBcmcx
LCBBcmcyLCBBcmczLCBCU0VMLCBfU1VOKSkKICAgICAgICAgICAgICAgIH0KICAgICAgICAg
ICAgfQoKICAgICAgICAgICAgRGV2aWNlIChTNzgpCiAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgIE5hbWUgKF9TVU4sIDB4MEYpICAvLyBfU1VOOiBTbG90IFVzZXIgTnVtYmVyCiAg
ICAgICAgICAgICAgICBOYW1lIChfQURSLCAweDAwMEYwMDAwKSAgLy8gX0FEUjogQWRkcmVz
cwogICAgICAgICAgICAgICAgTWV0aG9kIChfRUowLCAxLCBOb3RTZXJpYWxpemVkKSAgLy8g
X0VKeDogRWplY3QgRGV2aWNlLCB4PTAtOQogICAgICAgICAgICAgICAgewogICAgICAgICAg
ICAgICAgICAgIFBDRUogKEJTRUwsIF9TVU4pCiAgICAgICAgICAgICAgICB9CgogICAgICAg
ICAgICAgICAgTWV0aG9kIChfRFNNLCA0LCBTZXJpYWxpemVkKSAgLy8gX0RTTTogRGV2aWNl
LVNwZWNpZmljIE1ldGhvZAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAg
IFJldHVybiAoUERTTSAoQXJnMCwgQXJnMSwgQXJnMiwgQXJnMywgQlNFTCwgX1NVTikpCiAg
ICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIERldmljZSAoUzgw
KQogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBOYW1lIChfU1VOLCAweDEwKSAgLy8g
X1NVTjogU2xvdCBVc2VyIE51bWJlcgogICAgICAgICAgICAgICAgTmFtZSAoX0FEUiwgMHgw
MDEwMDAwMCkgIC8vIF9BRFI6IEFkZHJlc3MKICAgICAgICAgICAgICAgIE1ldGhvZCAoX0VK
MCwgMSwgTm90U2VyaWFsaXplZCkgIC8vIF9FSng6IEVqZWN0IERldmljZSwgeD0wLTkKICAg
ICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBQQ0VKIChCU0VMLCBfU1VOKQog
ICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIE1ldGhvZCAoX0RTTSwgNCwgU2Vy
aWFsaXplZCkgIC8vIF9EU006IERldmljZS1TcGVjaWZpYyBNZXRob2QKICAgICAgICAgICAg
ICAgIHsKICAgICAgICAgICAgICAgICAgICBSZXR1cm4gKFBEU00gKEFyZzAsIEFyZzEsIEFy
ZzIsIEFyZzMsIEJTRUwsIF9TVU4pKQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9
CgogICAgICAgICAgICBEZXZpY2UgKFM4OCkKICAgICAgICAgICAgewogICAgICAgICAgICAg
ICAgTmFtZSAoX1NVTiwgMHgxMSkgIC8vIF9TVU46IFNsb3QgVXNlciBOdW1iZXIKICAgICAg
ICAgICAgICAgIE5hbWUgKF9BRFIsIDB4MDAxMTAwMDApICAvLyBfQURSOiBBZGRyZXNzCiAg
ICAgICAgICAgICAgICBNZXRob2QgKF9FSjAsIDEsIE5vdFNlcmlhbGl6ZWQpICAvLyBfRUp4
OiBFamVjdCBEZXZpY2UsIHg9MC05CiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAg
ICAgICAgUENFSiAoQlNFTCwgX1NVTikKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAg
ICAgICBNZXRob2QgKF9EU00sIDQsIFNlcmlhbGl6ZWQpICAvLyBfRFNNOiBEZXZpY2UtU3Bl
Y2lmaWMgTWV0aG9kCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUmV0
dXJuIChQRFNNIChBcmcwLCBBcmcxLCBBcmcyLCBBcmczLCBCU0VMLCBfU1VOKSkKICAgICAg
ICAgICAgICAgIH0KICAgICAgICAgICAgfQoKICAgICAgICAgICAgRGV2aWNlIChTOTApCiAg
ICAgICAgICAgIHsKICAgICAgICAgICAgICAgIE5hbWUgKF9TVU4sIDB4MTIpICAvLyBfU1VO
OiBTbG90IFVzZXIgTnVtYmVyCiAgICAgICAgICAgICAgICBOYW1lIChfQURSLCAweDAwMTIw
MDAwKSAgLy8gX0FEUjogQWRkcmVzcwogICAgICAgICAgICAgICAgTWV0aG9kIChfRUowLCAx
LCBOb3RTZXJpYWxpemVkKSAgLy8gX0VKeDogRWplY3QgRGV2aWNlLCB4PTAtOQogICAgICAg
ICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFBDRUogKEJTRUwsIF9TVU4pCiAgICAg
ICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgTWV0aG9kIChfRFNNLCA0LCBTZXJpYWxp
emVkKSAgLy8gX0RTTTogRGV2aWNlLVNwZWNpZmljIE1ldGhvZAogICAgICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgICAgIFJldHVybiAoUERTTSAoQXJnMCwgQXJnMSwgQXJnMiwg
QXJnMywgQlNFTCwgX1NVTikpCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0KCiAg
ICAgICAgICAgIERldmljZSAoUzk4KQogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBO
YW1lIChfU1VOLCAweDEzKSAgLy8gX1NVTjogU2xvdCBVc2VyIE51bWJlcgogICAgICAgICAg
ICAgICAgTmFtZSAoX0FEUiwgMHgwMDEzMDAwMCkgIC8vIF9BRFI6IEFkZHJlc3MKICAgICAg
ICAgICAgICAgIE1ldGhvZCAoX0VKMCwgMSwgTm90U2VyaWFsaXplZCkgIC8vIF9FSng6IEVq
ZWN0IERldmljZSwgeD0wLTkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAg
ICBQQ0VKIChCU0VMLCBfU1VOKQogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAg
IE1ldGhvZCAoX0RTTSwgNCwgU2VyaWFsaXplZCkgIC8vIF9EU006IERldmljZS1TcGVjaWZp
YyBNZXRob2QKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBSZXR1cm4g
KFBEU00gKEFyZzAsIEFyZzEsIEFyZzIsIEFyZzMsIEJTRUwsIF9TVU4pKQogICAgICAgICAg
ICAgICAgfQogICAgICAgICAgICB9CgogICAgICAgICAgICBEZXZpY2UgKFNBMCkKICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgTmFtZSAoX1NVTiwgMHgxNCkgIC8vIF9TVU46IFNs
b3QgVXNlciBOdW1iZXIKICAgICAgICAgICAgICAgIE5hbWUgKF9BRFIsIDB4MDAxNDAwMDAp
ICAvLyBfQURSOiBBZGRyZXNzCiAgICAgICAgICAgICAgICBNZXRob2QgKF9FSjAsIDEsIE5v
dFNlcmlhbGl6ZWQpICAvLyBfRUp4OiBFamVjdCBEZXZpY2UsIHg9MC05CiAgICAgICAgICAg
ICAgICB7CiAgICAgICAgICAgICAgICAgICAgUENFSiAoQlNFTCwgX1NVTikKICAgICAgICAg
ICAgICAgIH0KCiAgICAgICAgICAgICAgICBNZXRob2QgKF9EU00sIDQsIFNlcmlhbGl6ZWQp
ICAvLyBfRFNNOiBEZXZpY2UtU3BlY2lmaWMgTWV0aG9kCiAgICAgICAgICAgICAgICB7CiAg
ICAgICAgICAgICAgICAgICAgUmV0dXJuIChQRFNNIChBcmcwLCBBcmcxLCBBcmcyLCBBcmcz
LCBCU0VMLCBfU1VOKSkKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfQoKICAgICAg
ICAgICAgRGV2aWNlIChTQTgpCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIE5hbWUg
KF9TVU4sIDB4MTUpICAvLyBfU1VOOiBTbG90IFVzZXIgTnVtYmVyCiAgICAgICAgICAgICAg
ICBOYW1lIChfQURSLCAweDAwMTUwMDAwKSAgLy8gX0FEUjogQWRkcmVzcwogICAgICAgICAg
ICAgICAgTWV0aG9kIChfRUowLCAxLCBOb3RTZXJpYWxpemVkKSAgLy8gX0VKeDogRWplY3Qg
RGV2aWNlLCB4PTAtOQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFBD
RUogKEJTRUwsIF9TVU4pCiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgTWV0
aG9kIChfRFNNLCA0LCBTZXJpYWxpemVkKSAgLy8gX0RTTTogRGV2aWNlLVNwZWNpZmljIE1l
dGhvZAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFJldHVybiAoUERT
TSAoQXJnMCwgQXJnMSwgQXJnMiwgQXJnMywgQlNFTCwgX1NVTikpCiAgICAgICAgICAgICAg
ICB9CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIERldmljZSAoU0IwKQogICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICBOYW1lIChfU1VOLCAweDE2KSAgLy8gX1NVTjogU2xvdCBV
c2VyIE51bWJlcgogICAgICAgICAgICAgICAgTmFtZSAoX0FEUiwgMHgwMDE2MDAwMCkgIC8v
IF9BRFI6IEFkZHJlc3MKICAgICAgICAgICAgICAgIE1ldGhvZCAoX0VKMCwgMSwgTm90U2Vy
aWFsaXplZCkgIC8vIF9FSng6IEVqZWN0IERldmljZSwgeD0wLTkKICAgICAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgICAgICBQQ0VKIChCU0VMLCBfU1VOKQogICAgICAgICAgICAg
ICAgfQoKICAgICAgICAgICAgICAgIE1ldGhvZCAoX0RTTSwgNCwgU2VyaWFsaXplZCkgIC8v
IF9EU006IERldmljZS1TcGVjaWZpYyBNZXRob2QKICAgICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICAgICBSZXR1cm4gKFBEU00gKEFyZzAsIEFyZzEsIEFyZzIsIEFyZzMsIEJT
RUwsIF9TVU4pKQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9CgogICAgICAgICAg
ICBEZXZpY2UgKFNCOCkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTmFtZSAoX1NV
TiwgMHgxNykgIC8vIF9TVU46IFNsb3QgVXNlciBOdW1iZXIKICAgICAgICAgICAgICAgIE5h
bWUgKF9BRFIsIDB4MDAxNzAwMDApICAvLyBfQURSOiBBZGRyZXNzCiAgICAgICAgICAgICAg
ICBNZXRob2QgKF9FSjAsIDEsIE5vdFNlcmlhbGl6ZWQpICAvLyBfRUp4OiBFamVjdCBEZXZp
Y2UsIHg9MC05CiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUENFSiAo
QlNFTCwgX1NVTikKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBNZXRob2Qg
KF9EU00sIDQsIFNlcmlhbGl6ZWQpICAvLyBfRFNNOiBEZXZpY2UtU3BlY2lmaWMgTWV0aG9k
CiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUmV0dXJuIChQRFNNIChB
cmcwLCBBcmcxLCBBcmcyLCBBcmczLCBCU0VMLCBfU1VOKSkKICAgICAgICAgICAgICAgIH0K
ICAgICAgICAgICAgfQoKICAgICAgICAgICAgRGV2aWNlIChTQzApCiAgICAgICAgICAgIHsK
ICAgICAgICAgICAgICAgIE5hbWUgKF9TVU4sIDB4MTgpICAvLyBfU1VOOiBTbG90IFVzZXIg
TnVtYmVyCiAgICAgICAgICAgICAgICBOYW1lIChfQURSLCAweDAwMTgwMDAwKSAgLy8gX0FE
UjogQWRkcmVzcwogICAgICAgICAgICAgICAgTWV0aG9kIChfRUowLCAxLCBOb3RTZXJpYWxp
emVkKSAgLy8gX0VKeDogRWplY3QgRGV2aWNlLCB4PTAtOQogICAgICAgICAgICAgICAgewog
ICAgICAgICAgICAgICAgICAgIFBDRUogKEJTRUwsIF9TVU4pCiAgICAgICAgICAgICAgICB9
CgogICAgICAgICAgICAgICAgTWV0aG9kIChfRFNNLCA0LCBTZXJpYWxpemVkKSAgLy8gX0RT
TTogRGV2aWNlLVNwZWNpZmljIE1ldGhvZAogICAgICAgICAgICAgICAgewogICAgICAgICAg
ICAgICAgICAgIFJldHVybiAoUERTTSAoQXJnMCwgQXJnMSwgQXJnMiwgQXJnMywgQlNFTCwg
X1NVTikpCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIERl
dmljZSAoU0M4KQogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBOYW1lIChfU1VOLCAw
eDE5KSAgLy8gX1NVTjogU2xvdCBVc2VyIE51bWJlcgogICAgICAgICAgICAgICAgTmFtZSAo
X0FEUiwgMHgwMDE5MDAwMCkgIC8vIF9BRFI6IEFkZHJlc3MKICAgICAgICAgICAgICAgIE1l
dGhvZCAoX0VKMCwgMSwgTm90U2VyaWFsaXplZCkgIC8vIF9FSng6IEVqZWN0IERldmljZSwg
eD0wLTkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBQQ0VKIChCU0VM
LCBfU1VOKQogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIE1ldGhvZCAoX0RT
TSwgNCwgU2VyaWFsaXplZCkgIC8vIF9EU006IERldmljZS1TcGVjaWZpYyBNZXRob2QKICAg
ICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBSZXR1cm4gKFBEU00gKEFyZzAs
IEFyZzEsIEFyZzIsIEFyZzMsIEJTRUwsIF9TVU4pKQogICAgICAgICAgICAgICAgfQogICAg
ICAgICAgICB9CgogICAgICAgICAgICBEZXZpY2UgKFNEMCkKICAgICAgICAgICAgewogICAg
ICAgICAgICAgICAgTmFtZSAoX1NVTiwgMHgxQSkgIC8vIF9TVU46IFNsb3QgVXNlciBOdW1i
ZXIKICAgICAgICAgICAgICAgIE5hbWUgKF9BRFIsIDB4MDAxQTAwMDApICAvLyBfQURSOiBB
ZGRyZXNzCiAgICAgICAgICAgICAgICBNZXRob2QgKF9FSjAsIDEsIE5vdFNlcmlhbGl6ZWQp
ICAvLyBfRUp4OiBFamVjdCBEZXZpY2UsIHg9MC05CiAgICAgICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICAgICAgUENFSiAoQlNFTCwgX1NVTikKICAgICAgICAgICAgICAgIH0KCiAg
ICAgICAgICAgICAgICBNZXRob2QgKF9EU00sIDQsIFNlcmlhbGl6ZWQpICAvLyBfRFNNOiBE
ZXZpY2UtU3BlY2lmaWMgTWV0aG9kCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAg
ICAgICAgUmV0dXJuIChQRFNNIChBcmcwLCBBcmcxLCBBcmcyLCBBcmczLCBCU0VMLCBfU1VO
KSkKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfQoKICAgICAgICAgICAgRGV2aWNl
IChTRDgpCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIE5hbWUgKF9TVU4sIDB4MUIp
ICAvLyBfU1VOOiBTbG90IFVzZXIgTnVtYmVyCiAgICAgICAgICAgICAgICBOYW1lIChfQURS
LCAweDAwMUIwMDAwKSAgLy8gX0FEUjogQWRkcmVzcwogICAgICAgICAgICAgICAgTWV0aG9k
IChfRUowLCAxLCBOb3RTZXJpYWxpemVkKSAgLy8gX0VKeDogRWplY3QgRGV2aWNlLCB4PTAt
OQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFBDRUogKEJTRUwsIF9T
VU4pCiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgTWV0aG9kIChfRFNNLCA0
LCBTZXJpYWxpemVkKSAgLy8gX0RTTTogRGV2aWNlLVNwZWNpZmljIE1ldGhvZAogICAgICAg
ICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFJldHVybiAoUERTTSAoQXJnMCwgQXJn
MSwgQXJnMiwgQXJnMywgQlNFTCwgX1NVTikpCiAgICAgICAgICAgICAgICB9CiAgICAgICAg
ICAgIH0KCiAgICAgICAgICAgIERldmljZSAoU0UwKQogICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICBOYW1lIChfU1VOLCAweDFDKSAgLy8gX1NVTjogU2xvdCBVc2VyIE51bWJlcgog
ICAgICAgICAgICAgICAgTmFtZSAoX0FEUiwgMHgwMDFDMDAwMCkgIC8vIF9BRFI6IEFkZHJl
c3MKICAgICAgICAgICAgICAgIE1ldGhvZCAoX0VKMCwgMSwgTm90U2VyaWFsaXplZCkgIC8v
IF9FSng6IEVqZWN0IERldmljZSwgeD0wLTkKICAgICAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgICAgICBQQ0VKIChCU0VMLCBfU1VOKQogICAgICAgICAgICAgICAgfQoKICAgICAg
ICAgICAgICAgIE1ldGhvZCAoX0RTTSwgNCwgU2VyaWFsaXplZCkgIC8vIF9EU006IERldmlj
ZS1TcGVjaWZpYyBNZXRob2QKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAg
ICBSZXR1cm4gKFBEU00gKEFyZzAsIEFyZzEsIEFyZzIsIEFyZzMsIEJTRUwsIF9TVU4pKQog
ICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9CgogICAgICAgICAgICBEZXZpY2UgKFNF
OCkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTmFtZSAoX1NVTiwgMHgxRCkgIC8v
IF9TVU46IFNsb3QgVXNlciBOdW1iZXIKICAgICAgICAgICAgICAgIE5hbWUgKF9BRFIsIDB4
MDAxRDAwMDApICAvLyBfQURSOiBBZGRyZXNzCiAgICAgICAgICAgICAgICBNZXRob2QgKF9F
SjAsIDEsIE5vdFNlcmlhbGl6ZWQpICAvLyBfRUp4OiBFamVjdCBEZXZpY2UsIHg9MC05CiAg
ICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUENFSiAoQlNFTCwgX1NVTikK
ICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBNZXRob2QgKF9EU00sIDQsIFNl
cmlhbGl6ZWQpICAvLyBfRFNNOiBEZXZpY2UtU3BlY2lmaWMgTWV0aG9kCiAgICAgICAgICAg
ICAgICB7CiAgICAgICAgICAgICAgICAgICAgUmV0dXJuIChQRFNNIChBcmcwLCBBcmcxLCBB
cmcyLCBBcmczLCBCU0VMLCBfU1VOKSkKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAg
fQoKICAgICAgICAgICAgRGV2aWNlIChTRjApCiAgICAgICAgICAgIHsKICAgICAgICAgICAg
ICAgIE5hbWUgKF9TVU4sIDB4MUUpICAvLyBfU1VOOiBTbG90IFVzZXIgTnVtYmVyCiAgICAg
ICAgICAgICAgICBOYW1lIChfQURSLCAweDAwMUUwMDAwKSAgLy8gX0FEUjogQWRkcmVzcwog
ICAgICAgICAgICAgICAgTWV0aG9kIChfRUowLCAxLCBOb3RTZXJpYWxpemVkKSAgLy8gX0VK
eDogRWplY3QgRGV2aWNlLCB4PTAtOQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAg
ICAgICAgIFBDRUogKEJTRUwsIF9TVU4pCiAgICAgICAgICAgICAgICB9CgogICAgICAgICAg
ICAgICAgTWV0aG9kIChfRFNNLCA0LCBTZXJpYWxpemVkKSAgLy8gX0RTTTogRGV2aWNlLVNw
ZWNpZmljIE1ldGhvZAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFJl
dHVybiAoUERTTSAoQXJnMCwgQXJnMSwgQXJnMiwgQXJnMywgQlNFTCwgX1NVTikpCiAgICAg
ICAgICAgICAgICB9CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIERldmljZSAoU0Y4KQog
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBOYW1lIChfU1VOLCAweDFGKSAgLy8gX1NV
TjogU2xvdCBVc2VyIE51bWJlcgogICAgICAgICAgICAgICAgTmFtZSAoX0FEUiwgMHgwMDFG
MDAwMCkgIC8vIF9BRFI6IEFkZHJlc3MKICAgICAgICAgICAgICAgIE1ldGhvZCAoX0VKMCwg
MSwgTm90U2VyaWFsaXplZCkgIC8vIF9FSng6IEVqZWN0IERldmljZSwgeD0wLTkKICAgICAg
ICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBQQ0VKIChCU0VMLCBfU1VOKQogICAg
ICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIE1ldGhvZCAoX0RTTSwgNCwgU2VyaWFs
aXplZCkgIC8vIF9EU006IERldmljZS1TcGVjaWZpYyBNZXRob2QKICAgICAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgICAgICBSZXR1cm4gKFBEU00gKEFyZzAsIEFyZzEsIEFyZzIs
IEFyZzMsIEJTRUwsIF9TVU4pKQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9Cgog
ICAgICAgICAgICBNZXRob2QgKERWTlQsIDIsIE5vdFNlcmlhbGl6ZWQpCiAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgIElmICgoQXJnMCAmIDB4MDgpKQogICAgICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgICAgIE5vdGlmeSAoUzE4LCBBcmcxKQogICAgICAgICAgICAg
ICAgfQoKICAgICAgICAgICAgICAgIElmICgoQXJnMCAmIDB4MTApKQogICAgICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgICAgIE5vdGlmeSAoUzIwLCBBcmcxKQogICAgICAgICAg
ICAgICAgfQoKICAgICAgICAgICAgICAgIElmICgoQXJnMCAmIDB4MjApKQogICAgICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgICAgIE5vdGlmeSAoUzI4LCBBcmcxKQogICAgICAg
ICAgICAgICAgfQoKICAgICAgICAgICAgICAgIElmICgoQXJnMCAmIDB4NDApKQogICAgICAg
ICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIE5vdGlmeSAoUzMwLCBBcmcxKQogICAg
ICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIElmICgoQXJnMCAmIDB4ODApKQogICAg
ICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIE5vdGlmeSAoUzM4LCBBcmcxKQog
ICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIElmICgoQXJnMCAmIDB4MDEwMCkp
CiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgTm90aWZ5IChTNDAsIEFy
ZzEpCiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgSWYgKChBcmcwICYgMHgw
MjAwKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKFM0
OCwgQXJnMSkKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBJZiAoKEFyZzAg
JiAweDA0MDApKQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIE5vdGlm
eSAoUzUwLCBBcmcxKQogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIElmICgo
QXJnMCAmIDB4MDgwMCkpCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAg
Tm90aWZ5IChTNTgsIEFyZzEpCiAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAg
SWYgKChBcmcwICYgMHgxMDAwKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
ICAgICBOb3RpZnkgKFM2MCwgQXJnMSkKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAg
ICAgICBJZiAoKEFyZzAgJiAweDIwMDApKQogICAgICAgICAgICAgICAgewogICAgICAgICAg
ICAgICAgICAgIE5vdGlmeSAoUzY4LCBBcmcxKQogICAgICAgICAgICAgICAgfQoKICAgICAg
ICAgICAgICAgIElmICgoQXJnMCAmIDB4NDAwMCkpCiAgICAgICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICAgICAgTm90aWZ5IChTNzAsIEFyZzEpCiAgICAgICAgICAgICAgICB9Cgog
ICAgICAgICAgICAgICAgSWYgKChBcmcwICYgMHg4MDAwKSkKICAgICAgICAgICAgICAgIHsK
ICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKFM3OCwgQXJnMSkKICAgICAgICAgICAgICAg
IH0KCiAgICAgICAgICAgICAgICBJZiAoKEFyZzAgJiAweDAwMDEwMDAwKSkKICAgICAgICAg
ICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKFM4MCwgQXJnMSkKICAgICAg
ICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBJZiAoKEFyZzAgJiAweDAwMDIwMDAwKSkK
ICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKFM4OCwgQXJn
MSkKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBJZiAoKEFyZzAgJiAweDAw
MDQwMDAwKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBOb3RpZnkg
KFM5MCwgQXJnMSkKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBJZiAoKEFy
ZzAgJiAweDAwMDgwMDAwKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAg
ICBOb3RpZnkgKFM5OCwgQXJnMSkKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAg
ICBJZiAoKEFyZzAgJiAweDAwMTAwMDAwKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgICAgICBOb3RpZnkgKFNBMCwgQXJnMSkKICAgICAgICAgICAgICAgIH0KCiAgICAg
ICAgICAgICAgICBJZiAoKEFyZzAgJiAweDAwMjAwMDAwKSkKICAgICAgICAgICAgICAgIHsK
ICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKFNBOCwgQXJnMSkKICAgICAgICAgICAgICAg
IH0KCiAgICAgICAgICAgICAgICBJZiAoKEFyZzAgJiAweDAwNDAwMDAwKSkKICAgICAgICAg
ICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKFNCMCwgQXJnMSkKICAgICAg
ICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBJZiAoKEFyZzAgJiAweDAwODAwMDAwKSkK
ICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKFNCOCwgQXJn
MSkKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBJZiAoKEFyZzAgJiAweDAx
MDAwMDAwKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBOb3RpZnkg
KFNDMCwgQXJnMSkKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBJZiAoKEFy
ZzAgJiAweDAyMDAwMDAwKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAg
ICBOb3RpZnkgKFNDOCwgQXJnMSkKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAg
ICBJZiAoKEFyZzAgJiAweDA0MDAwMDAwKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgICAgICBOb3RpZnkgKFNEMCwgQXJnMSkKICAgICAgICAgICAgICAgIH0KCiAgICAg
ICAgICAgICAgICBJZiAoKEFyZzAgJiAweDA4MDAwMDAwKSkKICAgICAgICAgICAgICAgIHsK
ICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKFNEOCwgQXJnMSkKICAgICAgICAgICAgICAg
IH0KCiAgICAgICAgICAgICAgICBJZiAoKEFyZzAgJiAweDEwMDAwMDAwKSkKICAgICAgICAg
ICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKFNFMCwgQXJnMSkKICAgICAg
ICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBJZiAoKEFyZzAgJiAweDIwMDAwMDAwKSkK
ICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKFNFOCwgQXJn
MSkKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBJZiAoKEFyZzAgJiAweDQw
MDAwMDAwKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBOb3RpZnkg
KFNGMCwgQXJnMSkKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBJZiAoKEFy
ZzAgJiAweDgwMDAwMDAwKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAg
ICBOb3RpZnkgKFNGOCwgQXJnMSkKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfQoK
ICAgICAgICAgICAgTWV0aG9kIChQQ05ULCAwLCBOb3RTZXJpYWxpemVkKQogICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICBCTlVNID0gWmVybwogICAgICAgICAgICAgICAgRFZOVCAo
UENJVSwgT25lKQogICAgICAgICAgICAgICAgRFZOVCAoUENJRCwgMHgwMykKICAgICAgICAg
ICAgfQogICAgICAgIH0KICAgIH0KfQoK

--------------XlOJqMvXxgp1YTDKkEZuE2SQ--

