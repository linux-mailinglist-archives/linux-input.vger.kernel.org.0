Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631CB241629
	for <lists+linux-input@lfdr.de>; Tue, 11 Aug 2020 08:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbgHKGAY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 11 Aug 2020 02:00:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59932 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgHKGAX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Aug 2020 02:00:23 -0400
Received: from mail-pj1-f71.google.com ([209.85.216.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1k5NKe-0002lM-PC
        for linux-input@vger.kernel.org; Tue, 11 Aug 2020 06:00:21 +0000
Received: by mail-pj1-f71.google.com with SMTP id z8so1414111pje.0
        for <linux-input@vger.kernel.org>; Mon, 10 Aug 2020 23:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=mGtWVW52fjaWvs3IfcD5BRSmGck3KpJYwMz2AjjH5iY=;
        b=KJk61iVnUwI9OR6BipobMojdjZ29T9LYXYXo3AGRzIRQxXgxGjQs5GkThfJnrYcC/T
         ZE/7XZ1n4L61w14cpQFcCeeBpLOu+OKlbUoxMs5wRFN514YLyOIGBdJy6Qznxy73zkl5
         YLscKNHSYAxuZEWZrYx6+c7660pYk2DI9n/zEYBebs0LlHpKMgKJYPMzoC2CN3PXMvqp
         eEt24DwN5six4KOFxETwyf0oDL8nFTn0qs+Moq0wYSltVdjHI2LUteX87EYuiPILd59K
         PjXPtWXFJW3s1PYwB51My6+/ovoXsKGcQRkssyTD8EKqeGyHrpJa8rvcZwiFLwQmVpFy
         +53g==
X-Gm-Message-State: AOAM530UWaEBoX4+EeXavFoRdY6b+sEtL4QrkXod1EXjqJXiGbElPiOF
        pFTf3biAxF2wyicR69heDasPtGDJtq/mpqBO6gfgIMttdtVuUPJ0fCLKgmBfV6Ol6eT7POvYgz1
        /vDQofjSjPs1Bi32RYjI9au6znG4UIpdha37Qq2iB
X-Received: by 2002:a62:6142:: with SMTP id v63mr4784447pfb.179.1597125619141;
        Mon, 10 Aug 2020 23:00:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXdidy/n4Gh2I26Qgbu/jJNNWm1OZi4zBw9rDh1yu1KQknUXh4p/J6JbXSUDM8OuMF+2Vh3g==
X-Received: by 2002:a62:6142:: with SMTP id v63mr4784416pfb.179.1597125618746;
        Mon, 10 Aug 2020 23:00:18 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id y72sm25257936pfg.58.2020.08.10.23.00.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2020 23:00:18 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] HID: i2c-hid: Add 60ms delay after SET_POWER ON
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <bbe5fde3-e0df-053e-a30a-a55c780b1f69@redhat.com>
Date:   Tue, 11 Aug 2020 14:00:14 +0800
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Balan <admin@kryma.net>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <869337EE-BA79-4C83-B7AA-9CA76885D5D3@canonical.com>
References: <20200810142928.12552-1-kai.heng.feng@canonical.com>
 <bbe5fde3-e0df-053e-a30a-a55c780b1f69@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

> On Aug 11, 2020, at 00:13, Hans de Goede <hdegoede@redhat.com> wrote:
> 
> Hi,
> 
> On 10-08-2020 16:29, Kai-Heng Feng wrote:
>> Goodix touchpad fails to operate in I2C mode after system suspend.
>> According to the vendor, Windows is more forgiving and there's a 60ms
>> delay after SET_POWER ON command.
>> So let's do the same here, to workaround for the touchpads that depend
>> on the delay.
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> 
> Interesting I send a very similar patch a couple of days ago,
> after debugging some touchpads issues on a BMAX Y13 laptop:
> 
> https://patchwork.kernel.org/patch/11701541/
> 
> If you look at that patch you will see that if we add a
> sleep on power-on to i2c_hid_set_power(), we can remove
> an existing sleep after power-on from i2c_hid_hwreset().
> 
> And there is an interesting comment there which should
> probably be moved (as my patch does) and corrected for the
> new knowledge so that people reading the code in the future
> now why the sleep is there.

Thanks for the info.
Can you please update your patch with 60ms to supersede mine?

> 
> Other then that we've come to the same conclusion, but
> your sleep is much longer. I guess that is ok though,
> are you sure we need 60ms as a minimum?
> Is that what goodix
> said?

Yes, I was told by Goodix that the 60ms delay is needed.

Kai-Heng

> 
> Regards,
> 
> Hans
> 
> 
>> ---
>>  drivers/hid/i2c-hid/i2c-hid-core.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
>> index 294c84e136d7..7b24a27fad95 100644
>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>> @@ -419,6 +419,9 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
>>  	if (ret)
>>  		dev_err(&client->dev, "failed to change power setting.\n");
>>  +	if (!ret && power_state == I2C_HID_PWR_ON)
>> +		msleep(60);
>> +
>>  set_pwr_exit:
>>  	return ret;
>>  }
> 

