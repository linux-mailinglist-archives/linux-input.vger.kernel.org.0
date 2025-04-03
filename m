Return-Path: <linux-input+bounces-11486-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D554EA799CC
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 03:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ACF016A869
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 01:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D011A1F5EA;
	Thu,  3 Apr 2025 01:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DLoZbvoB"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F60746E;
	Thu,  3 Apr 2025 01:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743644940; cv=none; b=eF2pOADwvN1xpF9G5UInPc674iOR2YJ6/nogisrKpiMUx2FdQs8CXPfk+wnWZSrykaZYPGWYMbgu4cCvogf5TGEBZQtr3bHBxiojB4RLDCuHNpgYZsAESQHB6nPvI1tAr+PaPW5Q+0m/4eYknGm2rlW9kQdKxrX+wGyerq4mreM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743644940; c=relaxed/simple;
	bh=05swC2QjNYjm9AtP7yNjsgW48VrmyZjYyOS2lFzaiXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ifv0+Z7W3AO6KYcD7RAZRkaPkTPxlsz4Ljd4WRbFPKrHQo5XO8r3gRzvLtzptphRb2rSqom7I/qjyqab5/tmF3zlTea2hk5KikmnWxp08iZBE/JX6CKm7FIh1ZVna0NaoOJV26sNNSsdj/dHjAkAT3z+lmbFIxu0je940iF6h20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DLoZbvoB; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1743644927; x=1744249727; i=w_armin@gmx.de;
	bh=05swC2QjNYjm9AtP7yNjsgW48VrmyZjYyOS2lFzaiXM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DLoZbvoBUBIXD2ucDF/b3amaPq72NSUFnp1kkEvrvI/F7qWT5wcqYje4jyV1fLVs
	 S3gLvi0Idk67b9BXukI7YZeuqZl+Z6nud93oPgvPzz6AX3c/iyjod1zsNdbO56jWH
	 HEgK1f0ehwyzS4MJBms+bfISjPpHIo419HNxH8oIyDsl+C0Yax1myZhVhoyL6Innj
	 5NE70v0vdVLNOF9nz7a3gPyWYSxxRYh4dZuUTRRhp3qVzW63Tb4TJs/7Bi0B+gQnc
	 +ZAHfUvOrImXIF01b2RsEtqbFgN76Ij0UT33PwcURzOh192UzPdbK6yR3mKJT0HQG
	 kAV7zsOPkLS9wUu5MA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatVh-1tOtCX34VH-00i9kt; Thu, 03
 Apr 2025 03:48:46 +0200
Message-ID: <b52d9855-6433-4487-b006-34eeca8e2e9d@gmx.de>
Date: Thu, 3 Apr 2025 03:48:44 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: pmf: Use meta + L for screen lock
 command
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mario Limonciello <superm1@kernel.org>, Shyam-sundar.S-k@amd.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, dmitry.torokhov@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20250321193052.2973537-1-superm1@kernel.org>
 <3b7c719f-8aa6-424f-92a0-e2cf05b12ca0@gmx.de>
 <fe47758a-ca42-41b0-92bd-4ac86e1d0a3b@kernel.org>
 <edc8986d-3414-4bc8-8aeb-9465b148ab35@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <edc8986d-3414-4bc8-8aeb-9465b148ab35@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l8AYG8rQyFxf1burcqIPx0zR48SSezxFj0M8YHIk8YmipdxIQtZ
 EEFC1o0GSFTFBlFSJI84wabB4PYAlPyg5lIMutWOBJWy+107+3rFVF3wnGeh1N+XT4bzrsn
 Iqv81NLV+YNmBvmX/Io5PqmKX5odIrj7WPdZMSeNbfVSEPbH9QpdOZ42KG/bHPHjXBpZFMU
 GujEx5uS8vlLMMH9E6inA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T4efxM2u/eA=;jx7mrWbmFLwRaFe7wBQlTAt24uI
 tk14q6aFb8Yn/ORt1eAoJfkwZ66JR+3ZHjbZ5FLosYGpu3Fs1zKYs+DbihqlahjwU7MV9GFr2
 fu9WcQd+qfzPiuNn8f7HsoR6wXfsoYXVkT0a+t2qFNSZCShNL3mdoxgCx80g8J4RDcn+zFByz
 lwuj+Fqmu2I6QvB3t1b01vWtRNGg7YczFb8OoPLq3lX2HOgTifcV/n/TILenpHptQps1Dj6ia
 AKIzR9fwvLXrn0dTN1g3zttmhCfYefCwPGPcq2M/GeOiqqnoz0ZibQiNjTMho+Mwuj1zhxpBg
 n6wTFHJb/bMWD50wuGpCJrITVVuXPxylZLBpbcAYJzdTaNoFP3Y99PRVkw7miA0PRjDKoKNQx
 iZ57JL2g/ZJKY2XAhEvCer9D5xJ5KnzoRBVTtLjyE1o0v6CWOeTbOsBq0Z1ddQI75CbdwSM/Y
 anLepsvuv/Hal2Jd5QjWFvBf+t6jl+BrEZ5xelHqGc0pDDnfy0ce9ofDVYk3459ppdARXAiph
 0JgTQzw9MKPiEmojUnm2Q2UfIGSKsoC4SSmgdCiPvnAr2tsAMEfJ3M4/jQ4baiX0n2+cH88Gm
 HLYJOFIt3NOTpz5kmH1QoqtNcBQUyBYsh2pePcFRHsUb7H4xC231frG1bojOKWzawnQ9gyzIP
 0Kl4+H8a1PVpTIqtADzTcdv8nFcBiAWSjrt0uJ7LHWDwCtvmqzwkeIn7l1WKnBB2XOhy51Ssf
 61m96nPx6ykhsdDhUjLi4WMP6tSbY32QZ6E9RF9IcZKjVBf9xSTS90vsRiAjJ2ObWUWOhGkzS
 qWHnT8EkrnBvgXelZrEuP5DEB8n2PGrL/WYvPp76xU/KsYC9jFuVv/79jKwemQz6T1N1NWJFr
 lhi8ot++Dpq2Gh9bSJdkEJWhKcavnP/MocTtJSxWFDIvKaLxA6t3FXjHHc0Kgdr55nSLPpqab
 1Hs47MNwCfO/psHNbZgy9GIfHaai7xGrqqvlrd182RlR9UIT61zMXt/3O9pydWrMpa1aspWzM
 5XyttXc4XrcEIf07538Z8iyti2/0WZfeuw4V4xoh4D3Fp53UbRhfQJIwhbJzndtuPECZXoW5r
 6DDrioRE8cQ4epnkBy2Y4HQOekHtU7O8+Tbc5rcV3/0CFfnuFBGDIYGiliszFWkxCX9yC8Hwz
 KF//91SMKHfKj6S1KxZJFLjo+LixwwjP2pt0m2WOAlJElTcbvFATPPrDOP3VQrwbGwiKjd55e
 63jwVwFx8PdJLGzRzgIXk/GHtFUcWUqJE/+d5/JwS1eKnI1hOZHue+7xxxZvAXu/i2OWL1i8y
 Jobntwpy6oho6GsxXAEMsv5NZSYDi1izBgeBklY5KGD2OsDD+UHZZ95tzU+B0R2GmQwpYoGND
 MgLPkxXjTYBdzjv98lpDq9zZJjn09ZEpUjl24oqj8Ju+GpYsjAxkzlWOwhI7QjM4ijKgXxXuG
 AbhBhlR80T75Tra/cwGXrA6vYI4w=

Am 31.03.25 um 19:49 schrieb Mario Limonciello:

> On 3/21/2025 5:25 PM, Mario Limonciello wrote:
>>
>>
>> On 3/21/25 16:16, Armin Wolf wrote:
>>> Am 21.03.25 um 20:30 schrieb Mario Limonciello:
>>>
>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>
>>>> In practice userspace software doesn't react to KEY_SCREENLOCK by
>>>> default.=C2=A0 So any time that the PMF policies would suggest to loc=
k
>>>> the screen (for example from an HPD sensor event) userspace isn't
>>>> configured to do it properly.
>>>>
>>>> However userspace is configured for meta + L as this is the default
>>>> in the ecosystem. Adjust the PMF driver to send meta + L.
>>>
>>> Hi,
>>>
>>> KEY_SCREENLOCK is used by other drivers too, so it would make sense
>>> to instead add support for KEY_SCREENLOCK to the userspace software
>>> instead of having this workaround inside the driver.
>>
>> Right; that's actually that's the first thing I looked at when I came
>> to this issue.
>>
>> I had "expected" GNOME for example to work with KEY_SCREENLOCK, but
>> even when you program it to do so it doesn't work.
>>
>> https://gitlab.gnome.org/GNOME/mutter/-/issues/3990
>>
>> The ecosystem has moved to META + L.=C2=A0 My last employer (Dell) I
>> remember there was a FN + F key that would issue a screen lock. It
>> had a silkscreen of a lock symbol.
>> How did it work?=C2=A0 Not KEY_SCREENLOCK - it emulated META + L.
>>
>> This is what works in Windows, GNOME and KDE.=C2=A0 So I am of the opin=
ion
>> that KEY_SCREENLOCK is likely a dinosaur that doesn't really exist
>> anymore.
>>
>
> FWIW, I found an aftermarket keyboard (Logitech Ergo K860 [1]) that
> has a "lock" key.
>
> It also emits a KEY_LEFTMETA combination when this key is pressed and
> works by default in GNOME as well with no changes.
>
> -event11=C2=A0 DEVICE_ADDED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Logitech ERGO K860 seat0 default
> group7=C2=A0 cap:kp left scroll-nat scroll-button
>
> -event11=C2=A0 KEYBOARD_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 +4.191s=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KEY_LEFT=
META (125)
> pressed
> =C2=A0event11=C2=A0 KEYBOARD_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +4.231s=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 **=
* (-1) pressed
> =C2=A0event11=C2=A0 KEYBOARD_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +4.374s=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 **=
* (-1) released
> =C2=A0event11=C2=A0 KEYBOARD_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +4.412s=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KE=
Y_LEFTMETA (125)
> released
>
> [1] https://www.logitech.com/en-us/shop/p/k860-split-ergonomic.920-00916=
6
>
Interesting, i CCed the input maintainer so that he can decide whether to =
keep KEY_SCREENLOCK or replace it
with meta + L. Maybe the input subsystem could provide a generic meta + L =
emulation for KEY_SCREENLOCK?

Thanks,
Armin Wolf

>>>
>>> Also please add a comment explaining what meta + L is supposed to
>>> achieve.
>>>
>>
>> Sure if we can align on doing this I will spin a V2 with a comment
>> better explaining the situation.
>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> ---
>>>> =C2=A0 drivers/platform/x86/amd/pmf/tee-if.c | 11 +++++++++--
>>>> =C2=A0 1 file changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/
>>>> platform/ x86/amd/pmf/tee-if.c
>>>> index 8c88769ea1d87..2c00f2baeec7b 100644
>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> @@ -151,7 +151,13 @@ static void amd_pmf_apply_policies(struct
>>>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amd_pmf_update_uevents(dev, KEY_SUSPEND)=
;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 case 2:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 input_report_key(dev->pmf_idev, KEY_LEFTMETA, 1);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 input_report_key(dev->pmf_idev, KEY_L, 1);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 input_sync(dev->pmf_idev);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 input_report_key(dev->pmf_idev, KEY_L, 0);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 input_sync(dev->pmf_idev);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 input_report_key(dev->pmf_idev, KEY_LEFTMETA, 0);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 input_sync(dev->pmf_idev);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 default:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev->dev, "Invalid PMF policy sy=
stem
>>>> state: %d\n", val);
>>>> @@ -422,8 +428,9 @@ static int amd_pmf_register_input_device(struct
>>>> amd_pmf_dev *dev)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->pmf_idev->phys =3D "amd-pmf/input=
0";
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_set_capability(dev->pmf_idev, EV=
_KEY, KEY_SLEEP);
>>>> -=C2=A0=C2=A0=C2=A0 input_set_capability(dev->pmf_idev, EV_KEY, KEY_S=
CREENLOCK);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_set_capability(dev->pmf_idev, EV=
_KEY, KEY_SUSPEND);
>>>> +=C2=A0=C2=A0=C2=A0 input_set_capability(dev->pmf_idev, EV_KEY, KEY_L=
);
>>>> +=C2=A0=C2=A0=C2=A0 input_set_capability(dev->pmf_idev, EV_KEY, KEY_L=
EFTMETA);
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D input_register_device(dev->pmf=
_idev);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err) {
>>
>
>

