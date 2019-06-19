Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABED4BD19
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 17:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfFSPkC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 11:40:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37526 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfFSPkC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 11:40:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4836560300; Wed, 19 Jun 2019 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560958800;
        bh=N7OYhxJf4HieDElspvISZS06uvWIa6aZs0RQzxGXlFw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KzSJtbNsOFKEL2Fn7y6uxBTqGbhwDR5SFtOyOdCNwGDGfrHNBQoWptwJItgbT9UbY
         Y5sIDfaGBfOwZiorqyv/J19mtNkgTmMtQdM2UByYRNNN8FKWuNeNrrumVIjLDXNQNC
         UnqT2Ha0GGvHyD5iWkIUzZsAyLcMkZDpEzyPZZ58=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6286E60850;
        Wed, 19 Jun 2019 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560958799;
        bh=N7OYhxJf4HieDElspvISZS06uvWIa6aZs0RQzxGXlFw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AOXyrESbQfXfIszltxu3JVMVMxIhqIRrmSvIvxz5LEUst3PaE6xkZ95dHsURHsgGi
         YN7LK0nGinFaRgSj46bqQOze8GJAFpjY6wv+i8C7okau93fAlE+/dIX5OoCV/SdX6+
         F9/1gg+WzU+hY8k4/9YFHpOVrL1DY1fBa0JDcEOg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6286E60850
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v6 2/5] HID: quirks: Refactor ELAN 400 and 401 handling
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, xnox@ubuntu.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
 <20190612212721.32195-1-jeffrey.l.hugo@gmail.com>
 <20190612214636.GA40779@dtor-ws>
 <84e7d83f-e133-0281-612a-94d8c4319040@codeaurora.org>
 <CAO-hwJJUivfzFj-Downqt8nY3iTwF8-oq_iBqs1Dxyx92HdYPw@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <e480240e-993b-5f09-f29c-7b5c57a67260@codeaurora.org>
Date:   Wed, 19 Jun 2019 09:39:57 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJJUivfzFj-Downqt8nY3iTwF8-oq_iBqs1Dxyx92HdYPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 6/13/2019 2:55 AM, Benjamin Tissoires wrote:
> On Thu, Jun 13, 2019 at 12:20 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 6/12/2019 3:46 PM, Dmitry Torokhov wrote:
>>> On Wed, Jun 12, 2019 at 02:27:21PM -0700, Jeffrey Hugo wrote:
>>>> There needs to be coordination between hid-quirks and the elan_i2c driver
>>>> about which devices are handled by what drivers.  Currently, both use
>>>> whitelists, which results in valid devices being unhandled by default,
>>>> when they should not be rejected by hid-quirks.  This is quickly becoming
>>>> an issue.
>>>>
>>>> Since elan_i2c has a maintained whitelist of what devices it will handle,
>>>> which is now in a header file that hid-quirks can access, use that to
>>>> implement a blacklist in hid-quirks so that only the devices that need to
>>>> be handled by elan_i2c get rejected by hid-quirks, and everything else is
>>>> handled by default.
>>>>
>>>> Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>>>> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>>>> ---
>>>>    drivers/hid/hid-quirks.c | 27 ++++++++++++++++-----------
>>>>    1 file changed, 16 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
>>>> index e5ca6fe2ca57..bd81bb090222 100644
>>>> --- a/drivers/hid/hid-quirks.c
>>>> +++ b/drivers/hid/hid-quirks.c
>>>> @@ -16,6 +16,7 @@
>>>>    #include <linux/export.h>
>>>>    #include <linux/slab.h>
>>>>    #include <linux/mutex.h>
>>>> +#include <linux/input/elan-i2c-ids.h>
>>>>
>>>>    #include "hid-ids.h"
>>>>
>>>> @@ -914,6 +915,8 @@ static const struct hid_device_id hid_mouse_ignore_list[] = {
>>>>
>>>>    bool hid_ignore(struct hid_device *hdev)
>>>>    {
>>>> +    int i;
>>>> +
>>>>       if (hdev->quirks & HID_QUIRK_NO_IGNORE)
>>>>               return false;
>>>>       if (hdev->quirks & HID_QUIRK_IGNORE)
>>>> @@ -978,18 +981,20 @@ bool hid_ignore(struct hid_device *hdev)
>>>>               break;
>>>>       case USB_VENDOR_ID_ELAN:
>>>>               /*
>>>> -             * Many Elan devices have a product id of 0x0401 and are handled
>>>> -             * by the elan_i2c input driver. But the ACPI HID ELAN0800 dev
>>>> -             * is not (and cannot be) handled by that driver ->
>>>> -             * Ignore all 0x0401 devs except for the ELAN0800 dev.
>>>> +             * Blacklist of everything that gets handled by the elan_i2c
>>>> +             * input driver.  This avoids disabling valid touchpads and
>>>> +             * other ELAN devices.
>>>>                */
>>>> -            if (hdev->product == 0x0401 &&
>>>> -                strncmp(hdev->name, "ELAN0800", 8) != 0)
>>>> -                    return true;
>>>> -            /* Same with product id 0x0400 */
>>>> -            if (hdev->product == 0x0400 &&
>>>> -                strncmp(hdev->name, "QTEC0001", 8) != 0)
>>>> -                    return true;
>>>> +            if ((hdev->product == 0x0401 || hdev->product == 0x0400)) {
>>>> +                    for (i = 0; strlen(elan_acpi_id[i].id); ++i)
>>>> +                            if (!strncmp(hdev->name, elan_acpi_id[i].id,
>>>> +                                         strlen(elan_acpi_id[i].id)))
>>>> +                                    return true;
>>>> +                    for (i = 0; strlen(elan_of_match[i].name); ++i)
>>>> +                            if (!strncmp(hdev->name, elan_of_match[i].name,
>>>> +                                         strlen(elan_of_match[i].name)))
>>>> +                                    return true;
>>>
>>> Do we really need to blacklist the OF case here? I thought that in ACPI
>>> case we have clashes as HID gets matched by elan_i2c and CID is matched
>>> by i2c-hid, but I do not believe we'll run into the same situation on OF
>>> systems.
>>
>> I think its the safer approach.
>>
>> On an OF system, such as patch 3 in the series, the "hid-over-i2c" will
>> end up running through this (kind of the whole reason why this series
>> exists).  The vendor and product ids will still match, so we'll end up
>> going through the lists to see if the hdev->name (the compatible string)
>> will match the blacklist.  "hid-over-i2c" won't match the blacklist, but
>> if there is a more specific compatible, it might.
>>
>> In that case, not matching OF would work, however how it could break
>> today is if both "hid-over-i2c" and "elan,ekth3000" were listed for the
>> same device, and elan_i2c was not compiled.  In that case, if we skip
>> the OF part of the black list, hid-quirks will not reject the device,
>> and you'll probably have some odd behavior instead of the obvious "the
>> device doesn't work because the correct driver isn't present" behavior.
>>
>> While that scenario might be far fetched since having both
>> "hid-over-i2c" and "elan,ekth3000" probably violates the OF bindings,
>> its still safer to include the OF case in the blacklist against future
>> scenarios.
>>
>>
> 
> Dmitry, if you are happy with Jeffrey's answer, feel free to take this
> through your tree and add:
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> 
> I don't expect any major conflicts given on where the code is located.

Ping?

Dmitry, are you happy with things?  I would really like to see this 
queued for 5.3, and it seems like the window to do so is rapidly closing.

