Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 856FC12A59
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2019 11:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbfECJWQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 May 2019 05:22:16 -0400
Received: from mx4.wp.pl ([212.77.101.12]:53706 "EHLO mx4.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbfECJWQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 May 2019 05:22:16 -0400
Received: (wp-smtpd smtp.wp.pl 15166 invoked from network); 3 May 2019 11:22:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1556875332; bh=GEshtnqIYYZFrwLt+PDrblczKzunXgnIFfS/61z3xfg=;
          h=Subject:To:Cc:From;
          b=svEcGncOWG5uDdAea3/4X3uky+g7bwmKsU0JiMFqBtVVf6/+JVcrvO69JTbUBhc1L
           ujcKpzJ04etI0lVcWuz0upOjwBzg7D8lDgL8FoEHZpk898wZe9exFymHPfMtVPaDPl
           tiueAjM47kbjOynN1EW9r5FBSxvAZdBW+1fksseg=
Received: from pc-201-108-240-185-static.strong-pc.com (HELO [192.168.0.9]) (spaz16@wp.pl@[185.240.108.201])
          (envelope-sender <spaz16@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linux-kernel@vger.kernel.org>; 3 May 2019 11:22:12 +0200
Subject: Re: [PATCH] HID: fix A4Tech horizontal scrolling
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     igorkuo@gmail.com, Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20190502213639.7632-1-spaz16@wp.pl>
 <CAO-hwJLbFv3S9M5N+BKBuafj8H-vToy=2VQd=cvohmaTHLMC3A@mail.gmail.com>
From:   =?UTF-8?B?QsWCYcW8ZWogU3pjenlnaWXFgg==?= <spaz16@wp.pl>
Message-ID: <70982912-b172-b5dd-a875-fd0e7b378430@wp.pl>
Date:   Fri, 3 May 2019 11:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJLbFv3S9M5N+BKBuafj8H-vToy=2VQd=cvohmaTHLMC3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GH
Content-Transfer-Encoding: 8bit
X-WP-MailID: 47bc0eb0d8531d3a9a08b3616fce268f
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [QdMk]                               
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I used the hid-record tool and my results are here:
https://gitlab.com/snippets/1853568

Cheers,
Błażej

> Hi,
> 
> On Thu, May 2, 2019 at 11:37 PM Błażej Szczygieł <spaz16@wp.pl> wrote:
>>
>> Since recent high resolution scrolling changes the A4Tech driver must
>> check for the "REL_WHEEL_HI_RES" usage code.
>>
>> Fixes: 2dc702c991e3774af9d7ce410eef410ca9e2357e (HID: input: use the
>> Resolution Multiplier for high-resolution scrolling)
>>
>> Signed-off-by: Błażej Szczygieł <spaz16@wp.pl>
> 
> Thanks for the patch. I do not doubt this fixes the issues, but I
> still wonder if we should not export REL_HWHEEL_HI_RES instead of
> REL_HWHEEL events.
> 
> Also, I can not figure out how the events are processed by the kernel.
> Could you attach a hid-recorder dump of the mouse wheels with
> hid-recorder from https://gitlab.freedesktop.org/libevdev/hid-tools ?
> 
> This should give me a better view of the mouse, and I could also add
> it to the regression tests I am running for each commit.
> 
> Cheers,
> Benjamin
> 
>> ---
>>   drivers/hid/hid-a4tech.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hid/hid-a4tech.c b/drivers/hid/hid-a4tech.c
>> index 9428ea7cdf8a..fafb9fa558e7 100644
>> --- a/drivers/hid/hid-a4tech.c
>> +++ b/drivers/hid/hid-a4tech.c
>> @@ -38,7 +38,7 @@ static int a4_input_mapped(struct hid_device *hdev, struct hid_input *hi,
>>   {
>>          struct a4tech_sc *a4 = hid_get_drvdata(hdev);
>>
>> -       if (usage->type == EV_REL && usage->code == REL_WHEEL)
>> +       if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES)
>>                  set_bit(REL_HWHEEL, *bit);
>>
>>          if ((a4->quirks & A4_2WHEEL_MOUSE_HACK_7) && usage->hid == 0x00090007)
>> @@ -60,7 +60,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>>          input = field->hidinput->input;
>>
>>          if (a4->quirks & A4_2WHEEL_MOUSE_HACK_B8) {
>> -               if (usage->type == EV_REL && usage->code == REL_WHEEL) {
>> +               if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES) {
>>                          a4->delayed_value = value;
>>                          return 1;
>>                  }
>> @@ -77,7 +77,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>>                  return 1;
>>          }
>>
>> -       if (usage->code == REL_WHEEL && a4->hw_wheel) {
>> +       if (usage->code == REL_WHEEL_HI_RES && a4->hw_wheel) {
>>                  input_event(input, usage->type, REL_HWHEEL, value);
>>                  return 1;
>>          }
>> --
>> 2.21.0
>>
