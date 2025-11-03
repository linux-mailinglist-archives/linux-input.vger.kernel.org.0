Return-Path: <linux-input+bounces-15866-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE046C2AAE2
	for <lists+linux-input@lfdr.de>; Mon, 03 Nov 2025 10:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 682E33B26B4
	for <lists+linux-input@lfdr.de>; Mon,  3 Nov 2025 09:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310F32E7180;
	Mon,  3 Nov 2025 09:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="n0SkMk2I"
X-Original-To: linux-input@vger.kernel.org
Received: from outbound.mr.icloud.com (p-west2-cluster6-host4-snip4-2.eps.apple.com [57.103.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804502E62A2
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 09:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762160760; cv=none; b=OZv1aM90oqMrtw4/ne8H8XOKN0y/p48e9iW0OPrU56gGjm1UpmP0DJbS9tubYYmGtgrA3d3lPZhdmM0B4XHyJIhFMR9w2J90gUdp9UUNhwck7Rf8JQYdBwR8lYedSYaonAaKd8W/S63fW7Wup2rqQN/HBkgOk1/Ye2l37c6vVF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762160760; c=relaxed/simple;
	bh=o4TCOAarTCqFaQqsWZz3KYGdDV4dO/jaL/MFd8GN8B4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=prUL0L/owupkQOXaKggxUaabmHpH4RKPseViCx+7cV6/Ljn07RAE4pw2KnnmMJK+hFBnDXCmxLBFai+Ih8FD5n9Fz9VoBgHC3G4iJk835l/0gpEZbzXJg2klHbBRllXK4jaWzsWhBDntVL2prpvNOZWgTLLk9g7IpDUt12+oQiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=pass smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=n0SkMk2I; arc=none smtp.client-ip=57.103.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljones.dev
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-11 (Postfix) with ESMTPS id C2F9D18001AF;
	Mon,  3 Nov 2025 09:05:52 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; s=sig1; bh=WQH4CHpDHsppzELgjx+JYv6twRdp4gv2g185+mM5A7k=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=n0SkMk2IPt9HKg5FvBA+rhWOJvg035Zruh/2COLmwiVA7VoyLuUznSb2940Rg8+f8HREXAusQhKeZ90SyhbsbwyPm9Z1oZ4crWERAmNms0CRk+eLpuW1M17j10D4RehgEo/4DlhmCqS/+vl1ANZL3JwkwQ77V5xxr+6iLwey7DO626ygjA5QxksltQe7Usu3s4xfVS/ikgU9KTZ/eHO4CvW1TKTXevt4slEkzr7LoxVkeaYv0CQieeGTbjLk0CqjLrL4RgWahfS6LJK6T6SOd1kBuqCYpgmiYz9w9QG9mVWyUaJ8eid/RXEPVxpnWRoMEYS1yl9uV0G4ukkTyDOWrQ==
mail-alias-created-date: 1566896761000
Received: from smtpclient.apple (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-11 (Postfix) with ESMTPSA id ED8C418001C5;
	Mon,  3 Nov 2025 09:05:48 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
From: luke@ljones.dev
In-Reply-To: <CAGwozwGJUPQLB2UrZubUj9Sd-MijM0ADepVwEaNo6MNRafD=Gg@mail.gmail.com>
Date: Mon, 3 Nov 2025 22:05:36 +1300
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Denis Benato <benato.denis96@gmail.com>,
 kernel test robot <lkp@intel.com>,
 platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4A46B714-E4D8-43B3-A4F0-53FF76E41BE4@ljones.dev>
References: <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
 <20251103042848.9302-1-derekjohn.clark@gmail.com>
 <CAGwozwHCnHwOVw08ZJ4LOFD8kDv+kevvF1-PkjBq2+VMBBx9TQ@mail.gmail.com>
 <52B61B78-4177-474B-9D40-471ED918C951@ljones.dev>
 <CAGwozwGJUPQLB2UrZubUj9Sd-MijM0ADepVwEaNo6MNRafD=Gg@mail.gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Proofpoint-GUID: _grnL0Lt1wWcKI3r0Juugaljw53zKclU
X-Proofpoint-ORIG-GUID: _grnL0Lt1wWcKI3r0Juugaljw53zKclU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA4MyBTYWx0ZWRfX2AM1GGK4CYum
 CXIieb03ogCGBbS728Hwjoi7p7EIsd12pw++uPZH+uHZNHO3Kj0AcaaFJWqlTxsokHz2WEoCblQ
 RG8/z7hzFJxh8XBupk8De02SzhA4yLa7n/l+CJIFqkInh6IGTM5GIdxn9Tcd7RS5Ku1RiVWAHcF
 GLTIzeWbve4XZPycrZvlYMku8H9c7NIjxxRZp3Y3ylMrU6ohwAS42Zzc7+D+zCIfwfghBq4k5vJ
 yzDej9pzE0Q+qKYSESPFnUK9GRzkoEvOZqTqYPuxjZ/NXl1w6GMfK+NK37FBkUzqySHffWBp0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1030 bulkscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2511030083
X-JNJ: AAAAAAABGgkyKGRcltc+12A4wZG8Sr3C75wiZtdY6ZwPuhPTZRa0uSZbsqz8aGeASxY2+Bx6sgCl98kQmC3tv8ZLnJmQ6vuSybqOwWGhIOkQaEs1JVmp5CaAN9bAatRUvbN7qbvvulXT3csmzJuWwYNjcFnpbCcnseCuIs+mGnx8HmberSlQOVG7GLOqFL4IqqR+PgXB3wN4Szj58hF0ovlhhg10F6JWHRtsDNzDzYX4A0aDmWCj2TAQUIvfmUSuW0qCTY6V8B/Benlxrqc9eKkM7a8WrRx058+vyR1Z+RFHaZakNXW/b1KyLY+5BFpVSPmxjc3kFYFieVff3z2avM7ZiBfxT73bOmrFnxVjZPzu16h5O9B0pq1XCrdn32fL16GgJbo4cVQfro8+sZLNC28IQ9/jN5f7EfDMsuJqZt9jvjgMRAUCpAN56A3zLP+UJ9eUYBQVlnK6HSm81aAxv7JETa52edC7fIG9iqaMGSyb4+0M9IO5dwKtVAcETJuoPGNExBErCBQlLyVFtoe5tHMmoDcF4AOs8we3U40bYuKhlgvMlMsFe8JxWGf+sljHePO7xIwB7Obod460pw3RWBzr+LkVI8XXCNVFcYSs0Ybw3gOLxEtFw8h4B/K5heek8iX0+mwJ5Q+GbnT9Fcoq1S65YC9DR977MjfOdlOOFanPoOgUCHi7JZ52MDUWFpoaRsify01UnxkJUj1OEHTT/Aa6LDdMIB2QS4Wv66WhQvMYa/bpKHkrSz9TSji5dJXe2+p0FMLyH55/1N+/cdbRM/Dekezn/wj2PhKs



> On 3 Nov 2025, at 21:48, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>=20
> On Mon, 3 Nov 2025 at 09:38, <luke@ljones.dev> wrote:
>>=20
>>=20
>>> On 3 Nov 2025, at 20:36, Antheas Kapenekakis <lkml@antheas.dev> =
wrote:
>>>=20
>>> On Mon, 3 Nov 2025 at 05:29, Derek J. Clark =
<derekjohn.clark@gmail.com> wrote:
>>>>=20
>>>>> On Fri, 31 Oct 2025 at 09:27, Jiri Kosina <jikos@kernel.org> =
wrote:
>>>>>>=20
>>>>>> On Thu, 23 Oct 2025, Antheas Kapenekakis wrote:
>>>>>>=20
>>>>>>>> 1589
>>>>>>>> 1590  static void kbd_led_update_all(struct work_struct *work)
>>>>>>>> 1591  {
>>>>>>>> 1592          enum led_brightness value;
>>>>>>>> 1593          struct asus_wmi *asus;
>>>>>>>> 1594          bool registered, notify;
>>>>>>>> 1595          int ret;
>>>>>>>                             /\ value should have been an int and
>>>>>>> placed here. It can take the value -1 hence the check
>>>>>>=20
>>>>>> Thanks, that needs to be fixed before the final merge.
>>>>>>=20
>>>>>>> Are there any other comments on the series?
>>>>>>>=20
>>>>>>> The only issue I am aware of is that Denis identified a bug in =
asusd
>>>>>>> (asusctl userspace program daemon) in certain Asus G14/G16 =
laptops
>>>>>>> that cause laptop keys to become sticky, I have had users also =
report
>>>>>>> that bug in previous versions of the series. WIthout asusd =
running,
>>>>>>> keyboards work fine incl. with brightness control (did not work
>>>>>>> before). Given it will take two months for this to reach =
mainline, I
>>>>>>> think it is a fair amount of time to address the bug.
>>>>>>=20
>>>>>> One thing that is not clear to me about this -- is this causing a =
visible
>>>>>> user-space behavior regression before vs. after the patchset with =
asusctl?
>>>>>>=20
>>>>>> If so, I am afraid this needs to be root-caused and fixed before =
the set
>>>>>> can be considered for inclusion.
>>>>=20
>>>>> Commit 591ba2074337 ("HID: asus: prevent binding to all HID =
devices on
>>>>> ROG") adds HID_QUIRK_INPUT_PER_APP and the extra devices seem to
>>>>> confuse asusd. Since the devices are the same as with hid-asus not
>>>>> loaded, it is specific to that program.
>>>>>=20
>>>>>=20
>>>> Hi Antheas.
>>>>=20
>>>> While you have previously expressed to me directly that you wish =
InputPlumber
>>>> didn't exist, it still very much does, in fact, exist. I also know =
that you are
>>>> explicitly aware that InputPlumber is a consumer of this interface, =
so your
>>>> comment that asusctl is the only affected program is something you =
know to be
>>>> false. This is not even the first time you have renamed an input =
device that
>>>> you knew InputPlumber was a consumer of without notifying me[1].
>>>>=20
>>>> I can't abide you outright lying to the maintainers here and I'm =
sick and tired
>>>> of having to watch your every move on the LKML. Either become a =
good citizen of
>>>> kernel maintenance, or get out of it.
>>>=20
>>> Hi Derek,
>>> I am not aware if your software is affected or not by this series as =
I
>>> have not received reports about it.
>>>=20
>>> If it is, please add:
>>> "ASUSTeK Computer Inc. N-KEY Device"
>>>=20
>>> As a name match to your software (should only take 5 minutes).
>>>=20
>>> I worked with Luke and Dennis on it for the better part of a year so
>>> hopefully they forwarded to you if it affects you or not.
>>>=20
>>> Your software relies on OOT drivers for most devices incl. the Ally =
so
>>> I am unsure if it is affected in reality. E.g., it would not be
>>> affected in SteamOS and CachyOS. In the future, it would be good to
>>> avoid name matches for your software as it makes it very fragile,
>>> which is a discussion we have had before. I do not think device =
evdev
>>> names constitute an ABI technically.
>>=20
>> Taking no sides here.
>>=20
>> An unfortunate reality is that there is stuff out there that does use =
name matches (and yes I agree they shouldn=E2=80=99t because it is *not* =
an ABI and many many devices have had name changes over the decades).
>>=20
>> While name strings aren't a formal ABI, when a change affects known =
downstream users, a heads-up helps the ecosystem adapt smoothly=E2=80=94ev=
en if the technical stance is that they shouldn't rely on names.
>>=20
>> In general it also needs to be justified such as:
>> - "Matches updated product branding"
>> - "Current string is misleading (says 'mouse' but it's a keyboard)"
>> - "Fixing spelling error"
>> - "Aligning with USB-IF device class names"
>>=20
>> I always advocated use of evdev libraries to discover devices rather =
than the shortcut of name matching as it is much more powerful and =
reliable (which is how asusctl does dynamic add/remove of LED dev dbus =
interfaces). It=E2=80=99s much better to use evdev with vid/pid, device =
sub/classes, into descriptors and so on - you can be as open or =
restrictive as required by use case. This particular issue illustrates =
why this approach is preferable.
>>=20
>> If the name change is a result of something I said or missed then I =
apologise to both Derek and yourself. Likely I missed it as I=E2=80=99ve =
never relied on name strings for userspace.
>>=20
>> Regarding the OOT ally drivers I started, these will of course get =
upstreamed in the future (by Denis in this case when he can). They are =
getting very heavily battled tested in the mean time. Please do =
contribute to them if there is anything required to be addressed or chat =
to Denis, after all they are made only to benefit all users (there is no =
*race to be first* here.
>>=20
>> As I no longer work on Asus laptops/handhelds and don't have hardware =
left to test with, I can't contribute further to this discussion. Best =
of luck resolving this.
>>=20
>> I'm out.
>> Luke.
>=20
> Hi Luke,
> good luck to your future endeavors.
>=20
> The OOT reference was not to disparage the drivers, just to note that
> in kernels that use those, hid-asus is stubbed for the Ally so there
> is no change there.
>=20
> As for reasons, see below.
>=20
>> - "Matches updated product branding"
>=20
> Reason for [1]
>=20
>> - "Aligning with USB-IF device class names"
>=20
> Reason for the change in this patch

Ack. Thank you, appreciate the clarification, this is the appropriate =
reason. Might be worth mentioning in change cover letter or commit =
message (if not already, sorry if I missed).

>=20
> If you would like me to stop cc'ing you in future asus changes let me
> know. I am preparing some additional patches for the Duo class of
> laptops.

Leave me in for the moment. I=E2=80=99ll submit a patch to remove myself =
from maintainers once Denis is comfortable in the role.

Regarding Duo, I assume you mean the larger type with two full-size =
screens and not the older models with a thin screen above the keyboard?
There was an issue with the older ones which I could not solve until I =
had the physical hardware to test due to it being difficult for testers =
to describe the exact behaviour. The way the power-off and brightness =
control works is funky. I submitted the patch here =
https://lore.kernel.org/all/20250525204214.104030-1-luke@ljones.dev/

Hopefully that=E2=80=99s of some help to you. It=E2=80=99s very unlikely =
I will resubmit that as a split series.

If you need anything from me related to above or otherwise, do please =
reach out off-chain to avoid us further hitting the CC.

>=20
> Best,
> Antheas
>=20
>>>=20
>>> Best,
>>> Antheas
>>>=20
>>>> Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices =
on ROG")
>>>> Nacked-By: Derek J. Clark <derekjohn.clark@gmail.com>
>>>>=20
>>>> - Derek
>>>>=20
>>>> [1] =
https://lore.kernel.org/linux-input/Z74vZD7ZtKBTDlwy@google.com/
>>>>=20
>>>>> We can delay that patch until Denis who took over maintenance of =
the
>>>>> program can have a deeper look. I will still keep the last part of
>>>>> that patch that skips the input check, because that causes errors =
in
>>>>> devices that do not create an input device (e.g., lightbar).
>>>>>=20
>>>>> Antheas



