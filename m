Return-Path: <linux-input+bounces-16112-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF0C5A47F
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 23:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE8E54E06B2
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 22:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C1D35957;
	Thu, 13 Nov 2025 22:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="IjVFwzm6"
X-Original-To: linux-input@vger.kernel.org
Received: from outbound.ms.icloud.com (p-west3-cluster4-host6-snip4-10.eps.apple.com [57.103.74.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA1030DD18
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.74.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763071760; cv=none; b=snsPPNyAbdKzVYqxHz/7N9WU8zEKlreuCO2yOFxABYXJtB/0bu+q075sRr9Ecv6wVvUiLfV70cfr6OekLL/u0ltAnAvbyEX2eBSw4BSDHCXC0aWR3HL+yCTvywbesQQ9don/0E5hy62ycDScGaImQUWUaqsc1CkWGe98LmZ/eNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763071760; c=relaxed/simple;
	bh=Cuu2DCbhd+zPap30bG56OurcqOtw1jRDKd0cfTHB5xo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qSqgzyYhHI7nbaZW5nVMSqidM61PijKv3KzQm2+wNexQPgm2Tk6G0XcEske/qpuWC37vzrb3nav+6ag1iTKNpmmyKQY1pLZuQ4zMz0bRqE4q26deu882D/MwMfgu2GfqsabhnqnTUpcbNoQcneGjot44aCrQYCCj24wIZlyAyjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=pass smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=IjVFwzm6; arc=none smtp.client-ip=57.103.74.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljones.dev
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-8 (Postfix) with ESMTPS id 20D2018000A0;
	Thu, 13 Nov 2025 22:09:15 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; s=sig1; bh=op1QM9y56AahOkmLGHurvMVk4RM4wvvOD7RH9V+I1P8=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=IjVFwzm66aMr9mHVSP4TIvQPEparn28khWgnKen1XZKWLv+zYaGV+Z23wklHMjuVCof5eixoNO5DKP7dg94K9eIG/801TJ+WuWKlx/dxVW/3CFCVCrHYiyNQ7Kxfk2mAZAiYok2Gwh1CrxlXnFSeCzxbWC9R2+PwGeTCLWEF09Izxxo6mQRPKVthKjCSYyeAcqgx5R+LWseWKS/7OU6RMOzBx1VgYazUxHw5g26+cNbS5V+wZT6PZd0a8tkrwWZM/T46/gNt2JAATmHOgadzTzG7Kl6NHCrXMyPKqW8IRDdt9M+jBjfexsed59W6bvjP/kNesW3Anj7Trd+OQXiG9g==
mail-alias-created-date: 1566896761000
Received: from smtpclient.apple (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-8 (Postfix) with ESMTPSA id 652E818000D8;
	Thu, 13 Nov 2025 22:09:13 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.22\))
Subject: Re: [PATCH v8 00/10] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
From: luke@ljones.dev
In-Reply-To: <CAGwozwGwtivKnC6ucCGwJiu2yLLbddFXG+jYTaMTwU4Zt=CAfQ@mail.gmail.com>
Date: Fri, 14 Nov 2025 11:09:00 +1300
Cc: Denis Benato <benato.denis96@gmail.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hansg@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5440F7FC-14A0-45A0-9E84-1DE5285F9F3F@ljones.dev>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <CAGwozwE+3vkm0-amRqnNJBzxTvXabgBF9h_G_vG_L7OJj91LBg@mail.gmail.com>
 <27a74ecc-bff7-f3ae-b23e-a8362ac3a6b3@linux.intel.com>
 <CAGwozwGpacR=wYXpf3vOiwWNxaV6pJ6CdE-E-G1gRRpO4VHVMg@mail.gmail.com>
 <74f91d3c-6494-4754-a10f-4d8c1d45f7ff@gmail.com>
 <CAGwozwEKqqJxxmtjJhy2MzNVhmBTMmy8xG5TZGkKJqJCgK=X5w@mail.gmail.com>
 <4671d267-d823-4bf7-af30-b587e67dec49@gmail.com>
 <CAGwozwFDm80YuC9AfES2d7Xk2bnCNPjHtgXCz5gZuh7fuajHgg@mail.gmail.com>
 <AC058796-5255-41AE-93A1-1D5382F8FDDE@ljones.dev>
 <CAGwozwGwtivKnC6ucCGwJiu2yLLbddFXG+jYTaMTwU4Zt=CAfQ@mail.gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
X-Mailer: Apple Mail (2.3864.300.22)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE3NCBTYWx0ZWRfX3/il+6woeQtW
 DzKOSdI92g5yOa7qBmm5VrBW9hrwXUksvvLJ/jUi9TvBS+CfBD1MeqJ5PD/trCubF5/RSftjFDw
 BRSIjRUkFCDldvNES3+FWg9uVi+twgO00CQf2sdh1OxP3181cc02B+XbFzfRh7ccaUdFAyiDK+w
 eA8myvW2ZlKoybEeH8NIKAWEvXgy7wPfVPONWZFhKI7POCbmEKqOuwsSoj1nogDV9A81YjSOV2Y
 bH1BgSgD9DpV9qhF6ucz1phj/ezGjV7HUMhCkrbLyc/kUrhYCXfhks1zu5+uWlA/9Z3omnSfgyM
 62Jkh5tCZVifTlw9fUo
X-Authority-Info: v=2.4 cv=Vpguwu2n c=1 sm=1 tr=0 ts=6916570c cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=q5ZSomFpAAAA:20
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wzsf0MJG4dYnkmvHXyQA:9 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22 a=yULaImgL6KKpOYXvFmjq:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-ORIG-GUID: nkhxOWOczt-DXnLszD95yTcB6m45InW5
X-Proofpoint-GUID: nkhxOWOczt-DXnLszD95yTcB6m45InW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 clxscore=1030 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130174
X-JNJ: AAAAAAABep1hXA95gE6qBbnF+SB+bIdO6spypRJVJk6/23jfulZuBZzv9aTvkxMwHb5j73qppDxznXwXh85u9ERHHP4cz/hcTFLWQN4cqFYcI19JFqMZy1JgC1EdubVIrMsCVYwuyuw9Ig8eC+GR0df1rmX4yFxJbWnMXsoUh91ZyYBqp4+mY3Tp8Z57VsFF66mLsLHChczzesVKJiGctgFusJ9Ljm+K/wnEHTdorpQtcebXIRvtkz+t+8WE5Plb2VaipfLSLuiWbnVr4DIZHfDkitn6wSfGZtZKDUWOGJgAdVCzzqlA1C/UuEdqhbxS7OD10b5AqyNS9v9gX+4V8FKY8FMdAx+K5d6nMU9aZM812zeKyicdvoYeQBM4RGU8nEoP5Ogw3UBAArBlaM+uplzaIRGUj8QA4qKXIXiJ2pIyUMfd12eozaK5pVcSlftq+77trNci6A4jjeOqAxCnOVV1hTbBct9Dtr4aIuqgB4cxKEJ/e82AAfy9hLISWGPMsR+fML1OtmKJnATxbaYl77fLmKeNNgZjYA56kEHt5bCpInRhSFsCY2L4rsyfNGVq2zUslL2d5ka/pYHE/sm9oHNh/1voDTAyxBDR9U+Z/TpBULQCjiBt+lZ+O0boFckOdqO2GvjZHjcHebD2rTpF+yq133ehw5W4AB6BA6PGq1t/5W0dmGKhyOeKgcovbxq2Vc5PUl7/O/UsRV4xFgfi29g=



> On 14 Nov 2025, at 10:17, Antheas Kapenekakis <lkml@antheas.dev> =
wrote:
>=20
> On Thu, 13 Nov 2025 at 21:23, <luke@ljones.dev> wrote:
>>=20
>>=20
>>> On 13 Nov 2025, at 21:44, Antheas Kapenekakis <lkml@antheas.dev> =
wrote:
>>>=20
>>> On Thu, 13 Nov 2025 at 02:14, Denis Benato =
<benato.denis96@gmail.com> wrote:
>>>>=20
>>>>=20
>>>> On 11/12/25 23:08, Antheas Kapenekakis wrote:
>>>>> On Wed, 12 Nov 2025 at 20:51, Denis Benato =
<benato.denis96@gmail.com> wrote:
>>>>>>=20
>>>>>> On 11/12/25 14:41, Antheas Kapenekakis wrote:
>>>>>>> On Wed, 12 Nov 2025 at 14:22, Ilpo J=C3=A4rvinen
>>>>>>> <ilpo.jarvinen@linux.intel.com> wrote:
>>>>>>>> On Wed, 12 Nov 2025, Antheas Kapenekakis wrote:
>>>>>>>>=20
>>>>>>>>> On Sat, 1 Nov 2025 at 11:47, Antheas Kapenekakis =
<lkml@antheas.dev> wrote:
>>>>>>>>>> This is a two part series which does the following:
>>>>>>>>>> - Clean-up init sequence
>>>>>>>>>> - Unify backlight handling to happen under asus-wmi so that =
all Aura
>>>>>>>>>>   devices have synced brightness controls and the backlight =
button works
>>>>>>>>>>   properly when it is on a USB laptop keyboard instead of one =
w/ WMI.
>>>>>>>>>>=20
>>>>>>>>>> For more context, see cover letter of V1. Since V5, I removed =
some patches
>>>>>>>>>> to make this easier to merge.
>>>>>>>>> Small bump for this.
>>>>>>>> I looked at v8 earlier but then got an impression some of =
Denis' comments
>>>>>>>> against v7 were not taken into account in v8, which implies =
there will be
>>>>>>>> delay until I've time to delve into the details (I need to =
understand
>>>>>>>> things pretty deeply in such a case, which does take lots of =
time).
>>>>>>>>=20
>>>>>>>> Alternatively, if Denis says v8 is acceptable, then I don't =
need to spend
>>>>>>>> so much time on it, but somehow I've a feeling he isn't happy =
with v8
>>>>>>>> but just hasn't voiced it again...
>>>>>>>>=20
>>>>>>>> Please do realize that ignoring reviewer feedback without a =
very very good
>>>>>>>> reason always risks adding delay or friction into getting =
things
>>>>>>>> upstreamed. Especially, when the review comes from a person who =
has been
>>>>>>>> around for me to learn to trust their reviews or from a =
maintainer of the
>>>>>>>> code in question.
>>>>>>> Sure, sorry if it came out this way. Dennis had two comments on =
the V7
>>>>>>> version of the series.
>>>>>>>=20
>>>>>>> The first one was that asusctl has a hang bug, which he hasn't =
had
>>>>>>> time to look into yet. This should have been fixed by dropping =
the
>>>>>>> HID_QUIRK_INPUT_PER_APP. I retested the series and that QUIRK =
was a
>>>>>>> bit of a NOOP that does not need to be added in the future.
>>>>>> So it is supposed to not regress it now, correct?
>>>>>>> The second is he is concerned with dropping the 0x5d/0x5e inits. =
Luke
>>>>>>> said (back in March) that it is fine to drop 0x5e because it is =
only
>>>>>>> used for ANIME displays. However, for 0x5d, it is hard to verify =
some
>>>>>>> of the older laptops because they have only been tested with =
0x5d and
>>>>>>> we do not have the hardware in question to test.
>>>>>>>=20
>>>>>>> For this series, I re-added "initialize LED endpoint early for =
old
>>>>>>> NKEY keyboards" that re-adds 0x5d for the keyboards that cannot =
be
>>>>>>> tested again so this comment should be resolved too. With that =
in
>>>>>>> mind, we do end up with an additional quirk/command that may be
>>>>>>> unneeded and will remain there forever, but since it was a point =
of
>>>>>>> contention, it is not worth arguing over.
>>>>>>>=20
>>>>>>> So both comments should be resolved
>>>>>> The driver should also not late-initialize anything.
>>>>>>=20
>>>>>> Windows doesn't do it and the official asus application
>>>>>> can freely send LEDs changing commands to either WMI or USB
>>>>>> so I don't see any reason to do things differently [than windows]
>>>>>> and not prepare every USB endpoint to receive commands,
>>>>>> this has not been addressed unless I confused v7 and v8?
>>>>> Yes, it's been added on v8. 0x5d is init for the laptops it is
>>>>> problematic for. Not because it does not work, but because it has =
not
>>>>> been verified to work for those laptops.
>>>> I am not sure I am reading this right:
>>>> are you telling me that on recent models the windows driver
>>>> doesn't issue 0x5d?
>>>=20
>>> Try to add spaces in your replies. This is hard to follow.
>>>=20
>>> Do not conflate driver with software. 0x5a (over the application
>>> 0xff310076) has traditionally been used by a driver in Windows to
>>> control the backlight level, as it is done in this driver. 0x5d =
(over
>>> the application 0xff310079) is only used by laptops with RGB by
>>> Armoury crate. But this driver does not do RGB. No device
>>> functionality relies on it being sent for any device I've seen. The
>>> device remembers its Windows settings, incl. the backlight color, in
>>> the absence of a driver.
>>>=20
>>> Laptops without RGB such as the Duo series which I would like to add
>>> support for next only have a 0x5a endpoint. But, they are sent =
garbage
>>> inits for 0x5d and 0x5e currently. This should be fixed.
>>>=20
>>> Moreso, it seems that Armoury crate on the Xbox Ally series uses
>>> exclusively 0x5a commands and if you use 0x5d it ignores them =
(perhaps
>>> RGB still works though). With the previous generation, commands =
worked
>>> for either report id.
>>>=20
>>>>>>> @Denis: can give an ack if this is the case?
>>>>>>>=20
>>>>>>> As for Derek's comment, he has a PR for his project where he =
removes
>>>>>>> the name match for Ally devices with ample time for it to be =
merged
>>>>>>> until kernel 6.19 is released. In addition, that specific =
software for
>>>>>>> full functionality relies on OOT drivers on the distros it ships =
with,
>>>>>>> so it is minimally affected in either case.
>>>>>> The part we are talking about depends on this driver (hid-asus)
>>>>>> and there are people on asus-linux community using inputplumber
>>>>>> for non-ally devices (the OOT driver is only for ally devices)
>>>>>> therefore it is very important to us (and various other =
distributions)
>>>>>> not to break that software in any way.
>>>>> This driver is only used for Ally devices. If you mean that people
>>>>> remap their keyboards using inputplumber I guess they could but I =
have
>>>>> not seen it.
>>>> I meant people remap keyboards using IP. I am sure there were
>>>> (and very probably still are) people doing that.
>>>>>> Weighting pros and cons of changing the name I am not sure
>>>>>> changing name brings any benefit? Or am I missing something here?
>>>>>> It's simply used by userspace so the hardware should be loading
>>>>>> regardless of the name...
>>>>> Users see the name of their devices in their settings menu. They
>>>>> should be accurate. Also, the early entry needs to be added anyway =
to
>>>>> prevent kicking devices.
>>>> If it's just aesthetics I don't see much reasons in changing the =
name.
>>>>=20
>>>> "the early entry needs to be added anyway ...." has no meaning to =
me,
>>>> please rephrase. Sorry.
>>>=20
>>> Early exit-
>>>=20
>>>>>> Along with IP and your tool and asusctl there is also openrgb,
>>>>>> and a newborn application for asus devices (I don't have contacts
>>>>>> with that dev nor I remember the name of the tool)
>>>>>> and I am not even that sure these are all asus-related
>>>>>> applications.
>>>>> My tool never checked for names, it briefly did for around a month
>>>>> after its creation for some devices until capability matches. =
Around
>>>>> 6.1 and 6.7 the kernel changed the names of most USB devices and =
that
>>>>> caused issues. It currently only uses name matches for VID/PID 0/0
>>>>> devices created by the kernel. Specifically, WMI and AT Keyboards. =
I
>>>>> am not sure there is a workaround for those. Asusctl also does not =
use
>>>>> names either.
>>>> But IP does, so I would like to hear confirmation from at least =
Derek
>>>> before the merge that there won't be future issues.
>>>>=20
>>>> Interpret what I say here as a broad topic, not just name/PER_APP =
flag:
>>>> avoid changing data flow on older models...
>>>=20
>>> In [1] Derek removes the name matches
>>>=20
>>> There are no other name matches concerning this driver in it.
>>>=20
>>> The data flow is not changed in this series; you should go through =
the
>>> patches once again if you think that. The only difference is 0x5e is
>>> not sent, and 0x5d is not sent for newer devices.
>>>=20
>>> [1] https://github.com/ShadowBlip/InputPlumber/pull/453
>>>=20
>>>>>> Excercise EXTRA care touching this area as these are enough =
changes
>>>>>> to make it difficult to understand what exactly is the problem if
>>>>>> someone shows up with LEDs malfunctioning, laptop not entering =
sleep
>>>>>> anymore or something else entirely. Plus over time
>>>>>> ASUS has used various workarounds for windows problems
>>>>>> and I am not eager to find out what those are since there is only
>>>>>> a realistic way it's going to happen....
>>>>> These changes are not doing something extraordinary. It's just a =
minor cleanup.
>>>>>=20
>>>>>>> Moreover, that specific commit is needed for Xbox Ally devices =
anyway,
>>>>>>> as the kernel kicks one of the RGB endpoints because it does not
>>>>>>> register an input device (the check skipped by early return) so
>>>>>>> userspace becomes unable to control RGB on a stock kernel
>>>>>>> (hidraw/hiddev nodes are gone). For more context here, this =
specific
>>>>>>> endpoint implements the RGB Lamparray protocol for Windows =
dynamic
>>>>>>> lighting, and I think in an attempt to make it work properly in
>>>>>>> Windows, Asus made it so Windows has to first disable dynamic =
lighting
>>>>>>> for armoury crate RGB commands to work (the 0x5a ones over the =
0xff31
>>>>>>> hid page).

Ah=E2=80=A6 this was an annoyance. In the hid-asus driver I did I ended =
up defaulting the LED control to the lamp-array style because it enabled =
faster per-led control. Then on sleep/resume it applied static colour =
matching first LED to keep some consistency. It works fine and there is =
no noticeable delay between switching to/from since the LampArray =
commands are instant (no set/apply required).

Anyhow, that driver created proper new LED device just for LED control. =
But it could only do that by taking the Ally HID off of the current =
driver and managing the whole lot. The end result I thought was much =
cleaner and separated the actual endpoints out to specific functions =
instead of how the current driver takes *all* the endpoints and tries to =
work off usage pages or report ID only.

For example use endpoint 0x83 for configuration (of gamepad) and LED. =
0x87 is typically keyboard press events etc.

It did make me wonder if a newer cleaner driver for new MCU 0x19b6 =
onwards would have worked better instead of trying to shoehorn stuff in =
to the current driver constantly. It=E2=80=99s dead easy to bring up a =
new driver for this as an experiment. Maybe both you and Denis could =
investigate doing so?


>>>>>> Yes once ASUS introduces something new it sticks with that for
>>>>>> future models so it's expected more and more laptops will have
>>>>>> the same problem: I am not questioning if these patches are =
needed
>>>>>> as they very clearly are; I am questioning if everything that =
these
>>>>>> patches are doing are worth doing and aren't breaking/regressing
>>>>>> either tools or the flow of actions between the EC and these USB =
devices.
>>>>> Well, this series is needed to account for that. Sending the =
disable
>>>>> command is out of scope for now though.
>>>> Here I apologize for confusion: my comments were mostly about
>>>> older models: I absolutely don't want to break those, but if you =
find a way
>>>> to distinguish them from newer models that would give you more =
freedom with those.
>>>=20
>>> Yes, we know their specific PIDs, so if you see the patch that adds
>>> the 0x5d init, it is only added for those models.
>>=20
>> I=E2=80=99m only half keeping up to date on this. I do recall however =
that the 0x5D init was definitely required for the first ASUS laptop I =
worked on, and old GX502 - the PID for keyboard is 0x1866 and I think =
that was the last of that generation MCU. All the previous MCU also =
required it.
>=20
> You recall if it was needed to enable the RGB commands or was it only
> for keyboard shortcuts? If it is needed for keyboard shortcuts it is
> correct for it to stay. If RGB does not turn on where it has been
> enabled before, it should also stay.

It was for shortcuts and the ROG buttons above the keyboard. There may =
have been some laptops using the same MCU that required it to enable =
LEDs too.

>=20
>> I saw some messages in perhaps another thread where it was mentioned =
that 0x5E init should be removed? That I agreed with that?
>> I know there are AniMe and Slash versions that use that init, and =
they are on the same MCU as the keyboard. I had expected that just one =
init (on 0x5A or whatever) would work but it doesn=E2=80=99t - what I =
don=E2=80=99t recall is if an incomplete init affected the keyboard =
features.
>=20
> Well, the way these devices work is that there are three hiddev
> devices, usually nested within the same hid endpoint under up to three
> collections. Each has one report ID. 0x5a is for brightness controls,
> 0x5d is for RGB, and 0x5e is for anime. For the first two, I know the
> usages are 76 and 79 (see above). I am not sure what the usage for
> anime is because I do not have a hid descriptor for that device.
>=20
> In order to start talking to one of the hiddev devices, you are
> supposed to start with an init. The init is bidirectional, so after
> reading it back software knows it is talking to an Asus device (as it
> is done in this series). Likewise, even though it is not the case for
> all MCUs, the MCUs themselves can use it to verify they are talking to
> an Asus application (as you said) and reject commands if it is not
> sent.

Yes, I know.=20
Before I stopped on all this I built up a rather large (untidy) =
collection of dumps for various things here =
https://gitlab.com/asus-linux/reverse-engineering/-/tree/master

>=20
> For this reason, I think it is a good idea before asusctl starts
> controlling RGB, to always start with a 0x5d init to verify it is
> talking to an Asus device. And before Anime, with a 0x5e init (if the
> specific application for it is available). So since Dennis you are the
> new maintainer, you should try to work that in. Sending it twice does
> not hurt, even if not ideal.
>=20
> Similarly, because this driver does not do Anime currently, there is
> no reason for it to send 0x5e. It also does not do RGB, so there is no
> reason to send 0x5D (unless not sending it causes issues). For the RGB
> patch I did, I delayed the init purposely until userspace interacts
> with the sysfs RGB endpoint, partly to interfere with userspace
> software less as well. So if the user does not use the sysfs RGB e.g.
> asusctl is completely unaffected.
>=20
>> In all reality unless the full set of init is causing issues it=E2=80=99=
s best to leave them in. If it is then I guess this driver is going to =
become a little more complex and have a few more quirks.
>>=20
>> Unfortunately I didn=E2=80=99t keep good records of my findings on =
this so it=E2=80=99s just my remembered observations that you=E2=80=99ll =
have to take at my word.
>>=20
>> It would be a good idea for you both to perhaps collaborate with =
Sergei from ghelper, he has put a huge amount of effort in to that tool =
and due to it being windows he gets a hell of a lot more use and bug =
reports/data than this driver does. There=E2=80=99s no shame in looking =
to others for inspiration, ideas, or guidance.
>=20
> Good idea. =46rom a quick look, indeed slash/anime is 0x5e. We could
> interact with him more in the future.
>=20
> Although looking into it, to find the correct endpoint he does a dirty
> check for report length being more than 128[1]. SIgh

Sergei would appreciate any friendly hints for sure. He=E2=80=99s a very =
nice guy.

>=20
> I think it would be productive to try to merge this for 6.19. So
> Dennis can you try to be a bit more cooperative?

He=E2=80=99s not being intentionally recalcitrant. You both have vested =
interest in the outcomes of this review process and from what I=E2=80=99ve=
 seen he has provided some excellent feedback.  If something isn=E2=80=99t=
 going the way you want it doesn=E2=80=99t mean it=E2=80=99s personal. =
You will both converge on acceptable solutions through good faith and =
communication.

I=E2=80=99ll try to get a look in early on the next patch version and =
help a little if I can - it would be good to get this work in kernel and =
you both build off it.

>=20
> I already have 6 more patches for duo keyboards. Although the keyboard
> brightness button on those seems to not work (?)[2]. I am waiting on a
> reply for that. Perhaps it uses a slightly different ID code. However,
> it seems that brightness works even when disconnecting and connecting
> the keyboard. Which is great.

Do the keys emit any codes? Maybe checking the raw output before it all =
gets filtered by the driver could help (like printing the raw array as =
hex) in asus_raw_event(). If there is nothing it could be emitting WMI =
events. ASUS did a dirty on some laptops and left the default WMI (I =
probably misremember, but ACPI event at least) in the ACPI, but made =
them emit nothing and used HID for brightness control instead.

That was this patch: =
https://github.com/torvalds/linux/commit/a720dee5e039238a44c0142dfccdc0e35=
c1125f7

Seems likely that because it appears to be a single button brightness =
cycle it could be a new code. In any case, debug printing the raw array =
as hex will show it if it=E2=80=99s being emitted.

While I remember, if you ever start playing with per-key RGB I mapped a =
lot of laptops =
https://gitlab.com/asus-linux/reverse-engineering/-/blob/master/keyboard/p=
er_key_raw_bytes.ods?ref_type=3Dheads - something to note is that each =
packet takes 1ms, but due to kernel internals it may attempt a burst of =
a few, or there could be up to 5ms delay. So a full sequence per row can =
be 8-20ms or more.

Oh, small reminder: if any patch changes dramatically from what I =
reviewed my tags should be removed.

>=20
> Antheas
>=20
> [1] =
https://github.com/seerge/g-helper/blob/610b11749b4da97346012e5d47f0a9bbc9=
3b94af/app/AnimeMatrix/Communication/Platform/WindowsUsbProvider.cs#L37
> [2] https://github.com/bazzite-org/kernel-bazzite/issues/35
>=20
>> Cheers,
>> Luke.
>>=20
>>>=20
>>>> No disable commands unless we find hard evidence those are strictly =
needed.
>>>=20
>>> They are needed for the Xbox Ally series, but since this driver does
>>> not do RGB it is out of scope.
>>>=20
>>>>> Antheas
>>>>>=20
>>>>>>> Hopefully this clears things up
>>>>>>>=20
>>>>>>> Antheas
>>>>>>>=20
>>>>>>>>> Unrelated but I was b4ing this series on Ubuntu 24 and got =
BADSIG:
>>>>>>>>> DKIM/antheas.dev. Is there a reference for fixing this on my =
host?
>>>>>>>>> Perhaps it would help with spam
>>>>>>>> I see BADSIG very often these days from b4 (thanks to gmail =
expiring
>>>>>>>> things after 7 days or so, I recall hearing somewhere), I just =
ignore them
>>>>>>>> entirely.
>>>>>>>>=20
>>>>>>>> AFAIK, that has never caused any delay to any patch in pdx86 =
domain so if
>>>>>>>> that is what you thought is happening here, it's not the case.
>>>>>>>> If your patch does appear in the pdx86 patchwork, there's even =
less reason
>>>>>>>> to worry as I mostly pick patches to process using patchwork's =
list.
>>>>>>> Turns out I had to update my DNS records. It should be good now.
>>>>>>>=20
>>>>>>>> --
>>>>>>>> i.
>>>>>> snipp
>>>>>>>>>> 2.51.2
>>=20
>>=20
>>=20
>=20


