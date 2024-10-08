Return-Path: <linux-input+bounces-7147-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0232799453A
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 12:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 205251C2483E
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 10:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A39418C93D;
	Tue,  8 Oct 2024 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="2fYTKnU4"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895C816EB76;
	Tue,  8 Oct 2024 10:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728382814; cv=none; b=rpH8L1ZFSpiV/WNngrH94qdTQJZHX2m/Va4/zCucLN4CXj775T7X8uAbVLcwkk7VKucXVBFl0ZVBLyBhLPXP/m6/vSNrC0+x9R+Z2ODRS4je5bVtfCAJ9LvgYoJVMqIv+JACFZYgVG8xBTtyJzIoavBnMFdNSNKNeLWFEpZGf7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728382814; c=relaxed/simple;
	bh=6T/BQtvdoD0QZSehx69s8EwGl3evviJoWR/EADMMNdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RwAM0uwlLpf3hz09YtUYSTBvRYQOCzGPpdiZhlig+rho2RWZZaJVFGAz2wZqzwiou+ZYMie0lc5KnWM6Da0sGcT3iNOjYRYGYamSEda0PrCYyRBQsuNtNjRCYQ6u17IWaO/LlPKWCmNB10jvfAd65EzribtU5pajDt/jDy04A6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=2fYTKnU4; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1728382790; x=1728987590; i=christian@heusel.eu;
	bh=E1nT/M9+SosslnD2/3K4r7sOqDzUYaV/IpDRu1a1zJ4=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=2fYTKnU4r0NW2QJoNPmb9CVMp4ia5coeIeGFCREwPqRfOQGWInb5avg8hf5mfir6
	 UbAuusyGcKGVSi1LFZYEmuLDIRk9dJv2+aOXBM5UUv3HiifRQ2vcUZjdypwizX01H
	 zgvSkfJHXr9tW2tqr3j2cehqPCzbDOES8YxSHI5qBxkbglXI3aJ2GW+hka4dhbPt+
	 SWmcdeUjY7WGQ+oLX3nthRP7lEzhee64fjQ/VgzlcqgCRWKkadjIeSizmNA+yqLlz
	 2vMQLVxkdKMBiZtp/U1xFkA1B8RPBay1KqCYvdMs5umICiSsSB4jlj3HQtn86e2UU
	 U8JLb2xltXGSGJ8QsA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MWAay-1tVn8p3Iss-00WJmH; Tue, 08
 Oct 2024 12:19:49 +0200
Date: Tue, 8 Oct 2024 12:19:48 +0200
From: Christian Heusel <christian@heusel.eu>
To: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>, 
	Ping Cheng <ping.cheng@wacom.com>, Benjamin Tissoires <bentiss@kernel.org>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Jutz <daniel@djutz.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	linux-input@vger.kernel.org
Subject: [REGRESSION][BISECTED] YOGA 7 pencil only show up as eraser since
 9c2913b962da
Message-ID: <3cd82004-c5b8-4f2a-9a3b-d88d855c65e4@heusel.eu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pezzs6s5iephxgn7"
Content-Disposition: inline
X-Provags-ID: V03:K1:b3hqhQRy5ZkTstJitpMmSfCYz+qxojOBwDkvRAWAnGXEvQ12kSw
 ijKzYyPhK46RiISiax/xPe/bIeCVRomXjMVRNr810E6mALHp6MEfgJk6NZcha9R4BU96XMl
 Y0pJu1hdgyTVsp3Co2uf/VxjoPvlFKwFepO0kjZ7Hmt7QU1B91mn6SQ5gEChKccEj6W9lTa
 DcbULbxtkvQhnYTnFdyJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nQwMtyC6WDQ=;5J65yCmzj9clO7JyWBuyByhdRBw
 OAhP37FKpprc4Bvn2yZk8K5ORTsOhiF+g1ar2Z+FznC89KKtPbABZnjcH0a39SVNUgMTtvJ1d
 5m3TG9dXs6EsTuXPxYFe+Zr2VSxPOHQ/ViXHrgk0WeYUQP4kwCvCrPyEKVDiKxgfN6n2iyCpR
 D1ibJ+wKUUFT9H89fmU2NlMvCTL5rR4XBJo0VKGq8gTEoTyKRN89JekgwjKEuCJCWebZ9awPz
 sEd0oDxSZzvzFHI85C8Nd3GgJuw2J4X3FTckgKM8uvZnZii7zS5+FX21czS+1FQ87s5Z6FGiU
 B0rLVlz38848g0Rp4U0W8QM32HuCib/UMfT0C8sR4f6OqxQJS661kLXymSLtH7ZuuXXMaGMFs
 Z3m4YPXgJVaWptznbS623YO+DVxv15JpzJr71NgiO1JMTScZRt1hrJun77Hzo9WLeDvFV8JV0
 J3PLN4vbcxdoz8+oNXXIylxzPo0+T344qsv9mg5WaNCj1IKBECy7l03b+lVaQEP2QHdPx6fg/
 ZnxhsfmBQcTEz/Igv5wKvSnJiAHGF8waB1/Rx1k9oHDiaxU//4BIDejPW9QToR4ZapeXDNV6h
 nxXbwWQWasZEYh99u/5hodAjk6LVBeQOCglbYZOwmGuaewYr1iyuPDK75FlTTDxBT4vFjAiGK
 rO19LUXCxlL3qQ/6IbGRAnRq3g/x1BkM7VJMHSTac8cYLF6uTyLbo4/XMD6vFbJRins3WJ6w/
 FmPnAUSy13QRbNNZhbhTit5mC/j+UW8qw==


--pezzs6s5iephxgn7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [REGRESSION][BISECTED] YOGA 7 pencil only show up as eraser since
 9c2913b962da
MIME-Version: 1.0

Hello everyone,

Daniel (in CC) as well as the Arch forum user "ls" report a regression
with the pen of their Yoga 7 2-in-1 14AHP9 Laptop that leads to it being
always recognized as an eraser:

    $ libinput debug-tablet
    Tool: eraser serial 0x80e51447, id 0x219

    $ evtest /dev/input/event6
    type 1 (EV_KEY), code 321 (BTN_TOOL_RUBBER), value 0

While the expected output with a previous kernel version (6.10.y stable
series) is the following:

    $ libinput debug-tablet
    Tool: pen serial 0x80e51447, id 0x219

    $ evtest /dev/input/event6
    type 1 (EV_KEY), code 320 (BTN_TOOL_PEN), value 0

We have bisected the issue together in the mainline tree and found that
the following commit has introduced this behaviour:

    9c2913b962da ("HID: wacom: more appropriate tool type categorization")

If any more debug information is needed or there are preliminary patches
to test we're happy to help!
If there is a fix found for this issue it would be nice if you could
credit us as follows:

Reported-by: Daniel Jutz <daniel@djutz.com>
Bisected-by: Christian Heusel <christian@heusel.eu>

Cheers,
Chris

---

#regzbot link: https://bbs.archlinux.org/viewtopic.php?id=300005
#regzbot introduced: 9c2913b962da
#regzbot title: HID/wacom: Yoga 7 Pen always detected as eraser

--pezzs6s5iephxgn7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmcFB0QACgkQwEfU8yi1
JYWICg//VvlKtK713rPJqCp8jV6R249+SgMjqXEhSGTyF9iIi+abrCpRTc10ATRs
jb1EOgw9DUQKc+7pV2U1+2lXHd0Sx0p3DJnDH2izWcYSIci8MRvrm+OFofqkRAxC
ZkLCfqIR4U4/df44c+LIys4J0LD6VhSbhhzkz1oLp3smkZFGZQh1Ojf/uoyhAmwR
o5eFdLL2Q7B5IhRUy38bYyb8zep4KsgK1M4MfwftHG7kfMYCRKyIfH8OsFtdeDkg
NP1r/OjJOY+n/0vKkEfoymKNWWINjEO+JJblEgjtn+RuOd39iYgutyg48kDBQ8ed
e9FHIF90Yc+WIcFjKVJTTjpu/n7tlC9X8CokQOUSsCw1zERRqQM9blFwtRTJo5Va
KmO3L+DzTkz0fogQcJR6AqNU79djE43b/Y6NaSzwZZU4NePpWYer9cnwkRr/P0Ze
WuhQvaP1RxC/VO0JQgaB3oi3+5ZuJ6vpEPOcy62sefbjWCYlgG12prHM77v1z+LJ
UUd8nbY2Y0/1H3EKoj/JTXz9P+wGOOmtc24tK7EQ7Z/BvdwBDn41RV+OpNrIF4nq
12kXQjvjs4xCE4gKQXoIbvV3mt86x2qcXDREIGR3ShQn9Ma8VCwFF5a98xqntaAO
r86Ewo//2HUdOn9QuX87zaQQFECam30QJ1SOI7oswnuvaG13HEg=
=NQM7
-----END PGP SIGNATURE-----

--pezzs6s5iephxgn7--

