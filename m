Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F20391D24
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 18:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhEZQiA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 12:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36213 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234445AbhEZQiA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 12:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622046987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9S7K5mCRRWIkeYI1MIav6MV57dgu0jXBjA3giCneipo=;
        b=RMhhOBnOyF5beVjdHH6EUvGz1UJ1dIvwlplAO8zTX4xZmqyswRHNSP0HK3aDlqsep4ZzSI
        Z7JUmjqQP+xqAl22rlTjLNSwopy85VLTFygfqfpct4dGjTFWe+S7Qw8KZTzVhix1N4U9G9
        mrk1vi7MnPvuWto6JpzGgpkHJyJTtw0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-vv3ZUlI9Nxy5QyGNsYp1pQ-1; Wed, 26 May 2021 12:36:24 -0400
X-MC-Unique: vv3ZUlI9Nxy5QyGNsYp1pQ-1
Received: by mail-ej1-f69.google.com with SMTP id p18-20020a1709067852b02903dab2a3e1easo609141ejm.17
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 09:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9S7K5mCRRWIkeYI1MIav6MV57dgu0jXBjA3giCneipo=;
        b=RLFOzPptXAN/IlVUGRE+r2ED8pcQP8qz9jeGqNUNmlAADbThWFpvTB63c3H2NnqOGN
         VWL6Rzkbje0JipLou966Q+wod+u3YxX1YobrxAWsuGHNLwNSXFDyS/nufsaKcjsqszqH
         0pCcw7vPdzK1z1gu/nJmorxtmNbl4p4fj7++9SB7+RJsqjWxwqFqZNStR2DYEYZMOQbR
         A8CVUbZz5cluyUSC+srV72Ru1o8Gc6SY5r87BPAAIpfJAl+0g3L+Josfi5VuANhs73DC
         fy5Y7eHOCja/ysz9a6fpKus+5UTOZ574CkkZYo5Ehi6gqHAftidK8q39+x2SQLnwIORK
         SVQA==
X-Gm-Message-State: AOAM533RW3Fy+UwOHwbK58C3Z2lthQD0gmENzbQEbzG74vGAqgWCGuWt
        KfkTVt5zD+YPMw30Yu2AFKsBDYo9t4zXn9RnQbBXpDlcOP9+3iKdOFNsoxvsM8CmbJJa1vy4sJE
        K6EqRSEuRoHL3Mtf80gqRJbM=
X-Received: by 2002:aa7:d48f:: with SMTP id b15mr11297050edr.110.1622046983402;
        Wed, 26 May 2021 09:36:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqUsg45P9hVX4+Mzs2jqi+wmu5RoHGMs4kr9YjqFX4TdvrB5ULImPIpxNf2R/868R6Lo46JA==
X-Received: by 2002:aa7:d48f:: with SMTP id b15mr11297032edr.110.1622046983220;
        Wed, 26 May 2021 09:36:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k2sm2204657ejx.98.2021.05.26.09.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 09:36:22 -0700 (PDT)
Subject: Re: [hid:for-5.13/upstream-fixes 3/17] undefined reference to
 `usb_hid_driver'
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>
References: <202105262320.BAmXkxUd-lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <384d160b-5cf2-e5e6-8976-a0919ddfed80@redhat.com>
Date:   Wed, 26 May 2021 18:36:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <202105262320.BAmXkxUd-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/26/21 5:51 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-5.13/upstream-fixes
> head:   624d8a18c8cd62e7613a9b2b6850205e0b6b9c7d
> commit: 2d21c6e884482b01b3878be220c51368a442bcc6 [3/17] HID: core: Add a hid_is_usb_device() helper function
> config: nios2-randconfig-c003-20210526 (attached as .config)
> compiler: nios2-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=2d21c6e884482b01b3878be220c51368a442bcc6
>         git remote add hid https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
>         git fetch --no-tags hid for-5.13/upstream-fixes
>         git checkout 2d21c6e884482b01b3878be220c51368a442bcc6
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=nios2 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Ugh, this is caused by:

CONFIG_HID=y
CONFIG_USB_HID=m

I expected this to never happen because CONFIG_USB_HID does "select CONFIG_HID"
but CONFIG_HID is also selected by CONFIG_I2C_HID_CORE which is:

CONFIG_I2C_HID_CORE=y

in the .config triggering this error; and I see that:

drivers/hid/intel-ish-hid/Kconfig
drivers/hid/surface-hid/Kconfig

both also do a "select HID", where as drivers/hid/amd-sfh-hid/Kconfig
interestingly enough uses "depends on HID", so that can only be build of
one of the other HID ll-driver providers are enabled.

So I see 3 possible fixes:

1. Use IS_REACHABLE instead of IS_ENABLED inside hid_is_usb_device,
which means that hid_is_usb_device will always return false when
CONFIG_HID=y && CONFIG_USB_HID=m which is wrong.

2. Add a name field to struct hid_ll_driver, or maybe an enum
   and use strcmp (or == in case of an enum)

3. Talking about using an enum another fix would be to check that
   hid_dev->bus == BUS_USB

Actually I now see that there are already various drivers doing 3,
including hid-core.c (to decided to remove HID_CONNECT_HIDDEV from the
connect_mask), instead of the hid_is_using_ll_driver() check,
so 3 is probably best.

One issue with 3 though is that we also have the special hid-logitech-dj
code which acts as a hid_ll_driver for devices behind logitech wireless
receivers and which uses BUS_USB for those devices behind the
receiver too.

So a complete check using the bus check would look something like this:

bool hid_is_usb_device(struct hid_device *hid)
{
	/*
	 * The logi_dj_ll_driver also creates hid_devices with bus == BUS_USB
	 * but it does not have an output_report function so also check for that.
	 */
	return hdev->bus == BUS_USB && hdev->ll_driver->output_report;
}

This is esp. important for the usage in hid-multitouch.c because some
Logitech wireless devices are multi-touch touchpads which I believe are
using hid-multitouch.c and we do not want the parent device of those to
be treated as a usb-device...

So writing that makes me realize that mt_parent_may_wake() helper will
do the wrong thing for those hid_devices, which in turn makes me believe
that the whole approach taken in mt_parent_may_wake() is wrong.

Thinking about this more, this really is info which should be provided
by the hid_ll_driver to a new call-back.

So I believe that it is best to just drop:

[PATCH v2 2/6] HID: core: Add a hid_is_usb_device() helper function
[PATCH v2 4/6] HID: multitouch: Disable event reporting on suspend when our parent is not a wakeup-source
[PATCH v2 6/6] HID: asus: Switch to the new hid_is_usb_device() helper

For now and then I'll rework things when I have some time, sorry about this.

Regards,

Hans










> 
> All errors (new ones prefixed by >>):
> 
>    nios2-linux-ld: drivers/hid/hid-core.o: in function `hid_is_usb_device':
>>> (.text+0x298): undefined reference to `usb_hid_driver'
>>> nios2-linux-ld: (.text+0x29c): undefined reference to `usb_hid_driver'
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

