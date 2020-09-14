Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4052697BF
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 23:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgINVdb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 17:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgINVdY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 17:33:24 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA77C06174A;
        Mon, 14 Sep 2020 14:33:22 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a22so911684ljp.13;
        Mon, 14 Sep 2020 14:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3YwtE+CTU98SQVonfRVf6T56ba7+ycZ/CEr3uZIyJc8=;
        b=cRNK2bemRgHRX4F2MlV7DtpMhy9grkklAmMT3+NZLDm2R840vORB8qOhD+dptgKNLy
         N5e9QWvcWU0lcwYNK7S+8NRzJA56QGaLhag/wWqhuOjGUXiuNWyWbM2n7ea0VPMy8Vf1
         HMvFP8owh5TrpSi/RdZJOiUSOj3DYw6PNpp1OdDxCsnfueeRMhGf+39an/vtUhjK/X1q
         8bkR34thp3adiXZ6STzJx84uf1SxwREBsS+yS7ZU7MYXj8rbYDkNre1ZO6Uxj2R89Lzi
         SQVeaJgEbQ0q3ioK/QiU7nXDmqLJ8A7GIlHSBoO8UMPuVXTa8tB6YDVXF7nFBFw3ow7i
         NmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3YwtE+CTU98SQVonfRVf6T56ba7+ycZ/CEr3uZIyJc8=;
        b=Ft4pJWtGWp73Sc5sd5IQTcCC/WbgyGXV3U92fTHhKu9x1g3o/coohZuA+ght3Dlarh
         /DiQjA1q49UiGl4YfWdyia1+dbPG+d6ulKX3KQOv1dztsEjLvgffNNdFRtM8E5ZPXrPd
         w5tH1X322svOiC5OvJ/hNiP7eLDVuPD7SpqXg2BAqW4P0+TNWI8QCt6GZAKffA1iEq/F
         Ul0RpEE9+OUu2xaNNGL/QG98P0H5Yeyl2uwV0EEr30hY5xEP5iX4jEROP7bQz/OtoS5p
         oXj4845ME2IDfVJNq7t1pP2GTQSmP7gto49CuiGCkY4qGublbLMmF4vVhgxuhZAJ6WxZ
         S2qA==
X-Gm-Message-State: AOAM532xIOIGPwqONlSvF9KCr+OBi/O8lbvITihlgouJ58dJy4oc9jCR
        SLSlOAq/jy45bK66Hx2o3mI=
X-Google-Smtp-Source: ABdhPJyjeCl6efHmjd39pCF/CLYwDAZN2YpwMM+OktUFOzKQFhrMgTQuSeb+WRoKKQjMTXR+V+d8rw==
X-Received: by 2002:a2e:a41b:: with SMTP id p27mr5984435ljn.75.1600119200445;
        Mon, 14 Sep 2020 14:33:20 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id l14sm4254079lji.99.2020.09.14.14.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 14:33:19 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200912005521.26319-1-jiada_wang@mentor.com>
 <20200913165644.GF1665100@dtor-ws>
 <65d1b9f2-a8e3-6398-712d-41d8067d06a1@gmail.com>
 <20200914193340.GV1665100@dtor-ws> <20200914193603.GW1665100@dtor-ws>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e3dca702-7489-be94-9eee-46024f988372@gmail.com>
Date:   Tue, 15 Sep 2020 00:33:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914193603.GW1665100@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

14.09.2020 22:36, Dmitry Torokhov пишет:
> On Mon, Sep 14, 2020 at 12:33:40PM -0700, Dmitry Torokhov wrote:
>> On Mon, Sep 14, 2020 at 08:29:44PM +0300, Dmitry Osipenko wrote:
>>> 13.09.2020 19:56, Dmitry Torokhov пишет:
>>>> Hi Jiada,
>>>>
>>>> On Sat, Sep 12, 2020 at 09:55:21AM +0900, Jiada Wang wrote:
>>>>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>>>>
>>>>> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
>>>>> when they are in a sleep state. It must be retried after a delay for the
>>>>> chip to wake up.
>>>>
>>>> Do we know when the chip is in sleep state? Can we do a quick I2C
>>>> transaction in this case instead of adding retry logic to everything? Or
>>>> there is another benefit for having such retry logic?
>>>
>>> Hello!
>>>
>>> Please take a look at page 29 of:
>>>
>>> https://ww1.microchip.com/downloads/en/DeviceDoc/mXT1386_1vx_Datasheet_LX.pdf
>>>
>>> It says that the retry is needed after waking up from a deep-sleep mode.
>>>
>>> There are at least two examples when it's needed:
>>>
>>> 1. Driver probe. Controller could be in a deep-sleep mode at the probe
>>> time, and then first __mxt_read_reg() returns I2C NACK on reading out TS
>>> hardware info.
>>>
>>> 2. Touchscreen input device is opened. The touchscreen is in a
>>> deep-sleep mode at the time when input device is opened, hence first
>>> __mxt_write_reg() invoked from mxt_start() returns I2C NACK.
>>>
>>> I think placing the retries within __mxt_read() / write_reg() should be
>>> the most universal option.
>>>
>>> Perhaps it should be possible to add mxt_wake() that will read out some
>>> generic register
>>
>> I do not think we need to read a particular register, just doing a quick
>> read:
>>
>> 	i2c_smbus_xfer(client->adapter, client->addr,
>> 			0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &dummy)
>>
>> should suffice.
>>
>>> and then this helper should be invoked after HW
>>> resetting (before mxt_read_info_block()) and from mxt_start() (before
>>> mxt_set_t7_power_cfg()). But this approach feels a bit fragile to me.
>>>
>>
>> Actually, reading the spec, it all depends on how the WAKE pin is wired
>> up on a given board. In certain setups retrying transaction is the right
>> approach, while in others explicit control is needed. So indeed, we need
>> a "wake" helper that we should call in probe and resume paths.

The WAKE-GPIO was never supported and I'm not sure whether anyone
actually needs it. I think we could ignore this case until anyone would
really need and could test it.

> By the way, I would like to avoid the unnecessary retries in probe paths
> if possible. I.e. on Chrome OS we really keep an eye on boot times and
> in case of multi-sourced touchscreens we may legitimately not have
> device at given address.

We could add a new MXT1386 DT compatible and then do:

static void mxt_wake(struct mxt_data *data)
{
	struct i2c_client *client = data->client;
	struct device *dev = &data->client->dev;
	union i2c_smbus_data dummy;

	if (!of_device_is_compatible(dev, "atmel,mXT1386"))
		return;

	/* TODO: add WAKE-GPIO support */

	i2c_smbus_xfer(client->adapter, client->addr,
			0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE,
			&dummy);

	msleep(MXT_WAKEUP_TIME);
}

Jiada, will you be able to re-work this patch? Please note that the new
"atmel,mXT1386" DT compatible needs to be added into the
atmel,maxtouch.txt binding.
