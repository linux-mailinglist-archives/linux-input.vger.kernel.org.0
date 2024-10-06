Return-Path: <linux-input+bounces-7101-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 591F0991B88
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 02:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8F3D1F21ED1
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 00:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C084A3C;
	Sun,  6 Oct 2024 00:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="JMVKqy+n"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68AF4A23;
	Sun,  6 Oct 2024 00:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728174003; cv=none; b=vGmyjBMXdDDM7UTK2dmlrz/k7Wtm0UnFHFRu9i1k9jkxeFdmHyWzxgVDJxx8x/cJcRTULUTZY8CTFcjUAjsSx1NeKVNSG2EC17aEASyB3oPzTFhMY9GFBxCwr/xKa/IuHuMVB8IGBizg9fjG+t7SdVx1W2Sdse8H4FRqcA+rXHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728174003; c=relaxed/simple;
	bh=lDws3Qg/vyK2jpUOZ4w75cmoxRBkESQdb1GX79yyub0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXV8fRP4TX6GOJFfVLwa3pXKRUt33j80WR5s1IjwCfY9PIWJjwe6Gp17KT8tY2SYg3/A632V7nGl4jy4OG0gbuaS72EkokdQ6iLcAKKllNcRMsc5yvS+Bh3dWh1xZP2XwIipvei1XgTY0RrppZg1a7EzSRwFuOsObJFwGX5nnKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=JMVKqy+n; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1728173974; x=1728778774; i=christian@heusel.eu;
	bh=QLirFuEof9zYPg1pqxnsxr/6JiEDZH5zqnpC1VhyykY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JMVKqy+ngmwmDmSI+6LhBYpsNg8C55CK3cwjJVm5+wYfZrXNcRxH8dchctnqiN0l
	 +tQ0MxYaLW6thsVCfp39oN2PgZN+8iCu3/fhOs2nBs+yVgznaljndsSJCcZ81jgRZ
	 /Bd6bb9uHTd3OnZDlGQYwVx51ykIQt69DhKRom/FNYYhCKhJNvr7lnbQ9WG1j3ZDz
	 D3E2COrqmzT4SvCKAtMBE7JUUYdj4C5/v/XCvFkkecAI85Mnn791HliArHPh9JEnX
	 qMKYy0cTXrwzWddgdv6kW19wr9pkqPLry4azrSbrUnvEKKyu1co5CX6661w4AFYDr
	 eJvYkolopo8ekmCkFw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N64JK-1u3Fsn0NJ2-012pa7; Sun, 06
 Oct 2024 02:13:37 +0200
Date: Sun, 6 Oct 2024 02:13:34 +0200
From: Christian Heusel <christian@heusel.eu>
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, Kenny Levinsen <kl@kl.wtf>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Nam Cao <namcao@linutronix.de>, linux-input@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] HID: i2c-hid: Touchpad not working on Thinkpad Z16
 Gen 2
Message-ID: <594820d1-506d-41a7-acdb-82e8476d8242@heusel.eu>
References: <gbvkokf7rpsayfqv4l5mvk347lal72q54jgxfvwu7bmx7olngm@e3tcy6oyaas3>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dp7wnmmfafmyhzzv"
Content-Disposition: inline
In-Reply-To: <gbvkokf7rpsayfqv4l5mvk347lal72q54jgxfvwu7bmx7olngm@e3tcy6oyaas3>
X-Provags-ID: V03:K1:oX4aQ0V5gY6ZhcUke661Ko4WIFtq1tR1dNXEyNlakgiM6FmCngA
 qVS+aqm3S3cBLyrdJ92tf7sSo4+q2thm5WkOtbOuc6um/wr97lE8e7eJiSkjEasek06yHXA
 oWqNt2vDlcXhOLBaBsWz7wcf3KcEe50+FBd+I6himR9dVDGV3GBm8QpJkDLktgl/0aFzSDQ
 h2wiVRSwhUx8uO2utBV7w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZSZpipJJ3XE=;h4ABgIWU+v48Je9o7BkbsUnC75x
 JzJS5itesNWei+nfJB8YFzrTwfaxkUfKAs10jxY9aALhPDBdKKOTF93sswxYC2aRGI7ueBiIs
 sbCw2oJzsPYgRZAdXUtJZv8tOcF5GShcnqZ0QsAr2y0/3WLrjSO+SJ7nDmJESHqd7wP5XGKdi
 OT58Bdy6JDtK9+6owe5I8vBzOQ+iu9o0+/2FK9hwk99ws6Be4uk6EEZy3HwKKklU2RgAu/SQx
 qAuYGxNz3zNd02lix1rJAvprbTpdJB+NG4dRg59rXHxfNDJMGRM7+Rt6VqcHjcyjcjAR2kRGc
 Kdmc2BvIhZ1tQ9G10Z5i5LHleNaNxniDa4Zr224ooHMbYveXYDuP18xafU3Uk7gyJEfZNEuT4
 zFGY9MBZSl/6QifUjT4bkjQAEcCvG7w9oCd3mzg88+DQSEi/wjBjs+6iokXsqFFozuZZb0bM8
 Rhu5OiIaqNOksg+IPV36WmVr3C4kcrLDGF5f9kHhNwet8FXmraIKG68XnRhdZRKG3whC8RIo1
 Cbe86F0tuIvuVjE4XjYNTAZzU5nABRJ0zofNdwZ/O7PZqgcRBNpoAyxr9PWiyJv3evt3QMHVV
 mw0DBm8mW+Wui3MTpaobdsGPjBIULnOHnf9EpZjqDxgl6SSJkdZMZnRen1d+PZjSAhURNAOAH
 kPFRTlYbJsTaB71uC576MnKtWT8ihEsBelKNu2EauqoDlhbRb00phTwKn8+yNRA1AZ7J5ZTqY
 0Z51dnP4tFX2tVV19WI1oY5Koxhouozqw==


--dp7wnmmfafmyhzzv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] HID: i2c-hid: Touchpad not working on Thinkpad Z16
 Gen 2
MIME-Version: 1.0

Hey Jose,

On 24/10/05 05:01PM, Jose Fernandez wrote:
> I'm using Fedora 40 with the vanilla kernel built from the 6.12-RC1 [1]. =
There
> is a regression that causes the touchpad to stop working on my Thinkpad Z=
16 Gen
> 2 (Sensil touchpad). dmesg shows this on 6.12-rc1 when filtering by `hid`:
>=20
> [    0.134369] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
> [    0.134370] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
> [    0.134371] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
> [    0.134372] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
> [    1.214845] hid: raw HID events driver (C) Jiri Kosina
> [    1.214881] usbcore: registered new interface driver usbhid
> [    1.214882] usbhid: USB HID core driver
>=20
> and this in 6.10.12 (touchpad working):
>=20
> [    0.143812] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR0, rdevid:160
> [    0.143814] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR1, rdevid:160
> [    0.143815] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR2, rdevid:160
> [    0.143815] AMD-Vi: ivrs, add hid:AMDI0020, uid:\_SB.FUR3, rdevid:160
> [    1.244550] hid: raw HID events driver (C) Jiri Kosina
> [    1.244588] usbcore: registered new interface driver usbhid
> [    1.244589] usbhid: USB HID core driver
> [    2.291822] hid-generic 0018:2C2F:0027.0001: input,hidraw0: I2C HID v1=
=2E00 Mouse [SNSL0027:00 2C2F:0027] on i2c-SNSL0027:00
> [    2.349966] hid-generic 0018:056A:5383.0002: input,hidraw0: I2C HID v1=
=2E00 Mouse [WACF2200:00 056A:5383] on i2c-WACF2200:00
> [    2.357724] hid-multitouch 0018:2C2F:0027.0001: input,hidraw1: I2C HID=
 v1.00 Mouse [SNSL0027:00 2C2F:0027] on i2c-SNSL0027:00
> [    2.516529] wacom 0018:056A:5383.0002: hidraw0: I2C HID v1.00 Mouse [W=
ACF2200:00 056A:5383] on i2c-WACF2200:00
>=20

Could you also post a full journal for a good and a bad boot? This is
generally good to have as debugging information (you can either attach
them or post to some paste service).

> The regression doesn't seem to be race-related. I've restarted and re-log=
ged
> multiple times, and the issue reproduces consistently.

This is generally a good ground to do a bisection since the issue is
easy to reproduce and seems to be there reliably. Would you be able to
bisect the issue betwee v6.11 and v6.12? A good information to get you
started is the following:
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

If you're stuck anywhere feel free to get in contact!

Cheers,
Chris

--dp7wnmmfafmyhzzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmcB1i4ACgkQwEfU8yi1
JYVC+BAAutvarodDXdrr6RY7IRG03DjOXtuP0JudJmwFP+lq4PjUcYAg/0POWlUr
910uAH5yKfS/LRi1RerQm/BR8PBvBcKrSrSxnWIrlMe41c2/+jHboq9zm+m6Rnxx
KrtAEgznsZ/+htQyDrSIZQZRyNj3AXelTipXkGSKQ6os6fPhEUS3EuSwPUn6oYwm
BMhxBWI1cwM4HCBzalkLlIls5fCqoYjImyF/8skgh2DNJ/ooWMcHnKziJ/EkM7wE
nbILS4Fw4X2cX2tmkCr02Sv6LEEaT91NbRG99y2HqslveS4Psab9YRUscs/BWgT+
YlG+kO+E8CXOqmIdEeqARqc4D5XuusOkGQXYQFb13q2y7u8RlD71iaZVr1jmJtLD
GrO9SnWU36zWa3IjrTp8wEk2ULcr1Hl5EGyjcbarfzuxzMoknDJrKnjWc6wEFLZF
vGKhKC7cWRw8YVPpaCt7ZidaXEY+nWU7E1Bw9kC0IFDvLb5VP4J6JHl21Fq7fOg2
ZlIhI9f5I7ELoaKV96LeOEkv8Jkr9TMa78aZrTbfJ8CF0iTkLK6OXyhG4ZO1tbJa
sl1ELletl066dIOAUrJ3Ek1qipaRyxJh45ur0OXmvlL+5imlDzVFNxbtZIyjI5it
ag7QgtEFfbR+2qAjfgq1U5RrMs8MVGQKcDxvpRCdjFHlTcCCXjY=
=dmr8
-----END PGP SIGNATURE-----

--dp7wnmmfafmyhzzv--

