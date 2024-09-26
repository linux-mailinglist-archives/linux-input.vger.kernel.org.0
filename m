Return-Path: <linux-input+bounces-6778-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B17C987988
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 21:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15D902871F1
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 19:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989D61662F1;
	Thu, 26 Sep 2024 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="QanVYZag"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709931D5AC5;
	Thu, 26 Sep 2024 19:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727377890; cv=none; b=ALZU2tlepwgihml9DbK5HvfO4OIOB4Q930Vu/UL6HFlAiUIdefWwTK/HK4Dzf0nU79W3eWweHNCKf+DGfXYrL3jLQLNZ/0Py7NA2gmlHgoTH41HSVqs8RS53fZuR/15k9jL3yu4L6+9RfFLf1T6a/nzE/4Z0RtgLzC8NCtM/vd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727377890; c=relaxed/simple;
	bh=OLy5Xoi6JjBNCqRvlTJH9bnZb/OZpWp4FqCAS49dufs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=kRzf6E74VUDn72pHAV2E+DCuMQfwTbTwUGVIL4sZ9YNX8LV6p6zlzRFcP6jtP3lYaISC41rc4NHsMDY8LDzUbkTBQXOeZP1i2A/JG1oBJRTJHRHfcKXEAk++SF4MuFjSWMrHrIejxS6w4XmYZLMNYB7kcQMroBcmQnx1KsCN4S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=QanVYZag; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727377866; x=1727982666; i=markus.elfring@web.de;
	bh=OLy5Xoi6JjBNCqRvlTJH9bnZb/OZpWp4FqCAS49dufs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QanVYZagb6XfRMh3g4e+qSNCErRgLKCOaOukXCvev9A6L8rQ7eJX9GZxsCeLxYRx
	 FJAGUwFHdFiM/yVdgCR9OyygyKgcOdseA7gl39GtRUb1zHrnAg840vefqbkGtIl5J
	 RF1+OLeyWAmhsQHNHV7uyJ0lgCGbgLGndEtcL8fB+e4elbmotpqigU1bISDExHLGs
	 mFyYrvIseiLOZ9UhirlHj5NwTmEELEl8lULVLPwGbXFmKhRSJiRE//6X9DkAVVNMb
	 F7bHHudrx85y0CfFNN+ajIhFtznzoLiBj0lC1KU0DRkmBBXCKv4vpfKppSeKlh+vY
	 dUBRzH3Qp5uWVjEB9A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MElV3-1sj8Of1BP9-00DHOW; Thu, 26
 Sep 2024 21:11:06 +0200
Message-ID: <08320b8e-a71b-4055-9fdf-1df76530ec1a@web.de>
Date: Thu, 26 Sep 2024 21:10:56 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>, Mario Limonciello <superm1@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240926092952.1284435-4-luke@ljones.dev>
Subject: Re: [PATCH v4 3/9] platform/x86: asus-armoury: move existing tunings
 to asus-armoury module
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240926092952.1284435-4-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N7FvWqL8o7nWio51CW2cWS36Vmzn2xXlTskJlx40pRVOMNqTlVD
 8sQjH5Gr4qXtkr6YCL+0VT75+WcwUM7dVeHEQMf82BLxCyBXE3qGnywN9c1QKcezcRd1M29
 Ld8qWGUmZYtX/U4RK/nzjxJwUNEFy74/E3dp0W58jcFp+TLM4vXqJbG2sMZVBm0ZRneeNpQ
 WtMjyLGG2xbjoYapihq1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RcwlX+z9iM8=;DXnqCVHE0D/V4kTQIBNlLaS2NhS
 i7ZqCzOXKOOM0dxvXo2UV/ljP5BfrJtrduUaYKbHpBpK4vdBfGVN9EUBlfgSbSCC3B8mdlNm5
 d6Zw96gb5zT8IqNAvPVXOrK2fyOd0VjoQY2h/l0L80py+d7jEP87SiXI1we1G7/BwH6pLh6g0
 6eeSnmmEaZb9OnhwjhyQZkmDw/B30lHgwRPofFvr1lCquWWNWyP/tPi+e1cbDGiuPg+2Yz0TS
 AOiun300guj3DMcOZx1mxbqYyIFthugpkvEVR4iHlycxy6ZAX68usod1WfOgIPEnOICRr0ten
 dtkQD/U+DsqpEvw8uaRjRokd54lLTTv8UQTjYNyhfOzmUtSkknwVx1dQT0kXL2fW0JcGAQ8Gr
 G8J90WZXK3bymH5s6QDnSHCWI6GSVygk0z/nLcU+xA8tfITRVM5kQr/gzUnGif3mTXIUZXu8H
 hPqq6WaynSzVi5QKVToRZ7ov4zVEE+/9QR9e3k1KvkbmUojXigPKWC3886EVK7fHFQxv3JbFV
 caSWNAttwXH9RKcSSjpTnGLVp3CF16w5IEquQo0sDBVbTAiqcO+m3BYyWx8eQkH1fX5pPdM4H
 YMg1CUIs03zp/xsu+1feUbf02/7cRQ9h3obuDIJn3edsr8ych5IUV1pzAeLPyq+MZJDE+KqiK
 umBajwoxp9eGpj7smZ14jnfxkAyqeAXtpIqNCi3FsvCOPWtS+1cMYqKBd5i3XNfeRLOoKp3kr
 Ye1pYDF99a4gPu+2cUj6rTZWIUs6gdne/xWDn3xpAO79L32/tuCzD1lZtaTEFOy90zz4roRaw
 3rzcW6HF7PmWOlBl67MUPn6w==

=E2=80=A6
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -0,0 +1,146 @@
=E2=80=A6
> +#ifndef _ASUS_BIOSCFG_H_
> +#define _ASUS_BIOSCFG_H_
=E2=80=A6

I suggest to omit leading underscores from such identifiers.
https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+d=
efine+a+reserved+identifier

Regards,
Markus

