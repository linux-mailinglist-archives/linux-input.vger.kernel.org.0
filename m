Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E722A241B49
	for <lists+linux-input@lfdr.de>; Tue, 11 Aug 2020 14:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgHKM7j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Aug 2020 08:59:39 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36682 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728566AbgHKM7i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Aug 2020 08:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597150776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QDUK4bKpIVSDS6ASp4f6Ne+K9yqlBfI4RmFNcFVLASE=;
        b=NVHoSYQWlCp4xrD01Udm0GOf7r+i6k+eYyUDgf8OGv7UlILcRnAGioHHUyOewlVmeKo7KO
        DrsHX8MwGThxlFHeqhBavuwU0Aehd5PsDAiXYYkY/SoqIRy+s1oM6GXLvcOYKOiD5qvBj6
        sa9poR+S6aByJZuSf1cdvzuJeYaDeXo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-UGSzlh_XPrat59drHA0ogg-1; Tue, 11 Aug 2020 08:59:34 -0400
X-MC-Unique: UGSzlh_XPrat59drHA0ogg-1
Received: by mail-ed1-f71.google.com with SMTP id u3so4537691edx.18
        for <linux-input@vger.kernel.org>; Tue, 11 Aug 2020 05:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QDUK4bKpIVSDS6ASp4f6Ne+K9yqlBfI4RmFNcFVLASE=;
        b=Q0Ah9X+9iSqYnV4lLBSlL1S6uXpIAXQ5iSVDqTrYqzuWUw/SlVXM6So8j+19ZvHiek
         PMx7DkToAv9dQRv6OdwDXY0APtYqDZblQsYTgGwZPu9wAyUjp4TdmZvpwlB6Ac3S98V8
         V7ByqNRUdoNanux024zVbsPC9Ln8aPoQrAaIO0g266aOW9avPBSy0HcUaFspUDDKZjCT
         F9lqMCaFJq+x1S2M8/fRJeHvadW181uITKigZH8B9Ei1C5ZnBEaYOny2Qb/7NXJ8gzn4
         L/OvAEyhVN/Hi8iRtjyUmJLI+ZRs1a+/xMNRratw3c67Fq0zWdy3gWOiykZSPnKnpYEw
         DrHw==
X-Gm-Message-State: AOAM530LKZogQxWceJCmkh8hpfGj/dmsxKckgtztnn5aYQTDTDw/Q2Ay
        O/zRnJ4OB2atqXh0FokI3GPs1Dajft7LbkD5GcrueTQI7wkqHx1Mvnlh4kkAEFym/OeSXh/ZU/r
        rIz3eWItHEVaOPPuqTjo7dtQ=
X-Received: by 2002:a05:6402:17f7:: with SMTP id t23mr26350947edy.301.1597150773704;
        Tue, 11 Aug 2020 05:59:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzah1LLbt+rbAJG+HG2VV5Qjzj9zLK2/g7ZiXHRVInMUQ9GS3NIZLSvMtmO6YMviEaVTMMIng==
X-Received: by 2002:a05:6402:17f7:: with SMTP id t23mr26350933edy.301.1597150773507;
        Tue, 11 Aug 2020 05:59:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id v14sm15118372ejb.63.2020.08.11.05.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 05:59:32 -0700 (PDT)
Subject: Re: [PATCH] HID: i2c-hid: Add 60ms delay after SET_POWER ON
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Balan <admin@kryma.net>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200810142928.12552-1-kai.heng.feng@canonical.com>
 <bbe5fde3-e0df-053e-a30a-a55c780b1f69@redhat.com>
 <869337EE-BA79-4C83-B7AA-9CA76885D5D3@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b8c8b16a-4beb-dc97-caaa-8f4753b81ce7@redhat.com>
Date:   Tue, 11 Aug 2020 14:59:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <869337EE-BA79-4C83-B7AA-9CA76885D5D3@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 8/11/20 8:00 AM, Kai-Heng Feng wrote:
> Hi Hans,
> 
>> On Aug 11, 2020, at 00:13, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 10-08-2020 16:29, Kai-Heng Feng wrote:
>>> Goodix touchpad fails to operate in I2C mode after system suspend.
>>> According to the vendor, Windows is more forgiving and there's a 60ms
>>> delay after SET_POWER ON command.
>>> So let's do the same here, to workaround for the touchpads that depend
>>> on the delay.
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>
>> Interesting I send a very similar patch a couple of days ago,
>> after debugging some touchpads issues on a BMAX Y13 laptop:
>>
>> https://patchwork.kernel.org/patch/11701541/
>>
>> If you look at that patch you will see that if we add a
>> sleep on power-on to i2c_hid_set_power(), we can remove
>> an existing sleep after power-on from i2c_hid_hwreset().
>>
>> And there is an interesting comment there which should
>> probably be moved (as my patch does) and corrected for the
>> new knowledge so that people reading the code in the future
>> now why the sleep is there.
> 
> Thanks for the info.
> Can you please update your patch with 60ms to supersede mine?

Sure, done.

Regards,

Hans


> 
>>
>> Other then that we've come to the same conclusion, but
>> your sleep is much longer. I guess that is ok though,
>> are you sure we need 60ms as a minimum?
>> Is that what goodix
>> said?
> 
> Yes, I was told by Goodix that the 60ms delay is needed.
> 
> Kai-Heng
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>> ---
>>>   drivers/hid/i2c-hid/i2c-hid-core.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
>>> index 294c84e136d7..7b24a27fad95 100644
>>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>>> @@ -419,6 +419,9 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
>>>   	if (ret)
>>>   		dev_err(&client->dev, "failed to change power setting.\n");
>>>   +	if (!ret && power_state == I2C_HID_PWR_ON)
>>> +		msleep(60);
>>> +
>>>   set_pwr_exit:
>>>   	return ret;
>>>   }
>>
> 

