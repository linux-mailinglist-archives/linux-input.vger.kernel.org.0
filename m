Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1612FC555
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2019 12:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfKNLbY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Nov 2019 06:31:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20443 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726139AbfKNLbY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Nov 2019 06:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573731083;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FHZk+jQ5+/NPOXRRVlq44jytBpfa66JJdnE2HiKfiik=;
        b=MiSiVSaVNTXDTq8kifIXBCGVO4gMZ8PL10YP8guavriRFpvSeiibXWTtuWbjlnouW73d94
        rI0cXeDDmEPyY0YwTGgRahuDSLWh+ceQTatCnk4VOil/vrmfSYMjpEf9Z9zqyvVtov6LYQ
        5UX/b7vRaVHRJvPfW/iClW0rk03kJwk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-SIWyXmTePHqGTAtz60qXeQ-1; Thu, 14 Nov 2019 06:31:22 -0500
Received: by mail-wm1-f71.google.com with SMTP id d140so3934711wmd.1
        for <linux-input@vger.kernel.org>; Thu, 14 Nov 2019 03:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yB9Vmf65QFRF0MLQB5kdoXOAN4BwMMLTqrLwtWTDnXU=;
        b=KYcRC6CpYIA/wk+q9QQQ6o2rfGvzNWZbhpnbZV5EcBJYTzcDNMZlEDrV1r7u8qYwJt
         +1mdwVbfwv1LlwiWc9TGKTXMbzMlqXfsOoBdm1EFhtRDxPuklc3morri5dSZjYGFwRgD
         Ho6DHH9A7cVmijNUsc5qBtAwbJrCD/S8YA+AbMwoI6n6Fzl4TRUMWZXOPWIMFAf3vO+B
         vlZJyD1Lla6IJpbXexz7rDxyTXgS1SofQSAzSIoJMYbqifN3Zyo7QDMtnyY5JIT61oQm
         l6tY8uo2LDXtUBIE6U0eMDQ1IPm8dB/GN629fYP1Sigyt1OfQuvyGpylwHbuFswID0mW
         V58w==
X-Gm-Message-State: APjAAAWT7bXTPkYJo48fbN2NGzJxKtik54omnBbY4vN1LwD9xt3N6bo0
        bdZX9nSMx9Dj6w49EIb+EQDS60J11zIqS9q7GnrgYgjFw5ub/HrHkg5BAvHFq1/PcgE7k4lVvtR
        dtNkD0rq+Ry/R9YWsAWk6PgI=
X-Received: by 2002:a5d:4649:: with SMTP id j9mr7883928wrs.248.1573731080921;
        Thu, 14 Nov 2019 03:31:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqwf0YNBetiah+6yssqcJRSd06dSFuIG3l3bATAyaxbwzYk/At6zhEndPZzNId8+wU5hbJVE5w==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr7883913wrs.248.1573731080718;
        Thu, 14 Nov 2019 03:31:20 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id b66sm6149136wmh.39.2019.11.14.03.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 03:31:20 -0800 (PST)
Subject: Re: [PATCH v7 1/8] efi: Export boot-services code and data as
 debugfs-blobs
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
 <20191004145056.43267-2-hdegoede@redhat.com>
 <20191014091133.GY16384@42.do-not-panic.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <340462a7-462a-3864-64bd-bdac5b428990@redhat.com>
Date:   Thu, 14 Nov 2019 12:31:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191014091133.GY16384@42.do-not-panic.com>
Content-Language: en-US
X-MC-Unique: SIWyXmTePHqGTAtz60qXeQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 14-10-2019 11:11, Luis Chamberlain wrote:
> On Fri, Oct 04, 2019 at 04:50:49PM +0200, Hans de Goede wrote:
>> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
>> index 8d3e778e988b..abba49c4c46d 100644
>> --- a/drivers/firmware/efi/efi.c
>> +++ b/drivers/firmware/efi/efi.c
>> @@ -314,6 +315,55 @@ static __init int efivar_ssdt_load(void)
>>   static inline int efivar_ssdt_load(void) { return 0; }
>>   #endif
>>  =20
>> +#ifdef CONFIG_DEBUG_FS
>> +
>> +#define EFI_DEBUGFS_MAX_BLOBS 32
>> +
>> +static struct debugfs_blob_wrapper debugfs_blob[EFI_DEBUGFS_MAX_BLOBS];
>> +
>> +static void __init efi_debugfs_init(void)
>> +{
>> +=09struct dentry *efi_debugfs;
>> +=09efi_memory_desc_t *md;
>> +=09char name[32];
>> +=09int type_count[EFI_BOOT_SERVICES_DATA + 1] =3D {};
>> +=09int i =3D 0;
>> +
>> +=09efi_debugfs =3D debugfs_create_dir("efi", NULL);
>> +=09if (IS_ERR_OR_NULL(efi_debugfs))
>> +=09=09return;
>> +
>> +=09for_each_efi_memory_desc(md) {
>> +=09=09switch (md->type) {
>> +=09=09case EFI_BOOT_SERVICES_CODE:
>> +=09=09=09snprintf(name, sizeof(name), "boot_services_code%d",
>> +=09=09=09=09 type_count[md->type]++);
>> +=09=09=09break;
>> +=09=09case EFI_BOOT_SERVICES_DATA:
>> +=09=09=09snprintf(name, sizeof(name), "boot_services_data%d",
>> +=09=09=09=09 type_count[md->type]++);
>> +=09=09=09break;
>> +=09=09default:
>> +=09=09=09continue;
>> +=09=09}
>> +
>> +=09=09debugfs_blob[i].size =3D md->num_pages << EFI_PAGE_SHIFT;
>> +=09=09debugfs_blob[i].data =3D memremap(md->phys_addr,
>> +=09=09=09=09=09=09debugfs_blob[i].size,
>> +=09=09=09=09=09=09MEMREMAP_WB);
>> +=09=09if (!debugfs_blob[i].data)
>> +=09=09=09continue;
>> +
>> +=09=09debugfs_create_blob(name, 0400, efi_debugfs, &debugfs_blob[i]);
>> +=09=09i++;
>> +=09=09if (i =3D=3D EFI_DEBUGFS_MAX_BLOBS)
>> +=09=09=09break;
>=20
> Why do we silently ignore more entries ?

A valid remark, I agree that adding a pr_warn_once here would be good
I will do so for the next version.

> And could documentation be
> added for ways in which this could be used in practice?

I can write a little how to use this to get an embedded firmware,
I will add this to firmware/fallback-mechanisms.rst for the next
version.

Regards,

Hans

