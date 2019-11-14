Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 741CDFCF5F
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2019 21:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfKNUNa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Nov 2019 15:13:30 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23437 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726655AbfKNUN3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Nov 2019 15:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573762408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zeOvreoiDJiJznC6pgddXng3TgtdBC/uHEqj3GGY24g=;
        b=dnah7DTRX3WQ722iH7Lin11WmvDlwizkzOHW1kM/tioSR9OC2yDoEHBrmWatp1DLep+MJs
        UCSO09nrZZfpF0kb70KOz8JCpV/MG8LtHQgOJI4+t/7XkVeomcn3FRbBAQzsXrlTj1ZAVM
        27/lYfxTHgPYZPoy/1t2jtT25hh7/Qo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-7iMg2fW6OYa2T8DVZqOwiQ-1; Thu, 14 Nov 2019 15:13:27 -0500
Received: by mail-wr1-f70.google.com with SMTP id m17so5323445wrb.20
        for <linux-input@vger.kernel.org>; Thu, 14 Nov 2019 12:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kwk2SObMZHFa0y+X6pAt/3dq8Wi+ovXi2eZNEpP7b1o=;
        b=AKfi7yFwwPpjZbgGHXwpYawWp0RzS4o1kMBm49CZkZO47tnZNfnvHBKmloFolKIYhm
         nAaGUBXkoFY37sF0HknGMduUu7Km3EJ3NATSB53pfHlE9lAK2KYLWbPiAEjai+wUKvH0
         DEMCiEFFGck0ub/5wNc6LUc2Ik3QKnMM8HaNw39XXTB/EudG5vZ0YqyYerfHztY8LXWv
         qvJeFojMpZa+bqE+WANjrQwNq8edLDsY/67ZoE9DYyvEHqpsuSF1NdoYCLdcXhLcccIP
         PKtPNK22OtUi9pQI39aEgJKgAdNeFHQK8kW8S2chw/tWsXLhfIPeSH3+9EvyAjR4ibOc
         fgyQ==
X-Gm-Message-State: APjAAAX7zf0aU7aS5kk/8x9rtoQgkA1+j5xTE2cH8DuVwVHmW0CTlNGa
        spRiwO4kz3tJC8f9VEmMOnzL9ff2yHRJcb8OH2JS5cVICj0fdhbpb2Uiz8ImGnZGJleyJAS+8fq
        W6AtE9Dk9y2OLlRj/utIIwkE=
X-Received: by 2002:a1c:a9cb:: with SMTP id s194mr10653859wme.92.1573762404993;
        Thu, 14 Nov 2019 12:13:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYg+h1HBpJaDU9hPX/MpQYH0wFtF669+nHobvHa152/M/2ldKc/DiHPX6bUeLLg5ZnBKKPdg==
X-Received: by 2002:a1c:a9cb:: with SMTP id s194mr10653824wme.92.1573762404762;
        Thu, 14 Nov 2019 12:13:24 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id 19sm10336706wrc.47.2019.11.14.12.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 12:13:23 -0800 (PST)
Subject: Re: [PATCH v7 2/8] efi: Add embedded peripheral firmware support
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20191004145056.43267-1-hdegoede@redhat.com>
 <20191004145056.43267-3-hdegoede@redhat.com>
 <20191011144834.GL16384@42.do-not-panic.com>
 <e7bd40ff-20d1-3aed-8516-9fffd4c3a207@redhat.com>
 <20191114194233.GE11244@42.do-not-panic.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f00804ae-e556-35e4-d0a3-cd9201fdd2d0@redhat.com>
Date:   Thu, 14 Nov 2019 21:13:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191114194233.GE11244@42.do-not-panic.com>
Content-Language: en-US
X-MC-Unique: 7iMg2fW6OYa2T8DVZqOwiQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 14-11-2019 20:42, Luis Chamberlain wrote:
> On Thu, Nov 14, 2019 at 12:27:01PM +0100, Hans de Goede wrote:
>> Hi Luis,
>>
>> Thank you for the reviews and sorry for being a bit slow to respind.
>>
>> On 11-10-2019 16:48, Luis Chamberlain wrote:
>>> On Fri, Oct 04, 2019 at 04:50:50PM +0200, Hans de Goede wrote:
>>>> +static int __init efi_check_md_for_embedded_firmware(
>>>> +=09efi_memory_desc_t *md, const struct efi_embedded_fw_desc *desc)
>>>> +{
>>>> +=09const u64 prefix =3D *((u64 *)desc->prefix);
>>>> +=09struct sha256_state sctx;
>>>> +=09struct embedded_fw *fw;
>>>> +=09u8 sha256[32];
>>>> +=09u64 i, size;
>>>> +=09void *map;
>>>> +
>>>> +=09size =3D md->num_pages << EFI_PAGE_SHIFT;
>>>> +=09map =3D memremap(md->phys_addr, size, MEMREMAP_WB);
>>>
>>> Since our limitaiton is the init process must have mostly finished,
>>> it implies early x86 boot code cannot use this, what measures can we
>>> take to prevent / check for such conditions to be detected and
>>> gracefully errored out?
>>
>> As with all (EFI) early boot code, there simply is a certain order
>> in which things need to be done. This needs to happen after the basic
>> mm is setup, but before efi_free_boot_services() gets called, there
>> isn't really a way to check for all these conditions. As with all
>> early boot code, people making changes need to be careful to not
>> break stuff.
>=20
> I rather we take a proactive measure here and add whatever it is we need
> to ensure the API works only when its supposed to, rather than try and
> fail, and then expect the user to know these things.
>=20
> I'd prefer if we at least try to address this.

This is purely internal x86/EFI API it is not intended for drivers
or anything like that. It has only one caller under arch/x86 and it is
not supposed to get any other callers outside of arch/* ever.

Note that this all runs before even core_initcall-s get run, none
if the code which runs before then has any sort of ordering checks
and I don't see how this bit is special and thus does need ordering
checks; and there really is no mechanism for such checks so early
during boot.

The drivers/firmware/efi/embedded-firmware.c file does add some API
which can be used normally, specifically the efi_get_embedded_fw()
but that has no special ordering constrains and it does not directly
use the function we are discussing now. It reads back data stored
by the earlier functions; and if somehow called before those functions
run (*), then it will simply return -ENOENT.

Regards,

Hans



*)  which would mean before core_initcalls run so really really early

