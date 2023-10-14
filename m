Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4827C9617
	for <lists+linux-input@lfdr.de>; Sat, 14 Oct 2023 21:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjJNTk6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Oct 2023 15:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjJNTk5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Oct 2023 15:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59935BF
        for <linux-input@vger.kernel.org>; Sat, 14 Oct 2023 12:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697312409;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SCOJmG4P5slpcBSatmk9EgKju9q702fleTSF4wOaQlE=;
        b=Ah3PGvAwuyVD2hXoO15mHgBH/jhxetlrfg3DEjOopBZaZCEVvGEiB1dqOduJ9nqFDDpNbb
        QzOuROwK3YLEkn+WgGxaop48fbxzo6OW2jirZkrUV1fqEvEwoqTXklujWIG3B0PoK1+PEv
        /tqeUCwM8TPRPD3Sl0RjVoOPXBZ6Vgs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-FTjnM6zVPNe1IqcCBqPD5Q-1; Sat, 14 Oct 2023 15:39:55 -0400
X-MC-Unique: FTjnM6zVPNe1IqcCBqPD5Q-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-53da5262466so2501601a12.0
        for <linux-input@vger.kernel.org>; Sat, 14 Oct 2023 12:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697312394; x=1697917194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCOJmG4P5slpcBSatmk9EgKju9q702fleTSF4wOaQlE=;
        b=br8Qgfe0Tw9BHKo+9C+DhHxYxbUeiqV1uyzl097aYO8kb2FWVYUAttyXX2m76kWcLP
         29xRCFgMyFX5aqhDQHBZBtZXi3Q++6e/goGqFRzM77p62XCEXCBqOAyWCbYoFF/WJMUB
         s4UkU3NwIgECBVHmyr/B15moDDZFRRb0VoJeAMEPqv8QxEGpf57bpnrgQAaK3u0IRs4p
         qHOSicCP6OpKJZHMf93yD/p0iVTkvuy1VtZ34kp4ciA+7XkGkPQSBgXTS1YTC1rFv++H
         FPSH9iS1dRMEAA5J2mAa6L7sVPWK9sEFkSJSjL8KCkUKhNJJZzrjf8Q97yU5DvghUC15
         5R6w==
X-Gm-Message-State: AOJu0YwK3ne+ctEQfTX3nK/jUdMuMEiTZcsDUC7hFze16GlGFSQSReDu
        DLmHPAsDd2ug3Oc0k5UQOdwMQARRdyJUmw66lh2zNvpvphdb3sB7S0Z2Quy08OVgOJXNN3U4Rqd
        qItQ+KjaS3PusxYRIcFqCN9E=
X-Received: by 2002:a50:d7d9:0:b0:53e:6db7:ea63 with SMTP id m25-20020a50d7d9000000b0053e6db7ea63mr2066666edj.14.1697312394630;
        Sat, 14 Oct 2023 12:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGTKR1l+cIrvRc1JcR9pn3Frud8lgehmgKp58fsDovm1ZQVcgQWaMpkF4oeomXT3fDAbztIg==
X-Received: by 2002:a50:d7d9:0:b0:53e:6db7:ea63 with SMTP id m25-20020a50d7d9000000b0053e6db7ea63mr2066659edj.14.1697312394326;
        Sat, 14 Oct 2023 12:39:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u19-20020a50d513000000b0053e408aec8bsm2534933edi.6.2023.10.14.12.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Oct 2023 12:39:53 -0700 (PDT)
Message-ID: <f5016787-c4c7-c8d9-f208-6e355d8b7db0@redhat.com>
Date:   Sat, 14 Oct 2023 21:39:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Help getting ELAN066C touchpad working in Linux
To:     jdieter@gmail.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
References: <27131a7fae2794a63f4f285a20e41116ba4198f3.camel@gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <27131a7fae2794a63f4f285a20e41116ba4198f3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jonathan,

For starters, did you see this in dmesg? :

[    0.422648] i8042: PNP: PS/2 Controller [PNP0303:KBC0] at 0x60,0x64 irq 1
[    0.422652] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp

And did you try booting with "i8042.nopnp" ?

Also what is the output of:

ls -l /sys/bus/i2c/devices

and of:

ls -l /sys/bus/acpi/devices/ELAN066C:00/

and of:

cat /sys/bus/acpi/devices/ELAN066C:00/status

?

Regards,

Hans





On 10/14/23 19:12, jdieter@gmail.com wrote:
> Hi Dmitry, Hans, input mailing list,
> 
> I have two Lenovo 300e laptops, one running Windows and the other
> Fedora.  The laptop has a touchscreen, a stylus and a touchpad.  The
> touch screen and stylus work perfectly, but, under Fedora, the touchpad
> doesn't work at all and isn't detected by the kernel.
> 
> The device shows up in /sys/bus/acpi/devices/ELAN066C:00/ with a
> modalias of acpi:ELAN066C:PNP0C50:.
> 
> I'm not sure if the touchpad should be using elan_i2c or i2c_hid_acpi.
> In a somewhat naive attempt to get something to happen, I added:
> ```
>     { "ELAN066C", 0 }, /* Lenovo 100e/300e 2nd gen AMD */
> ```
> to include/linux/input/elan-i2c-ids.h, but the kernel still doesn't
> auto-load the module.
> 
> I can get elan_i2c to recognize something if I run:
> # echo elan_i2c 0x15 > /sys/bus/i2c/devices/i2c-1/new_device 
> but the IRQ defaults to 0, and I get an error about an IRQ conflict:
> 
> ```
> [ 2317.791897] i2c i2c-1: delete_device: Deleting device elan_i2c at
> 0x15
> [ 2319.317468] i2c i2c-1: new_device: Instantiated device elan_i2c at
> 0x15
> [ 2319.317662] elan_i2c 1-0015: supply vcc not found, using dummy
> regulator
> [ 2319.433176] elan_i2c 1-0015: Elan Touchpad: Module ID: 0x00be,
> Firmware: 0x0003, Sample: 0x0003, IAP: 0x000e
> [ 2319.433184] elan_i2c 1-0015: Elan Touchpad Extra Information:
>                    Max ABS X,Y:   3206,1828
>                    Width X,Y:   152,152
>                    Resolution X,Y:   31,31 (dots/mm)
>                    ic type: 0xa
>                    info pattern: 0x0
> [ 2319.433339] genirq: Flags mismatch irq 0. 00002008 (elan_i2c) vs.
> 00015a00 (timer)
> ```
> 
> By manually setting the IRQ to an unused value in the driver, I can at
> least get the driver to create a new mouse device in /dev/input, but
> the touchpad still doesn't work.
> 
> At this point, I don't know if I'm really close or barking up the
> completely wrong tree.
> 
> A bug report from earlier this year about an identical system is at:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1976556
> 
> Attached is the dsl of the device in ACPI.
> 
> I would really appreciate any help in figuring out how to get this
> working.  Please let me know if there's anything else you need from me.
> 
> Thanks,
> 
> Jonathan

