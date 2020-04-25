Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C9B1B85BC
	for <lists+linux-input@lfdr.de>; Sat, 25 Apr 2020 12:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgDYKpJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Apr 2020 06:45:09 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27746 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726061AbgDYKpI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Apr 2020 06:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587811506;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ypPrD56tObDwf94GrskvQMr8bepljs+Bo7TgxGLG9Cw=;
        b=K8FZzR73neqQiht7QYE/eD+BcM57JburBv14hJoRxOk0KfKDrsXmdDv7JC4VxFsUm96QCf
        wlWTGdkjTd85YcVYOFHXFpf+WI8p6/ogWTmrPG028gW1zeQ0tARd/rpvtiP0XsNw5Z3Ctz
        t+SyYEL0j46ik38EGSEsYVOK3FNnPLQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-upXd08DlOQWRfEwyF8ZAww-1; Sat, 25 Apr 2020 06:45:05 -0400
X-MC-Unique: upXd08DlOQWRfEwyF8ZAww-1
Received: by mail-wr1-f71.google.com with SMTP id s11so6525142wru.6
        for <linux-input@vger.kernel.org>; Sat, 25 Apr 2020 03:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ypPrD56tObDwf94GrskvQMr8bepljs+Bo7TgxGLG9Cw=;
        b=Mn0myc7F3zB2RscRo/+EKWy49YcjoacIQOqCxtMr0A6JtyBCg1yjrqynY6E3xueUXz
         Flyy1Ev5lISK5ZluWw+NTtUS17zYCz1LfI32msO0keuo3LO2cN9DJRXhnoQ5A/7a0SZW
         IY+bYAcMbG5ruUc1H6UnGQlDAPeLjmaq66ETeqzzFxyPUFAyQmjLdfhrSQ+jzjPuILWj
         /irf17K/u2py7m8hUrdRpIm9MJpCGpRBG+npRicfzI/qKARCAbFHkzf7l0wTYQNCetGt
         pIpNHwGXViZNAKq+RzFPFCd5Y6kug0UNVIpeV4UFRGcIzv/smRcKZfJCTfgai9mGhmi9
         mv/Q==
X-Gm-Message-State: AGi0PuYW30Ztwk9P3zXSbZYe6jTmrIfnC4pasH50JACUkX+zivqrPmIN
        4ZNXgUTttE0iIyvkXBJQiZ8GWBBmm5fi7iJBGQkHfGISDCk9Bc2HwLptdmA8MfXK9xMj4wmAJCB
        pdlItD03gobjsLAePn6yhPKE=
X-Received: by 2002:a5d:5224:: with SMTP id i4mr16414551wra.1.1587811503429;
        Sat, 25 Apr 2020 03:45:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypLJoEN2ED9W9KVPrIzIBdcXp0/RapvQGKbLbIzMMgY12PkFvD3mFBtIEuTTIAiCCX+rffNQWg==
X-Received: by 2002:a5d:5224:: with SMTP id i4mr16414528wra.1.1587811503158;
        Sat, 25 Apr 2020 03:45:03 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id v131sm6828892wmb.19.2020.04.25.03.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 03:45:02 -0700 (PDT)
Subject: Re: [PATCH] HID: apple: Disable Fn-key key-re-mapping on clone
 keyboards
To:     =?UTF-8?Q?Jo=c3=a3o_Moreno?= <mail@joaomoreno.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20200424112222.118376-1-hdegoede@redhat.com>
 <CAHxFc3T8JpdtMkkQfmArWuaA2VfKwQ52_g2uNFRkbsHtgqs6cQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9e7667b3-65e2-90ce-1885-96e8bf4fe4af@redhat.com>
Date:   Sat, 25 Apr 2020 12:45:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHxFc3T8JpdtMkkQfmArWuaA2VfKwQ52_g2uNFRkbsHtgqs6cQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/25/20 11:30 AM, João Moreno wrote:
> Hi Hans,
> 
> On Fri, 24 Apr 2020 at 13:22, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Maxxter KB-BT-001 Bluetooth keyboard, which looks somewhat like the
>> Apple Wireless Keyboard, is using the vendor and product IDs (05AC:0239)
>> of the Apple Wireless Keyboard (2009 ANSI version) <sigh>.
>>
>> But its F1 - F10 keys are marked as sending F1 - F10, not the special
>> functions hid-apple.c maps them too; and since its descriptors do not
>> contain the HID_UP_CUSTOM | 0x0003 usage apple-hid looks for for the
>> Fn-key, apple_setup_input() never gets called, so F1 - F6 are mapped
>> to key-codes which have not been set in the keybit array causing them
>> to not send any events at all.
> 
> Oh no.
> 
>>
>> The lack of a usage code matching the Fn key in the clone is actually
>> useful as this allows solving this problem in a generic way.
>>
>> This commits adds a fn_found flag and it adds a input_configured
>> callback which checks if this flag is set once all usages have been
>> mapped. If it is not set, then assume this is a clone and clear the
>> quirks bitmap so that the hid-apple code does not add any special
>> handling to this keyboard.
>>
>> This fixes F1 - F6 not sending anything at all and F7 - F12 sending
>> the wrong codes on the Maxxter KB-BT-001 Bluetooth keyboard and on
>> similar clones.
>>
>> Cc: Joao Moreno <mail@joaomoreno.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Note hid-apple also enables APPLE_NUMLOCK_EMULATION for
>> USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI. At least on the Maxxter clone
>> this causes numlock to get stuck in the pressed state after pressing it
>> twice (its get stuck when pressed when the numlock led is on). This might
>> be specific to the clone, but it would be good to also check if this is
>> not an issue on an actual Apple Wireless Keyboard.
>>
>> Joao, can you check the numlock-emulation stuff on your 05AC:0256
>> (APPLE_ALU_WIRELESS_2011_ISO) keyboard?
> 
> Unfortunately I don't have that keyboard any more around. Maybe
> someone else around could give this a try?

Ok, thank you for letting us know. This was sorta orthogonal
to this patch, its just that I noticed that the numlock emulation
behaved weird with the maxxter clone. Not sure if this is due to
the clone behaving differently then the original Mac keyboards,
or if its an issue where the hid-apply code has regressed over time.

Regards,

Hans


> 
>> ---
>>   drivers/hid/hid-apple.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
>> index d732d1d10caf..6909c045fece 100644
>> --- a/drivers/hid/hid-apple.c
>> +++ b/drivers/hid/hid-apple.c
>> @@ -54,6 +54,7 @@ MODULE_PARM_DESC(swap_opt_cmd, "Swap the Option (\"Alt\") and Command (\"Flag\")
>>   struct apple_sc {
>>          unsigned long quirks;
>>          unsigned int fn_on;
>> +       unsigned int fn_found;
>>          DECLARE_BITMAP(pressed_numlock, KEY_CNT);
>>   };
>>
>> @@ -339,12 +340,15 @@ static int apple_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>>                  struct hid_field *field, struct hid_usage *usage,
>>                  unsigned long **bit, int *max)
>>   {
>> +       struct apple_sc *asc = hid_get_drvdata(hdev);
>> +
>>          if (usage->hid == (HID_UP_CUSTOM | 0x0003) ||
>>                          usage->hid == (HID_UP_MSVENDOR | 0x0003) ||
>>                          usage->hid == (HID_UP_HPVENDOR2 | 0x0003)) {
>>                  /* The fn key on Apple USB keyboards */
>>                  set_bit(EV_REP, hi->input->evbit);
>>                  hid_map_usage_clear(hi, usage, bit, max, EV_KEY, KEY_FN);
>> +               asc->fn_found = true;
>>                  apple_setup_input(hi->input);
>>                  return 1;
>>          }
>> @@ -371,6 +375,19 @@ static int apple_input_mapped(struct hid_device *hdev, struct hid_input *hi,
>>          return 0;
>>   }
>>
>> +static int apple_input_configured(struct hid_device *hdev,
>> +               struct hid_input *hidinput)
>> +{
>> +       struct apple_sc *asc = hid_get_drvdata(hdev);
>> +
>> +       if ((asc->quirks & APPLE_HAS_FN) && !asc->fn_found) {
>> +               hid_info(hdev, "Fn key not found (Apple Wireless Keyboard clone?), disabling Fn key handling\n");
>> +               asc->quirks = 0;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>   static int apple_probe(struct hid_device *hdev,
>>                  const struct hid_device_id *id)
>>   {
>> @@ -585,6 +602,7 @@ static struct hid_driver apple_driver = {
>>          .event = apple_event,
>>          .input_mapping = apple_input_mapping,
>>          .input_mapped = apple_input_mapped,
>> +       .input_configured = apple_input_configured,
>>   };
>>   module_hid_driver(apple_driver);
>>
>> --
>> 2.26.0
>>
> 

