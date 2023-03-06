Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6BB56AC913
	for <lists+linux-input@lfdr.de>; Mon,  6 Mar 2023 18:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjCFRDJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Mar 2023 12:03:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbjCFRCk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Mar 2023 12:02:40 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4572E64A9A;
        Mon,  6 Mar 2023 09:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678122121; x=1709658121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pvgQxe2WsZca7jEyglhQ49hXGopVEYml3M82wDe7Li4=;
  b=YkB+kbAJ0Dd4NHg/NXhNSGZLxOmeXru6jvKgMSawScH6sqgxs22Pf6tu
   5w2/2cd3BVwXs/TAAiKwRGg66mOB5D3uXH2rDqGzCJVpJXN3OYGaDae05
   Dbmnt0RCEQBt8U+zBrCFB+Kak9IvMzsaPEV7cWHYjrWoiSNDUXZxR2UW9
   1X9GJxIaSgi+bVFNwa8PHjDgO3WHcwC8fuzU9Dcsg5lFqyLJ81iJork0F
   aLhLCiCvXhX4Cr+ABY4O6W3S9vAMqH5lAv+bHYfh+XFU6AXC4Jju53533
   8HIHM1RBqI6lDXq4rD3fRPvbg86tjbK2Vmzxhp89GW1XKGZT4172VTC9K
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="333083845"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="333083845"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 09:01:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819370093"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="819370093"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2023 09:01:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZEDL-00GWzV-1M;
        Mon, 06 Mar 2023 19:01:31 +0200
Date:   Mon, 6 Mar 2023 19:01:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
References: <20230227140758.1575-1-kaehndan@gmail.com>
 <20230227140758.1575-4-kaehndan@gmail.com>
 <Y/03to4XFXPwkGH1@smile.fi.intel.com>
 <CAP+ZCCe=f3AtxvC1Z6zPErMEG9BcnCOjApc26n_9yjq2+U72pw@mail.gmail.com>
 <Y/9oO1AE6GK6CQmp@smile.fi.intel.com>
 <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
 <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
 <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
 <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 06, 2023 at 03:48:18PM +0100, Benjamin Tissoires wrote:
> 
> 
> On Mon, Mar 6, 2023 at 2:07 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > On Mon, Mar 06, 2023 at 01:36:51PM +0100, Benjamin Tissoires wrote:
> > > On Mon, Mar 6, 2023 at 11:49 AM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Mar 02, 2023 at 06:06:06PM +0100, Benjamin Tissoires wrote:
> > > > > On Mar 01 2023, Andy Shevchenko wrote:
> > > > > > On Tue, Feb 28, 2023 at 01:05:54PM -0600, Daniel Kaehn wrote:
> > 
> > ...
> > 
> > [1]: https://stackoverflow.com/a/60855157/2511795
> > 
> > > > > Thanks Andy for your help here, and thanks for that link.
> > > > >
> > > > > I am trying to test Danny's patch as I want to use it for my HID CI,
> > > > > being an owner of a CP2112 device myself.
> > > > >
> > > > > The current setup is using out of the tree patches [2] which are
> > > > > implementing a platform i2c-hid support and some manual addition of a
> > > > > I2C-HID device on top of it. This works fine but gets busted every now
> > > > > and then when the tree sees a change that conflicts with these patches.
> > > > >
> > > > > So with Danny's series, I thought I could have an SSDT override to
> > > > > declare that very same device instead of patching my kernel before
> > > > > testing it.
> > > > >
> > > > > Of course, it gets tricky because I need to run that under qemu.
> > > > >
> > > > > I am currently stuck at the "sharing the firmware_node from usb with
> > > > > HID" step and I'd like to know if you could help me.
> > > > >
> > > > > On my laptop, if I plug the CP2112 (without using a USB hub), I can get:
> > > > >
> > > > > $> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
> > > > >   lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/hid/devices/0003:10C4:EA90.0079 -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-9/2-9:1.0/0003:10C4:EA90.0079
> > > > > $> ls -l /sys/bus/usb/devices/2-9*/firmware_node
> > > > >   lrwxrwxrwx. 1 root root 0 Mar  2 17:03 /sys/bus/usb/devices/2-9:1.0/firmware_node -> ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25
> > > > >   lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/usb/devices/2-9/firmware_node -> ../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25
> > > > >
> > > > > So AFAIU the USB device is properly assigned a firmware node. My dsdt
> > > > > also shows the "Device (RHUB)" and I guess everything is fine.
> > > >
> > > > Yes, so far so good.
> > > >
> > > > > However, playing with qemu is not so easy.
> > > > >
> > > > > I am running qemu with the following arguments (well, almost because I
> > > > > have a wrapper script on top of it and I also run the compiled kernel
> > > > > from the current tree):
> > > > >
> > > > > #> qemu-system-x86_64 -bios /usr/share/edk2/ovmf/OVMF_CODE.fd \
> > > > >                       -netdev user,id=hostnet0 \
> > > > >                       -device virtio-net-pci,netdev=hostnet0 \
> > > > >                       -m 4G \
> > > > >                       -enable-kvm \
> > > > >                       -cpu host \
> > > > >                       -device qemu-xhci -usb \
> > > > >                       -device 'usb-host,vendorid=0x10c4,productid=0xea90' \
> > > > >                       -cdrom ~/Downloads/Fedora-Workstation-Live-x86_64-37-1.7.iso
> > > >
> > > > Side question, where can I get those blobs from (EDKII and Fedora Live CD)?
> > > > I'm using Debian unstable.
> > >
> > > You can install the ovmf package in debian[3], which should have a
> > > similar file.
> > > For the Fedora livecd -> https://getfedora.org/fr/workstation/download/
> > > but any other distribution with a recent enough kernel should show the
> > > same.
> > 
> > Thank you!
> > 
> > > > > And this is what I get:
> > > > >
> > > > > #> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
> > > > >   lrwxrwxrwx 1 root root 0 Mar  2 16:10 /sys/bus/hid/devices/0003:10C4:EA90.0001 -> ../../../devices/pci0000:00/0000:00:06.0/usb2/2-1/2-1:1.0/0003:10C4:EA90.0001
> > > > >
> > > > > #> ls -l /sys/bus/usb/devices/2-1*/firmware_node
> > > > >   ls: cannot access '/sys/bus/usb/devices/2-1*/firmware_node': No such file or directory
> > > > >
> > > > > Looking at the DSDT, I do not see any reference to the USB hub, so I
> > > > > wonder if the firmware_node needs to be populated first in the DSDT.
> > > >
> > > > So, where QEMU takes DSDT (ACPI tables in general) from? Can you patch that?
> > > > I believe that's the problem in qemu.
> > >
> > > That's a good question and it's one I am not sure I have the answer to.
> > > I would have assumed that the DSDT was in the OVMF firmware, but given
> > > that we can arbitrarily add command line arguments, I believe it
> > > probably just provides a baseline and then we are screwed. The OVMF bios
> > > is compiled only once, so I doubt there is any mechanism to
> > > enable/disable a component in the DSDT, or make it dynamically
> > > generated.
> > 
> > We have two ways of filling missing parts:
> > 1) update the original source of DSDT (firmware or bootloader,
> >    whichever provides that);
> > 2) adding an overlay.
> > 
> > The 2) works _if and only if_ there is *no* existing object in the tables.
> > In such cases, you can simply provide a *full* hierarchy. See an example of
> > PCI devices in the kernel documentation on how to do that. I believe something
> > similar can be done for USB.
> 
> Please find attached the dsdt from the Qemu VM.

Thank you!

> And after looking at it, your comments below, I think I am understanding
> what is happening (on the qemu side at least):
> 
> #> grep PCI0.S /sys/bus/acpi/devices/*/path
> /sys/bus/acpi/devices/device:02/path:\_SB_.PCI0.S00_
> /sys/bus/acpi/devices/device:03/path:\_SB_.PCI0.S10_
> /sys/bus/acpi/devices/device:04/path:\_SB_.PCI0.S18_
> /sys/bus/acpi/devices/device:05/path:\_SB_.PCI0.S20_
> /sys/bus/acpi/devices/device:06/path:\_SB_.PCI0.S28_
> /sys/bus/acpi/devices/device:07/path:\_SB_.PCI0.S30_
> /sys/bus/acpi/devices/device:08/path:\_SB_.PCI0.S38_
> /sys/bus/acpi/devices/device:09/path:\_SB_.PCI0.S40_
> /sys/bus/acpi/devices/device:0a/path:\_SB_.PCI0.S48_
> /sys/bus/acpi/devices/device:0b/path:\_SB_.PCI0.S50_
> /sys/bus/acpi/devices/device:0c/path:\_SB_.PCI0.S58_
> /sys/bus/acpi/devices/device:0d/path:\_SB_.PCI0.S60_
> /sys/bus/acpi/devices/device:0e/path:\_SB_.PCI0.S68_
> /sys/bus/acpi/devices/device:0f/path:\_SB_.PCI0.S70_
> /sys/bus/acpi/devices/device:10/path:\_SB_.PCI0.S78_
> /sys/bus/acpi/devices/device:11/path:\_SB_.PCI0.S80_
> /sys/bus/acpi/devices/device:12/path:\_SB_.PCI0.S88_
> /sys/bus/acpi/devices/device:13/path:\_SB_.PCI0.S90_
> /sys/bus/acpi/devices/device:14/path:\_SB_.PCI0.S98_
> /sys/bus/acpi/devices/device:15/path:\_SB_.PCI0.SA0_
> /sys/bus/acpi/devices/device:16/path:\_SB_.PCI0.SA8_
> /sys/bus/acpi/devices/device:17/path:\_SB_.PCI0.SB0_
> /sys/bus/acpi/devices/device:18/path:\_SB_.PCI0.SB8_
> /sys/bus/acpi/devices/device:19/path:\_SB_.PCI0.SC0_
> /sys/bus/acpi/devices/device:1a/path:\_SB_.PCI0.SC8_
> /sys/bus/acpi/devices/device:1b/path:\_SB_.PCI0.SD0_
> /sys/bus/acpi/devices/device:1c/path:\_SB_.PCI0.SD8_
> /sys/bus/acpi/devices/device:1d/path:\_SB_.PCI0.SE0_
> /sys/bus/acpi/devices/device:1e/path:\_SB_.PCI0.SE8_
> /sys/bus/acpi/devices/device:1f/path:\_SB_.PCI0.SF0_
> /sys/bus/acpi/devices/device:20/path:\_SB_.PCI0.SF8_

Ah, not much to get out of it.

From DSDT _ADR() you may deduct the PCI BDF of each device in the topology.

> And those translate on the DSDT as (for the S30/S38 chunk I am
> interested in):
> 
>             Device (S30)
>             {
>                 Name (_ADR, 0x00060000)  // _ADR: Address

In PCI this is 00:06.0

>                 Name (ASUN, 0x06)
>                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
>                 {
>                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
>                 }
> 
>                 Name (_SUN, 0x06)  // _SUN: Slot User Number
>                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
>                 {
>                     PCEJ (BSEL, _SUN)
>                 }
>             }
> 
>             Device (S38)
>             {
>                 Name (_ADR, 0x00070000)  // _ADR: Address

00:07.0 respectively.

>                 Name (ASUN, 0x07)
>                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
>                 {
>                     Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
>                 }
> 
>                 Name (_SUN, 0x07)  // _SUN: Slot User Number
>                 Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
>                 {
>                     PCEJ (BSEL, _SUN)
>                 }
>             }
> 
> The forwarded USB node is actually on device:07 -> S30_, and as much as
> I'd like it to be a regular USB hub, this looks like a virtio node entry
> that allows to forward a physical device to the VM.
> 
> So IMO, the missing piece might rely on the virtio-usb code which
> doesn't export the firmware node, which means I can not extend the
> device with an SSDT overlay ATM because the USB node doesn't have the
> fw_node.

Ah, that very much may explain this!

> > > > > Also note that if I plug the CP2112 over a docking station, I lose the
> > > > > firmware_node sysfs entries on the host too.
> > > >
> > > > This seems like a lack of firmware node propagating in the USB hub code in
> > > > the Linux kernel.
> > >
> > > That would make a lot of sense.
> > >
> > > FWIW, in the VM I see a firmware node on the pci controller itself:
> > > #> ls -l /sys/devices/pci0000\:00/0000\:00\:06.0/firmware_node
> > >   lrwxrwxrwx 1 root root 0 Mar  6 12:24 /sys/devices/pci0000:00/0000:00:06.0/firmware_node -> ../../LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/device:07
> > >
> > > And one the host, through a USB hub:
> > >
> > > #> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
> > >   lrwxrwxrwx. 1 root root 0 Mar  6 13:26 /sys/bus/hid/devices/0003:10C4:EA90.007C -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-8/2-8.2/2-8.2.4/2-8.2.4:1.0/0003:10C4:EA90.007C
> > > #> ls -l /sys/bus/usb/devices/2-8*/firmware_node
> > >   lrwxrwxrwx. 1 root root 0 Mar  2 16:53 /sys/bus/usb/devices/2-8:1.0/firmware_node -> ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:1e
> > >   lrwxrwxrwx. 1 root root 0 Mar  2 16:53 /sys/bus/usb/devices/2-8/firmware_node -> ../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:1e
> > >
> > > Note that the firmware node propagation stopped at 2-8, and 2.8.2 is not
> > > having a firmware node.
> > 
> > It would be nice if you can run `grep -H 15 /sys/bus/acpi/devices/*/status`,
> 
> This command (both on the host and on the VM) does not show any USB
> device or even the PCI USB controller itself (PNP0A08 or PNP0A03).
> 
> > filter out unneeded ones, and for the rest also print their paths:
> > `cat filtered_list_of_acpi_devs | while read p; do grep -H . $p/path; done`
> 
> see above for the VM case, and in the host:
> 
> #> grep XHC /sys/bus/acpi/devices/*/path
> /sys/bus/acpi/devices/device:15/path:\_SB_.PCI0.XHC_
> /sys/bus/acpi/devices/device:16/path:\_SB_.PCI0.XHC_.RHUB
> /sys/bus/acpi/devices/device:17/path:\_SB_.PCI0.XHC_.RHUB.HS01
> /sys/bus/acpi/devices/device:18/path:\_SB_.PCI0.XHC_.RHUB.HS02
> /sys/bus/acpi/devices/device:19/path:\_SB_.PCI0.XHC_.RHUB.HS03
> /sys/bus/acpi/devices/device:1a/path:\_SB_.PCI0.XHC_.RHUB.HS04
> /sys/bus/acpi/devices/device:1b/path:\_SB_.PCI0.XHC_.RHUB.HS05
> /sys/bus/acpi/devices/device:1c/path:\_SB_.PCI0.XHC_.RHUB.HS06
> /sys/bus/acpi/devices/device:1d/path:\_SB_.PCI0.XHC_.RHUB.HS07
> /sys/bus/acpi/devices/device:1e/path:\_SB_.PCI0.XHC_.RHUB.HS08
> /sys/bus/acpi/devices/device:1f/path:\_SB_.PCI0.XHC_.RHUB.SS01
> /sys/bus/acpi/devices/device:20/path:\_SB_.PCI0.XHC_.RHUB.SS02
> /sys/bus/acpi/devices/device:21/path:\_SB_.PCI0.XHC_.RHUB.SS03
> /sys/bus/acpi/devices/device:22/path:\_SB_.PCI0.XHC_.RHUB.SS04
> /sys/bus/acpi/devices/device:23/path:\_SB_.PCI0.XHC_.RHUB.SS05
> /sys/bus/acpi/devices/device:24/path:\_SB_.PCI0.XHC_.RHUB.SS06
> /sys/bus/acpi/devices/device:25/path:\_SB_.PCI0.XHC_.RHUB.HS09
> /sys/bus/acpi/devices/device:26/path:\_SB_.PCI0.XHC_.RHUB.HS10
> /sys/bus/acpi/devices/device:27/path:\_SB_.PCI0.XHC_.RHUB.USR1
> /sys/bus/acpi/devices/device:28/path:\_SB_.PCI0.XHC_.RHUB.USR2
> /sys/bus/acpi/devices/device:85/path:\_SB_.PCI0.TXHC
> /sys/bus/acpi/devices/device:86/path:\_SB_.PCI0.TXHC.RHUB
> /sys/bus/acpi/devices/device:87/path:\_SB_.PCI0.TXHC.RHUB.HS01
> /sys/bus/acpi/devices/device:88/path:\_SB_.PCI0.TXHC.RHUB.SS01
> /sys/bus/acpi/devices/device:89/path:\_SB_.PCI0.TXHC.RHUB.SS02
> /sys/bus/acpi/devices/device:8a/path:\_SB_.PCI0.TXHC.RHUB.SS03
> /sys/bus/acpi/devices/device:8b/path:\_SB_.PCI0.TXHC.RHUB.SS04
> 
> Which is coherent with the ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:1e
> I get when looking at the USB port.
> 
> > With this we will see what devices are actually present and up and running
> > in the system and what their paths in the ACPI namespace.
> 
> So it seems that the USB hub functionality is not creating fw_nodes for
> its children. But I am not sure this is a battle we want to fight right
> now, because it doesn't make a lot of sense IMO to add an SSDT overlay
> on a hub.

The description of the attachable devices should really be in the overlays
if user wants them, but it's another story.

> > > > > Do you think it would be achievable to emulate that over qemu and use a
> > > > > mainline kernel without patches?
> > > >
> > > > As long as qemu provides correct DSDT it should work I assume.
> > >
> > > Just to be sure I understand, for this to work, we need the DSDT to
> > > export a "Device(RHUB)"?
> > 
> > Not sure I understand the term "export" here. We need a description
> > of the (to describe) missing parts.
> 
> Yes, I meant "to describe" it.
> 
> > > Or if we fix the USB fw_node propagation, could we just overwrite
> > > "\_SB_.PCI0.S30_"?  "\_SB_.PCI0.S30_" is the name the ACPI is giving to
> > > the USB port in my VM case AFAIU.
> > 
> > I have no idea what is the S30 node.
> 
> That gave me the hint I needed, I think. The problem must be in the
> virtio drivers, where it doesn't attach the fw_node to the components it
> creates. We probably need kind of the same patch Danny is sending in 2/3
> in this series, but for virtio.

Sounds like that, indeed.

> > [2] https://gitlab.freedesktop.org/bentiss/gitlab-kernel-ci/-/tree/master/VM
> > [3] https://packages.debian.org/buster/all/ovmf/filelist

-- 
With Best Regards,
Andy Shevchenko


