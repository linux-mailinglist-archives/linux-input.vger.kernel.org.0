Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44523299272
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 17:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1786001AbgJZQat (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 12:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44337 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1785996AbgJZQat (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 12:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603729847;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+nQTLywXYlShNW7Ed0jmB9xmMFnNLOHDkwJYmqSFWns=;
        b=JfTNgNGd1FdsHrg+UEGVhXxFIcQWQaH7+0bOSE8l11H6esVwdv1+aOje3pUWjegjlk2zNi
        M0yGyoKm8icSnGhmc2UbrDxie/4sl4J2E+B2MlXQKOqpKTkYpJwr09JkUZKJGpLZsMwh3L
        msPcLRAvddLOOat7WgSwSp0XEjSdCvw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-vrBsav0LPNaPizn_UoI8RQ-1; Mon, 26 Oct 2020 12:30:45 -0400
X-MC-Unique: vrBsav0LPNaPizn_UoI8RQ-1
Received: by mail-ed1-f69.google.com with SMTP id w24so4740962edl.3
        for <linux-input@vger.kernel.org>; Mon, 26 Oct 2020 09:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+nQTLywXYlShNW7Ed0jmB9xmMFnNLOHDkwJYmqSFWns=;
        b=UwZTQoLACulEEW1QRjJ6Y+C3IiEdRNJ5sATMTmwAJoVYMZntg0jHBUPNVpVHUx8pEF
         kuiVuUIQULYTPURMjNIiWcGSF6sdCUPcx/zrqS27U+FozEcjAxfeOeCoGID+c0HeMweY
         qYotSmTh2lWcHJJQ+kS60AlF41RQoq47KyPXTZ13oluc5+jFXKb+LhsmFYFhoW+a9fK7
         9bo7jAaKfQBI9okQTxX1c4gKQjRnlwHZnCFapCyHSVB6djjM678QdNgN5GoOHf5yfziu
         twOggy7c4hkHSLXXtbbjMtEePg+nLImzDxhVUKbgyKjTbv1kvpSNhSi5OdPdQsVOUJTg
         CIaQ==
X-Gm-Message-State: AOAM530UEnTgIB4zi/a1YC1IsH4WiNdmJ/2QOJAy3W+/+Qfw//hPflkP
        B0NYhD7noMHNLYTVgegKa9PEhl1dgoFEFuwj3adaHyM3wAZuLleDxRy4W0YpeceFHBgiaUgkU0S
        xB7Z1bVzPhTcbN+3PUXt3q/o=
X-Received: by 2002:a17:906:d1ce:: with SMTP id bs14mr15947366ejb.548.1603729844067;
        Mon, 26 Oct 2020 09:30:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSaiP+DiJCK7lPToVLwshvUNdevvhXyjfw9HN/d2oXA29Q+H4mULQNmq0/kPBQkY2XS6JVxw==
X-Received: by 2002:a17:906:d1ce:: with SMTP id bs14mr15947335ejb.548.1603729843773;
        Mon, 26 Oct 2020 09:30:43 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id g18sm6164827eje.12.2020.10.26.09.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 09:30:43 -0700 (PDT)
Subject: Re: [PATCH v2] HID: i2c-hid: Put ACPI enumerated devices in D3 on
 shutdown
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20201026154606.10409-1-hdegoede@redhat.com>
 <9A3982A8-D427-4284-9C29-8D71901B5FFA@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e058b055-c253-686d-e8f6-49abab1a2e3b@redhat.com>
Date:   Mon, 26 Oct 2020 17:30:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <9A3982A8-D427-4284-9C29-8D71901B5FFA@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/26/20 5:27 PM, Kai-Heng Feng wrote:
> 
> 
>> On Oct 26, 2020, at 23:46, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The i2c-hid driver would quietly fail to probe the i2c-hid sensor-hub
>> with an ACPI device-id of SMO91D0 every other boot.
>>
>> Specifically, the i2c_smbus_read_byte() "Make sure there is something at
>> this address" check would fail every other boot.
>>
>> It seems that the BIOS does not properly reset/power-cycle the device
>> leaving it in a confused state where it refuses to respond to i2c-xfers.
>> On boots where probing the device failed, the driver-core puts the device
>> in D3 after the probe-failure, which causes the probe to succeed the next
>> boot.
>>
>> Putting the device in D3 from the shutdown-handler fixes the sensors not
>> working every other boot.
>>
>> This has been tested on both a Lenovo Miix 2-10 and a Dell Venue 8 Pro 5830
>> both of which use an i2c-hid sensor-hub with an ACPI id of SMO91D0.
>>
>> Note that it is safe to call acpi_device_set_power() with a NULL pointer
>> as first argument, so on none ACPI enumerated devices this change is a
>> no-op.
>>
>> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Acked-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Thank you. 
> And I do wonder if we should do this for all ACPI devices...

So do it with a power-domain shutdown handler in drivers/acpi/device_pm.c ?
Interesting suggestion...

Regards,

Hans



> 
> Kai-Heng
> 
>> ---
>> Changes in v2:
>> -Rebase on 5.10-rc1
>> ---
>> drivers/hid/i2c-hid/i2c-hid-core.c | 9 +++++++++
>> 1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
>> index 786e3e9af1c9..aeff1ffb0c8b 100644
>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>> @@ -943,6 +943,11 @@ static void i2c_hid_acpi_enable_wakeup(struct device *dev)
>> 	}
>> }
>>
>> +static void i2c_hid_acpi_shutdown(struct device *dev)
>> +{
>> +	acpi_device_set_power(ACPI_COMPANION(dev), ACPI_STATE_D3_COLD);
>> +}
>> +
>> static const struct acpi_device_id i2c_hid_acpi_match[] = {
>> 	{"ACPI0C50", 0 },
>> 	{"PNP0C50", 0 },
>> @@ -959,6 +964,8 @@ static inline int i2c_hid_acpi_pdata(struct i2c_client *client,
>> static inline void i2c_hid_acpi_fix_up_power(struct device *dev) {}
>>
>> static inline void i2c_hid_acpi_enable_wakeup(struct device *dev) {}
>> +
>> +static inline void i2c_hid_acpi_shutdown(struct device *dev) {}
>> #endif
>>
>> #ifdef CONFIG_OF
>> @@ -1175,6 +1182,8 @@ static void i2c_hid_shutdown(struct i2c_client *client)
>>
>> 	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
>> 	free_irq(client->irq, ihid);
>> +
>> +	i2c_hid_acpi_shutdown(&client->dev);
>> }
>>
>> #ifdef CONFIG_PM_SLEEP
>> -- 
>> 2.28.0
>>
> 

