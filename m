Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2FD251CBB2
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 23:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbiEEWBB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 18:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386079AbiEEWA5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 18:00:57 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB4E5C743
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 14:57:15 -0700 (PDT)
Received: from [192.168.0.23] (unknown [50.106.20.54])
        by endrift.com (Postfix) with ESMTPSA id 8017DA1E6;
        Thu,  5 May 2022 14:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1651787834; bh=Ilx2yDWepe2bWLA1XuRYDIKMj9E+qw4i6WKuY29FZt0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kkTgng7cLiaFPuO+toHrlMPJrJqAGy5vURfxPmsvh1rqNM9hbwCBNwnciWFJmrUdX
         1AFRMImPQLni+LFhSumgJOQz4bVUvKj7sPULMMGPHNy2pqpD83tWO5aebQU+1KL60F
         /vEqQGldhJ8BiQ6YCju84qMSI9B3a3WuFoVoPwCJqpEIINLtxMmTSGy1mO3hXtleYb
         IVstAn809+6hSkMVtedzMCczMxRhQ7MvGsUVeBqYE6myuB3r0AjAT0K8P9xQfYwy5+
         AEL9U89G+avmnbUMXxA7eNAz6yBFv3sctIiR1gDGe1aRjABlCuEn0bIpuDC1ZiaOIH
         iIF5zC8Zy8POA==
Message-ID: <267323e2-2b0f-8b3b-ef8f-68a60f701e52@endrift.com>
Date:   Thu, 5 May 2022 14:57:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/6] HID: hid-playstation: Allow removal of touchpad
Content-Language: en-US
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20220427224526.35657-1-vi@endrift.com>
 <CAO-hwJKLr0z98bpt7QnvVWp2QzqDq6jCW+Lj0CgWW0vhYZuNLg@mail.gmail.com>
From:   Vicki Pfau <vi@endrift.com>
In-Reply-To: <CAO-hwJKLr0z98bpt7QnvVWp2QzqDq6jCW+Lj0CgWW0vhYZuNLg@mail.gmail.com>
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

On 5/5/22 01:50, Benjamin Tissoires wrote:
> Hi Vicki,
> 
> On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
>>
>> This allows the touchpad input_dev to be removed and have the driver remain
>> functional without its presence. This will be used to allow the touchpad to
>> be disabled, e.g. by a module parameter.
> 
> Thanks for the contribution.
> I'd like to hear from Roderick, but I have a general comment here:
> We had Wii and Steam controllers following this logic. Now we are
> adding Sony PS ones... That seems like a lot of duplication, and I
> wonder if we should not have something more generic.
> 
> We are working on an ioctl to revoke hidraw nodes and I wonder if we
> should not take this opportunity to have a more generic mechanism in
> HID to also disable input events when the hidraw node is opened...

I would much rather that. I (attempted) to start a discussion on this a few weeks ago (https://lore.kernel.org/linux-input/b5f229c3-26e5-4fe1-aecb-504aa3c38bee@endrift.com/T/) but no one replied, so I went ahead and implemented what I assumed would be a substandard implementation, if at the very least so my sponsor would be happy, and as an attempt to start the conversation again.

> 
> One comment on the code itself below.
> 
>>
>> Signed-off-by: Vicki Pfau <vi@endrift.com>
>> ---
>>  drivers/hid/hid-playstation.c | 60 +++++++++++++++++++++++++----------
>>  1 file changed, 43 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
>> index ab7c82c2e886..f859a8dd8a2e 100644
>> --- a/drivers/hid/hid-playstation.c
>> +++ b/drivers/hid/hid-playstation.c
>> @@ -29,6 +29,7 @@ static DEFINE_IDA(ps_player_id_allocator);
>>  struct ps_device {
>>         struct list_head list;
>>         struct hid_device *hdev;
>> +       struct mutex mutex;
>>         spinlock_t lock;
>>
>>         uint32_t player_id;
>> @@ -130,7 +131,7 @@ struct dualsense {
>>         struct ps_device base;
>>         struct input_dev *gamepad;
>>         struct input_dev *sensors;
>> -       struct input_dev *touchpad;
>> +       struct input_dev __rcu *touchpad;
>>
>>         /* Calibration data for accelerometer and gyroscope. */
>>         struct ps_calibration_data accel_calib_data[3];
>> @@ -590,6 +591,22 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
>>         return touchpad;
>>  }
>>
>> +static void dualsense_unregister_touchpad(struct dualsense *ds)
>> +{
>> +       struct input_dev *touchpad;
>> +
>> +       rcu_read_lock();
>> +       touchpad = rcu_dereference(ds->touchpad);
>> +       rcu_read_unlock();
>> +
>> +       if (!touchpad)
>> +               return;
>> +
>> +       RCU_INIT_POINTER(ds->touchpad, NULL);
>> +       synchronize_rcu();
>> +       input_unregister_device(touchpad);
>> +}
>> +
>>  static ssize_t firmware_version_show(struct device *dev,
>>                                 struct device_attribute
>>                                 *attr, char *buf)
>> @@ -888,6 +905,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>>         struct hid_device *hdev = ps_dev->hdev;
>>         struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
>>         struct dualsense_input_report *ds_report;
>> +       struct input_dev *touchpad = NULL;
>>         uint8_t battery_data, battery_capacity, charging_status, value;
>>         int battery_status;
>>         uint32_t sensor_timestamp;
>> @@ -1002,24 +1020,29 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>>         input_event(ds->sensors, EV_MSC, MSC_TIMESTAMP, ds->sensor_timestamp_us);
>>         input_sync(ds->sensors);
>>
>> -       for (i = 0; i < ARRAY_SIZE(ds_report->points); i++) {
>> -               struct dualsense_touch_point *point = &ds_report->points[i];
>> -               bool active = (point->contact & DS_TOUCH_POINT_INACTIVE) ? false : true;
>> +       rcu_read_lock();
>> +       touchpad = rcu_dereference(ds->touchpad);
>> +       rcu_read_unlock();
>> +       if (touchpad) {
> 
> Access to touchpad should probably be guarded under RCU (that's what I
> understand when I read
> https://www.kernel.org/doc/html/latest/RCU/whatisRCU.html#rcu-dereference)

Ah, I'm new to this so I overlooked that. I'll fix this in a v2, if it's even worth having a v2 given that, as I said, I would really rather not have implemented it this way in the first place.

> 
>> +               for (i = 0; i < ARRAY_SIZE(ds_report->points); i++) {
>> +                       struct dualsense_touch_point *point = &ds_report->points[i];
>> +                       bool active = (point->contact & DS_TOUCH_POINT_INACTIVE) ? false : true;
>>
>> -               input_mt_slot(ds->touchpad, i);
>> -               input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
>> +                       input_mt_slot(ds->touchpad, i);
>> +                       input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
>>
>> -               if (active) {
>> -                       int x = (point->x_hi << 8) | point->x_lo;
>> -                       int y = (point->y_hi << 4) | point->y_lo;
>> +                       if (active) {
>> +                               int x = (point->x_hi << 8) | point->x_lo;
>> +                               int y = (point->y_hi << 4) | point->y_lo;
>>
>> -                       input_report_abs(ds->touchpad, ABS_MT_POSITION_X, x);
>> -                       input_report_abs(ds->touchpad, ABS_MT_POSITION_Y, y);
>> +                               input_report_abs(ds->touchpad, ABS_MT_POSITION_X, x);
>> +                               input_report_abs(ds->touchpad, ABS_MT_POSITION_Y, y);
>> +                       }
>>                 }
>> +               input_mt_sync_frame(ds->touchpad);
>> +               input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
>> +               input_sync(ds->touchpad);
>>         }
>> -       input_mt_sync_frame(ds->touchpad);
>> -       input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
>> -       input_sync(ds->touchpad);
>>
>>         battery_data = ds_report->status & DS_STATUS_BATTERY_CAPACITY;
>>         charging_status = (ds_report->status & DS_STATUS_CHARGING) >> DS_STATUS_CHARGING_SHIFT;
>> @@ -1141,6 +1164,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>>  {
>>         struct dualsense *ds;
>>         struct ps_device *ps_dev;
>> +       struct input_dev *touchpad;
>>         uint8_t max_output_report_size;
>>         int ret;
>>
>> @@ -1157,6 +1181,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>>         ps_dev = &ds->base;
>>         ps_dev->hdev = hdev;
>>         spin_lock_init(&ps_dev->lock);
>> +       mutex_init(&ps_dev->mutex);
> 
> This mutex is never used.

The mutex is used in both patch 2 and 3, so I put it here in case either 2 or 3 is rejected, but not the other.

> 
> Cheers,
> Benjamin
> 
>>         ps_dev->battery_capacity = 100; /* initial value until parse_report. */
>>         ps_dev->battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
>>         ps_dev->parse_report = dualsense_parse_report;
>> @@ -1204,11 +1229,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>>                 goto err;
>>         }
>>
>> -       ds->touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
>> -       if (IS_ERR(ds->touchpad)) {
>> -               ret = PTR_ERR(ds->touchpad);
>> +       touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
>> +       if (IS_ERR(touchpad)) {
>> +               ret = PTR_ERR(touchpad);
>>                 goto err;
>>         }
>> +       rcu_assign_pointer(ds->touchpad, touchpad);
>>
>>         ret = ps_device_register_battery(ps_dev);
>>         if (ret)
>> --
>> 2.36.0
>>
> 

Thanks,
Vicki
