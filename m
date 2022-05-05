Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 110BD51CBCC
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 00:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbiEEWEo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 18:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348580AbiEEWEn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 18:04:43 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE925DA05
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 15:01:00 -0700 (PDT)
Received: from [192.168.0.23] (unknown [50.106.20.54])
        by endrift.com (Postfix) with ESMTPSA id 9E039A1E6;
        Thu,  5 May 2022 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1651788060; bh=x/zqgL+9713vlgdtVvOiMFuJIifOm+EEH9/z5J0G7yw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=bQz/wEqoaDfOKWtyRACl/ClsxDMnrF/2+TUUQAQz75u5P0YQX07kN/xl8ygli78yt
         UfI7h2Q5PRvm9GSEhfCgjFbzirQgy9b07UW5Ur6jAIMCADtoNCuFqU09m+8pq0jT+8
         q/3E+pGrXEWvHfwpcq87s1Cur9Y4lISQnZgjPY1Pp2gYPY6B71WfLoZWKN/2j3+jc6
         Y6wIEqivGl/1maMuudPfori2dX8O7V2s3S6qds7FqY1mAkL0BqWFOFSoEZXKYCnmM7
         uZi4b76lI8LG1nmPqRQvyBTdBItjKZpQ+azCUtbkaCFjaAz56kEkGRrE72AAKo9Mk1
         yzWFAUK6ihtzg==
Message-ID: <abfedaa1-3e50-3653-a6dd-08c2b8077cca@endrift.com>
Date:   Thu, 5 May 2022 15:00:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/6] HID: hid-playstation: Add touchpad_mouse param
Content-Language: en-US
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20220427224526.35657-1-vi@endrift.com>
 <20220427224526.35657-2-vi@endrift.com>
 <CAO-hwJ+ekkNpyXwdWmCW3mLqayNExVfC8gxR4MZYxmSXBa0NXQ@mail.gmail.com>
From:   Vicki Pfau <vi@endrift.com>
In-Reply-To: <CAO-hwJ+ekkNpyXwdWmCW3mLqayNExVfC8gxR4MZYxmSXBa0NXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

On 5/5/22 01:52, Benjamin Tissoires wrote:
> Hi Vicki,
> 
> On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
>>
>> Add parameter "touchpad_mouse" to enable disabling or re-enabling exposing the
>> touchpad input_dev, which can be changed while the module is loaded.
> 
> What's the point of exposing this new parameter?
> Patch 3/6 automatically disables touchpad when hidraw is opened, so
> who will be the user of this parameter?

Generally speaking, the touchpad shows up as a mouse, even though on other OSes it is only presented via gamepad APIs. This is, well, very frustrating for a lot of users, and having to tell libinput or evdev or xinput or whatever to ignore it every time you plug it in (if you're not using the hidraw directly) is...suboptimal. This was an attempt at a way to just generically say "don't do that".

> 
> The problem I have with kernel parameter is that they are effectively
> kernel API, and we need to keep them forever, so I'd rather have good
> arguments on why this is needed.

Ah, this is probably not a good enough argument to justify that then. Some other way will probably be preferred.

> 
> Cheers,
> Benjamin
> 
>>
>> Signed-off-by: Vicki Pfau <vi@endrift.com>
>> ---
>>  drivers/hid/hid-playstation.c | 41 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
>> index f859a8dd8a2e..ad0da4470615 100644
>> --- a/drivers/hid/hid-playstation.c
>> +++ b/drivers/hid/hid-playstation.c
>> @@ -23,6 +23,8 @@ static LIST_HEAD(ps_devices_list);
>>
>>  static DEFINE_IDA(ps_player_id_allocator);
>>
>> +static bool touchpad_mouse = true;
>> +
>>  #define HID_PLAYSTATION_VERSION_PATCH 0x8000
>>
>>  /* Base class for playstation devices. */
>> @@ -1343,6 +1345,45 @@ static void ps_remove(struct hid_device *hdev)
>>         hid_hw_stop(hdev);
>>  }
>>
>> +static int ps_param_set_touchpad_mouse(const char *val,
>> +                                       const struct kernel_param *kp)
>> +{
>> +       struct ps_device *dev;
>> +       struct dualsense *ds;
>> +       struct input_dev *touchpad;
>> +       int ret;
>> +
>> +       ret = param_set_bool(val, kp);
>> +       if (ret)
>> +               return ret;
>> +
>> +       mutex_lock(&ps_devices_lock);
>> +       list_for_each_entry(dev, &ps_devices_list, list) {
>> +               mutex_lock(&dev->mutex);
>> +               if (dev->hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
>> +                       ds = container_of(dev, struct dualsense, base);
>> +                       if (touchpad_mouse) {
>> +                               touchpad = ps_touchpad_create(dev->hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
>> +                               if (IS_ERR(touchpad))
>> +                                       continue;
>> +                               rcu_assign_pointer(ds->touchpad, touchpad);
>> +                       } else
>> +                               dualsense_unregister_touchpad(ds);
>> +               }
>> +               mutex_unlock(&dev->mutex);
>> +       }
>> +       mutex_unlock(&ps_devices_lock);
>> +       return 0;
>> +}
>> +
>> +static const struct kernel_param_ops ps_touchpad_mouse_ops = {
>> +       .set    = ps_param_set_touchpad_mouse,
>> +       .get    = param_get_bool,
>> +};
>> +
>> +module_param_cb(touchpad_mouse, &ps_touchpad_mouse_ops, &touchpad_mouse, 0644);
>> +MODULE_PARM_DESC(touchpad_mouse, "Enable mouse emulation using the touchpad");
>> +
>>  static const struct hid_device_id ps_devices[] = {
>>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
>>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
>> --
>> 2.36.0
>>
> 

Vicki
