Return-Path: <linux-input+bounces-15864-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A41FC2A977
	for <lists+linux-input@lfdr.de>; Mon, 03 Nov 2025 09:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DAA64E3E64
	for <lists+linux-input@lfdr.de>; Mon,  3 Nov 2025 08:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4D12E040C;
	Mon,  3 Nov 2025 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="DWFAg4xx"
X-Original-To: linux-input@vger.kernel.org
Received: from outbound.mr.icloud.com (p-west2-cluster2-host12-snip4-6.eps.apple.com [57.103.68.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77A02DEA7A
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 08:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762159081; cv=none; b=U/wkpQXALyrRGP3K4fQLaFP2yugwFXKERZk3MbhMFq7AqXy2q27CDdqpazzVjMnaZQ14YHL3L0eU6RKZE+17jBOMZV9wR0wE6jzKr4Sr8hbKnKrZG92Ne9fxwRXhjdla8sseedU6dRVDYT4DlWTkIhikWsL9DADkQGFaI8/9YYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762159081; c=relaxed/simple;
	bh=Sp7nSaXbOCNj+brMy3i1C+VjmzXxTE/hC3oJTrEU3E4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZPU1YxiGZkbHI5yn8S9QLEVSQnc7bW/DrlzkSp5nJ6wyVrEonKiidENbAkfGudPIOOterHVrX9GMcZeKLVFpIxAd/SruEUCZKqUYQs3OR5VEE9aY+aKPVI/ll9b67LWqeryS2zd7CeGzDuhvDrEjcEW12utFZf2pUo62QPCnLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=pass smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=DWFAg4xx; arc=none smtp.client-ip=57.103.68.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljones.dev
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-7 (Postfix) with ESMTPS id CDDDF1800176;
	Mon,  3 Nov 2025 08:37:56 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; s=sig1; bh=A5gZGsxsUWbC8mj8gE4jWelFQ54ptgMLFPpk+7cReZg=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=DWFAg4xxE+m20x9u9wD9OY/lr1Y7D5slT97bh68PmrJ+rsRr8BdfN/aVM+20Kzaq3lrPtlw9e+dvOwksUZEnp+TYOY/QWt73veAx09Y9CPDDteq9pogmBxQP3XlJA4/7UqD7huBJ+mTsPFGUK5eTovHQ5dkkswevRU3FRKjlpTKHtz0vbGmPex8xeRE6Nbs8scMfBKBPZUE48KGObQ60xUOmBf0ih1OIuC84s81q7nAzIcL6Ux/CwPUIVQ+gG+U/xfvemiJeTvcvQQcz8v2pVxaQrSmJKuZbdb5uxnvNL9jawdXafzqCbXf90UOLlRV7VnCR8wE/I6D05NCeZL9Wvg==
mail-alias-created-date: 1566896761000
Received: from smtpclient.apple (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-7 (Postfix) with ESMTPSA id C7E0218000A2;
	Mon,  3 Nov 2025 08:37:53 +0000 (UTC)
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
In-Reply-To: <CAGwozwHCnHwOVw08ZJ4LOFD8kDv+kevvF1-PkjBq2+VMBBx9TQ@mail.gmail.com>
Date: Mon, 3 Nov 2025 21:37:40 +1300
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
Message-Id: <52B61B78-4177-474B-9D40-471ED918C951@ljones.dev>
References: <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
 <20251103042848.9302-1-derekjohn.clark@gmail.com>
 <CAGwozwHCnHwOVw08ZJ4LOFD8kDv+kevvF1-PkjBq2+VMBBx9TQ@mail.gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
X-Proofpoint-GUID: 7TEDa_DEytf2rJ2G_QvLuacr2f32o_bB
X-Proofpoint-ORIG-GUID: 7TEDa_DEytf2rJ2G_QvLuacr2f32o_bB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA3OSBTYWx0ZWRfX+2R3w4de1bFi
 Uoi+7W7T669pWxfnxoMqJYU0u4FOJBd3oGi7s97P1RCKvMCUNjxPWqbeu0y/4X6XPRrskpnU16n
 l780+p1LLHNjvNxrXKRqESJ+Fbq4pXY8BiIK7lkujs+D4+4g7TelObBUCyylRUi924126StCQ0f
 dbfZ9cB8EEcZClu5rYKzEbIYg7jbqcZEXoNj8VQeM/51KVy2LGaLGVdqmmPH1aAXKI+zvIg0Mnv
 MqpSyRzLEWm57JyF9eQobuUX99ETrBImuCbJE2eV1JXN7Bg2ZJ3wkj9F3Z5fIc31vo5ZlRjDQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 clxscore=1030 mlxlogscore=999
 spamscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2511030079
X-JNJ: AAAAAAABbd6XqknHa+CF2M9WuZZR5OKHSDARVg9jtMkzSgwqIagSwG7+g5Ssmnkzk3xUZFHnxEwri1mPi5uS5bMEfZnetGW5CPWf9HpyK42SlQTrSZlb6W6sxOaeNRZIwJVuexGtpzmgCSkP15DREt3MeFSyOTc0sf4wT6lyF6HLRKZN7VvbYGlnEQhDkrtFfQJu9TyJeIeyNTe/wqeK8QaHw5UtiJPrj8VnIXCwBeulEIfzb2hqZpvw9w66UaBmeVA7O8to06cNqlSdiwsm4iHrYgtjZhfQkkFVFPvf0PBUEiBoZ7V27qw/bSQleHc54iwXGbw+0lz63cKiiiFBrzWmTdh/fR8o71fRr/7DOtne7Bi8U+6mCjc1CMX8PZ1cf8oHA/CsM1fJVognGYYdCjHWctrzbxL6+pN7HG/5SXAgRsZJvHSGlmrj3KfOZ0U5LGmV0obIFASig3EJU6WC592/wW6CUYioy4qtT00YrsjqB6b4dKtYJEVjIgBfaa3eIrOQxAc+lH+WJF2me4OSWR8QT2eKfz6joEH4mf1ATFMGykaXq/k6edSKW52Rx5Ubq+QQG4Bb0bSTLX2MYEsIea3jkLnmABOR0ynVVNXN69QkbI25kTBtA/Ar9D7rVB436Zrs8ECticPiUCKQBGENU8KIQ41qp3sLizZON68d0V0FUk6551zo7+55hFICbxv3FLyoJTiyhNqKF8tj249sXLwLXZNh9+0/XJpuXvPCIWOuF2vZHqEjTwnwNhWmI9arC2KuXMOWOKKK1c4u47Xo5Xsg3Z+/eGMl85bTNT9jPJzJr3Nn7g/9w6Nj/g==


> On 3 Nov 2025, at 20:36, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>=20
> On Mon, 3 Nov 2025 at 05:29, Derek J. Clark =
<derekjohn.clark@gmail.com> wrote:
>>=20
>>> On Fri, 31 Oct 2025 at 09:27, Jiri Kosina <jikos@kernel.org> wrote:
>>>>=20
>>>> On Thu, 23 Oct 2025, Antheas Kapenekakis wrote:
>>>>=20
>>>>>>  1589
>>>>>>  1590  static void kbd_led_update_all(struct work_struct *work)
>>>>>>  1591  {
>>>>>>  1592          enum led_brightness value;
>>>>>>  1593          struct asus_wmi *asus;
>>>>>>  1594          bool registered, notify;
>>>>>>  1595          int ret;
>>>>>                              /\ value should have been an int and
>>>>> placed here. It can take the value -1 hence the check
>>>>=20
>>>> Thanks, that needs to be fixed before the final merge.
>>>>=20
>>>>> Are there any other comments on the series?
>>>>>=20
>>>>> The only issue I am aware of is that Denis identified a bug in =
asusd
>>>>> (asusctl userspace program daemon) in certain Asus G14/G16 laptops
>>>>> that cause laptop keys to become sticky, I have had users also =
report
>>>>> that bug in previous versions of the series. WIthout asusd =
running,
>>>>> keyboards work fine incl. with brightness control (did not work
>>>>> before). Given it will take two months for this to reach mainline, =
I
>>>>> think it is a fair amount of time to address the bug.
>>>>=20
>>>> One thing that is not clear to me about this -- is this causing a =
visible
>>>> user-space behavior regression before vs. after the patchset with =
asusctl?
>>>>=20
>>>> If so, I am afraid this needs to be root-caused and fixed before =
the set
>>>> can be considered for inclusion.
>>=20
>>> Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices =
on
>>> ROG") adds HID_QUIRK_INPUT_PER_APP and the extra devices seem to
>>> confuse asusd. Since the devices are the same as with hid-asus not
>>> loaded, it is specific to that program.
>>>=20
>>>=20
>> Hi Antheas.
>>=20
>> While you have previously expressed to me directly that you wish =
InputPlumber
>> didn't exist, it still very much does, in fact, exist. I also know =
that you are
>> explicitly aware that InputPlumber is a consumer of this interface, =
so your
>> comment that asusctl is the only affected program is something you =
know to be
>> false. This is not even the first time you have renamed an input =
device that
>> you knew InputPlumber was a consumer of without notifying me[1].
>>=20
>> I can't abide you outright lying to the maintainers here and I'm sick =
and tired
>> of having to watch your every move on the LKML. Either become a good =
citizen of
>> kernel maintenance, or get out of it.
>=20
> Hi Derek,
> I am not aware if your software is affected or not by this series as I
> have not received reports about it.
>=20
> If it is, please add:
> "ASUSTeK Computer Inc. N-KEY Device"
>=20
> As a name match to your software (should only take 5 minutes).
>=20
> I worked with Luke and Dennis on it for the better part of a year so
> hopefully they forwarded to you if it affects you or not.
>=20
> Your software relies on OOT drivers for most devices incl. the Ally so
> I am unsure if it is affected in reality. E.g., it would not be
> affected in SteamOS and CachyOS. In the future, it would be good to
> avoid name matches for your software as it makes it very fragile,
> which is a discussion we have had before. I do not think device evdev
> names constitute an ABI technically.

Taking no sides here.

An unfortunate reality is that there is stuff out there that does use =
name matches (and yes I agree they shouldn=E2=80=99t because it is *not* =
an ABI and many many devices have had name changes over the decades).

While name strings aren't a formal ABI, when a change affects known =
downstream users, a heads-up helps the ecosystem adapt smoothly=E2=80=94ev=
en if the technical stance is that they shouldn't rely on names.

In general it also needs to be justified such as:
- "Matches updated product branding"
- "Current string is misleading (says 'mouse' but it's a keyboard)"
- "Fixing spelling error"
- "Aligning with USB-IF device class names"

I always advocated use of evdev libraries to discover devices rather =
than the shortcut of name matching as it is much more powerful and =
reliable (which is how asusctl does dynamic add/remove of LED dev dbus =
interfaces). It=E2=80=99s much better to use evdev with vid/pid, device =
sub/classes, into descriptors and so on - you can be as open or =
restrictive as required by use case. This particular issue illustrates =
why this approach is preferable.

If the name change is a result of something I said or missed then I =
apologise to both Derek and yourself. Likely I missed it as I=E2=80=99ve =
never relied on name strings for userspace.

Regarding the OOT ally drivers I started, these will of course get =
upstreamed in the future (by Denis in this case when he can). They are =
getting very heavily battled tested in the mean time. Please do =
contribute to them if there is anything required to be addressed or chat =
to Denis, after all they are made only to benefit all users (there is no =
*race to be first* here.

As I no longer work on Asus laptops/handhelds and don't have hardware =
left to test with, I can't contribute further to this discussion. Best =
of luck resolving this.

I'm out.
Luke.

>=20
> Best,
> Antheas
>=20
>> Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices =
on ROG")
>> Nacked-By: Derek J. Clark <derekjohn.clark@gmail.com>
>>=20
>> - Derek
>>=20
>> [1] https://lore.kernel.org/linux-input/Z74vZD7ZtKBTDlwy@google.com/
>>=20
>>> We can delay that patch until Denis who took over maintenance of the
>>> program can have a deeper look. I will still keep the last part of
>>> that patch that skips the input check, because that causes errors in
>>> devices that do not create an input device (e.g., lightbar).
>>>=20
>>> Antheas



