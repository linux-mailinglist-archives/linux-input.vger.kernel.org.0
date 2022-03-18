Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9F84DD68D
	for <lists+linux-input@lfdr.de>; Fri, 18 Mar 2022 09:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbiCRI4B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Mar 2022 04:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234018AbiCRI4B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Mar 2022 04:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2EF051F1D0B
        for <linux-input@vger.kernel.org>; Fri, 18 Mar 2022 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647593682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7HWeZEMEGqeavewyZo9xEKkkuF2oYbesigQSr2n3rD8=;
        b=AGiaEnLwOpMo/3HWZ8/yvwn8F14cIIRh3ANs3rrJ7/kVXQ54HiDZEwFc6qUl2vJPnIJRxB
        1lgdw00qD/pz46wCUvol+q2BFy99ksdtygcCs2MkZxFXK8aJylgWVeV9UQFEhKWlPSJpoa
        IKr8V9Ykp4txk7xSgx2zlVxg7Wayh9k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-0o9zDauPNvSNzSe1LeENRg-1; Fri, 18 Mar 2022 04:54:41 -0400
X-MC-Unique: 0o9zDauPNvSNzSe1LeENRg-1
Received: by mail-ed1-f72.google.com with SMTP id x1-20020a50f181000000b00418f6d4bccbso2808711edl.12
        for <linux-input@vger.kernel.org>; Fri, 18 Mar 2022 01:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=7HWeZEMEGqeavewyZo9xEKkkuF2oYbesigQSr2n3rD8=;
        b=FFGF/vwBO/yQVy2ZesJf5hXybLcGAaC6rhBiq6JlAQyZ4AxBHakp5zwLNwrpekKuQG
         SpxWjAqB19YajBen+ErUdKVNJY3hV1tvdtio8LkvdX68EFDqGgIzbvS0b5+TekRLIK8i
         RiPtV3rMGDtr/KzxU38gmUZ1+a3KCU/+JGUYIcaujx+4zED58X+onSR8wa4+xgvKuuRz
         YxH9QI8rClQL6czoCZXCXl13/RaTsj5Cwkx02yrN8z9KBEMPBh4ttA3MxqLjo5fYsSjt
         iQHTCUdnGRIE2t9RC+UilFCBlRBoFanwdvGb+XxYfuMUzVbn2j/lHmORJfGm3JHHtLGJ
         4oQw==
X-Gm-Message-State: AOAM532m0HzpQfxNrewZXSqfcbWpyLKYhrdm4c8Szjr8FQg1M73f+fLe
        Q+qvCeJJG35Ot+8GDiDGl+hStFG7XoCdz0aq/AJMVOCtEmScC64qW8N7bHZNl/dttC4Bx8+yVhA
        C7P1abEv8fxlMlgX0wLdr/Ok=
X-Received: by 2002:a17:906:478c:b0:6df:6b35:156d with SMTP id cw12-20020a170906478c00b006df6b35156dmr7957518ejc.578.1647593679649;
        Fri, 18 Mar 2022 01:54:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsXvTobev8ekDmCXMyLZm4Ixi/HitCEGGFxxCXfM+2lFdhiFrZC7EyPUeQPNh8CCeSG3v9+A==
X-Received: by 2002:a17:906:478c:b0:6df:6b35:156d with SMTP id cw12-20020a170906478c00b006df6b35156dmr7957502ejc.578.1647593679411;
        Fri, 18 Mar 2022 01:54:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id s15-20020a170906778f00b006df84c19995sm2898424ejm.224.2022.03.18.01.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 01:54:39 -0700 (PDT)
Message-ID: <d1192588-8993-5052-6018-7a2f8393cff9@redhat.com>
Date:   Fri, 18 Mar 2022 09:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: Dell laptop touchpad disabling?
To:     Randy Dunlap <rdunlap@infradead.org>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Perry Yuan <Perry.Yuan@dell.com>
References: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
Content-Language: en-US
In-Reply-To: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

<attempt 2, fat-fingered send>

Hi Randy,

On 3/18/22 01:32, Randy Dunlap wrote:
> Hi all,
> 
> I have a Dell Inspiron 15 5510 laptop. Of course, it has a touchpad
> (which I think of as a nuisance pad).
> I would like to be able to disable the touchpad easily.
> 
> Are there any best practices or suggestions for how to do this?
> (I am using xfce4 as the desktop environment if that matters.)
> 
> 
> Sometimes the touchpad is discovered as a PS/2 Generic Mouse on
> the i8042 AUX port, and sometimes it is discovered as this
> touchpad: "DELL0B24:00 04F3:3147 Touchpad" on some I2C device:
> "i2c-DELL0B24:00". (The different discoveries might have something
> to do with my kernel configuration/builds, but I don't know that
> for sure.)
> 
> I have some very hackish scripts that I can run to toggle the
> 'inhibited' flag in sysfs (/sys/class/input/ for the I2C device or
> or /sys/devices/platform/i8042/ for the i8042 AUX port device),
> but that requires root (sudo), so that does not qualify as "easily"
> IMO.
> 
> E.g.,
> $ sudo toggle-aux-mouse
> or
> $ sudo toggle-i2c-touchpad
> 
> depending on which configuration the device is in.

The touchpad is supposed to be always recognized as, well a touchpad,
so you want it to show up as "DELL0B24:00 04F3:3147 Touchpad", as
you said this likely depends on your kernel config.

And then usually the desktop environment will give you an option
to disable it. At least GNOME offers a clear on/off toggle see e.g. :

https://blog.separateconcerns.com/img/gnome-touchpad-settings.jpg

Or you could use xinput properties to set the matching xinput
device, to disabled which you can do by device-name:

https://linuxhint.com/change_mouse_touchpad_settings_xinput_linux/

And then change the "Device Enabled" property.

Regardless of the method, the kernel's responsibility here is
to make sure the touchpad gets seen as a touchpad and after that
"disabling" it is a userspace problem.

Regards,

Hans

