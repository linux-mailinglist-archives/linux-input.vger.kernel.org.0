Return-Path: <linux-input+bounces-3112-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB4A8A916B
	for <lists+linux-input@lfdr.de>; Thu, 18 Apr 2024 05:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A71982820A9
	for <lists+linux-input@lfdr.de>; Thu, 18 Apr 2024 03:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E5D4F208;
	Thu, 18 Apr 2024 03:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="amkS6Lcn"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596F3433BC;
	Thu, 18 Apr 2024 03:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713409655; cv=none; b=aK2hv3sELaUQPU1nkIIJS7d8N3QjUIM9llW7QUuihpByHSUvh0w0g+CQ+RsHajxSWSySvSBzaQT3j2ZrQAIJ+kpxntrzxcvlyLuSN3mwhXONxQo1gsUkbqcL12rHngrdz4hjyBGjiOWM61L2/OP9fXSO0TDZ6ekdzMBysbGljFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713409655; c=relaxed/simple;
	bh=EOQgfIVF4B3dV+aIFM26YGLxtoN6CU+9+tjGDBiZfr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X90DbiInetnq3vDZY50QQ430/7yVh9CoZFiU8z9zxFjDeC3cnjelEQFzANJZtGbt2bXljDSljn2SbNjz6iE/rFDFBK5Ibal0eKRGkxCU2zxdJtV0tC4JzaSnxcBuiOXYslGejaThHYUYExjP1ZsUS0kq8mS7Qf1rtz03VN4N3JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=amkS6Lcn; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from [192.168.0.22] (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id E62B1A275;
	Wed, 17 Apr 2024 20:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1713409646; bh=EOQgfIVF4B3dV+aIFM26YGLxtoN6CU+9+tjGDBiZfr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=amkS6Lcn03UK/nKgtgZtmN/W0EdrDZWsf6+qr3tvM9F3v9w1ThZ3IquFyMGlNJ6P0
	 X72jGEMensYEAxME96An3tMBqSjdUtuEn6B9XZcNCB5KZb2AsSzXNg1Nr4WzhwejyS
	 A5aoWpYS9G1PUmJmOF1J+DCMA7vbnQxLc3Pz9VDRtKfy5KHTcXo5heLHiezpc/fPzW
	 I5XhxobkhUh8cCG3fUGFooHkidIYONQy5R0jjewvtfFV5zjJQ6CDnmPwmyofCw8LS6
	 lL8rOga0N9qiJUpjwNYq7TM/qw1DB4beQE+6jygqfi3Gdhs0SawMkZg6/qMMhJl5sI
	 b/0ySqvHZ8OCg==
Message-ID: <aed282d9-3a50-468d-a150-4621086299f7@endrift.com>
Date: Wed, 17 Apr 2024 20:07:25 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: hid-steam: Add Deck IMU support
To: Max Maisel <mmm-1@posteo.net>
Cc: benjamin.tissoires@redhat.com, jikos@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 rodrigorivascosta@gmail.com
References: <0a92f4da-9517-4c12-a265-eb06f909f18b@endrift.com>
 <20240417165641.12994-1-mmm-1@posteo.net>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <20240417165641.12994-1-mmm-1@posteo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/17/24 9:56 AM, Max Maisel wrote:
> On Mon, 15. Apr 2024, Vicki Pfau wrote:
>> Hi,
>>
>> On 4/12/24 4:42 AM, Jiri Kosina wrote:
>>> On Sun, 7 Apr 2024, Max Maisel wrote:
>>>
>>>> The Deck's controller features an accelerometer and gyroscope which
>>>> send their measurement values by default in the main HID input report.
>>>> Expose both sensors to userspace through a separate evdev node as it
>>>> is done by the hid-nintendo and hid-playstation drivers.
>>>>
>>>> Signed-off-by: Max Maisel <mmm-1@posteo.net>
>>>
>>> CCing Rodrigo and Vicki ... could you please take a look and Ack the patch 
>>> below from Max?
>>>
>>> Thanks.
>>>
>>>> ---
>>>>
>>>> This patch was tested on a Steam Deck running Arch Linux. With it,
>>>> applications using latest SDL2/3 git libraries will pick up the sensors
>>>> without hidraw access. This was tested against the antimicrox gamepad mapper.
>>>>
>>>> Measurement value scaling was tested by moving the deck and a dualsense
>>>> controller simultaneously and comparing their reported values in
>>>> userspace with SDL3's testcontroller tool.
>>>>
>>>>  drivers/hid/hid-steam.c | 158 ++++++++++++++++++++++++++++++++++++++--
>>>>  1 file changed, 150 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
>>>> index b08a5ab58528..af6e6c3b1356 100644
>>>> --- a/drivers/hid/hid-steam.c
>>>> +++ b/drivers/hid/hid-steam.c
>>>> @@ -66,6 +66,12 @@ static LIST_HEAD(steam_devices);
>>>>  #define STEAM_DECK_TRIGGER_RESOLUTION 5461
>>>>  /* Joystick runs are about 5 mm and 32768 units */
>>>>  #define STEAM_DECK_JOYSTICK_RESOLUTION 6553
>>>> +/* Accelerometer has 16 bit resolution and a range of +/- 2g */
>>>> +#define STEAM_DECK_ACCEL_RES_PER_G 16384
>>>> +#define STEAM_DECK_ACCEL_RANGE 32768
>>>> +/* Gyroscope has 16 bit resolution and a range of +/- 2000 dps */
>>>> +#define STEAM_DECK_GYRO_RES_PER_DPS 16
>>>> +#define STEAM_DECK_GYRO_RANGE 32000
>>
>> This value looks strange. How do you know it's not supposed to be 32768?
> 
> The "input-programming" documentation mentioned that the device must be able to
> reach its min and max values so I subtracted a little bit from the 32768.
> But with this in mind, the accelerometer max value looks wrong.

I'm pretty sure I was able to max out the accelerometer. It's not too difficult to move something at 20 m/s^2 for a short amount of time. I didn't log the data though, but in realtime I did see it getting quite close.
> 
> If you agree, I would change it to 32768 since the playstation and nintendo
> IMU drivers use powers of two derived maximum values as well.

Yeah, I see no reason to arbitrarily restrict it when it probably can go to the full range.

> 
>>>>  
>>>>  #define STEAM_PAD_FUZZ 256
>>>>  
>>>> @@ -288,6 +294,7 @@ struct steam_device {
>>>>  	struct mutex report_mutex;
>>>>  	unsigned long client_opened;
>>>>  	struct input_dev __rcu *input;
>>>> +	struct input_dev __rcu *sensors;
>>>>  	unsigned long quirks;
>>>>  	struct work_struct work_connect;
>>>>  	bool connected;
>>>> @@ -302,6 +309,7 @@ struct steam_device {
>>>>  	struct work_struct rumble_work;
>>>>  	u16 rumble_left;
>>>>  	u16 rumble_right;
>>>> +	unsigned int sensor_timestamp_us;
>>>>  };
>>>>  
>>>>  static int steam_recv_report(struct steam_device *steam,
>>>> @@ -825,6 +833,74 @@ static int steam_input_register(struct steam_device *steam)
>>>>  	return ret;
>>>>  }
>>>>  
>>>> +static int steam_sensors_register(struct steam_device *steam)
>>>> +{
>>>> +	struct hid_device *hdev = steam->hdev;
>>>> +	struct input_dev *sensors;
>>>> +	int ret;
>>>> +
>>>> +	if (!(steam->quirks & STEAM_QUIRK_DECK))
>>>> +		return 0;
>>>> +
>>>> +	rcu_read_lock();
>>>> +	sensors = rcu_dereference(steam->sensors);
>>>> +	rcu_read_unlock();
>>>> +	if (sensors) {
>>>> +		dbg_hid("%s: already connected\n", __func__);
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	sensors = input_allocate_device();
>>>> +	if (!sensors)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	input_set_drvdata(sensors, steam);
>>>> +	sensors->dev.parent = &hdev->dev;
>>>> +
>>>> +	sensors->name = "Steam Deck Motion Sensors";
>>>> +	sensors->phys = hdev->phys;
>>>> +	sensors->uniq = steam->serial_no;
>>>> +	sensors->id.bustype = hdev->bus;
>>>> +	sensors->id.vendor = hdev->vendor;
>>>> +	sensors->id.product = hdev->product;
>>>> +	sensors->id.version = hdev->version;
>>>> +
>>>> +	__set_bit(INPUT_PROP_ACCELEROMETER, sensors->propbit);
>>>> +	__set_bit(EV_MSC, sensors->evbit);
>>>> +	__set_bit(MSC_TIMESTAMP, sensors->mscbit);
>>>> +
>>>> +	input_set_abs_params(sensors, ABS_X, -STEAM_DECK_ACCEL_RANGE,
>>>> +			STEAM_DECK_ACCEL_RANGE, 16, 0);
>>>> +	input_set_abs_params(sensors, ABS_Y, -STEAM_DECK_ACCEL_RANGE,
>>>> +			STEAM_DECK_ACCEL_RANGE, 16, 0);
>>>> +	input_set_abs_params(sensors, ABS_Z, -STEAM_DECK_ACCEL_RANGE,
>>>> +			STEAM_DECK_ACCEL_RANGE, 16, 0);
>>>> +	input_abs_set_res(sensors, ABS_X, STEAM_DECK_ACCEL_RES_PER_G);
>>>> +	input_abs_set_res(sensors, ABS_Y, STEAM_DECK_ACCEL_RES_PER_G);
>>>> +	input_abs_set_res(sensors, ABS_Z, STEAM_DECK_ACCEL_RES_PER_G);
>>>> +
>>>> +	input_set_abs_params(sensors, ABS_RX, -STEAM_DECK_GYRO_RANGE,
>>>> +			STEAM_DECK_GYRO_RANGE, 16, 0);
>>>> +	input_set_abs_params(sensors, ABS_RY, -STEAM_DECK_GYRO_RANGE,
>>>> +			STEAM_DECK_GYRO_RANGE, 16, 0);
>>>> +	input_set_abs_params(sensors, ABS_RZ, -STEAM_DECK_GYRO_RANGE,
>>>> +			STEAM_DECK_GYRO_RANGE, 16, 0);
>>>> +	input_abs_set_res(sensors, ABS_RX, STEAM_DECK_GYRO_RES_PER_DPS);
>>>> +	input_abs_set_res(sensors, ABS_RY, STEAM_DECK_GYRO_RES_PER_DPS);
>>>> +	input_abs_set_res(sensors, ABS_RZ, STEAM_DECK_GYRO_RES_PER_DPS);
>>
>> I seem to recall hearing that this data is not calibrated coming off of the device, and the actual calibration data is in Steam somewhere, but I'm not sure which data this applies to. The gravitation acceleration looked fine when testing, but I didn't have a dualsense handy to test the gyro with. Have you tested this on more than one device?
> 
> I tested it with a single Steam Deck and Dualsense controller and compared
> the rotation values by eye in SDL's testcontroller tool while holding the
> Deck and Dualsense in both hands. In this test the rotation data matched
> well if compared by eye.
> 
> I repeated the test with a makeshift rotational plate and data-logging
> and got an average absolute angular velocity of about 49 degree per second
> for the Dualsense controller and 51 degree per second for the Steam Deck.
> Hence, I think the values and their scaling are fine.
> 
> I'll remove my comment above about factory calibration in the next
> patchset.

I logged some data that I gathered while swinging around a Steam Deck and Dualsense at the same time and found that once scaled they were only off by a little bit (by magnitude, because they axes weren't perfectly aligned when I collected the data), and not with a consistent scale. Graphing the data shows they're pretty close, so it seems fine.

> 
>>
>>>> +
>>>> +	ret = input_register_device(sensors);
>>>> +	if (ret)
>>>> +		goto sensors_register_fail;
>>>> +
>>>> +	rcu_assign_pointer(steam->sensors, sensors);
>>>> +	return 0;
>>>> +
>>>> +sensors_register_fail:
>>>> +	input_free_device(sensors);
>>>> +	return ret;
>>>> +}
>>>> +
>>>>  static void steam_input_unregister(struct steam_device *steam)
>>>>  {
>>>>  	struct input_dev *input;
>>>> @@ -838,6 +914,24 @@ static void steam_input_unregister(struct steam_device *steam)
>>>>  	input_unregister_device(input);
>>>>  }
>>>>  
>>>> +static void steam_sensors_unregister(struct steam_device *steam)
>>>> +{
>>>> +	struct input_dev *sensors;
>>>> +
>>>> +	if (!(steam->quirks & STEAM_QUIRK_DECK))
>>>> +		return;
>>>> +
>>>> +	rcu_read_lock();
>>>> +	sensors = rcu_dereference(steam->sensors);
>>>> +	rcu_read_unlock();
>>>> +
>>>> +	if (!sensors)
>>>> +		return;
>>>> +	RCU_INIT_POINTER(steam->sensors, NULL);
>>>> +	synchronize_rcu();
>>>> +	input_unregister_device(sensors);
>>>> +}
>>>> +
>>>>  static void steam_battery_unregister(struct steam_device *steam)
>>>>  {
>>>>  	struct power_supply *battery;
>>>> @@ -890,18 +984,28 @@ static int steam_register(struct steam_device *steam)
>>>>  	spin_lock_irqsave(&steam->lock, flags);
>>>>  	client_opened = steam->client_opened;
>>>>  	spin_unlock_irqrestore(&steam->lock, flags);
>>>> +
>>>>  	if (!client_opened) {
>>>>  		steam_set_lizard_mode(steam, lizard_mode);
>>>>  		ret = steam_input_register(steam);
>>>> -	} else
>>>> -		ret = 0;
>>>> +		if (ret != 0)
>>>> +			goto steam_register_input_fail;
>>>> +		ret = steam_sensors_register(steam);
>>>> +		if (ret != 0)
>>>> +			goto steam_register_sensors_fail;
>>>> +	}
>>>> +	return 0;
>>>>  
>>>> +steam_register_sensors_fail:
>>>> +	steam_input_unregister(steam);
>>>> +steam_register_input_fail:
>>>>  	return ret;
>>>>  }
>>>>  
>>>>  static void steam_unregister(struct steam_device *steam)
>>>>  {
>>>>  	steam_battery_unregister(steam);
>>>> +	steam_sensors_unregister(steam);
>>>>  	steam_input_unregister(steam);
>>>>  	if (steam->serial_no[0]) {
>>>>  		hid_info(steam->hdev, "Steam Controller '%s' disconnected",
>>>> @@ -1010,6 +1114,7 @@ static int steam_client_ll_open(struct hid_device *hdev)
>>>>  	steam->client_opened++;
>>>>  	spin_unlock_irqrestore(&steam->lock, flags);
>>>>  
>>>> +	steam_sensors_unregister(steam);
>>>>  	steam_input_unregister(steam);
>>>>  
>>>>  	return 0;
>>>> @@ -1030,6 +1135,7 @@ static void steam_client_ll_close(struct hid_device *hdev)
>>>>  	if (connected) {
>>>>  		steam_set_lizard_mode(steam, lizard_mode);
>>>>  		steam_input_register(steam);
>>>> +		steam_sensors_register(steam);
>>>>  	}
>>>>  }
>>>>  
>>>> @@ -1121,6 +1227,7 @@ static int steam_probe(struct hid_device *hdev,
>>>>  	INIT_DELAYED_WORK(&steam->mode_switch, steam_mode_switch_cb);
>>>>  	INIT_LIST_HEAD(&steam->list);
>>>>  	INIT_WORK(&steam->rumble_work, steam_haptic_rumble_cb);
>>>> +	steam->sensor_timestamp_us = 0;
>>>>  
>>>>  	/*
>>>>  	 * With the real steam controller interface, do not connect hidraw.
>>>> @@ -1380,12 +1487,12 @@ static void steam_do_input_event(struct steam_device *steam,
>>>>   *  18-19 | s16   | ABS_HAT0Y | left-pad Y value
>>>>   *  20-21 | s16   | ABS_HAT1X | right-pad X value
>>>>   *  22-23 | s16   | ABS_HAT1Y | right-pad Y value
>>>> - *  24-25 | s16   | --        | accelerometer X value
>>>> - *  26-27 | s16   | --        | accelerometer Y value
>>>> - *  28-29 | s16   | --        | accelerometer Z value
>>>> - *  30-31 | s16   | --        | gyro X value
>>>> - *  32-33 | s16   | --        | gyro Y value
>>>> - *  34-35 | s16   | --        | gyro Z value
>>>> + *  24-25 | s16   | IMU ABS_X | accelerometer X value
>>>> + *  26-27 | s16   | IMU ABS_Z | accelerometer Y value
>>>> + *  28-29 | s16   | IMU ABS_Y | accelerometer Z value
>>>> + *  30-31 | s16   | IMU ABS_RX | gyro X value
>>>> + *  32-33 | s16   | IMU ABS_RZ | gyro Y value
>>>> + *  34-35 | s16   | IMU ABS_RY | gyro Z value
>>>>   *  36-37 | s16   | --        | quaternion W value
>>>>   *  38-39 | s16   | --        | quaternion X value
>>>>   *  40-41 | s16   | --        | quaternion Y value
>>>> @@ -1546,6 +1653,32 @@ static void steam_do_deck_input_event(struct steam_device *steam,
>>>>  	input_sync(input);
>>>>  }
>>>>  
>>>> +static void steam_do_deck_sensors_event(struct steam_device *steam,
>>>> +		struct input_dev *sensors, u8 *data)
>>>> +{
>>>> +	/*
>>>> +	 * The deck input report is received every 4 ms on average,
>>>> +	 * with a jitter of +/- 4 ms even though the USB descriptor claims
>>>> +	 * that it uses 1 kHz.
>>>> +	 * Since the HID report does not include a sensor timestamp,
>>>> +	 * use a fixed increment here.
>>>> +	 *
>>>> +	 * The reported sensors data is factory calibrated by default so
>>>> +	 * no extra logic for handling calibratrion is necessary.
>>>> +	 */
>>>> +	steam->sensor_timestamp_us += 4000;
>>>> +	input_event(sensors, EV_MSC, MSC_TIMESTAMP, steam->sensor_timestamp_us);
>>>> +
>>>> +	input_report_abs(sensors, ABS_X, steam_le16(data + 24));
>>>> +	input_report_abs(sensors, ABS_Z, -steam_le16(data + 26));
>>>> +	input_report_abs(sensors, ABS_Y, steam_le16(data + 28));
>>>> +	input_report_abs(sensors, ABS_RX, steam_le16(data + 30));
>>>> +	input_report_abs(sensors, ABS_RZ, -steam_le16(data + 32));
>>>> +	input_report_abs(sensors, ABS_RY, steam_le16(data + 34));
>>>> +
>>>> +	input_sync(sensors);
>>>> +}
>>>> +
>>>>  /*
>>>>   * The size for this message payload is 11.
>>>>   * The known values are:
>>>> @@ -1583,6 +1716,7 @@ static int steam_raw_event(struct hid_device *hdev,
>>>>  {
>>>>  	struct steam_device *steam = hid_get_drvdata(hdev);
>>>>  	struct input_dev *input;
>>>> +	struct input_dev *sensors;
>>>>  	struct power_supply *battery;
>>>>  
>>>>  	if (!steam)
>>>> @@ -1629,6 +1763,14 @@ static int steam_raw_event(struct hid_device *hdev,
>>>>  		if (likely(input))
>>>>  			steam_do_deck_input_event(steam, input, data);
>>>>  		rcu_read_unlock();
>>>> +
>>>> +		if (steam->quirks & STEAM_QUIRK_DECK) {
>>
>> This report ID is only sent on the Steam Deck. Checking the quirk here is unnecessary, especially since it'll just be null and fail out if something weird happens and we get this report on a non-Deck device.
> 
> You're right, I'll change it.
> 
>>
>>>> +			rcu_read_lock();
>>>> +			sensors = rcu_dereference(steam->sensors);
>>>> +			if (likely(sensors))
>>>> +				steam_do_deck_sensors_event(steam, sensors, data);
>>>> +			rcu_read_unlock();
>>>> +		}
>>>>  		break;
>>>>  	case ID_CONTROLLER_WIRELESS:
>>>>  		/*
>>>>
>>>> base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
>>>> -- 
>>>> 2.44.0
>>>>
>>>
>>
>> Implementation looks mostly fine. However, I had some discussion with people at Valve about this who said they'd like the IMU to be silenced when gamepad mode is disabled the same way the gamepad data is.
>>
>> Vicki
> 
> I'll add a check for gamepad_mode to the sensors event.
> 
> Thank you for your feedback.
> 
> Max

With those changes it'll probably be fine.

Vicki

