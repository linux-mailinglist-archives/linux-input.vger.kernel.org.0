Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2266AC05C
	for <lists+linux-input@lfdr.de>; Mon,  6 Mar 2023 14:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjCFNH2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Mar 2023 08:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbjCFNH0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Mar 2023 08:07:26 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9FDA2D166;
        Mon,  6 Mar 2023 05:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678108044; x=1709644044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=K2XLwJDAgCn5cUp8HDBtYFb3RkUQScuiERg+YLrJ+zY=;
  b=PRPzgI6U2FEpqZz1ihsDOcIEX2Wcwov49N38EB99eLCR86RiFXgb/raN
   69kZ2CG8lnc2mh/7ncE7XzmYjVTe+jdK3W8GRrsZGzjBjizr2elY/qryE
   Ez7sSHGLqvN71MYhbzFXUrZlAJLwqi/KdCoulKJSGDlqYpOvMbWBNNSY8
   ZAhYGVmfzkmEKESIM0PZyst2x9S4W5oRhlvIoFE1cFW/Ld7Urrz40sjO+
   XEOgPbi4gnLxNZPpW+fdEICLonoltyYRj8wjIwjHAvUufXFQB+JHEMq1r
   /uDMjQnjjydIGqJPX9wbirVqjR760pyvAAZlQ5766uimWFStpc20c3+wc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337864356"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="337864356"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 05:07:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="676155837"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="676155837"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 06 Mar 2023 05:07:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZAYh-00GQmq-2X;
        Mon, 06 Mar 2023 15:07:19 +0200
Date:   Mon, 6 Mar 2023 15:07:19 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
References: <20230227140758.1575-1-kaehndan@gmail.com>
 <20230227140758.1575-4-kaehndan@gmail.com>
 <Y/03to4XFXPwkGH1@smile.fi.intel.com>
 <CAP+ZCCe=f3AtxvC1Z6zPErMEG9BcnCOjApc26n_9yjq2+U72pw@mail.gmail.com>
 <Y/9oO1AE6GK6CQmp@smile.fi.intel.com>
 <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
 <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
 <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 06, 2023 at 01:36:51PM +0100, Benjamin Tissoires wrote:
> On Mon, Mar 6, 2023 at 11:49 AM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Mar 02, 2023 at 06:06:06PM +0100, Benjamin Tissoires wrote:
> > > On Mar 01 2023, Andy Shevchenko wrote:
> > > > On Tue, Feb 28, 2023 at 01:05:54PM -0600, Daniel Kaehn wrote:

...

[1]: https://stackoverflow.com/a/60855157/2511795

> > > Thanks Andy for your help here, and thanks for that link.
> > >
> > > I am trying to test Danny's patch as I want to use it for my HID CI,
> > > being an owner of a CP2112 device myself.
> > >
> > > The current setup is using out of the tree patches [2] which are
> > > implementing a platform i2c-hid support and some manual addition of a
> > > I2C-HID device on top of it. This works fine but gets busted every now
> > > and then when the tree sees a change that conflicts with these patches.
> > >
> > > So with Danny's series, I thought I could have an SSDT override to
> > > declare that very same device instead of patching my kernel before
> > > testing it.
> > >
> > > Of course, it gets tricky because I need to run that under qemu.
> > >
> > > I am currently stuck at the "sharing the firmware_node from usb with
> > > HID" step and I'd like to know if you could help me.
> > >
> > > On my laptop, if I plug the CP2112 (without using a USB hub), I can get:
> > >
> > > $> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
> > >   lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/hid/devices/0003:10C4:EA90.0079 -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-9/2-9:1.0/0003:10C4:EA90.0079
> > > $> ls -l /sys/bus/usb/devices/2-9*/firmware_node
> > >   lrwxrwxrwx. 1 root root 0 Mar  2 17:03 /sys/bus/usb/devices/2-9:1.0/firmware_node -> ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25
> > >   lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/usb/devices/2-9/firmware_node -> ../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25
> > >
> > > So AFAIU the USB device is properly assigned a firmware node. My dsdt
> > > also shows the "Device (RHUB)" and I guess everything is fine.
> > 
> > Yes, so far so good.
> > 
> > > However, playing with qemu is not so easy.
> > >
> > > I am running qemu with the following arguments (well, almost because I
> > > have a wrapper script on top of it and I also run the compiled kernel
> > > from the current tree):
> > >
> > > #> qemu-system-x86_64 -bios /usr/share/edk2/ovmf/OVMF_CODE.fd \
> > >                       -netdev user,id=hostnet0 \
> > >                       -device virtio-net-pci,netdev=hostnet0 \
> > >                       -m 4G \
> > >                       -enable-kvm \
> > >                       -cpu host \
> > >                       -device qemu-xhci -usb \
> > >                       -device 'usb-host,vendorid=0x10c4,productid=0xea90' \
> > >                       -cdrom ~/Downloads/Fedora-Workstation-Live-x86_64-37-1.7.iso
> > 
> > Side question, where can I get those blobs from (EDKII and Fedora Live CD)?
> > I'm using Debian unstable.
> 
> You can install the ovmf package in debian[3], which should have a
> similar file.
> For the Fedora livecd -> https://getfedora.org/fr/workstation/download/
> but any other distribution with a recent enough kernel should show the
> same.

Thank you!

> > > And this is what I get:
> > >
> > > #> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
> > >   lrwxrwxrwx 1 root root 0 Mar  2 16:10 /sys/bus/hid/devices/0003:10C4:EA90.0001 -> ../../../devices/pci0000:00/0000:00:06.0/usb2/2-1/2-1:1.0/0003:10C4:EA90.0001
> > >
> > > #> ls -l /sys/bus/usb/devices/2-1*/firmware_node
> > >   ls: cannot access '/sys/bus/usb/devices/2-1*/firmware_node': No such file or directory
> > >
> > > Looking at the DSDT, I do not see any reference to the USB hub, so I
> > > wonder if the firmware_node needs to be populated first in the DSDT.
> > 
> > So, where QEMU takes DSDT (ACPI tables in general) from? Can you patch that?
> > I believe that's the problem in qemu.
> 
> That's a good question and it's one I am not sure I have the answer to.
> I would have assumed that the DSDT was in the OVMF firmware, but given
> that we can arbitrarily add command line arguments, I believe it
> probably just provides a baseline and then we are screwed. The OVMF bios
> is compiled only once, so I doubt there is any mechanism to
> enable/disable a component in the DSDT, or make it dynamically
> generated.

We have two ways of filling missing parts:
1) update the original source of DSDT (firmware or bootloader,
   whichever provides that);
2) adding an overlay.

The 2) works _if and only if_ there is *no* existing object in the tables.
In such cases, you can simply provide a *full* hierarchy. See an example of
PCI devices in the kernel documentation on how to do that. I believe something
similar can be done for USB.

> > > Also note that if I plug the CP2112 over a docking station, I lose the
> > > firmware_node sysfs entries on the host too.
> > 
> > This seems like a lack of firmware node propagating in the USB hub code in
> > the Linux kernel.
> 
> That would make a lot of sense.
> 
> FWIW, in the VM I see a firmware node on the pci controller itself:
> #> ls -l /sys/devices/pci0000\:00/0000\:00\:06.0/firmware_node
>   lrwxrwxrwx 1 root root 0 Mar  6 12:24 /sys/devices/pci0000:00/0000:00:06.0/firmware_node -> ../../LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/device:07
> 
> And one the host, through a USB hub:
> 
> #> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
>   lrwxrwxrwx. 1 root root 0 Mar  6 13:26 /sys/bus/hid/devices/0003:10C4:EA90.007C -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-8/2-8.2/2-8.2.4/2-8.2.4:1.0/0003:10C4:EA90.007C
> #> ls -l /sys/bus/usb/devices/2-8*/firmware_node
>   lrwxrwxrwx. 1 root root 0 Mar  2 16:53 /sys/bus/usb/devices/2-8:1.0/firmware_node -> ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:1e
>   lrwxrwxrwx. 1 root root 0 Mar  2 16:53 /sys/bus/usb/devices/2-8/firmware_node -> ../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:1e
> 
> Note that the firmware node propagation stopped at 2-8, and 2.8.2 is not
> having a firmware node.

It would be nice if you can run `grep -H 15 /sys/bus/acpi/devices/*/status`,
filter out unneeded ones, and for the rest also print their paths:
`cat filtered_list_of_acpi_devs | while read p; do grep -H . $p/path; done`

With this we will see what devices are actually present and up and running
in the system and what their paths in the ACPI namespace.

> > > Do you think it would be achievable to emulate that over qemu and use a
> > > mainline kernel without patches?
> > 
> > As long as qemu provides correct DSDT it should work I assume.
> 
> Just to be sure I understand, for this to work, we need the DSDT to
> export a "Device(RHUB)"?

Not sure I understand the term "export" here. We need a description
of the (to describe) missing parts.

> Or if we fix the USB fw_node propagation, could we just overwrite
> "\_SB_.PCI0.S30_"?  "\_SB_.PCI0.S30_" is the name the ACPI is giving to
> the USB port in my VM case AFAIU.

I have no idea what is the S30 node.

[2] https://gitlab.freedesktop.org/bentiss/gitlab-kernel-ci/-/tree/master/VM
[3] https://packages.debian.org/buster/all/ovmf/filelist

-- 
With Best Regards,
Andy Shevchenko


