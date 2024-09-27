Return-Path: <linux-input+bounces-6827-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A152498899D
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 19:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EBC528249A
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 17:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501851C0DD9;
	Fri, 27 Sep 2024 17:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="AYHtG6/i"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BE09443;
	Fri, 27 Sep 2024 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727457545; cv=none; b=RwniqaGIKEipQ+rmuBKu8KHGC7BFv1c7CLc7svqKViVYLyMDb+wmqE15jHD1oqaaOXYfxScNh+O9WzzJZhiQmFJgD/9MdbsFw8VnpP8Evsvcb59p3aMW112zRHSOsZdqLdZN114GiPxXTOmksisPleMmf6hXUq20AiwV0SCRlEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727457545; c=relaxed/simple;
	bh=wtDpYwOAOKofX4RvJxSntDIhYtfMCgqh7rhIZgRfwJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0iXUbhMHkmExu/TBJnwPs7dd+tPTishh2Qzxw9sEpX5sAhS+abiFlAGFRaAfpbYcNe8HrzT7RwUxyxJqkfCRgKYeBZ9mG4Mi279en5EwXTSTKvGAEvKJCYyCL+Vk5p/hgDO/PHgskWptHqfyEkVLrso333R2lS0InfnzfLzos4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=AYHtG6/i; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727457523; x=1728062323; i=w_armin@gmx.de;
	bh=wtDpYwOAOKofX4RvJxSntDIhYtfMCgqh7rhIZgRfwJ8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AYHtG6/iQJDvQyZfJRLG0SQe1DP9ifBowEWfHWSBcvEnaLO5NTWDCJ/M+nCIQTir
	 AkW9qx6YMJxcGFk9M9/wUAx42Ks4uRaKBfp16FEjTt2jb1MmKPz3lopUQskCcXpmD
	 3nGKlRMmXftcIZ0neM7BmsgL1BpPaTeMTjRPg3BfTuRsGUzRYhmPJ4gsAGA57oh3N
	 0b6NA9/glWLeJPEMVAW4re2opBpulSJ82nB5Qr53tW1kFnsUQcswZ9hYjrWbAkAJr
	 hQze/JLxMBbSQxdQxao9sQdYy+sl8fGmHVRsCWRSSLlqu0KfbTooe6BEHaTu+O9VE
	 uQa5ozJABfYATk2ViQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1sOnoW3TbW-00QuPw; Fri, 27
 Sep 2024 19:18:42 +0200
Message-ID: <95d1342d-f2a1-4f55-b8f9-d1ede1207aaa@gmx.de>
Date: Fri, 27 Sep 2024 19:18:37 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>,
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <3e5630c0-2ab4-49fc-8b91-988b327bdcf8@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VFjl67dLNrv6Jc4tqj4gacATd5Ifbha8xEOZ4lw5in4oH2CWA8t
 MYnzLPSKY1axuJqaUQMWHFQYPKO1pZAxYxN0X8Mmd2AkbecbkzKKo/RgtKAz8ANi73lMeXI
 t/h2gowUjE3f+AAMAmK1Rm4hqp+m8gFY7wGH6HQ4lq5P917kN9fxelePqkrx7szzQZOd4ud
 o0/LSuuDcFwKE0aNNKjnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vEEe5JzzMiY=;rdnoMfl7Ge1slGcTHb2xD/BJNx5
 o5VocNTqMshaUv15dIW6Zbx26P56xKZgODeDJeLzlrpEDyJkKM5+577L2HpHATlxdWAB3EpbT
 yQJO8KYiVm26Mm/RJxRK2idvn69cBPCLBm0E9Cc5Y2eXHgVcRgjy6fFxeAdujANXxZD3Quynz
 mz4gRj12PsMSdyI3oVAeIJ7eKW+YI83W8fELMIoJAZAVI3HDxv1wxI7YhlxCcGT143DpU9zgm
 LAqLT55AVLFWpq4D3BaqPNuGo8DvKwkG1MAW4gIfjjrgiTGehzBh5zAbrbMIZzqx7O7KT4YwV
 C0UIL3mR7tEOUCiwYIlugNHwC/z87T4lAFpZa5NoE4unBEVc6xdF5oylI4NF7wVZi6PN8IPGk
 EvEe0c8r9KTRIppTToz3Uk8zVd7TeOnPN9AdScV+1cqG//18nbKqzcGNIuKjZaZrHsHTqAnvj
 +IqG/+Ce2RQks+rwEanWiLi9dKtDXi5KV6XHTlQ6vGBfNnWP+1FBmIsACNMpvbcQEmzfZpeAQ
 txotazX9ZqOuA8WYvTOFcCiBNbDsQyn3yYbX0CMzOB3EwzYFYGNmrG+hQ8bpqxGbXtT7zbSZv
 LI0OzpVl2dzHD2Sj8r+USuvx4YK9gI/2aYsKEQE006bZIQ+hbbV7/lk2rCFDo4XsjQo1oT8Ee
 OT6nLYuK/Xd3NbVj2Zqad8Xlydj6QNkJBW4XsCg1P24tegd7IzU1LQwjc4HeB6RL87pUQ//1S
 iN9FcPjRnZ9+FSi1rzDdqeq33Kq+RZWNN0x7WTl1mHRIqA0XFjDMn8igRUn9kPctLPJAH3fiX
 mKZ6gfYv/mvqy/GAfGsXUEHoRh55LoKVit9s5Opx0GqyA=

Am 27.09.24 um 13:24 schrieb Werner Sembach:

> Hi,
>
> an additional question below
>
> Am 27.09.24 um 08:59 schrieb Werner Sembach:
>> Hi,
>>
>> Am 26.09.24 um 20:39 schrieb Armin Wolf:
>>> Am 26.09.24 um 19:44 schrieb Werner Sembach:
>>>
>>>> [...]
>>>> +// We don't know if the WMI API is stable and how unique the GUID
>>>> is for this ODM. To be on the safe
>>>> +// side we therefore only run this driver on tested devices
>>>> defined by this list.
>>>> +static const struct dmi_system_id tested_devices_dmi_table[] =3D {
>>>> +=C2=A0=C2=A0=C2=A0 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TUXEDO Sirius 16 Gen1
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
MI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
MI_EXACT_MATCH(DMI_BOARD_NAME, "APX958"),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>> +=C2=A0=C2=A0=C2=A0 },
>>>> +=C2=A0=C2=A0=C2=A0 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // TUXEDO Sirius 16 Gen2
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
MI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
MI_EXACT_MATCH(DMI_BOARD_NAME, "AHP958"),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>> +=C2=A0=C2=A0=C2=A0 },
>>>> +=C2=A0=C2=A0=C2=A0 { }
>>>> +};
>>>> +
>>>> +static int probe(struct wmi_device *wdev, const void
>>>> __always_unused *context)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tuxedo_nb04_wmi_driver_data_t *driver_data=
;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (dmi_check_system(tested_devices_dmi_table))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>>
>>> Hi,
>>>
>>> please do this DMI check during module initialization. This avoids
>>> having an useless WMI driver
>>> on unsupported machines and allows for marking
>>> tested_devices_dmi_table as __initconst.
> I wonder how to do it since I don't use module_init manually but
> module_wmi_driver to register the module.

In this case you cannot use module_wmi_driver. You have to manually call w=
mi_driver_register()/wmi_driver_unregister()
in module_init()/module_exit().

>>>
>>> Besides that, maybe a "force" module parameter for overriding the
>>> DMI checking could be
>>> useful?
>
> Considering the bricking potential i somewhat want for people to look
> in the source first, so i would not implementen a force module parameter=
.
>
Ok.

> Kind regards,
>
> Werner
>
>

