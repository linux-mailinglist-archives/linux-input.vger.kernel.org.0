Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA8E14A95B9
	for <lists+linux-input@lfdr.de>; Fri,  4 Feb 2022 10:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235990AbiBDJIM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Feb 2022 04:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233421AbiBDJIM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Feb 2022 04:08:12 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05178C061714
        for <linux-input@vger.kernel.org>; Fri,  4 Feb 2022 01:08:12 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id j25so9332887wrb.2
        for <linux-input@vger.kernel.org>; Fri, 04 Feb 2022 01:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qierXtUbZEmphX6HcbtFGN8YKi1RAaq4Ta2iqLEIxWY=;
        b=B1P/cTNJvVYlMeaMkSVACRaKB8PK/eURYSk8PrZq2TS0TVvvZxqmd5CQjHhiOiTasY
         7cyc8oBVHOp7i5m8EzLCPqCFadmK/A3V2TBE+n6rA+j93rtdaWSpU+INlJaor0hS9uLR
         lQb0KIpktokOn6YucvYgwKPTaALOQ9nnKwqdr2Gk3fal9egJLfrEmXxr9vQZFB/tscrZ
         h5HIIM73yp/DakHbpADlHZ47Af200a0H5lVet6AIZ1z30duWZjYakgdDKSrhyijIjVKM
         OUp5h3KXZkd+r7DvjcB+gLZNrPlwPYc4VgOmGKnWSmxBK5vPeIRFNxZ8PgwYGfxeNpt4
         Lvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qierXtUbZEmphX6HcbtFGN8YKi1RAaq4Ta2iqLEIxWY=;
        b=bmfGWSCt57CLt/D+KdxwaVz6I41s6QoPgSYdHG+wB4LcNx9b6zvJjbfBSkr/LfPyRT
         uzjsmwUyRlO20tFCpT2oxyOQfZMYAC2NdhHwvqhpBiUt9/8fAn+nNUi4AREde08DUVio
         cBItf7Iowc2l/Al6TNhmeLouqCKmGuDRjOsArwjYQZPzYTgwze9ZCu++8Sq3x88TF2IT
         CEP2l1wkSPtboSE0LZZqZZDoezMLTyupC9lh6JsKgKLUmBwX/uXdStSsDmeIS3g6DwPQ
         q2O0+RwvokPJWoOnO0HBIGxG+Lh8RXGhgShV+raZv1ydSUtL6btOuhIL2lHlUDkrgcM3
         TH2g==
X-Gm-Message-State: AOAM533Tywby+f3m2bNhjHKp/fRHE06YRImWurHQurzu0pc83vei4c5J
        mps8SBcpR/MkujAZcDhXRbtSX491V9itbA==
X-Google-Smtp-Source: ABdhPJxkHXkpna7invgnPjEspJSibWUvfM4ihh4EcUz+fOroPoCfva5vviDmHtCXQW94IyEFC/g9sQ==
X-Received: by 2002:adf:eacc:: with SMTP id o12mr1555724wrn.576.1643965690459;
        Fri, 04 Feb 2022 01:08:10 -0800 (PST)
Received: from [192.168.0.21] (95.138.117.91.dynamic.reverse-mundo-r.com. [91.117.138.95])
        by smtp.gmail.com with ESMTPSA id j12sm1317247wru.38.2022.02.04.01.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 01:08:10 -0800 (PST)
Message-ID: <7a47c92b-85f2-1fca-4cff-5024d43d2cd2@gmail.com>
Date:   Fri, 4 Feb 2022 10:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] HID:Add support for UGTABLET WP5540 with new quirk
Content-Language: en-US
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
References: <6e8bd24e-3fad-b0c3-971b-cfd9152bf349@gmail.com>
 <CAO-hwJLB2EvMecPrvk+_BaC7zKChh8efaiF_YAqeaoO4jJXWyQ@mail.gmail.com>
From:   Sergio Costas <rastersoft@gmail.com>
In-Reply-To: <CAO-hwJLB2EvMecPrvk+_BaC7zKChh8efaiF_YAqeaoO4jJXWyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin:

You are absolutely right. Here is the new patch. It works perfectly too, 
and is much simpler.

 From 139638a264bdbc47e4f55c484c58867e2dbd4ddc Mon Sep 17 00:00:00 2001
From: Sergio Costas <rastersoft@gmail.com>
Date: Fri, 4 Feb 2022 10:01:17 +0100
Subject: [PATCH] HID:Add support for UGTABLET WP5540

This patch adds support for the UGTABLET WP5540 digitizer tablet
devices. Without it, the pen moves the cursor, but neither the
buttons nor the tap sensor in the tip do work.
---
  drivers/hid/hid-ids.h    | 1 +
  drivers/hid/hid-quirks.c | 1 +
  2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 85975031389b..78bd3ddda442 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1370,6 +1370,7 @@
  #define USB_VENDOR_ID_UGTIZER            0x2179
  #define USB_DEVICE_ID_UGTIZER_TABLET_GP0610    0x0053
  #define USB_DEVICE_ID_UGTIZER_TABLET_GT5040    0x0077
+#define USB_DEVICE_ID_UGTIZER_TABLET_WP5540    0x0004

  #define USB_VENDOR_ID_VIEWSONIC            0x0543
  #define USB_DEVICE_ID_VIEWSONIC_PD1011        0xe621
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 9af1dc8ae3a2..c066ba901867 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -187,6 +187,7 @@ static const struct hid_device_id hid_quirks[] = {
      { HID_USB_DEVICE(USB_VENDOR_ID_TURBOX, 
USB_DEVICE_ID_TURBOX_KEYBOARD), HID_QUIRK_NOGET },
      { HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, 
USB_DEVICE_ID_UCLOGIC_TABLET_KNA5), HID_QUIRK_MULTI_INPUT },
      { HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, 
USB_DEVICE_ID_UCLOGIC_TABLET_TWA60), HID_QUIRK_MULTI_INPUT },
+    { HID_USB_DEVICE(USB_VENDOR_ID_UGTIZER, 
USB_DEVICE_ID_UGTIZER_TABLET_WP5540), HID_QUIRK_MULTI_INPUT },
      { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP, 
USB_DEVICE_ID_WALTOP_MEDIA_TABLET_10_6_INCH), HID_QUIRK_MULTI_INPUT },
      { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP, 
USB_DEVICE_ID_WALTOP_MEDIA_TABLET_14_1_INCH), HID_QUIRK_MULTI_INPUT },
      { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP, 
USB_DEVICE_ID_WALTOP_SIRIUS_BATTERY_FREE_TABLET), HID_QUIRK_MULTI_INPUT },
-- 
2.34.1

El 4/2/22 a las 9:03, Benjamin Tissoires escribió:
> Hi Sergio,
>
> On Thu, Feb 3, 2022 at 7:40 PM Sergio Costas <rastersoft@gmail.com> wrote:
>>   From 82e513c85f4bdc027e5b907000a3bbaf74314bcb Mon Sep 17 00:00:00 2001
>> From: Sergio Costas <rastersoft@gmail.com>
>> Date: Thu, 3 Feb 2022 14:15:07 +0100
>> Subject: [PATCH] HID:Add support for UGTABLET WP5540 with new quirk
>>
>> This patch adds a new quirk to HID, allowing to configure the
>> usage rules in reverse order. This is needed to enable the use
>> of the UGTABLET WP5540 USB digitizer tablet.
>>
>> This tablet defines three HID collections: one for a digitizer
>> device and two for mouse devices, the first one with relative
>> coordinates, and the second one with absolute coordinates.
>> The problem is that both mouse devices share the "button 1",
>> "button 2" and "button 3" usages, but the Linux HID driver
>> doesn't support that, so those usages remain unassigned for
>> the second mouse because they are considered "duplicated".
>> Unfortunately, the second mouse is, really, the pencil,
>> which means that the movements are detected and managed,
>> but not the pencil touch or any button press, because those
>> usages are already assigned to the first mouse (I suspect
>> that the chip used in this tablet is designed to work both
>> with pencils and with uncorded mouses, allowing dual devices
>> where both a pencil and a mouse can be used over the same
>> rug).
>>
>> The result is that the user can move the cursor with the pencil,
>> but can't "paint" things because the "touch" action doesn't
>> work.
>>
>> Currently there is already a quirk that, at first glance, could
>> seem as the solution to this problem. That quirk is
>> HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE. Unfortunately, the
>> result is that the "pencil touch" and "press button" actions
>> are translated into "previous page", "next page"... and so on,
>> which is not a desirable option. Although those events could
>> be reasigned in user space using xmodmap, it requires actions
>> from the user, and also could interfere with other devices,
>> like multibutton mouses.
>>
>> I also tried to remove the duplicate test, but the system
>> hangs as soon as it receives an event from the tablet.
>>
>> This patch aims to fix this by configuring the entries in
>> reverse order, thus giving priority to the pencil over the
>> mouse. This makes sense today, because it is more common to
>> use optical mouses instead of tablet-based ones, and also
>> ensures that devices marketed only with the pencil but
>> using this chip do work out-of-the-box.
>>
>> To do this, the patch adds a new quirk:
>> HID_QUIRK_REVERSE_CONFIGURE_USAGES, which can be enabled for
>> an specific device, and it does assign the actions in reverse
>> order, thus reversing the priority. This quirk can still be
>> combined with HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE, so the
>> events from the physical mouse could still be received, but
>> giving priority to the digitizer, which makes more sense.
> This seems extremely over-engineered. Have you tried the quirk
> HID_QUIRK_MULTI_INPUT?
> This quirk should create one independent input node per input report,
> and I suspect your tablet is using different report IDs for the 2
> mices.
>
> Cheers,
> Benjamin
>
>> With this new quirk enabled for it, the UGTABLET WP5540
>> digitizer tablet works like a charm.
>>
>> Signed-off-by: Sergio Costas <rastersoft@gmail.com>
>> ---
>>    drivers/hid/hid-ids.h    |   1 +
>>    drivers/hid/hid-input.c  | 101 +++++++++++++++++++++++++++------------
>>    drivers/hid/hid-quirks.c |   1 +
>>    include/linux/hid.h      |   1 +
>>    4 files changed, 73 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
>> index 85975031389b..78bd3ddda442 100644
>> --- a/drivers/hid/hid-ids.h
>> +++ b/drivers/hid/hid-ids.h
>> @@ -1370,6 +1370,7 @@
>>    #define USB_VENDOR_ID_UGTIZER            0x2179
>>    #define USB_DEVICE_ID_UGTIZER_TABLET_GP0610    0x0053
>>    #define USB_DEVICE_ID_UGTIZER_TABLET_GT5040    0x0077
>> +#define USB_DEVICE_ID_UGTIZER_TABLET_WP5540    0x0004
>>
>>    #define USB_VENDOR_ID_VIEWSONIC            0x0543
>>    #define USB_DEVICE_ID_VIEWSONIC_PD1011        0xe621
>> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
>> index 112901d2d8d2..8cf4f63581cf 100644
>> --- a/drivers/hid/hid-input.c
>> +++ b/drivers/hid/hid-input.c
>> @@ -1938,6 +1938,56 @@ static inline void
>> hidinput_configure_usages(struct hid_input *hidinput,
>>                             report->field[i]->usage + j);
>>    }
>>
>> +static inline void hidinput_configure_usages_reversed(struct hid_input
>> *hidinput,
>> +                              struct hid_report *report)
>> +{
>> +    int i, j;
>> +
>> +    for (i = report->maxfield; i > 0 ; i--)
>> +        for (j = report->field[i-1]->maxusage; j > 0 ; j--)
>> +            hidinput_configure_usage(hidinput, report->field[i-1],
>> +                         report->field[i-1]->usage + j - 1);
>> +}
>> +
>> +static bool hidinput_configure_usage_list(struct hid_device *hid,
>> +                      struct hid_report *report,
>> +                      bool reverse)
>> +{
>> +
>> +    unsigned int application;
>> +    struct hid_input *hidinput = NULL;
>> +
>> +    application = report->application;
>> +
>> +    /*
>> +     * Find the previous hidinput report attached
>> +     * to this report id.
>> +     */
>> +    if (hid->quirks & HID_QUIRK_MULTI_INPUT)
>> +        hidinput = hidinput_match(report);
>> +    else if (hid->maxapplication > 1 &&
>> +            (hid->quirks & HID_QUIRK_INPUT_PER_APP))
>> +        hidinput = hidinput_match_application(report);
>> +
>> +    if (!hidinput) {
>> +        hidinput = hidinput_allocate(hid, application);
>> +        if (!hidinput)
>> +            return true;
>> +    }
>> +
>> +    if (reverse)
>> +        hidinput_configure_usages_reversed(hidinput, report);
>> +    else
>> +        hidinput_configure_usages(hidinput, report);
>> +
>> +    if (hid->quirks & HID_QUIRK_MULTI_INPUT)
>> +        hidinput->report = report;
>> +
>> +    list_add_tail(&report->hidinput_list,
>> +              &hidinput->reports);
>> +    return false;
>> +}
>> +
>>    /*
>>     * Register the input device; print a message.
>>     * Configure the input layer interface
>> @@ -1949,8 +1999,7 @@ int hidinput_connect(struct hid_device *hid,
>> unsigned int force)
>>        struct hid_driver *drv = hid->driver;
>>        struct hid_report *report;
>>        struct hid_input *next, *hidinput = NULL;
>> -    unsigned int application;
>> -    int i, k;
>> +    int i, k, l;
>>
>>        INIT_LIST_HEAD(&hid->inputs);
>>        INIT_WORK(&hid->led_work, hidinput_led_worker);
>> @@ -1972,41 +2021,31 @@ int hidinput_connect(struct hid_device *hid,
>> unsigned int force)
>>
>>        report_features(hid);
>>
>> -    for (k = HID_INPUT_REPORT; k <= HID_OUTPUT_REPORT; k++) {
>> +    for (l = HID_INPUT_REPORT; l <= HID_OUTPUT_REPORT; l++) {
>> +        if (hid->quirks & HID_QUIRK_REVERSE_CONFIGURE_USAGES)
>> +            k = HID_OUTPUT_REPORT - l + HID_INPUT_REPORT;
>> +        else
>> +            k = l;
>>            if (k == HID_OUTPUT_REPORT &&
>>                hid->quirks & HID_QUIRK_SKIP_OUTPUT_REPORTS)
>>                continue;
>>
>> -        list_for_each_entry(report, &hid->report_enum[k].report_list,
>> list) {
>> -
>> -            if (!report->maxfield)
>> -                continue;
>> -
>> -            application = report->application;
>> -
>> -            /*
>> -             * Find the previous hidinput report attached
>> -             * to this report id.
>> -             */
>> -            if (hid->quirks & HID_QUIRK_MULTI_INPUT)
>> -                hidinput = hidinput_match(report);
>> -            else if (hid->maxapplication > 1 &&
>> -                 (hid->quirks & HID_QUIRK_INPUT_PER_APP))
>> -                hidinput = hidinput_match_application(report);
>> -
>> -            if (!hidinput) {
>> -                hidinput = hidinput_allocate(hid, application);
>> -                if (!hidinput)
>> +        if (hid->quirks & HID_QUIRK_REVERSE_CONFIGURE_USAGES) {
>> +            list_for_each_entry_reverse(report,
>> + &hid->report_enum[k].report_list,
>> +                            list) {
>> +                if (!report->maxfield)
>> +                    continue;
>> +                if (hidinput_configure_usage_list(hid, report, true))
>> +                    goto out_unwind;
>> +            }
>> +        } else {
>> +            list_for_each_entry(report,
>> &hid->report_enum[k].report_list, list) {
>> +                if (!report->maxfield)
>> +                    continue;
>> +                if (hidinput_configure_usage_list(hid, report, false))
>>                        goto out_unwind;
>>                }
>> -
>> -            hidinput_configure_usages(hidinput, report);
>> -
>> -            if (hid->quirks & HID_QUIRK_MULTI_INPUT)
>> -                hidinput->report = report;
>> -
>> -            list_add_tail(&report->hidinput_list,
>> -                      &hidinput->reports);
>>            }
>>        }
>>
>> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
>> index 9af1dc8ae3a2..a59510bc76a1 100644
>> --- a/drivers/hid/hid-quirks.c
>> +++ b/drivers/hid/hid-quirks.c
>> @@ -187,6 +187,7 @@ static const struct hid_device_id hid_quirks[] = {
>>        { HID_USB_DEVICE(USB_VENDOR_ID_TURBOX,
>> USB_DEVICE_ID_TURBOX_KEYBOARD), HID_QUIRK_NOGET },
>>        { HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC,
>> USB_DEVICE_ID_UCLOGIC_TABLET_KNA5), HID_QUIRK_MULTI_INPUT },
>>        { HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC,
>> USB_DEVICE_ID_UCLOGIC_TABLET_TWA60), HID_QUIRK_MULTI_INPUT },
>> +    { HID_USB_DEVICE(USB_VENDOR_ID_UGTIZER,
>> USB_DEVICE_ID_UGTIZER_TABLET_WP5540), HID_QUIRK_REVERSE_CONFIGURE_USAGES },
>>        { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
>> USB_DEVICE_ID_WALTOP_MEDIA_TABLET_10_6_INCH), HID_QUIRK_MULTI_INPUT },
>>        { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
>> USB_DEVICE_ID_WALTOP_MEDIA_TABLET_14_1_INCH), HID_QUIRK_MULTI_INPUT },
>>        { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
>> USB_DEVICE_ID_WALTOP_SIRIUS_BATTERY_FREE_TABLET), HID_QUIRK_MULTI_INPUT },
>> diff --git a/include/linux/hid.h b/include/linux/hid.h
>> index 7487b0586fe6..61bf462ca658 100644
>> --- a/include/linux/hid.h
>> +++ b/include/linux/hid.h
>> @@ -361,6 +361,7 @@ struct hid_item {
>>    #define HID_QUIRK_INPUT_PER_APP            BIT(11)
>>    #define HID_QUIRK_X_INVERT            BIT(12)
>>    #define HID_QUIRK_Y_INVERT            BIT(13)
>> +#define HID_QUIRK_REVERSE_CONFIGURE_USAGES    BIT(14)
>>    #define HID_QUIRK_SKIP_OUTPUT_REPORTS        BIT(16)
>>    #define HID_QUIRK_SKIP_OUTPUT_REPORT_ID        BIT(17)
>>    #define HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP    BIT(18)
>> --
>> 2.34.1
>>
>>
>>
-- 
Nos leemos
		         RASTER    (Linux user #228804)
rastersoft@gmail.com                https://www.rastersoft.com

