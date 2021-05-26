Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 640C7391D25
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 18:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234464AbhEZQiG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 12:38:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53076 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234445AbhEZQiD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 12:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622046991;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9S7K5mCRRWIkeYI1MIav6MV57dgu0jXBjA3giCneipo=;
        b=ZCRr+ahIeTZOIJXVvJxjaQqk5kCUGU7S5/MUtD6sHUY6KQMMjkqB5cYP9GGDOVq1bFHB2A
        hMAud+S8UHMJ0Yec9OHiAFwCbp/TSEXqy/CIfGpEtVnAp8HeFa5MYJoZWWK1EuBjLGfhh3
        PXr7P6O5dykPWfYam51dG7ehEnCjvNc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-v5sdkvbNOjaBtoaGVDoSbQ-1; Wed, 26 May 2021 12:36:29 -0400
X-MC-Unique: v5sdkvbNOjaBtoaGVDoSbQ-1
Received: by mail-ej1-f70.google.com with SMTP id p18-20020a1709067852b02903dab2a3e1easo609224ejm.17
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 09:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9S7K5mCRRWIkeYI1MIav6MV57dgu0jXBjA3giCneipo=;
        b=SaCqVGe+YQ3EY4wIIjjwtf9SZSN96AqBAe4RH4QBbHYUtli4/ynOtirFy0djh4aaXb
         iaDbB8goWxmerW9OGqB7oE0Owiyp8nzqMLKxK/HGTsQzOOLtZZ607+II+o3ZlB1bkvqY
         vhFygSMV0BePjTIszbrQEWeVh0UMaysjPA+f0wcIJSzdtORCRpg6UOiwXPd3rJgeFJS3
         dlrD+79YK6N6KbqHbGH1EDCXP2ka1h0rYv2qnvnW+U5rSHGf2DJYfxIfRuEQ67j/SnrZ
         wv92M/j22ZVX2E792A6ctWwy8maZJ7CaM7Xvn+87V+Ttd2nLrznAApIxOYryq1PRWyeo
         aVQA==
X-Gm-Message-State: AOAM532atvpU7mdOm+wdQW8o+dc8YfcFXdG0uyQi1FfX6rLskrStGnxP
        p8C1s9NMlXudJUpm+SayXOwV75iBMspoHjhaxA14KtbYejj3rZMOElPdof5WGwGrL14uJcj/kk7
        WrpmiedazfIZ9TGNllCUh6JY=
X-Received: by 2002:aa7:d3c8:: with SMTP id o8mr38288328edr.181.1622046987613;
        Wed, 26 May 2021 09:36:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxG5nUS2tzeLfF/ko31Zkoj4J6s1xJp6pCkVxc5Tlev7KvdVW88txGwzPXfF8BZRUVPKrMlQ==
X-Received: by 2002:aa7:d3c8:: with SMTP id o8mr38288313edr.181.1622046987451;
        Wed, 26 May 2021 09:36:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n8sm10494884ejl.0.2021.05.26.09.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 09:36:27 -0700 (PDT)
Subject: Re: [hid:for-5.13/upstream-fixes 3/17] undefined reference to
 `usb_hid_driver'
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>
References: <202105262320.BAmXkxUd-lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <963aa6e9-bf3d-8f2b-bf8f-b7d3fac4f05d@redhat.com>
Date:   Wed, 26 May 2021 18:36:26 +0200
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

