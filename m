Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F9136D82A
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 15:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239634AbhD1NTQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 09:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55957 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235630AbhD1NTQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 09:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619615910;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lvHikEWnSMBDr4g7rvh6+sICCfjrh3guz5syX3AMRAo=;
        b=Ep2sddvcKtHsBkTpE0Hi11UdCUzRRHFQINgQ70NHFIXD743AXQtpRf03DLoanvJlvOFeLq
        CTGGYoemJ+WDPVpJUs6ohKfLxF7ota7Ic/4/04RKP3KjWDESK1ba5u3/AnsqVuopb2VpGx
        jIOHFLVALjvNv8lU3J8baftF2NsLosw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-IBXQwyapPbSAvgfmK_sEfw-1; Wed, 28 Apr 2021 09:18:28 -0400
X-MC-Unique: IBXQwyapPbSAvgfmK_sEfw-1
Received: by mail-ed1-f69.google.com with SMTP id bm3-20020a0564020b03b0290387c8b79486so4283655edb.20
        for <linux-input@vger.kernel.org>; Wed, 28 Apr 2021 06:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lvHikEWnSMBDr4g7rvh6+sICCfjrh3guz5syX3AMRAo=;
        b=ZhwEP7qN9954Ji+11iPzR+yjpEyxyJpT3NeztKsM42JmvOTX+xqDzsV8PxpRAeBXXp
         yd1Q5f0JqDxygh6f8eEYr9yHRtY2QmlkMRiava+x09LAJ2EsvfnuA8bcHchUM5jyDlgd
         nZLq6uGBmct+wbX15poS0eoVxFQtOQfvJSEZRq1py2ChWMPtwbn3DOIoX5t5S/LZprOC
         D1JaIdxUlrPKHXROXNsfDa84QlKWrkEIaBlm511caTXlE8vD9N763nF/eGlQF2LKw7Ef
         mqy1Fu8JhtAlmxH8TN4mS+9CnE5QMMce+i5/dZOxSibscOiXMn1vkvzCDvifhfd3BIjB
         lJVQ==
X-Gm-Message-State: AOAM532PD8s10yaaad4DOdOrjqJ4Rr6aVlqk2YS0KH16vj4v+HB11Zcf
        0acOC+mYQ+kzqG8Xn8LkMzlN2YZowNvKeYefmGH/Ahe4mK1ANx/mJtw0PRtfDkjUIod+7q/gbVL
        i+MOb2ywnHCiLbBs3O5zP8Mh6Q3L1ArFZwyFPYYYeMxIiJ/T7ENA9BAd3HZR+xbagykHiejc/+n
        A=
X-Received: by 2002:a17:907:7355:: with SMTP id dq21mr16250638ejc.157.1619615907254;
        Wed, 28 Apr 2021 06:18:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7OqCSBIqrR98PSIj4ZXCpXe/ed8SfxIcGYOBPxTSAhLY4nnO26UJ1cY/BJEcjMWogob7XUA==
X-Received: by 2002:a17:907:7355:: with SMTP id dq21mr16250612ejc.157.1619615907009;
        Wed, 28 Apr 2021 06:18:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ss6sm990650ejb.60.2021.04.28.06.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 06:18:26 -0700 (PDT)
Subject: Re: [PATCH 0/7] Input: goodix - Add support for controllers without
 flash
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20210428114608.101795-1-hdegoede@redhat.com>
 <35bccdf42b1f6b24546d0bcb44510cfdd535de10.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f0ac9d1d-8869-b0ae-8b04-7a2c92d0e203@redhat.com>
Date:   Wed, 28 Apr 2021 15:18:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <35bccdf42b1f6b24546d0bcb44510cfdd535de10.camel@hadess.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/28/21 2:03 PM, Bastien Nocera wrote:
> On Wed, 2021-04-28 at 13:46 +0200, Hans de Goede wrote:
>> Hi All,
>>
>> A while ago I bought a Glavey TM800A550L tablet. This is a Bay Trail
>> (x86)
>> tablet which comes with Android from the factory.
>>
>> It is mostly just another Bay Trail tablet, but the way the Goodix
>> touchscreen on it works is interesting. The controller needs to have
>> firmware uploaded to it before it will work. After that it pretty
>> much
>> works 100% the same as any other Goodix touchscreen controller.
>>
>> I've described this patch-set in the Subject as "Add support for
>> controllers without flash", but I suspect that the Goodix controllers
>> used on Bay Trail devices which ship with Windows pre-installed may
>> also
>> lack flash; and that the Windows version of the BIOS-es on these
>> devices
>> does the upload for us. Anyways just something which I'm wondering
>> about,
>> these patches are necessary to make things work regardless.
>>
>> These patches should also be useful for supporting the Goodix
>> controllers
>> on some ARM based devices, as some of those need the OS to upload the
>> firmware too AFAIK.
>>
>> Note patch 7/7 is included to get an overview of the entire set.
>> I'll merge that one myself through the pdx86 tree. Patches 1-6 are
>> intended for merging through the input tree.
> 
> 
> I've done a cursory review, and didn't find anything particularly
> egregious. Did you check that the intermediate patches all compiled?

Yes I did.

> Feel free to add my Reviewed-by:

Thanks, I've added this locally so it will be part of a v2 if
a v2 is necessary.

> My only question would be where the firmware are supposed to come from
> after this gets merged.

That is a good question. I guess step 1 would be to see if we can 
get permission to distribute these from Goodix themselves, so
that these can be added to linux-firmware.

Alternatively I can ask the gsl-firmware repo maintainer if it
is ok to also add Goodix firmware there:

https://github.com/onitake/agsl-firmware/tree/master/firmware/linux

ATM that contains a whole bunch of firmwares for devices with
Silead GSLx6xx controllers. I've contacted Silead about this in
the past but I've failed to get permission to add these to
linux-firmware.

Regards,

Hans

