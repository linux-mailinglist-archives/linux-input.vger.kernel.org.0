Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8F3C7C963E
	for <lists+linux-input@lfdr.de>; Sat, 14 Oct 2023 22:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjJNUbp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Oct 2023 16:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjJNUbp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Oct 2023 16:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A98CBF
        for <linux-input@vger.kernel.org>; Sat, 14 Oct 2023 13:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697315456;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iTW1kov1AtNB0N+7rq0vDIUqEjOWX7ziZfyrIMhiDXk=;
        b=UGs/GX+WjBLcxixtU2Ezd/7PtBZXjr80fLcNFcF/ROEUcSNcqZFYvg0p4tSSya3Y0/WeDD
        dL7mXXqTrtITLJFWrjHHAXwsOnHKqPhzG2+6a7HfXX7byCcvbe5Jh7ujYZc/iximZNVEAH
        q7NBqXIdKg9/MuVPL4uGMJfVCnTqlqM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-fPYEgsGEPy-1RZHjaXe69w-1; Sat, 14 Oct 2023 16:30:50 -0400
X-MC-Unique: fPYEgsGEPy-1RZHjaXe69w-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5a836d49eeaso20270047b3.0
        for <linux-input@vger.kernel.org>; Sat, 14 Oct 2023 13:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697315449; x=1697920249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iTW1kov1AtNB0N+7rq0vDIUqEjOWX7ziZfyrIMhiDXk=;
        b=sLCaphf9srsSp8N0NTkbwD3RJ8HTLJ/W/nb5+JhTDwoJ/8YM/96OHmbyvymGZ9DbtM
         Lbfj8Cm7MdsiNp3h8BZqEvrjMQHHEjvBZNhOWnSO9BBFWgO4nV20vad3pr4hdrQ1SD1q
         HJOH8p39VMFjjR1As7TV4zY7B9rjlC5avOSJ/eWJpcZl87cTB6jJ/3EjihzaSD+7/pVv
         3eURCbP05FXHbOlMd3f+aAErk/v84vU59+LXADbWIwJwxuY2ZugtSi/zfGngYYnQtKJZ
         RYvRFZ780JrDqKtJogTqwtFoMj7pJE7exGZBoW3uzAEdTppXSmBtzpdFOT3Kygza7FUi
         P3/Q==
X-Gm-Message-State: AOJu0YzNH75lOe2+5y2mcvbz+/ZoHurgB9WlplApalf/6vaBGzPD1deU
        TVs4MqbcmvPkzP3Rt+ZlXNFYqtzWv9mj19HU44YnC/nQS9ZL5wrSTCLft8G9NutWqLZSMHmwjyI
        Ssl7/haMEULartmris5eiccg=
X-Received: by 2002:a81:8742:0:b0:59f:6675:7771 with SMTP id x63-20020a818742000000b0059f66757771mr28172563ywf.35.1697315449452;
        Sat, 14 Oct 2023 13:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM9RPFlLkDYa7uaCPJbvwguJ0zES5qkUfzdUz6GarfxblEs/iwivFTFDJMLenMl1Hfm1tXQQ==
X-Received: by 2002:a81:8742:0:b0:59f:6675:7771 with SMTP id x63-20020a818742000000b0059f66757771mr28172555ywf.35.1697315449177;
        Sat, 14 Oct 2023 13:30:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q2-20020a0dce02000000b00583f8f41cb8sm813064ywd.63.2023.10.14.13.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Oct 2023 13:30:48 -0700 (PDT)
Message-ID: <fdfc2766-0885-7cbe-0e96-6358a08aa3c7@redhat.com>
Date:   Sat, 14 Oct 2023 22:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Help getting ELAN066C touchpad working in Linux
To:     Jonathan Dieter <jdieter@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <27131a7fae2794a63f4f285a20e41116ba4198f3.camel@gmail.com>
 <f5016787-c4c7-c8d9-f208-6e355d8b7db0@redhat.com>
 <4a1de7c3dfd7c2d2ced08c6d2b589555c1205dab.camel@gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4a1de7c3dfd7c2d2ced08c6d2b589555c1205dab.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_FILL_THIS_FORM_SHORT autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/14/23 22:22, Jonathan Dieter wrote:
> On Sat, 2023-10-14 at 21:39 +0200, Hans de Goede wrote:
>> Hi Jonathan,
>>
>> For starters, did you see this in dmesg? :
>>
>> [    0.422648] i8042: PNP: PS/2 Controller [PNP0303:KBC0] at
>> 0x60,0x64 irq 1
>> [    0.422652] i8042: PNP: PS/2 appears to have AUX port disabled, if
>> this is incorrect please boot with i8042.nopnp
>>
>> And did you try booting with "i8042.nopnp" ?
>>
>> Also what is the output of:
>>
>> ls -l /sys/bus/i2c/devices
>>
>> and of:
>>
>> ls -l /sys/bus/acpi/devices/ELAN066C:00/
>>
>> and of:
>>
>> cat /sys/bus/acpi/devices/ELAN066C:00/status
>>
>> ?
> 
> Hey Hans,
> 
> Yeah, I did see that in my dmesg and did try i8042.nopnp by itself and
> with combinations of pci=nocrs and the other i8042 options, with no
> effect except breaking audio.
> 
> # ls -l /sys/bus/i2c/devices
> total 0
> lrwxrwxrwx. 1 root root 0 Oct 14  2023 i2c-0 -> ../../../devices/platform/AMDI0010:00/i2c-0
> lrwxrwxrwx. 1 root root 0 Oct 14  2023 i2c-1 -> ../../../devices/platform/AMDI0010:01/i2c-1
> lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-2 -> ../../../devices/pci0000:00/0000:00:08.1/0000:04:00.0/i2c-2
> lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-3 -> ../../../devices/pci0000:00/0000:00:08.1/0000:04:00.0/i2c-3
> lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-4 -> ../../../devices/pci0000:00/0000:00:08.1/0000:04:00.0/i2c-4
> lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-5 -> ../../../devices/pci0000:00/0000:00:08.1/0000:04:00.0/drm/card1/card1-eDP-1/i2c-5
> lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-6 -> ../../../devices/pci0000:00/0000:00:08.1/0000:04:00.0/drm/card1/card1-DP-1/i2c-6
> lrwxrwxrwx. 1 root root 0 Oct 14 21:15 i2c-7 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-7
> lrwxrwxrwx. 1 root root 0 Oct 14 21:15 i2c-8 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-8
> lrwxrwxrwx. 1 root root 0 Oct 14 21:15 i2c-9 -> ../../../devices/pci0000:00/0000:00:14.0/i2c-9
> lrwxrwxrwx. 1 root root 0 Oct 14  2023 i2c-ELAN238E:00 -> ../../../devices/platform/AMDI0010:00/i2c-0/i2c-ELAN238E:00
> 
> # ls -l /sys/bus/acpi/devices/ELAN066C:00/
> total 0
> -r--r--r--. 1 root root 4096 Oct 14 21:16 hid
> -r--r--r--. 1 root root 4096 Oct 14 21:16 modalias
> -r--r--r--. 1 root root 4096 Oct 14 21:16 path
> lrwxrwxrwx. 1 root root    0 Oct 14 21:16 physical_node -> ../../../../platform/AMDI0010:01/ELAN066C:00

Ok this looks like a platform-device is being instantiated for the touchpad
rather then an i2c_client.

Can you do:

ls -l /sys/bus/platform/devices | grep ELAN066C

and let me know the output of that ?

If that confirms that a platform device is being instantiated
then the issue likely is that neither of the 2 if-s here:

    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (SBFG, ResourceTemplate ()
        {
            GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0009
                }
        })
        If ((^^^PCI0.LPC0.H_EC.ECRD (RefOf (^^^PCI0.LPC0.H_EC.TPTY)) == 0x01))
        {
            Name (SBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.I2CD",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            Return (ConcatenateResTemplate (SBFB, SBFG))
        }

        If ((^^^PCI0.LPC0.H_EC.ECRD (RefOf (^^^PCI0.LPC0.H_EC.TPTY)) == 0x02))
        {
            Name (SBFC, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.I2CD",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            Return (ConcatenateResTemplate (SBFC, SBFG))
        }
    }

Returns true causing no i2c-client to get instantiated.


If that is the case the first thing to do is try a DSDT overlay replacing the
first if:

        If ((^^^PCI0.LPC0.H_EC.ECRD (RefOf (^^^PCI0.LPC0.H_EC.TPTY)) == 0x01))
	{
		...
	}

With dropping the If so you get:

	{
		...
	}

See: https://docs.kernel.org/admin-guide/acpi/initrd_table_override.html

And then specifically the "How does it work" section.

Regards,

Hans



