Return-Path: <linux-input+bounces-11805-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1BA8B9B4
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 14:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F733441452
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 12:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2D314B945;
	Wed, 16 Apr 2025 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="MZy5SUD5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87A511CA0;
	Wed, 16 Apr 2025 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808358; cv=none; b=EqKbuvnXyoRNAkvckR5YHov1nq9WGTnE5vVv+Sf01vL6NpSUVKY5Gp7u1iJTkcAi2cL3g+qHvooMssgMDhFZ8ErhjepA/nAq9m1nhHYCCMAxH58VBEFeoA0GA1l83BatvT/N1p9HB4Trh/Vdwz68JS7qEU3H6HTydwzY80pxUak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808358; c=relaxed/simple;
	bh=1tqE8NEhCBUe0DW5OL55bzVinX2sVhvzB7EUP4GGoyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G17RZvV3fbniC+eRNuxOKiossY9E6tX/s6TPmk0+g+X5WD10PAqhX4l5WWEdwgJGccRim+0G+PZcpfQURtb0v7JEOurNzb9CZM88L64YMu1fkybsNnLyKajX8g8pwIuCpFCtMfVn964GCgGSN0iSMN4tS84A7ET4XRp/G/NalMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=MZy5SUD5; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [10.6.0.9] (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 93F682FC0080;
	Wed, 16 Apr 2025 14:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1744808350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MvaH3v47i8qxClnTKZnOnh7qx2Qoy/RwJJjsWfD0k0U=;
	b=MZy5SUD5p3VD+tq2UMjBhrezBFoHtpT+EkbU0h7mqgT6Z7JlHTNzMa2S6AL6yXURGR/BDV
	7/hVL2tJ8NyAovvY4r/BGvcR/j+LaJSY3iqNWJADhuoaQPJzO8Hj/f0eBFX+UOzX5kyj9S
	fiNsOVxfSUWrHE0kRRZDRuZzqjX/o2o=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <f733dd6d-a2bd-4642-a8b7-01577a3a1695@tuxedocomputers.com>
Date: Wed, 16 Apr 2025 14:59:09 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org,
 linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org
References: <20250403212934.561943-1-wse@tuxedocomputers.com>
 <20250403212934.561943-2-wse@tuxedocomputers.com>
 <9251783a-de2e-b923-2e05-ee30761846bc@linux.intel.com>
 <52b7051e-cc41-4983-aee9-a9a9fc4a404d@tuxedocomputers.com>
 <7d083fb7-74e9-37b6-0fa4-4f97d55ef619@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <7d083fb7-74e9-37b6-0fa4-4f97d55ef619@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 15.04.25 um 19:32 schrieb Ilpo Järvinen:
> On Tue, 15 Apr 2025, Werner Sembach wrote:
>> Am 11.04.25 um 15:48 schrieb Ilpo Järvinen:
>>> On Thu, 3 Apr 2025, Werner Sembach wrote:
>>>
>>>> The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a per-key
>>>> controllable RGB keyboard backlight. The firmware API for it is
>>>> implemented
>>>> via WMI.
>>>>
>>>> To make the backlight userspace configurable this driver emulates a
>>>> LampArray HID device and translates the input from hidraw to the
>>>> corresponding WMI calls. This is a new approach as the leds subsystem
>>>> lacks
>>>> a suitable UAPI for per-key keyboard backlights, and like this no new UAPI
>>>> needs to be established.
>>>>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> ---
>>>>    MAINTAINERS                                 |   6 +
>>>>    drivers/platform/x86/Kconfig                |   2 +
>>>>    drivers/platform/x86/Makefile               |   3 +
>>>>    drivers/platform/x86/tuxedo/Kconfig         |   8 +
>>>>    drivers/platform/x86/tuxedo/Makefile        |   8 +
>>>>    drivers/platform/x86/tuxedo/nb04/Kconfig    |  15 +
>>>>    drivers/platform/x86/tuxedo/nb04/Makefile   |  10 +
>>>>    drivers/platform/x86/tuxedo/nb04/wmi_ab.c   | 847 ++++++++++++++++++++
>>>>    drivers/platform/x86/tuxedo/nb04/wmi_util.c |  95 +++
>>>>    drivers/platform/x86/tuxedo/nb04/wmi_util.h | 109 +++
>>>>    10 files changed, 1103 insertions(+)
>>>>    create mode 100644 drivers/platform/x86/tuxedo/Kconfig
>>>>    create mode 100644 drivers/platform/x86/tuxedo/Makefile
>>>>    create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
>>>>    create mode 100644 drivers/platform/x86/tuxedo/nb04/Makefile
>>>>    create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab.c
>>>>    create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.c
>>>>    create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.h
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 00e94bec401e1..c1f7460c246ad 100644
>
>>>> +struct tux_driver_data_t {
>>>> +	struct hid_device *hdev;
>>>> +};
>>>> +
>>>> +struct tux_hdev_driver_data_t {
>>>> +	u8 keyboard_type;
>>>> +	u8 lamp_count;
>>>> +	u8 next_lamp_id;
>>>> +	union tux_wmi_xx_496in_80out_in_t next_kbl_set_multiple_keys_in;
>>>> +};
>>>> +
>>>> +static int tux_ll_start(struct hid_device *hdev)
>>>> +{
>>>> +	struct wmi_device *wdev = to_wmi_device(hdev->dev.parent);
>>>> +	struct tux_hdev_driver_data_t *driver_data;
>>>> +	union tux_wmi_xx_8in_80out_out_t out;
>>>> +	union tux_wmi_xx_8in_80out_in_t in;
>>>> +	int ret;
>>>> +
>>>> +	driver_data = devm_kzalloc(&hdev->dev, sizeof(*driver_data),
>>>> GFP_KERNEL);
>>>> +	if (!driver_data)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	in.get_device_status_in.device_type =
>>>> WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD;
>>>> +	ret = tux_wmi_xx_8in_80out(wdev, WMI_AB_GET_DEVICE_STATUS, &in, &out);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	driver_data->keyboard_type =
>>>> out.get_device_status_out.keyboard_physical_layout;
>>>> +	if (driver_data->keyboard_type ==
>>>> WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
>>>> +		driver_data->lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
>>>> +	else if (driver_data->keyboard_type ==
>>>> WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
>>>> +		driver_data->lamp_count = sizeof(sirius_16_iso_kbl_mapping);
>>>> +	else
>>>> +		return -EINVAL;
>>>> +	driver_data->next_lamp_id = 0;
>>>> +
>>>> +	dev_set_drvdata(&hdev->dev, driver_data);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void tux_ll_stop(struct hid_device __always_unused *hdev)
>>>> +{
>>>> +}
>>>> +
>>>> +static int tux_ll_open(struct hid_device __always_unused *hdev)
>>>> +{
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void tux_ll_close(struct hid_device __always_unused *hdev)
>>>> +{
>>>> +}
>>>> +
>>>> +static int tux_ll_parse(struct hid_device *hdev)
>>>> +{
>>>> +	return hid_parse_report(hdev, tux_report_descriptor,
>>>> +				sizeof(tux_report_descriptor));
>>>> +}
>>>> +
>>>> +struct __packed lamp_array_attributes_report_t {
>>>> +	const u8 report_id;
>>>> +	u16 lamp_count;
>>>> +	u32 bounding_box_width_in_micrometers;
>>>> +	u32 bounding_box_height_in_micrometers;
>>>> +	u32 bounding_box_depth_in_micrometers;
>>>> +	u32 lamp_array_kind;
>>>> +	u32 min_update_interval_in_microseconds;
>>>> +};
>>>> +
>>>> +static int handle_lamp_array_attributes_report(struct hid_device *hdev,
>>>> +					       struct
>>>> lamp_array_attributes_report_t *rep)
>>>> +{
>>>> +	struct tux_hdev_driver_data_t *driver_data =
>>>> dev_get_drvdata(&hdev->dev);
>>>> +
>>>> +	rep->lamp_count = driver_data->lamp_count;
>>>> +	rep->bounding_box_width_in_micrometers = 368000;
>>>> +	rep->bounding_box_height_in_micrometers = 266000;
>>>> +	rep->bounding_box_depth_in_micrometers = 30000;
>>>> +	/*
>>>> +	 * LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of
>>>> +	 * "HID Usage Tables v1.5"
>>>> +	 */
>>>> +	rep->lamp_array_kind = 1;
>>>> +	// Some guessed value for interval microseconds
>>>> +	rep->min_update_interval_in_microseconds = 500;
>>>> +
>>>> +	return sizeof(*rep);
>>>> +}
>>>> +
>>>> +struct __packed lamp_attributes_request_report_t {
>>>> +	const u8 report_id;
>>>> +	u16 lamp_id;
>>>> +};
>>>> +
>>>> +static int handle_lamp_attributes_request_report(struct hid_device *hdev,
>>>> +						 struct
>>>> lamp_attributes_request_report_t *rep)
>>>> +{
>>>> +	struct tux_hdev_driver_data_t *driver_data =
>>>> dev_get_drvdata(&hdev->dev);
>>>> +
>>>> +	if (rep->lamp_id < driver_data->lamp_count)
>>>> +		driver_data->next_lamp_id = rep->lamp_id;
>>>> +	else
>>>> +		driver_data->next_lamp_id = 0;
>>>> +
>>>> +	return sizeof(*rep);
>>>> +}
>>>> +
>>>> +struct __packed lamp_attributes_response_report_t {
>>>> +	const u8 report_id;
>>>> +	u16 lamp_id;
>>>> +	u32 position_x_in_micrometers;
>>>> +	u32 position_y_in_micrometers;
>>>> +	u32 position_z_in_micrometers;
>>>> +	u32 update_latency_in_microseconds;
>>>> +	u32 lamp_purpose;
>>>> +	u8 red_level_count;
>>>> +	u8 green_level_count;
>>>> +	u8 blue_level_count;
>>>> +	u8 intensity_level_count;
>>>> +	u8 is_programmable;
>>>> +	u8 input_binding;
>>>> +};
>>>> +
>>>> +static int handle_lamp_attributes_response_report(struct hid_device
>>>> *hdev,
>>>> +						  struct
>>>> lamp_attributes_response_report_t *rep)
>>>> +{
>>>> +	struct tux_hdev_driver_data_t *driver_data =
>>>> dev_get_drvdata(&hdev->dev);
>>>> +	u16 lamp_id = driver_data->next_lamp_id;
>>>> +
>>> Don't leave empty lines into the variable declaration block.
>> ack, an oversight
>>>> +	const u32 *kbl_mapping_pos_x, *kbl_mapping_pos_y, *kbl_mapping_pos_z;
>>>> +	const u8 *kbl_mapping;
>>>> +
>>>> +	rep->lamp_id = lamp_id;
>>>> +	// Some guessed value for latency microseconds
>>>> +	rep->update_latency_in_microseconds = 100;
>>>> +	/*
>>>> +	 * LampPurposeControl, see "26.3.1 LampPurposes Flags" of
>>>> +	 * "HID Usage Tables v1.5"
>>>> +	 */
>>>> +	rep->lamp_purpose = 1;
>>>> +	rep->red_level_count = 0xff;
>>>> +	rep->green_level_count = 0xff;
>>>> +	rep->blue_level_count = 0xff;
>>>> +	rep->intensity_level_count = 0xff;
>>>> +	rep->is_programmable = 1;
>>>> +
>>>> +	if (driver_data->keyboard_type ==
>>>> WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII) {
>>>> +		kbl_mapping = &sirius_16_ansii_kbl_mapping[0];
>>>> +		kbl_mapping_pos_x = &sirius_16_ansii_kbl_mapping_pos_x[0];
>>>> +		kbl_mapping_pos_y = &sirius_16_ansii_kbl_mapping_pos_y[0];
>>>> +		kbl_mapping_pos_z = &sirius_16_ansii_kbl_mapping_pos_z[0];
>>>> +	} else if (driver_data->keyboard_type ==
>>>> WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO) {
>>>> +		kbl_mapping = &sirius_16_iso_kbl_mapping[0];
>>>> +		kbl_mapping_pos_x = &sirius_16_iso_kbl_mapping_pos_x[0];
>>>> +		kbl_mapping_pos_y = &sirius_16_iso_kbl_mapping_pos_y[0];
>>>> +		kbl_mapping_pos_z = &sirius_16_iso_kbl_mapping_pos_z[0];
>>> Could these components be put inside another struct so you don't need 3
>>> variables to store them?
>> Reworked that a little bit, is now stored in struct tux_hdev_driver_data_t
>>
>> struct tux_hdev_driver_data_t {
>>      u8 lamp_count;
>>      const u8 *kbl_map;
>>      const u32 *kbl_map_pos_x;
>>      const u32 *kbl_map_pos_y;
>>      const u32 *kbl_map_pos_z;
>>      u8 next_lamp_id;
>>      union tux_wmi_xx_496in_80out_in_t next_kbl_set_multiple_keys_in;
>> };
>>
>> initialized only once during ll_start
>>
>> or should go another level and do a nested struct?
> I'd prefer the pos ones to be nested as they seem strongly related. It
> also makes it possible to store it into temporary pointer variable if
> that's beneficial somewhere to make the code more readable.
ack
>
>>>> +		for (unsigned int j = 0; j <
>>>> lamp_multi_update_report.lamp_count; ++j) {
>>>> +			lamp_multi_update_report.lamp_id[j] = i + j;
>>>> +			lamp_multi_update_report.update_channels[j].red =
>>>> +				rep->red_update_channel;
>>>> +			lamp_multi_update_report.update_channels[j].green =
>>>> +				rep->green_update_channel;
>>>> +			lamp_multi_update_report.update_channels[j].blue =
>>>> +				rep->blue_update_channel;
>>>> +			lamp_multi_update_report.update_channels[j].intensity
>>>> =
>>>> +				rep->intensity_update_channel;
>>>> +		}
>>>> +
>>>> +		ret = handle_lamp_multi_update_report(hdev,
>>>> &lamp_multi_update_report);
>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +		else if (ret != sizeof(struct lamp_multi_update_report_t))
>>> Unnecessary "else".
>> practically handle_lamp_multi_update_report can only return <0 or the correct
>> size the was i implemented it, but theoretically other values would be wrong
>> and this code would document that if in the future other values are possible
>>
>> I know a somewhat philosophical train of thought. If you want i can just
>> delete the else and optionally replace it with a comment about the return
>> value.
> I think you misunderstood why, I didn't mean remove the whole else if
> thing.
>
> There's return statement in the if block so else is not required, you can
> do the same without explicit "else":
>
> 		if (ret < 0)
> 			return ret;
> 		if (ret != sizeof(...))
> 			...
ah ok, sorry for the missunderstanding
>
>>> Take sizeof directly from the related struct variable.
>> ack
>>>> +			return -EIO;
>>>> +	}
>>>> +
>>>> +	return sizeof(*rep);
>>>> +}
>
>>>> +{
>>>> +	/*
>>>> +	 * The keyboards firmware doesn't have any built in controls and the
>>>> +	 * built in effects are not implemented so this is a NOOP.
>>>> +	 * According to the HID Documentation (HID Usage Tables v1.5) this
>>>> +	 * function is optional and can be removed from the HID Report
>>>> +	 * Descriptor, but it should first be confirmed that userspace
>>>> respects
>>>> +	 * this possibility too. The Microsoft MacroPad reference
>>>> implementation
>>>> +	 * (https://github.com/microsoft/RP2040MacropadHidSample 1d6c3ad)
>>>> +	 * already deviates from the spec at another point, see
>>>> +	 * handle_lamp_*_update_report.
>>>> +	 */
>>>> +
>>>> +	return sizeof(*rep);
>>>> +}
>>>> +
>>>> +static int tux_ll_raw_request(struct hid_device *hdev, unsigned char
>>>> reportnum,
>>>> +			      __u8 *buf, size_t len, unsigned char rtype,
>>> For in-kernel usage, always use non-__ variants, so u8.
>> copied that over from the definition in hid.h, but can change it ofc
> Yes, use u8.
ack
>
>

