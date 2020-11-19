Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C292B95DB
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 16:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgKSPMg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 10:12:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54916 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727386AbgKSPMg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 10:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605798754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wOmU6CZqIx4vK4ygNAbjCw7bW5SwN2H9LOlU9RygKYU=;
        b=CkbdyTKPCHJkANwsW4AcroZuVSlQY48FHPIKoE0Exh7vW4/yy8DfQYxQc6ZuDHW1kIqrBU
        zuB2CR+Q5xJPW9XTazszGzrig3rWKcgFM+dW2WvZJySClW2RnUFiRViemQvhd1Z3NGoxz0
        6SXW7uY1lcd8iLtOCQlwf/9yNg5eYfU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-EUNCrpjQP3-KouckXvgN1w-1; Thu, 19 Nov 2020 10:12:31 -0500
X-MC-Unique: EUNCrpjQP3-KouckXvgN1w-1
Received: by mail-ed1-f70.google.com with SMTP id h11so1323015edw.14
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 07:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wOmU6CZqIx4vK4ygNAbjCw7bW5SwN2H9LOlU9RygKYU=;
        b=Xl4Dz77gKRyjLZrGXkpXL0i2S7sw/rU2NgjcqhW1PCKm0u5c2wYImwuy7pU43YwLEQ
         2LDT4A2AlRoiifPHdJLadgZ7gCK3MHuAhAbVXfgE97xQUQgGggUgSl45LLkxjkkVas6Y
         4d+bHD693YqMgWEdnD4U2EN1E9fcqcoaoEXK5fkawdyFKZVboArtgN4Q7oEwvNNuG9Ub
         4gb3jfziau42dfxvfVsxxCF9iaC62iqjpryxR2uE0/96vcnMyeGU6OIq+yLlAEmQ084b
         pfZXBjPi1K+nh7Q7dM486w2Z4ftQ34IsUfqkNwyiGBj9chbg6MqjKgWlzdtACerqzu32
         3ktQ==
X-Gm-Message-State: AOAM533ebRBdFkQ25AOQmySujBnryjEyBnxNTJUhd6QOEY9wlS0wvoPi
        i/Ft/nHuvIbVH3SXBCueAFCE/+A1VTcfdgBNNBqIT/EgjCCPkioySYzsbI9dlzeTHqv5MVSMACC
        Ta8swa4A5beZyJwiqgunMiu5rdv1nS/qrFQOWTnNzcMSApCz+bQdm/C2nyw4uPFr2Yv3Gn8flCf
        Y=
X-Received: by 2002:a17:906:1fc9:: with SMTP id e9mr28386487ejt.319.1605798749484;
        Thu, 19 Nov 2020 07:12:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzgZN7i9oPH2HLtVtF9B5m18t9gTh3CdMccjsK/DTfY1wf5fyFNLyFAZTMHvcMDgkO9vsHeA==
X-Received: by 2002:a17:906:1fc9:: with SMTP id e9mr28386458ejt.319.1605798749119;
        Thu, 19 Nov 2020 07:12:29 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id l25sm10444191edj.94.2020.11.19.07.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 07:12:28 -0800 (PST)
Subject: Re: [PATCH] HID: logitech-dj: Fix an error in
 mse_bluetooth_descriptor
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20201114094531.8285-1-hdegoede@redhat.com>
 <CAO-hwJKamLL0j8AfcFYbFeRpLxDRswGxJ3=TC=GABoSHOu=Yjw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <126285ed-29ef-5791-f289-4fb56a619bd9@redhat.com>
Date:   Thu, 19 Nov 2020 16:12:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJKamLL0j8AfcFYbFeRpLxDRswGxJ3=TC=GABoSHOu=Yjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/19/20 4:10 PM, Benjamin Tissoires wrote:
> Hi Hans,
> 
> [sorry for taking long to get to this, I wanted to conduct some tests
> with the Dinovo Mini with this patch and the series after]

No problem.

> On Sat, Nov 14, 2020 at 10:45 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Fix an error in the mouse / INPUT(2) descriptor used for quad/bt2.0 combo
>> receivers. Replace INPUT with INPUT (Data,Var,Abs) for the field for the
>> 4 extra buttons which share their report-byte with the low-res hwheel.
>>
>> This is likely a copy and paste error. I've verified that the new
>> 0x81, 0x02 value matches both the mouse descriptor for the currently
>> supported MX5000 / MX5500 receivers, as well as the INPUT(2) mouse
>> descriptors for the Dinovo receivers for which support is being
>> worked on.
>>
>> Fixes: f2113c3020ef ("HID: logitech-dj: add support for Logitech Bluetooth Mini-Receiver")
> 
> I suppose you also want a cc:stable tag here too?

In my experience the stable maintainers pick up most patches with
a fixes tag anyways. With that said adding a cc:stable tag is fine.

> I have added the patch to my local tests, and if you are happy with
> it, I can push it upstream.

Pushing this patch upstream is fine with me.

Regards,

Hans



>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/hid/hid-logitech-dj.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
>> index d3471d655ab4..7706454de88f 100644
>> --- a/drivers/hid/hid-logitech-dj.c
>> +++ b/drivers/hid/hid-logitech-dj.c
>> @@ -330,7 +330,7 @@ static const char mse_bluetooth_descriptor[] = {
>>         0x25, 0x01,             /*      LOGICAL_MAX (1)                 */
>>         0x75, 0x01,             /*      REPORT_SIZE (1)                 */
>>         0x95, 0x04,             /*      REPORT_COUNT (4)                */
>> -       0x81, 0x06,             /*      INPUT                           */
>> +       0x81, 0x02,             /*      INPUT (Data,Var,Abs)            */
>>         0xC0,                   /*    END_COLLECTION                    */
>>         0xC0,                   /*  END_COLLECTION                      */
>>  };
>> --
>> 2.28.0
>>
> 

