Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE824333A81
	for <lists+linux-input@lfdr.de>; Wed, 10 Mar 2021 11:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhCJKpe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Mar 2021 05:45:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45764 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231987AbhCJKp3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Mar 2021 05:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615373128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kJ+un2z4NMv/Kxe8Z3VFYigvPKssN/iPDyN8B+naIL4=;
        b=hnUg9wP6pOfms3DWgSWGdtcw10wTaYj2Uhff4OdLGK20x0IIuYfCO9kVhQq2rq1N476Y8k
        fKxHBiAdUPBX9rLKuVbgWG/QldSTPOVneaSOES7RB2oj7gA2XC8YQPLxkJjm8foKuD72L6
        1gY0VMB+h6sk+TjJYlkj4P4s5W1YY4I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-77Uvmg7rPOmtfEjCPXHrqQ-1; Wed, 10 Mar 2021 05:45:26 -0500
X-MC-Unique: 77Uvmg7rPOmtfEjCPXHrqQ-1
Received: by mail-ed1-f72.google.com with SMTP id f9so3844692edd.13
        for <linux-input@vger.kernel.org>; Wed, 10 Mar 2021 02:45:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kJ+un2z4NMv/Kxe8Z3VFYigvPKssN/iPDyN8B+naIL4=;
        b=mFcOeID8sglKqfRAfpcclN3Qw//HbU4RwaAUyH9PPUMsPt+Wt+T37oyvw8qzYSC1hT
         wGkaeVR8GW4ZDoplZS1Jpgn6Z12UvsQmcmMVkmqxeWlwLY4qPGvxrzmADwPOMsrEMyuo
         k9TbKMQ40b6P8pM+vsGHJ16pMoi4ImSa0UjJd/p7/ajwQ8xU7JjYmOKdBs4tVvmLkd2v
         8aj1HRO20M0bqXml4Gr3g1sw+RTnFt8DnSAFF2EtBhDxtEqt8+844K0ZRAN1tk2WunzB
         48EF0Pq9ds2Q9SCcXnQQLVp0wS2s8jrrrpCS1Yry7QVK5QSDY9e78i5X0ayutzEb7xic
         qTAw==
X-Gm-Message-State: AOAM5333tWvAs31MzAwmtRGCZnaBugpz8Lqim2UZJWY8nN/1Qjc/zzs5
        3DWMoRiwcg8dEUA/utMoUyqVcBLJZIPhPkyGTTo4zSA8HjE23ddgOq62qN25apfo629S+Jfx0Lt
        j21X6HDqJwxGcdVnEiuvFIhjbKmSGG9ndjfJ1uvpZxJ7jDYo9mHZJA1Nq0pFFg623S715ezGc6+
        o=
X-Received: by 2002:a17:907:7745:: with SMTP id kx5mr2932618ejc.3.1615373124939;
        Wed, 10 Mar 2021 02:45:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxm21/5vjRtkwYe+Sora0R+L+wEwVS3JFN4IK6EfOEo9Te5A3MU4Q2R85D7fFwcj0yh7fzkZw==
X-Received: by 2002:a17:907:7745:: with SMTP id kx5mr2932601ejc.3.1615373124645;
        Wed, 10 Mar 2021 02:45:24 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y24sm10717859eds.23.2021.03.10.02.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 02:45:24 -0800 (PST)
Subject: Re: [PATCH] Input: elants_i2c - Do not bind to i2c-hid compatible
 ACPI instantiated devices
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20210302145057.112437-1-hdegoede@redhat.com>
 <YD6VL4CwudwKs5Vo@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7d456f99-1a8d-c96d-a029-c6ffe42784fb@redhat.com>
Date:   Wed, 10 Mar 2021 11:45:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YD6VL4CwudwKs5Vo@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/2/21 8:42 PM, Dmitry Torokhov wrote:
> On Tue, Mar 02, 2021 at 03:50:57PM +0100, Hans de Goede wrote:
>> Several users have been reporting that elants_i2c gives several errors
>> during probe and that their touchscreen does not work on their Lenovo AMD
>> based laptops with a touchscreen with a ELAN0001 ACPI hardware-id:
>>
>> [    0.550596] elants_i2c i2c-ELAN0001:00: i2c-ELAN0001:00 supply vcc33 not found, using dummy regulator
>> [    0.551836] elants_i2c i2c-ELAN0001:00: i2c-ELAN0001:00 supply vccio not found, using dummy regulator
>> [    0.560932] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
>> [    0.562427] elants_i2c i2c-ELAN0001:00: software reset failed: -121
>> [    0.595925] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
>> [    0.597974] elants_i2c i2c-ELAN0001:00: software reset failed: -121
>> [    0.621893] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
>> [    0.622504] elants_i2c i2c-ELAN0001:00: software reset failed: -121
>> [    0.632650] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (4d 61 69 6e): -121
>> [    0.634256] elants_i2c i2c-ELAN0001:00: boot failed: -121
>> [    0.699212] elants_i2c i2c-ELAN0001:00: invalid 'hello' packet: 00 00 ff ff
>> [    1.630506] elants_i2c i2c-ELAN0001:00: Failed to read fw id: -121
>> [    1.645508] elants_i2c i2c-ELAN0001:00: unknown packet 00 00 ff ff
>>
>> Despite these errors, the elants_i2c driver stays bound to the device
>> (it returns 0 from its probe method despite the errors), blocking the
>> i2c-hid driver from binding.
>>
>> Manually unbinding the elants_i2c driver and binding the i2c-hid driver
>> makes the touchscreen work.
>>
>> Check if the ACPI-fwnode for the touchscreen contains one of the i2c-hid
>> compatiblity-id strings and if it has the I2C-HID spec's DSM to get the
>> HID descriptor address, If it has both then make elants_i2c not bind,
>> so that the i2c-hid driver can bind.
>>
>> This assumes that non of the (older) elan touchscreens which actually
>> need the elants_i2c driver falsely advertise an i2c-hid compatiblity-id
>> + DSM in their ACPI-fwnodes. If some of them actually do have this
>> false advertising, then this change may lead to regressions.
>>
>> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207759
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/input/touchscreen/elants_i2c.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
>> index 4c2b579f6c8b..510638e5ba5a 100644
>> --- a/drivers/input/touchscreen/elants_i2c.c
>> +++ b/drivers/input/touchscreen/elants_i2c.c
>> @@ -1334,6 +1334,12 @@ static void elants_i2c_power_off(void *_data)
>>  	}
>>  }
>>  
>> +static const struct acpi_device_id i2c_hid_ids[] = {
>> +	{"ACPI0C50", 0 },
>> +	{"PNP0C50", 0 },
>> +	{ },
>> +};
> 
> This ideally needs to be protected by CONFIG_ACPI.
> 
>> +
>>  static int elants_i2c_probe(struct i2c_client *client,
>>  			    const struct i2c_device_id *id)
>>  {
>> @@ -1342,6 +1348,25 @@ static int elants_i2c_probe(struct i2c_client *client,
>>  	unsigned long irqflags;
>>  	int error;
>>  
>> +#ifdef CONFIG_ACPI
>> +	/* Don't bind to i2c-hid compatible devices, these are handled by the i2c-hid drv. */
>> +	if (acpi_match_device_ids(ACPI_COMPANION(&client->dev), i2c_hid_ids) == 0) {
>> +		static const guid_t i2c_hid_guid =
>> +			GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
>> +				  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
>> +		acpi_handle handle = ACPI_HANDLE(&client->dev);
>> +		union acpi_object *obj;
>> +
>> +		obj = acpi_evaluate_dsm_typed(handle, &i2c_hid_guid, 1, 1, NULL,
>> +					      ACPI_TYPE_INTEGER);
>> +		if (obj) {
>> +			dev_warn(&client->dev, "elants_i2c: This device appears to be an I2C-HID device, not binding\n");
> 
> No need for "elants_i2c" prefix as dev_warn already gives driver info I
> believe.

Right, I will fix this for v2.

> 
>> +			ACPI_FREE(obj);
>> +			return -ENODEV;
>> +		}
>> +	}
>> +#endif
> 
> Could we tuck this away into "elants_acpi_is_hid_device" and have #ifdef
> protecting that and have a complementing stub?

That is a good idea, I'll do that for v2.

> 
>> +
>>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>>  		dev_err(&client->dev,
>>  			"%s: i2c check functionality error\n", DEVICE_NAME);
> 
> As a cleanup should probably drop device prefix from this message as
> well.

Ack.

Regards,

Hans

