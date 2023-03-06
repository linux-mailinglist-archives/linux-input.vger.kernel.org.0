Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEE8E6ABFB0
	for <lists+linux-input@lfdr.de>; Mon,  6 Mar 2023 13:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjCFMhv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Mar 2023 07:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjCFMhu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Mar 2023 07:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18E12B630
        for <linux-input@vger.kernel.org>; Mon,  6 Mar 2023 04:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678106217;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5F2Ut0RIpB7q0lfWRDdGziUvrafVvrbjyMmcJfjGryo=;
        b=aqgPOx/yDBIpUeewDv/2b5+O5L9g7Btk/NaxhwLNNAGkvvzSH33OLS5Z+lGdGSTHZ25Enw
        Hb7RA/h7AUacJpdz1tRaPbC6Pov4kdj2aZr3CqAFtkd0Uyi9TxK2xUoNcFZA2mnaEd85Kr
        gmCMxkjz/R2n4xA6+un6vP57T06oAUs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-D0QWma8CODWMbONZC10rXw-1; Mon, 06 Mar 2023 07:36:56 -0500
X-MC-Unique: D0QWma8CODWMbONZC10rXw-1
Received: by mail-qk1-f199.google.com with SMTP id pc36-20020a05620a842400b00742c715894bso5233176qkn.21
        for <linux-input@vger.kernel.org>; Mon, 06 Mar 2023 04:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678106215;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5F2Ut0RIpB7q0lfWRDdGziUvrafVvrbjyMmcJfjGryo=;
        b=JDNImSgSThPHiM4qoJ5I9IDxEEEvyOyZBZ+zPK1Ji5gaORFFFKvJxhxOtccTuuunhS
         OhHU3NaT2ueiuWQhBQm7dJ1zzPNbbUpwuPWji+g6G/2Xfigk+DqHNnjCB64FaHE+pfM6
         EEryEyr6CoVwlL5CAkM2Ykeh8DJvzB+U1H+bna4VXG49tEIUhiLhopms73KFe0HDh3K4
         mJtNPPo7tPDnArH+fpVrzkEL8GktP8pTySm4sv8uFDN8CXcE9ztItfKTUZwC5+oDwzBW
         6svsHdUDF2TuQYx+7uf1kZqsuj/h/o6ZSZOo5ddfrBqOvan85s8TMvY2M9Y6v9qwJaxk
         YQKA==
X-Gm-Message-State: AO0yUKXPUiAd8n/1XaMmi+y7s8tKfJpp79QW/eEtMjieXfCPNLpkmHFI
        2fCVFg+uK6OIZnZ9Yf3s37YRld7zFn8emXShT8VKuUd2gecz8sabakq8xkM4lfiBclWJr7HArtP
        KeZgK7vCjl2jZ9YCx/5trIog=
X-Received: by 2002:a05:6214:2524:b0:56e:a658:84e4 with SMTP id gg4-20020a056214252400b0056ea65884e4mr17535496qvb.36.1678106215233;
        Mon, 06 Mar 2023 04:36:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9En25jevmdG9XUCpPy6XPLf4jYLNZhmnGpqShticfH7Hb1DkdTZgTxC+nH0KwdF/0rT8J79A==
X-Received: by 2002:a05:6214:2524:b0:56e:a658:84e4 with SMTP id gg4-20020a056214252400b0056ea65884e4mr17535461qvb.36.1678106214934;
        Mon, 06 Mar 2023 04:36:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:2bc:381::432? ([2a01:e0a:2bc:381::432])
        by smtp.gmail.com with ESMTPSA id 136-20020a37088e000000b00742a252ba06sm7335077qki.135.2023.03.06.04.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 04:36:54 -0800 (PST)
Message-ID: <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
Date:   Mon, 6 Mar 2023 13:36:51 +0100
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
Content-Language: en-US
In-Reply-To: <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Mon, Mar 6, 2023 at 11:49 AM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 02, 2023 at 06:06:06PM +0100, Benjamin Tissoires wrote:
> > On Mar 01 2023, Andy Shevchenko wrote:
> > > On Tue, Feb 28, 2023 at 01:05:54PM -0600, Daniel Kaehn wrote:
>
> ...
>
> > > [1]: https://stackoverflow.com/a/60855157/2511795
> >
> > Thanks Andy for your help here, and thanks for that link.
> >
> > I am trying to test Danny's patch as I want to use it for my HID CI,
> > being an owner of a CP2112 device myself.
> >
> > The current setup is using out of the tree patches [2] which are
> > implementing a platform i2c-hid support and some manual addition of a
> > I2C-HID device on top of it. This works fine but gets busted every now
> > and then when the tree sees a change that conflicts with these patches.
> >
> > So with Danny's series, I thought I could have an SSDT override to
> > declare that very same device instead of patching my kernel before
> > testing it.
> >
> > Of course, it gets tricky because I need to run that under qemu.
> >
> > I am currently stuck at the "sharing the firmware_node from usb with
> > HID" step and I'd like to know if you could help me.
> >
> > On my laptop, if I plug the CP2112 (without using a USB hub), I can get:
> >
> > $> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
> >   lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/hid/devices/0003:10C4:EA90.0079 -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-9/2-9:1.0/0003:10C4:EA90.0079
> > $> ls -l /sys/bus/usb/devices/2-9*/firmware_node
> >   lrwxrwxrwx. 1 root root 0 Mar  2 17:03 /sys/bus/usb/devices/2-9:1.0/firmware_node -> ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25
> >   lrwxrwxrwx. 1 root root 0 Mar  2 17:02 /sys/bus/usb/devices/2-9/firmware_node -> ../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:25
> >
> > So AFAIU the USB device is properly assigned a firmware node. My dsdt
> > also shows the "Device (RHUB)" and I guess everything is fine.
>
> Yes, so far so good.
>
> > However, playing with qemu is not so easy.
> >
> > I am running qemu with the following arguments (well, almost because I
> > have a wrapper script on top of it and I also run the compiled kernel
> > from the current tree):
> >
> > #> qemu-system-x86_64 -bios /usr/share/edk2/ovmf/OVMF_CODE.fd \
> >                       -netdev user,id=hostnet0 \
> >                       -device virtio-net-pci,netdev=hostnet0 \
> >                       -m 4G \
> >                       -enable-kvm \
> >                       -cpu host \
> >                       -device qemu-xhci -usb \
> >                       -device 'usb-host,vendorid=0x10c4,productid=0xea90' \
> >                       -cdrom ~/Downloads/Fedora-Workstation-Live-x86_64-37-1.7.iso
>
> Side question, where can I get those blobs from (EDKII and Fedora Live CD)?
> I'm using Debian unstable.

You can install the ovmf package in debian[3], which should have a
similar file.
For the Fedora livecd -> https://getfedora.org/fr/workstation/download/
but any other distribution with a recent enough kernel should show the
same.
  >
>
> > And this is what I get:
> >
> > #> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
> >   lrwxrwxrwx 1 root root 0 Mar  2 16:10 /sys/bus/hid/devices/0003:10C4:EA90.0001 -> ../../../devices/pci0000:00/0000:00:06.0/usb2/2-1/2-1:1.0/0003:10C4:EA90.0001
> >
> > #> ls -l /sys/bus/usb/devices/2-1*/firmware_node
> >   ls: cannot access '/sys/bus/usb/devices/2-1*/firmware_node': No such file or directory
> >
> > Looking at the DSDT, I do not see any reference to the USB hub, so I
> > wonder if the firmware_node needs to be populated first in the DSDT.
>
> So, where QEMU takes DSDT (ACPI tables in general) from? Can you patch that?
> I believe that's the problem in qemu.

That's a good question and it's one I am not sure I have the answer to.
I would have assumed that the DSDT was in the OVMF firmware, but given
that we can arbitrarily add command line arguments, I believe it
probably just provides a baseline and then we are screwed. The OVMF bios
is compiled only once, so I doubt there is any mechanism to
enable/disable a component in the DSDT, or make it dynamically
generated.

>
> > Also note that if I plug the CP2112 over a docking station, I lose the
> > firmware_node sysfs entries on the host too.
>
> This seems like a lack of firmware node propagating in the USB hub code in
> the Linux kernel.

That would make a lot of sense.

FWIW, in the VM I see a firmware node on the pci controller itself:
#> ls -l /sys/devices/pci0000\:00/0000\:00\:06.0/firmware_node
   lrwxrwxrwx 1 root root 0 Mar  6 12:24 /sys/devices/pci0000:00/0000:00:06.0/firmware_node -> ../../LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/device:07

And one the host, through a USB hub:

#> ls -l /sys/bus/hid/devices/0003:10C4:EA90.*
   lrwxrwxrwx. 1 root root 0 Mar  6 13:26 /sys/bus/hid/devices/0003:10C4:EA90.007C -> ../../../devices/pci0000:00/0000:00:14.0/usb2/2-8/2-8.2/2-8.2.4/2-8.2.4:1.0/0003:10C4:EA90.007C
#> ls -l /sys/bus/usb/devices/2-8*/firmware_node
   lrwxrwxrwx. 1 root root 0 Mar  2 16:53 /sys/bus/usb/devices/2-8:1.0/firmware_node -> ../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:1e
   lrwxrwxrwx. 1 root root 0 Mar  2 16:53 /sys/bus/usb/devices/2-8/firmware_node -> ../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:15/device:16/device:1e

Note that the firmware node propagation stopped at 2-8, and 2.8.2 is not
having a firmware node.


>
> > Do you think it would be achievable to emulate that over qemu and use a
> > mainline kernel without patches?
>
> As long as qemu provides correct DSDT it should work I assume.

Just to be sure I understand, for this to work, we need the DSDT to
export a "Device(RHUB)"?
Or if we fix the USB fw_node propagation, could we just overwrite
"\_SB_.PCI0.S30_"?  "\_SB_.PCI0.S30_" is the name the ACPI is giving to
the USB port in my VM case AFAIU.

Cheers,
Benjamin

>
> > [2] https://gitlab.freedesktop.org/bentiss/gitlab-kernel-ci/-/tree/master/VM

[3] https://packages.debian.org/buster/all/ovmf/filelist

