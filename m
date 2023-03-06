Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B35936ACE40
	for <lists+linux-input@lfdr.de>; Mon,  6 Mar 2023 20:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjCFTkb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Mar 2023 14:40:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjCFTka (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Mar 2023 14:40:30 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA88B39B8B;
        Mon,  6 Mar 2023 11:40:29 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id m10so10250743vso.4;
        Mon, 06 Mar 2023 11:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678131628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=50qzc6WD2nrbOh892nmzl1AVo/ViXdtXCdM3w+9KPdw=;
        b=m2K87Mke1XXFLtw5HmO4wDPEYvfextGDTGA2B2HAGtahyJXOcKfq5pwv1vDPJSX2sN
         6tn9zGcqZo49GUiLn+tAwJzTmr4PwxSrwFv6lE6nFKsYhRkV5R6L3tPKUvMwh3S+Xz7X
         CuQnALiV5dKqgnlMWL3yAoKHSn2DhAQh8ZAO+LE/oPXXoww+KF5N0CkfQXhLdNhItNzl
         eB7h2oabDuiIr4FLxHTo4KQu3C+8/FLDWTRaje+X5CG86tTwrN/Xcl5R3LsqA3TxWwfp
         HnUCtIlriLIuwyJ5SoLJyJ59qO7tBMoLeDnDTNiUH2XgW4oesBopQbCQo+wVJ0gb8gY2
         pywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678131628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50qzc6WD2nrbOh892nmzl1AVo/ViXdtXCdM3w+9KPdw=;
        b=ZE27z4r7HFrUvlpKfYEwAApwfQyz3VHHaPmZioMFTj7UPMieynaek3741V4XBbPevR
         zCIZJGLayEJ+K5B9cwZFSamGB9vtFfIKHJNzGaa/NxFUye9tLVtSuxW9jzcGY6AiPWFK
         xU4zQ++BD09IRMZbksPo076ujVy7bjOJCvAR6Kp+SRVQim7ZVYwQIHGJIvfOP0FYt3T9
         UJP5HRiDyVz8ZL3BsQHKwToE5euVNp9mM0ICtYw5tBAYD7Z534J0kZUdqcBhkoWUDt6l
         Mob6iai/Ju5+YCb3oZlrWu/1KDTwfNm/1sXd7lGvmijvQpc9IE8JPo837iB2k8k2lIBy
         ddLw==
X-Gm-Message-State: AO0yUKWgCxOuCbW7ghIKTElZuqLLtqUrlSx7eOHlFTIoA84eWA0dvG6m
        Tl7WwXEsFQrMWsiJ/KNqQYCVaIR6dLyZVef8TmU=
X-Google-Smtp-Source: AK7set+1yTdfOkCma+ANXP4GN5jjYn34NBFM8TpRoemiDYWOmTeB7K2gc15y+/gBb5FH0o6HMV+rrzwRGXajdf0jCD8=
X-Received: by 2002:a67:f8c7:0:b0:412:4e02:ba9f with SMTP id
 c7-20020a67f8c7000000b004124e02ba9fmr7950396vsp.1.1678131628444; Mon, 06 Mar
 2023 11:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20230227140758.1575-1-kaehndan@gmail.com> <20230227140758.1575-4-kaehndan@gmail.com>
 <Y/03to4XFXPwkGH1@smile.fi.intel.com> <CAP+ZCCe=f3AtxvC1Z6zPErMEG9BcnCOjApc26n_9yjq2+U72pw@mail.gmail.com>
 <Y/9oO1AE6GK6CQmp@smile.fi.intel.com> <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
 <ZAXFNRuALYpXgL6F@smile.fi.intel.com> <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com> <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
In-Reply-To: <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Mon, 6 Mar 2023 13:40:16 -0600
Message-ID: <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

Sorry about the radio silence from me --
I've been trying to get this working on my end as well.

I was able to get my passed-through USB device  on a qemu system to
have a firmware_node by
using the "Upgrading ACPI tables via initrd" kernel feature [1]. In
case this provides helpful information,
the below describes what I did.

This was using the default yocto core-image-minimal image and
qemu-system-x86_64.

I invoke qemu with the convenience "runqemu" script, as follows:
runqemu nographic qemuparams="
    -initrd ../acpi-overlay/instrumented_initrd
    -device 'usb-host,vendorid=0x10c4,productid=0xea90'
    -pflash ./build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202211-r0/ovmf/ovmf.fd
    "

Which invokes qemu with something like the following (sorry about the
long lines..):
qemu-system-x86_64 \
    -device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 \
    -netdev tap,id=net0,ifname=tap0,script=no,downscript=no \
    -object rng-random,filename=/dev/urandom,id=rng0 \
    -device virtio-rng-pci,rng=rng0 \
    -drive file=/home/kaehnd/src/local/x86/build/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64-20230306143252.rootfs.ext4,if=virtio,format=raw
\
    -usb -device usb-tablet -usb -device usb-kbd   -cpu IvyBridge \
    -machine q35,i8042=off -smp 4 -m 256 \
    -device 'usb-host,vendorid=0x10c4,productid=0xea90' \
    -serial mon:stdio -serial null -nographic \
    -kernel /home/kaehnd/src/local/x86/build/tmp/deploy/images/qemux86-64/bzImage
\
    -append 'root=/dev/vda
        rw  ip=192.168.7.2::192.168.7.1:255.255.255.0::eth0:off:8.8.8.8
        console=ttyS0 console=ttyS1 oprofile.timer=1
        tsc=reliable no_timer_check rcupdate.rcu_expedited=1 '


The sysfs path tree for the CP2112 was as follows:
#> ls -l  /sys/bus/hid/devices/0003:10C4:EA90.0003
lrwxrwxrwx    1 root     root             0 Mar  6 19:24
/sys/bus/hid/devices/0003:10C4:EA90.0003 ->
../../../devices/pci0000:00/0000:00:1d.1/usb3/3-1/3-1:1.0/0003:10C4:EA90.0003


Out of the box, firmware_node files existed only through what I assume
is the PCI bus:
/sys/devices/pci0000:00

It's ACPI path:
#> cat /sys/devices/pci0000:00/firmware_node/path
\_SB_.PCI0

Using the instructions at [1], I grabbed the dsdt table, and modified
it as follows.

Underneath the PCI0 node, I added the following ASL

```
Device (SE9)
{
    Name (_ADR, 0x001D0001) // _ADR: Address
    Device (RHUB)
    {
        Name (_ADR, Zero)
        Device (CP2) // the USB-hid & CP2112 shared node
        {
            Name (_ADR, One)
        }
    }
}
```

If I'm understanding correctly, this adds the SE9 device as function 1
of PCI device 0x1d,
then RHUB as the USB controller it provides, and finally, CP2 as the
USB device attached to port 1 of the controller.

With this as the loaded dsdt table, the USB device now has a firmware_node :)
#> cat /sys/bus/usb/devices/3-1:1.0/firmware_node/path
\_SB_.PCI0.SE9_.RHUB.CP2_

After applying my patches, the HID device also references this node:
#> cat /sys/bus/hid/devices/0003:10C4:EA90.0003/firmware_node/path
\_SB_.PCI0.SE9_.RHUB.CP2_

With this all said -- I noticed iasl prints this statement when trying
to create a node with a lowercase name:
"At least one lower case letter found in NameSeg, ASL is case
insensitive - converting to upper case (GPIO)"

I wonder if this suggests that adding a call to toupper() to
acpi_fwnode_get_named_child_node would be
an appropriate solution for the node name casing issue....

[1] https://www.kernel.org/doc/html/latest/admin-guide/acpi/initrd_table_override.html
