Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12B02A3FB9
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 10:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgKCJKA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 04:10:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33711 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbgKCJJ7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Nov 2020 04:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604394596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qp1mpM89OUzoixrxTpf5EO4rSuDDV59SitpeUYui81s=;
        b=jWEReW9GvU16G9xLq8jaDPLttOYNwLfxEx5i/0oelsWiaKTAc2jzYAbktEssGnDxYjWssj
        6AnF03oMpBdGBwX65gCPg12iv9nTW84JUB93TIjNWAj9uKZrhPHZSuJFkRvaV5ewaEDPxe
        0LzV4Ti2FifzjCLP/6t9am0PHptz+Xs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-JVW0RVa0OWCpdr63ASIGNA-1; Tue, 03 Nov 2020 04:09:52 -0500
X-MC-Unique: JVW0RVa0OWCpdr63ASIGNA-1
Received: by mail-ed1-f69.google.com with SMTP id c2so1894120edw.21
        for <linux-input@vger.kernel.org>; Tue, 03 Nov 2020 01:09:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qp1mpM89OUzoixrxTpf5EO4rSuDDV59SitpeUYui81s=;
        b=QGMugPNA9ITfwBHMiIUAxd4ZXZPPmaTO4GIjmewE1Zwja3YKfmFSZFtT+gMkvOo9Wc
         cUUagi1ulrj02KIpy2ViIfiAtRDd+ToDrH5Wmydv59g04TUz75W2/rPJnVjpyxUE94LA
         3yP51NsxitdNqWGgMsrs1dgFaF93AeFr9XSnaXaNWxN+baY51fvMnTrXqza/NECobAYA
         PfRvBnrs9p4R1G2vxxUztfAeimog91QxVzTJQjVC+znMyIaizpWwW7BiECrinPZN+YLF
         nCM+52G8ZJ/uxaiX2MRSRLXX8k0DzR0YPyNMzF9EDXqapulVEd5wZ7Pb2/ML5Bw8Pnsp
         YaZQ==
X-Gm-Message-State: AOAM532OjXY+m/1pFvdCZ9LXugCQ/RoNLeQTr/i68jiN+OgD/w/tAAUz
        URcs1sig/vCJsrkLowmqMVZTwfNlEDCF4fJIFpBAUGdq86tckRFPCQk0H96MlkyKKzeXFTo6sNy
        +1l8U8ySQg4WBBoJL0q0SGlg=
X-Received: by 2002:a17:906:1b09:: with SMTP id o9mr754977ejg.79.1604394591502;
        Tue, 03 Nov 2020 01:09:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznSSiGsFB5SSjHibLoSbkIlVQSz95qrcy+LKowTf1vCHyD05+I/fIL3nfr+q7Sd6iqhsFiZg==
X-Received: by 2002:a17:906:1b09:: with SMTP id o9mr754950ejg.79.1604394591214;
        Tue, 03 Nov 2020 01:09:51 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id y6sm7244400edl.54.2020.11.03.01.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 01:09:50 -0800 (PST)
Subject: Re: [PATCH v3 2/3] HID: i2c-hid: Allow subclasses of i2c-hid for
 power sequencing
To:     Rob Herring <robh+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        andrea@borgia.bo.it, Aaron Ma <aaron.ma@canonical.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Balan <admin@kryma.net>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201102161210.v3.1.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
 <20201102161210.v3.2.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
 <CAL_JsqLxGugWg7Xwr-NQa1h+a_=apQsfFCU0KF-97xt1ZB8jMg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <28e75d51-28d8-5a9a-adf9-71f107e94dfb@redhat.com>
Date:   Tue, 3 Nov 2020 10:09:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLxGugWg7Xwr-NQa1h+a_=apQsfFCU0KF-97xt1ZB8jMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/3/20 2:46 AM, Rob Herring wrote:
> On Mon, Nov 2, 2020 at 6:13 PM Douglas Anderson <dianders@chromium.org> wrote:
>>
>> This exports some things from i2c-hid so that we can have a driver
>> that's effectively a subclass of it and that can do its own power
>> sequencing.
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>
>> Changes in v3:
>> - Rework to use subclassing.
>>
>> Changes in v2:
>> - Use a separate compatible string for this new touchscreen.
>> - Get timings based on the compatible string.
>>
>>  drivers/hid/i2c-hid/i2c-hid-core.c    | 78 +++++++++++++++++----------
>>  include/linux/input/i2c-hid-core.h    | 19 +++++++
>>  include/linux/platform_data/i2c-hid.h |  9 ++++
>>  3 files changed, 79 insertions(+), 27 deletions(-)
>>  create mode 100644 include/linux/input/i2c-hid-core.h
>>
>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
>> index 786e3e9af1c9..910e9089fcf8 100644
>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>> @@ -22,6 +22,7 @@
>>  #include <linux/i2c.h>
>>  #include <linux/interrupt.h>
>>  #include <linux/input.h>
>> +#include <linux/input/i2c-hid-core.h>
>>  #include <linux/irq.h>
>>  #include <linux/delay.h>
>>  #include <linux/slab.h>
>> @@ -1007,8 +1008,33 @@ static void i2c_hid_fwnode_probe(struct i2c_client *client,
>>                 pdata->post_power_delay_ms = val;
>>  }
>>
>> -static int i2c_hid_probe(struct i2c_client *client,
>> -                        const struct i2c_device_id *dev_id)
>> +static int i2c_hid_power_up_device(struct i2c_hid_platform_data *pdata)
>> +{
>> +       struct i2c_hid *ihid = container_of(pdata, struct i2c_hid, pdata);
>> +       struct hid_device *hid = ihid->hid;
>> +       int ret;
>> +
>> +       ret = regulator_bulk_enable(ARRAY_SIZE(pdata->supplies),
>> +                                   pdata->supplies);
>> +       if (ret) {
>> +               if (hid)
>> +                       hid_warn(hid, "Failed to enable supplies: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       if (pdata->post_power_delay_ms)
>> +               msleep(pdata->post_power_delay_ms);
>> +
>> +       return 0;
>> +}
>> +
>> +static void i2c_hid_power_down_device(struct i2c_hid_platform_data *pdata)
>> +{
>> +       regulator_bulk_disable(ARRAY_SIZE(pdata->supplies), pdata->supplies);
>> +}
>> +
>> +int i2c_hid_probe(struct i2c_client *client,
>> +                 const struct i2c_device_id *dev_id)
>>  {
>>         int ret;
>>         struct i2c_hid *ihid;
>> @@ -1035,6 +1061,9 @@ static int i2c_hid_probe(struct i2c_client *client,
>>         if (!ihid)
>>                 return -ENOMEM;
>>
>> +       if (platform_data)
>> +               ihid->pdata = *platform_data;
>> +
>>         if (client->dev.of_node) {
>>                 ret = i2c_hid_of_probe(client, &ihid->pdata);
>>                 if (ret)
>> @@ -1043,13 +1072,16 @@ static int i2c_hid_probe(struct i2c_client *client,
>>                 ret = i2c_hid_acpi_pdata(client, &ihid->pdata);
>>                 if (ret)
>>                         return ret;
>> -       } else {
>> -               ihid->pdata = *platform_data;
>>         }
>>
>>         /* Parse platform agnostic common properties from ACPI / device tree */
>>         i2c_hid_fwnode_probe(client, &ihid->pdata);
>>
>> +       if (!ihid->pdata.power_up_device)
>> +               ihid->pdata.power_up_device = i2c_hid_power_up_device;
>> +       if (!ihid->pdata.power_down_device)
>> +               ihid->pdata.power_down_device = i2c_hid_power_down_device;
>> +
>>         ihid->pdata.supplies[0].supply = "vdd";
>>         ihid->pdata.supplies[1].supply = "vddl";
>>
>> @@ -1059,14 +1091,10 @@ static int i2c_hid_probe(struct i2c_client *client,
>>         if (ret)
>>                 return ret;
>>
>> -       ret = regulator_bulk_enable(ARRAY_SIZE(ihid->pdata.supplies),
>> -                                   ihid->pdata.supplies);
>> -       if (ret < 0)
>> +       ret = ihid->pdata.power_up_device(&ihid->pdata);
>> +       if (ret)
> 
> This is an odd driver structure IMO. I guess platform data is already
> there, but that's not what we'd use for any new driver.
> 
> Why not export i2c_hid_probe, i2c_hid_remove, etc. and then just call
> them from the goodix driver and possibly make it handle all DT
> platforms?
> 
> Who else needs regulators besides DT platforms? I thought with ACPI
> it's all wonderfully abstracted away?

Right with ACPI we do not need the regulators, actually not checking
for them with ACPI would be preferable, if only to suppress kernel
messages like these:

[    3.515658] i2c_hid i2c-SYNA8007:00: supply vdd not found, using dummy regulator
[    3.515848] i2c_hid i2c-SYNA8007:00: supply vddl not found, using dummy regulator

To be fair the i2c-hid-core.c code does have some acpi specific handling too.

With the latest fixes from:
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=for-5.10/upstream-fixes
taken into account we have the following acpi specific functions being called
from various places:

i2c_hid_acpi_fix_up_power   (called on probe)
i2c_hid_acpi_enable_wakeup  (called on probe)
i2c_hid_acpi_shutdown       (called on shutdown)

Not I'm not Benjamin / not the MAINTAINER of this code, but I think that
splitting out both the ACPI *and* the of/dt handling might make sense.

Maybe even turn drivers/hid/i2c-hid/i2c-hid-core.c into a library
and have 2 separate:

drivers/hid/i2c-hid/i2c-hid-acpi.c
drivers/hid/i2c-hid/i2c-hid-of.c

drivers using that library.

That would change the kernel-module name, but there only is the debug
module parameter which is affected by that from a userspace API point
of break, so I think that changing the kernel-module name is fine.

So you would have 2 i2c drivers, one with an acpi_match_table and one
with an of_match_table. And then either also have 2 separate probe
functions, or have a probe helper which gets passed some platform_data
given by the acpi/of probe function + some extra callbacks (either
as extra arguments or inside the pdata).

Having a separate drivers/hid/i2c-hid/i2c-hid-of.c file also allows
for a separate MAINTAINER entry where someone else then Benjamin
becomes responsible for reviewing DT related changes...

Anyways just my 2 cents, it is probably wise to wait what Benjamin
has to say before sinking time in implementing my suggestion :)

Regards,

Hans

