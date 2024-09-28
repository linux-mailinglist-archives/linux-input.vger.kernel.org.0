Return-Path: <linux-input+bounces-6841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B558988E40
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 09:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C36451F21E47
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 07:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD5319DFA3;
	Sat, 28 Sep 2024 07:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Bd3yNL+o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410FD19DF98;
	Sat, 28 Sep 2024 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727509234; cv=none; b=VWMpdBrsdYqLMRC/Ao9zbgBpJ++Wi4oKfmJ4LAMp+su1MLQltgQDwpi0XokFd35ejpZ9RkIoOSM0vbyQ/egkykPwNftt8JRgZOKiwXgIdFFBD98S9HmCvlOWCctRIg3EkKwvEB5qhFtChQ/eimhEgkT5QWcw6/iizAKM3RUhJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727509234; c=relaxed/simple;
	bh=WiHi+8A8AcUloQzJPM++xYrcHmkSdaWV/c2K5j5sYgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyypFB5i9eIgMP3Cmj9QWiIpUfxxL6YLkkoJD6DKn7g+UHDTXovwyQkRKuipFuMRefMnZmKv8A9UxuEuU48NiqMFWYCO2Yg0oIYMOctAOqdmjSOTnZjjvUZVPPvm46jDj8sB01sbHq/TGYA+AOVrJ2TX6VFmsK0KL5eeRkCTeOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Bd3yNL+o; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.27] (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id D46982FC004A;
	Sat, 28 Sep 2024 09:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1727509229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8kC/eRWIHnVWlkxzZZ/FKnPuBi+ZrUHo8bPEJjkftMU=;
	b=Bd3yNL+oZCK9jBewlU/VEi5BLgg6t7w24T1Bt08FhneXbzdN2ms6dgoZOVwavfBuQR+QD9
	+D1hIuPfauBQeSPZNMyrWVMYKsM31J+zGJq7nQEJw2V2lMSZLxQe+7js9OrziBdjOq67ZT
	epNZPXEMgt1K4aS8oV9J1TBXc6o5Svg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <540c87b1-39aa-4311-b34a-a505556a501a@tuxedocomputers.com>
Date: Sat, 28 Sep 2024 09:40:28 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, jelle@vdwaa.nl,
 jikos@kernel.org, lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, platform-driver-x86@vger.kernel.org
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
 <ad01bc38-3834-44c9-a5e3-540a09a20643@gmx.de>
 <3dde4572-78a0-4a93-916a-563b7150f078@tuxedocomputers.com>
 <3e5630c0-2ab4-49fc-8b91-988b327bdcf8@tuxedocomputers.com>
 <95d1342d-f2a1-4f55-b8f9-d1ede1207aaa@gmx.de>
Content-Language: de-DE
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <95d1342d-f2a1-4f55-b8f9-d1ede1207aaa@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 27.09.24 um 19:18 schrieb Armin Wolf:
> Am 27.09.24 um 13:24 schrieb Werner Sembach:
>
>> Hi,
>>
>> an additional question below
>>
>> Am 27.09.24 um 08:59 schrieb Werner Sembach:
>>> Hi,
>>>
>>> Am 26.09.24 um 20:39 schrieb Armin Wolf:
>>>> Am 26.09.24 um 19:44 schrieb Werner Sembach:
>>>>
>>>>> [...]
>>>>> +// We don't know if the WMI API is stable and how unique the GUID
>>>>> is for this ODM. To be on the safe
>>>>> +// side we therefore only run this driver on tested devices
>>>>> defined by this list.
>>>>> +static const struct dmi_system_id tested_devices_dmi_table[] = {
>>>>> +    {
>>>>> +        // TUXEDO Sirius 16 Gen1
>>>>> +        .matches = {
>>>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> +            DMI_EXACT_MATCH(DMI_BOARD_NAME, "APX958"),
>>>>> +        },
>>>>> +    },
>>>>> +    {
>>>>> +        // TUXEDO Sirius 16 Gen2
>>>>> +        .matches = {
>>>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>>> +            DMI_EXACT_MATCH(DMI_BOARD_NAME, "AHP958"),
>>>>> +        },
>>>>> +    },
>>>>> +    { }
>>>>> +};
>>>>> +
>>>>> +static int probe(struct wmi_device *wdev, const void
>>>>> __always_unused *context)
>>>>> +{
>>>>> +    struct tuxedo_nb04_wmi_driver_data_t *driver_data;
>>>>> +
>>>>> +    if (dmi_check_system(tested_devices_dmi_table))
>>>>> +        return -ENODEV;
>>>>
>>>> Hi,
>>>>
>>>> please do this DMI check during module initialization. This avoids
>>>> having an useless WMI driver
>>>> on unsupported machines and allows for marking
>>>> tested_devices_dmi_table as __initconst.
>> I wonder how to do it since I don't use module_init manually but
>> module_wmi_driver to register the module.
>
> In this case you cannot use module_wmi_driver. You have to manually 
> call wmi_driver_register()/wmi_driver_unregister()
> in module_init()/module_exit().
ack
>
>>>>
>>>> Besides that, maybe a "force" module parameter for overriding the
>>>> DMI checking could be
>>>> useful?
>>
>> Considering the bricking potential i somewhat want for people to look
>> in the source first, so i would not implementen a force module 
>> parameter.
>>
> Ok.
>
>> Kind regards,
>>
>> Werner
>>
>>

