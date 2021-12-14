Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8155E4742EC
	for <lists+linux-input@lfdr.de>; Tue, 14 Dec 2021 13:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhLNMut (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Dec 2021 07:50:49 -0500
Received: from mga18.intel.com ([134.134.136.126]:17107 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232332AbhLNMus (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Dec 2021 07:50:48 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="225829147"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="225829147"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 04:50:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="518224917"
Received: from maboudiw-mobl1.ger.corp.intel.com (HELO [10.252.53.239]) ([10.252.53.239])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 04:50:46 -0800
Subject: Re: [PATCHv4 2/5] HID: hid-input: Add suffix also for HID_DG_PEN
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
References: <20211210111138.1248187-1-tero.kristo@linux.intel.com>
 <20211210111138.1248187-3-tero.kristo@linux.intel.com>
 <c8854f9b-8200-ee10-fe83-77a776ddff95@redhat.com>
 <fb99885c-a9ff-d3e7-ce72-a123cadcd9da@linux.intel.com>
 <CAO-hwJKk55uDCaEr5MVZCUc1p215a3kZqq5zi3oE3fhED7Yavg@mail.gmail.com>
From:   Tero Kristo <tero.kristo@linux.intel.com>
Message-ID: <3ff83be0-7732-053e-8d5a-818049070e8a@linux.intel.com>
Date:   Tue, 14 Dec 2021 14:50:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJKk55uDCaEr5MVZCUc1p215a3kZqq5zi3oE3fhED7Yavg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 14/12/2021 14:35, Benjamin Tissoires wrote:
> On Fri, Dec 10, 2021 at 6:51 PM Tero Kristo <tero.kristo@linux.intel.com> wrote:
>>
>> On 10/12/2021 18:21, Benjamin Tissoires wrote:
>>>
>>> On Fri, Dec 10, 2021 at 12:12 PM Tero Kristo
>>> <tero.kristo@linux.intel.com> wrote:
>>>> From: Mika Westerberg <mika.westerberg@linux.intel.com>
>>>>
>>>> This and HID_DG_STYLUS are pretty much the same thing so add suffix for
>>>> HID_DG_PEN too. This makes the input device name look better.
>>>>
>>>> While doing this, remove the suffix override from hid-multitouch, as it
>>>> is now handled by hid-input. Also, the suffix override done by
>>>> hid-multitouch was wrong, as it mapped HID_DG_PEN => "Stylus" and
>>>> HID_DG_STYLUS => "Pen".
>>> FWIW, I was thinking at the following:
>>> ---
>>> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
>>> index 837585f4e673..fe0da7bf24a9 100644
>>> --- a/drivers/hid/hid-input.c
>>> +++ b/drivers/hid/hid-input.c
>>> @@ -1775,6 +1775,15 @@ static struct hid_input
>>> *hidinput_allocate(struct hid_device *hid,
>>>                          suffix = "Mouse";
>>>                          break;
>>>                  case HID_DG_PEN:
>>> +                       /*
>>> +                        * yes, there is an issue here:
>>> +                        *  DG_PEN -> "Stylus"
>>> +                        *  DG_STYLUS -> "Pen"
>>> +                        * But changing this now means users with
>>> config snippets
>>> +                        * will have to change it and the test suite
>>> will not be happy.
>>> +                        */
>>> +                       suffix = "Stylus";
>>> +                       break;
>>>                  case HID_DG_STYLUS:
>>>                          suffix = "Pen";
>>>                          break;
>>> ---
>>>
>>> Because the current patch breaks the test suite.
>> Ah I see, do you want me to re-post in this form?
> Nah, no need for a repost. I fixed the patch locally and pushed to
> for-5.17/core.

Thanks a lot!

-Tero


> Cheers,
> Benjamin
>
>> -Tero
>>
>>> Cheers,
>>> Benjamin
>>>
>>>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>>> Signed-off-by: Tero Kristo <tero.kristo@linux.intel.com>
>>>> ---
>>>>   drivers/hid/hid-input.c      | 1 +
>>>>   drivers/hid/hid-multitouch.c | 3 ---
>>>>   2 files changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
>>>> index ad718ceb8af3..78205e445652 100644
>>>> --- a/drivers/hid/hid-input.c
>>>> +++ b/drivers/hid/hid-input.c
>>>> @@ -1741,6 +1741,7 @@ static struct hid_input
>>>> *hidinput_allocate(struct hid_device *hid,
>>>>                  case HID_GD_MOUSE:
>>>>                          suffix = "Mouse";
>>>>                          break;
>>>> +               case HID_DG_PEN:
>>>>                  case HID_DG_STYLUS:
>>>>                          suffix = "Pen";
>>>>                          break;
>>>> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
>>>> index 082376a6cb3d..99eabfb4145b 100644
>>>> --- a/drivers/hid/hid-multitouch.c
>>>> +++ b/drivers/hid/hid-multitouch.c
>>>> @@ -1606,9 +1606,6 @@ static int mt_input_configured(struct
>>>> hid_device *hdev, struct hid_input *hi)
>>>>          case HID_DG_STYLUS:
>>>>                  /* force BTN_STYLUS to allow tablet matching in udev */
>>>>                  __set_bit(BTN_STYLUS, hi->input->keybit);
>>>> -               fallthrough;
>>>> -       case HID_DG_PEN:
>>>> -               suffix = "Stylus";
>>>>                  break;
>>>>          default:
>>>>                  suffix = "UNKNOWN";
>>>> --
>>>> 2.25.1
>>>>
