Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C47F6ABD41
	for <lists+linux-input@lfdr.de>; Mon,  6 Mar 2023 11:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjCFKte (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Mar 2023 05:49:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjCFKtb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Mar 2023 05:49:31 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F0810401;
        Mon,  6 Mar 2023 02:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678099770; x=1709635770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OXqYMXl/hlgYZxIDFM1ZqZhMh7ad081WKSCNnyp9lLk=;
  b=OctXOis3ZudZWeQN0tx5m78FfBbHOn0ki6njdk/pRu2VgcFqMOwPJqGV
   uJH9+A+M1i35s2Hu04OSGhTXX9ezaq5ntWB4hvMR5xs/PW0lvY1imqHtd
   QUCYOATg3ZrfxDgXn+EC20NXXWAGwx+35QnL/EQXJwL7jav1iBMhqkffl
   aEENim2t3hkkbGG5Wx0P415YaN0LYZk7FRnOVT3Gf4Zv0sNjcAYK6qwuC
   pk/znIikYGsGqfbT5Dehf4rgUIi0zVBWU9PdO6pFc7H8IhufykbVOxnDV
   IjAcwauh+/Iz+NamX+FUIoECJxD+YbV/3z+I7PvWgNbcM7jOZ7ddN69lZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="363139478"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="363139478"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 02:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="1005343475"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="1005343475"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2023 02:49:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZ8PF-00GJBT-1A;
        Mon, 06 Mar 2023 12:49:25 +0200
Date:   Mon, 6 Mar 2023 12:49:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
References: <20230227140758.1575-1-kaehndan@gmail.com>
 <20230227140758.1575-4-kaehndan@gmail.com>
 <Y/03to4XFXPwkGH1@smile.fi.intel.com>
 <CAP+ZCCe=f3AtxvC1Z6zPErMEG9BcnCOjApc26n_9yjq2+U72pw@mail.gmail.com>
 <Y/9oO1AE6GK6CQmp@smile.fi.intel.com>
 <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 02, 2023 at 06:06:06PM +0100, Benjamin Tissoires wrote:
> On Mar 01 2023, Andy Shevchenko wrote:
> > On Tue, Feb 28, 2023 at 01:05:54PM -0600, Daniel Kaehn wrote:

...

> > [1]: https://stackoverflow.com/a/60855157/2511795
> 
> Thanks Andy for your help here, and thanks for that link.
> 
> I am trying to test Danny's patch as I want to use it for my HID CI,
> being an owner of a CP2112 device myself.
> 
> The current setup is using out of the tree patches [2] which are
> implementing a platform i2c-hid support and some manual addition of a
> I2C-HID device on top of it. This works fine but gets busted every now
> and then when the tree sees a change that conflicts with these patches.
> 
> So with Danny's series, I thought I could have an SSDT override to
> declare that very same device instead of patching my kernel before
> testing it.
> 
> Of course, it gets tricky because I need to run that under qemu.
> 
> I am currently stuck at the "sharing the firmware_node from usb with
> HID" step and I'd like to know if you could help me.
> 
> On my laptop, if I plug the CP2112 (without using a USB hub), I can get:
> 
> $> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
>   lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/hid/devices/0003:10C4:EA90.0079 -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-9/2-9:1.0/0003:10C4:EA90.0079
> $> ls -l /sys/bus/usb/devices/2-9*/firmware_node
>   lrwxrwxrwx. 1 root root 0 Mar  2 17:03 /sys/bus/usb/devices/2-9:1.0/firmware_node -> ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25
>   lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/usb/devices/2-9/firmware_node -> ../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25
> 
> So AFAIU the USB device is properly assigned a firmware node. My dsdt
> also shows the "Device (RHUB)" and I guess everything is fine.

Yes, so far so good.

> However, playing with qemu is not so easy.
> 
> I am running qemu with the following arguments (well, almost because I
> have a wrapper script on top of it and I also run the compiled kernel
> from the current tree):
> 
> #> qemu-system-x86_64 -bios /usr/share/edk2/ovmf/OVMF_CODE.fd \
>                       -netdev user,id=hostnet0 \
>                       -device virtio-net-pci,netdev=hostnet0 \
>                       -m 4G \
>                       -enable-kvm \
>                       -cpu host \
>                       -device qemu-xhci -usb \
>                       -device 'usb-host,vendorid=0x10c4,productid=0xea90' \
>                       -cdrom ~/Downloads/Fedora-Workstation-Live-x86_64-37-1.7.iso

Side question, where can I get those blobs from (EDKII and Fedora Live CD)?
I'm using Debian unstable.

> And this is what I get:
> 
> #> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
>   lrwxrwxrwx 1 root root 0 Mar  2 16:10 /sys/bus/hid/devices/0003:10C4:EA90.0001 -> ../../../devices/pci0000:00/0000:00:06.0/usb2/2-1/2-1:1.0/0003:10C4:EA90.0001
> 
> #> ls -l /sys/bus/usb/devices/2-1*/firmware_node
>   ls: cannot access '/sys/bus/usb/devices/2-1*/firmware_node': No such file or directory
> 
> Looking at the DSDT, I do not see any reference to the USB hub, so I
> wonder if the firmware_node needs to be populated first in the DSDT.

So, where QEMU takes DSDT (ACPI tables in general) from? Can you patch that?
I believe that's the problem in qemu.

> Also note that if I plug the CP2112 over a docking station, I lose the
> firmware_node sysfs entries on the host too.

This seems like a lack of firmware node propagating in the USB hub code in
the Linux kernel.

> Do you think it would be achievable to emulate that over qemu and use a
> mainline kernel without patches?

As long as qemu provides correct DSDT it should work I assume.

> [2] https://gitlab.freedesktop.org/bentiss/gitlab-kernel-ci/-/tree/master/VM

-- 
With Best Regards,
Andy Shevchenko


