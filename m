Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD171C6C05
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 10:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbgEFIlm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 May 2020 04:41:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29386 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728475AbgEFIll (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 May 2020 04:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588754499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S5Bjh819c0+YWb82JIMqWq1ODX/MuaBqMErF0qvycrU=;
        b=DK9eijW4ylKLAR8YEe2OWQsZ9LhST5oRDLH2WsXiCWbM6sAdOjnIP3NWZbRVy8K3VaAHhS
        hvttunHJ0xTrZHXYkB4o3U745Z8hu1QqyqN4xyAl1WlY0otBTyKJGaphKiipUJ8zkEQwsX
        noE7i4LC4Nsl19vr3STTFMMruI6+3cU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-NB1STDctM8esFkmOLeRx2Q-1; Wed, 06 May 2020 04:41:37 -0400
X-MC-Unique: NB1STDctM8esFkmOLeRx2Q-1
Received: by mail-wr1-f69.google.com with SMTP id e14so943521wrv.11
        for <linux-input@vger.kernel.org>; Wed, 06 May 2020 01:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S5Bjh819c0+YWb82JIMqWq1ODX/MuaBqMErF0qvycrU=;
        b=DYi4GwK9oxnsY1DcX05zAyyIJUJ8rDScSMpbajhbbN44cnB3ixNju93Pc7wvU4pKy1
         Cg3f8CkR+P5MYJ01Wb/kzo8+Tlgfk0Dm18Ix1fc/Y+5Ykj9MG9k44pqvWxefwbon+p1J
         Bg4Byp4fq17XobRx7UaOPGzAAb27giAr78z946YUHPgJSr+YOWbpHeD83pQqeAHJH5pO
         OaHFT/soYMMOYwdM/Y0I1D9oKp1QPuDAmBOq/T1zJyRHjHzLXMhHOsdYbjGU4YzlgLeF
         a3INACa2c3CQlT6BAOal096zFX2f8uZZ8QMca2Xd+iqVTrgmS8jpx0BSJ/czUPycP2/z
         D3dg==
X-Gm-Message-State: AGi0PuaapXCHKK41ZE/LI8RWK+ypEFDivj9oj7/MKIXtXeWDzE4OMaaP
        NGINgmKQx5BYJPs2QCdb00pc/J0nc0A8UdzT6+gCCcmA+7sRMtUXAMMyUDfT//JEX/g1Lebg9lL
        EcmATvuu9nifx4IQmtgAt/nY=
X-Received: by 2002:a1c:f609:: with SMTP id w9mr3079194wmc.123.1588754495993;
        Wed, 06 May 2020 01:41:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypKwuDe3c+kFax9x8urZDBryMfrYWwqxthBgxp0yReGZqBDm3E0r6th/+Hxrau2NDLqazEVjvQ==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr3079178wmc.123.1588754495761;
        Wed, 06 May 2020 01:41:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id s8sm1524746wrt.69.2020.05.06.01.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 01:41:35 -0700 (PDT)
Subject: Re: [PATCH 3/6] HID: asus: Add hid_is_using_ll_driver(usb_hid_driver)
 check
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20200428142254.252063-1-hdegoede@redhat.com>
 <20200428142254.252063-3-hdegoede@redhat.com>
 <nycvar.YFH.7.76.2005051631560.25812@cbobk.fhfr.pm>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <85945c78-5ed6-a780-e562-27c710710a8f@redhat.com>
Date:   Wed, 6 May 2020 10:41:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2005051631560.25812@cbobk.fhfr.pm>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/5/20 4:32 PM, Jiri Kosina wrote:
> On Tue, 28 Apr 2020, Hans de Goede wrote:
> 
>> Add a hid_is_using_ll_driver(usb_hid_driver) check to ensure that the
>> parent device is an usb_interface, before casting the parent device
>> pointer to an usb_interface pointer with to_usb_interface().
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/hid/hid-asus.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>> index b3292ff3f61a..719eff589f92 100644
>> --- a/drivers/hid/hid-asus.c
>> +++ b/drivers/hid/hid-asus.c
>> @@ -842,7 +842,8 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>   	if (drvdata->quirks & QUIRK_IS_MULTITOUCH)
>>   		drvdata->tp = &asus_i2c_tp;
>>   
>> -	if (drvdata->quirks & QUIRK_T100_KEYBOARD) {
>> +	if ((drvdata->quirks & QUIRK_T100_KEYBOARD) &&
>> +	    hid_is_using_ll_driver(hdev, &usb_hid_driver)) {
>>   		struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
>>   
> 
> I am going to push the whole patchset to for-5.8/asus branch later today,

Thanks.

> but I guess this one should better be taken as 5.7 fix still, right?

I know that Benjamin has been insisting on these extra checks, which
is why I added it. But in practice not having the check does not really
seem to be a big issue, so whether to add it to 5.7.x or not is your call.

Regards,

Hans

