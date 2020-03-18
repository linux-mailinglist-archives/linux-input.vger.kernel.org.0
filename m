Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 248C318A168
	for <lists+linux-input@lfdr.de>; Wed, 18 Mar 2020 18:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgCRRUK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Mar 2020 13:20:10 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:58887 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726680AbgCRRUK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Mar 2020 13:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584552008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n3XT9uOrt7PH+M1GJzb9jqNp+v2UICWH0KuRq1shXUc=;
        b=M5HnFlW4gpkt6mG1UDaT3t5MF1EW8EZyTx6yXYIlXmRb3OzS2wWOUGEZyUHCI/aBDBNV6M
        sNluaAeNjMcpiCJpSKqOWv/o1xlMimBoZ5rjHysTjnzGt00F2/u/9UtNbFLqVZ3rWH8/GQ
        laQUyROjsOUHVx9l9Bj6CFazJTwwHek=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-ex3j1PZYNT2ENoVANm9OXA-1; Wed, 18 Mar 2020 13:20:06 -0400
X-MC-Unique: ex3j1PZYNT2ENoVANm9OXA-1
Received: by mail-wm1-f70.google.com with SMTP id f185so1331354wmf.8
        for <linux-input@vger.kernel.org>; Wed, 18 Mar 2020 10:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n3XT9uOrt7PH+M1GJzb9jqNp+v2UICWH0KuRq1shXUc=;
        b=qAaZAPXEHaNLCI1bj1+9gbE+HapCVnT6cvOwLzM4c2TmNO4grUxt7xlFrk9QU2TOIw
         UZOlPAb3Cdo9QrS71iMYMmsxlSDWBSkzqknhr/EdnaPZgTDgekjlw+jhtDvMOg3HCvkl
         VpMNofdPf5XBNK6lUlluYcceVjXUBQYblC3yYtr9oc4awBxUMprNW4KivxJ7F1DDuxbZ
         RrhOqEe884Rv2YbPa7Dg0AQIANb0dAa2K7/ghJcBxfbFh/g5MX/rCFtgK0LlmRzeQ/2v
         tgNhhxInv0zR+5CZ7jM4iSbKNanqVoNCCXQrCjQ7hYEwbMEwvdFF/v2cysyXOCY/w7bM
         RsuA==
X-Gm-Message-State: ANhLgQ0k2AOaxBjz8Xt1iK0P01s8SzI4tSef96c5i7STrbGXdyuTpsWo
        8QujMzAhqqi2HntdC8XQeFwOSsOfW0/9vY3qz/HkNx9wHTPhC3r3T3WmfWpK5BP0GOKpFk2f5Iz
        jAp/ftkauZJQCITOFD9/MQsg=
X-Received: by 2002:a05:6000:d1:: with SMTP id q17mr6725138wrx.409.1584552005529;
        Wed, 18 Mar 2020 10:20:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuZ21PQnKDISW6DXa9UKtqOe0KrEn2YQ1z7EL087QF5tRR4yPJScGJdLOCwadR//kwuf6j6qA==
X-Received: by 2002:a05:6000:d1:: with SMTP id q17mr6725115wrx.409.1584552005310;
        Wed, 18 Mar 2020 10:20:05 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id f12sm4835053wmh.4.2020.03.18.10.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2020 10:20:04 -0700 (PDT)
Subject: Re: [PATCH] HID: logitech-dj: issue udev change event on device
 connection
To:     Mario Limonciello <superm1@gmail.com>,
        =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Richard Hughes <hughsient@gmail.com>
References: <20200318161906.3340959-1-lains@archlinux.org>
 <CA+EcB1MoTXMaueJfRHf51A5PU4oiKSJXrHazfTEvifZK54OrLQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e8ea0c2e-445f-21e2-a248-3368f26bf391@redhat.com>
Date:   Wed, 18 Mar 2020 18:20:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+EcB1MoTXMaueJfRHf51A5PU4oiKSJXrHazfTEvifZK54OrLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/18/20 6:15 PM, Mario Limonciello wrote:
> On Wed, Mar 18, 2020 at 11:19 AM Filipe Laíns <lains@archlinux.org> wrote:
>>
>> As discussed in the mailing list:
>>
>>> Right now the hid-logitech-dj driver will export one node for each
>>> connected device, even when the device is not connected. That causes
>>> some trouble because in userspace we don't have have any way to know if
>>> the device is connected or not, so when we try to communicate, if the
>>> device is disconnected it will fail.
>>
>> The solution reached to solve this issue is to trigger an udev change
>> event when the device connects, this way userspace can just wait on
>> those connections instead of trying to ping the device.
>>
>> Signed-off-by: Filipe Laíns <lains@archlinux.org>
>> ---
>>   drivers/hid/hid-logitech-dj.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
>> index 48dff5d6b605..fcd481a0be1f 100644
>> --- a/drivers/hid/hid-logitech-dj.c
>> +++ b/drivers/hid/hid-logitech-dj.c
>> @@ -1464,6 +1464,8 @@ static int logi_dj_dj_event(struct hid_device *hdev,
>>                  if (dj_report->report_params[CONNECTION_STATUS_PARAM_STATUS] ==
>>                      STATUS_LINKLOSS) {
>>                          logi_dj_recv_forward_null_report(djrcv_dev, dj_report);
>> +               } else {
>> +                       kobject_uevent(&hdev->dev.kobj, KOBJ_CHANGE);
>>                  }
>>                  break;
>>          default:
>> --
>> 2.25.1
> 
> The problem that will remain here is the transition period for
> userspace to start to rely upon
> this.  It will have no idea whether the kernel is expected to send
> events or not.  What do you
> think about adding a syfs attribute to indicate that events are being
> sent?  Or something similar?

Then we would need to support that attribute forever. IMHO the best
option is to just make a uname call and check the kernel version, with
the code marked to be removed in the future when kernels older then
$version are no longer something we want to support.

Regards,

Hans

