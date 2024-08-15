Return-Path: <linux-input+bounces-5586-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DA2952A2A
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 09:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B37F628353C
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 07:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB362BAE5;
	Thu, 15 Aug 2024 07:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ra0xirBu"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB27D19D884;
	Thu, 15 Aug 2024 07:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723708276; cv=none; b=jDPbDcRIP6Dh6TC1b9bBccRRF99VNTVLPMD/fctPmIw9+a36feDHKS7J4PH8VH40Lyblzl0gY6Y27x8LEG5VtgpiOKIy+Iu4lbxgKJemMMbGQPz5mLieGLWAN0n0cwiK1Lhwod5T9ZQqXMuYf8xuCA5gFX/1jHjCffRfvmSlcT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723708276; c=relaxed/simple;
	bh=wb+xp9uhuznrTESB9DDO9Ovji/TCwZd4QjJecFTa+IE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=t57By9nwiQut6xI1/xT9TfO1qPjg0FnZssOrB8yM74U2KA8IGeHlGRwTNrO/ayjKrZ8AAQL23Z29gsbebyYKirGQn2Hr7AATHO0Gr7nVPPgM+HEVjwlhAUs/k5sVKG6cEuyTbwpzTQw4PFOkxXQTd8/Ul8YkSXuch+vqLq8QN7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ra0xirBu; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1723708255; x=1724313055; i=markus.elfring@web.de;
	bh=zj6szpRc6KXAwSpKGJ8JFFZnzP6VpFR62KKkneOpws0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ra0xirBu2sNAhJPpfsf4HHv/myfXSa7xjkFGSxcWvEEvtUzq0wktt9yXHtsgbZDm
	 NYrrBAwUu3Ty8TLyBNglV+ENy4dkNwUtnnUR6jrQmlWOARueory4qjEEm1CQ9e4bT
	 KWE27eaBsWj5dFCKWlZSRoAWpfBvdN37aqAkMI+sMHbmGD8GIFt0Tg470LJYTzRTI
	 hFGYdLoLHDFrZg2NvFypREsBSl3qXPfXhl2x1JRcLOT5OypPKymYsoEJLiXYS/9Hw
	 m7zViQMbshOZd3UUwnIlniX5qz+116jOBcpx7O3LO6Tov/p/z1t95cm+sByTqK+cu
	 sKUfQ5eiL5roTNmjzA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7QUJ-1s61R40oc1-00sXeW; Thu, 15
 Aug 2024 09:50:55 +0200
Message-ID: <da4ca647-6eef-4576-9882-c5ffeddd1f7b@web.de>
Date: Thu, 15 Aug 2024 09:50:51 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20240813153819.840275-3-stuart.a.hayhurst@gmail.com>
Subject: Re: [PATCH] HID: corsair-void: Add Corsair Void headset family driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240813153819.840275-3-stuart.a.hayhurst@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5vJ8c9bC/IactJuBjNJ5bTRigg1p2fv3E11M2Reo7AwQJKJHSAI
 zsjtwGbFHvgsCUFx7dPT5d0kGaGNsbjEWihIbANW+VtCJO66zr+oSrAPCDqyj1ubbmyTxvY
 FNtDOyjlDfzHbzw/7aNieFsJ0j9R+RVMDvNZ6x92UqSP6KZ4B7rLo+apDxucmGj38HeuCHD
 A89ikkFZhnF1syoUB9BvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dqfvIDAQ5y0=;xJSLXIV8TKGka3XydoEg1HyG7JB
 DWCSfrNvOfWhq6x9XloXohCC34Z7dUr/XUJX+OCwuyFRhAADvHeZ+dm/c+28tvIpi1WMfgZEo
 L/w9Y2/+PtqKdPIqQLoADOCAvxnzLLwjaMKZUaiJi5aSdg+sZISKBZclNXXlFL/ROb8DXBZVX
 gNgz+891kLYa07I3XoCoDHfQioe8jO8tmnHuPHeUGL3ZKFdp9wa9O7W9195of+v060vRzPrXK
 yGCszSp5XW6zZs3L5qPHJCo69/7peKPyTVjRc7lDVK8Eio29LLBQPPVN3lUohxQ1nnmVgs73X
 SDez+oIjW2T/ZwYQpu3wbpGqfOzWDoO4kEg4vkJfNcaRxHQM/uKz63gsrwZoiA9WTPHlF+HMC
 nNoo8APVRVwe7INCvm1vq0evlWD8mwIOhIExnva8ReO4xH/BOjWKxUPhGj2plVTcek3yIQjMj
 po0oEsWiaVICq+MskvdX3AbK43chzcVdLVbiUYZ143/y5ya1xTu01ANb72AJBwoVQ3O9xKEFf
 HGsvmrCRMHTzk++12LdtzsbM2SK1RplCm9/efVQ5NBFV6QtifkK8pYV5p6AQDdjlHrS9cKca0
 j7dMDuXqkHyvDwS1I8w5MVcuI9mAUCiUmb7IUxL4v2any0CN+tXtecyZUmf1RXXUsEWJVA24l
 02szgHAMWKWm3QZNOZH/faxEkrAZdkvDHFuwFw3waPR9WRhbQxHCiAIddDdlj75+ILrLK/kDE
 mHC0hWYNkc2PcuDhg+FwFGI7tNG8qeUhKWHABhnjtrVup1j1lvXZtdNXnc1O5fIuy1oEWUZFN
 UVBd/kxf5dBd+c9nbC1Q0Fpw==

=E2=80=A6
> Should I leave it like this, or deregister the attributes, so those case=
s are never triggered?
>
> I'm also not sure about the block of comments at the start describing th=
e (guessed) format of the
> packets, let me know if this should go somewhere else.
>
> Apologies if I've messed anything up, I've only sent fairly small patche=
s until now :)

Such information should not belong to the change description.
It may be specified behind the marker line.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.11-rc3#n711


=E2=80=A6
> +++ b/drivers/hid/hid-corsair-void.c
> @@ -0,0 +1,851 @@
=E2=80=A6
> +static void corsair_void_process_receiver(struct corsair_void_drvdata *=
drvdata,
> +					  int raw_battery_capacity,
> +					  int raw_connection_status,
> +					  int raw_battery_status)
> +{
=E2=80=A6
> +	/* Set battery status */
> +	switch (raw_battery_status) {
> +	case 1:
> +	case 2:
> +	case 3: /* Battery normal / low / critical */
=E2=80=A6

Will any enumeration values become more helpful here?


=E2=80=A6
> +static int corsair_void_request_status(struct hid_device *hid_dev, int =
id)
> +{
> +	unsigned char *send_buf;
> +	int ret;
> +
> +	send_buf =3D kzalloc(12, GFP_KERNEL);
=E2=80=A6

Please improve the size determination (or explanation).


=E2=80=A6
> +static int corsair_void_probe(struct hid_device *hid_dev,
> +			      const struct hid_device_id *hid_id)
> +{
=E2=80=A6
> +/*failed_after_hid_start:
> +	hid_hw_stop(hid_dev);*/
> +failed_after_sysfs:
=E2=80=A6

I guess that you would not like to preserve code which was commented out.

Regards,
Markus

