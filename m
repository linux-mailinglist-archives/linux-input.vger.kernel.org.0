Return-Path: <linux-input+bounces-11336-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B74DDA748C7
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 11:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAD331B61160
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 10:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B545213232;
	Fri, 28 Mar 2025 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WpDGO+e8"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917401E833C;
	Fri, 28 Mar 2025 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159416; cv=none; b=nhxKJvhlBBeA9SuNxMW1KrRU7F5VKVhKxgp511hAwfqCVTp7guvfT7/aS6JkDuQhgW3SX0dHbY3+H+o/44OEqksBgr9VG48elKHi/cD8kuGPjPSiEtFHy50iPoMKpx+IgPpBwa/WjxUMQa8zvh5d6hcH+mPkfssOXbDsQndjFLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159416; c=relaxed/simple;
	bh=tGvX5t4II0bWdMuGq9vrGzb4pR38dMcf0L54AhhUVUY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=klDx9ei56eA4bAD38Wy86SkqRvmSR8QipFxW9Npx42v7rx6pq1rYH6/22pkh/ySNTTRdVsvdpNol4uw1xhOMnh/0OQM60lM3NJ9DU9HAVu8gtBQ4/HRvDkvbzaS589TrSaWW9wVwln5/yMrASs9uyTPhE1m2s/Jvsvs4LcgVhbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WpDGO+e8; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743159403; x=1743764203; i=markus.elfring@web.de;
	bh=BsTjFY2jj2A4o4aQeM1yn18m5VjBspLLRgGpCLGwkew=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WpDGO+e8Pafgapt3mOamCiKLPrbULpkroAnOl9ooxFPHR/fNPkuOhNO9D+NtGlSc
	 xwKVjPgp4XRZD4AwPykZImwZC2GGBlimJl1TBZHurMmiQ/5Qpeo7FwZW84LXuqYV5
	 RXzHRoMTgT9gPICdplbHT/gZPUknsuCrQe1eQ0jsiNjiKL8Gh1C4Qcoh0Lh44EePv
	 M1vZoKHqe/CTPjYmOv9mCUEpvI5z/+s0PXnQXuDfyC0HDAil/oRTCYT6BTzMa23hC
	 WskAS67FlspXcYxb3ZBtukPpU5uvgs9985JRjjvOYQ7YRCUyepj1u/fOKDMwC0lZH
	 ougAWFN2c0fEYLUkzg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MD5jv-1tpd3y19nd-008p2m; Fri, 28
 Mar 2025 11:56:43 +0100
Message-ID: <4a17d0e2-bed9-43e5-a867-a501b991e6e7@web.de>
Date: Fri, 28 Mar 2025 11:56:41 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20250327231146.6388-1-qasdev00@gmail.com>
Subject: Re: [PATCH] HID: thrustmaster: fix memory leak in
 thrustmaster_interrupts()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250327231146.6388-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8213H3JxfzTQowCs9fcHxElSgWiDoD0E+Gg1w0tPtaSuYYTPPy9
 Kja4WkXD0/LkPpj/SAN+o1cRvBrVIFNXeNoKNsCMK0WjzCgs3YKslikuiI0UZx13eRX9MH4
 jqCUzTqRMrmmV3twB+FRXb44dbQdb+GtVqlJTGwT8h6V67i1S3QRaZiQZPatWV3J3cC5g+f
 8NkN62sPnQKhAE8Z1UPvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+fwmZpPe2Zw=;w07p3cdLwi1BKzk99WXBuwFWIa5
 DCS74iZOzPB9xdCYFqGs0rThXtHxIFybDbMmhw/OG6CirzS79/QbgubWy8g75m5489HRYJW5O
 Ncjs/2cwJsldbhl4KkJElVIWNqN5EITI10GrD/eylok90s9KQC/VkFnmmacq21ErL1y2Kojo8
 +aiXIglCI0rFA4w+9LjIr7u7n7UmWk9O3TpxNippid/G+i+H9By1I7rG5AkzgP2Muxv32I+6v
 X9W6HTH+dRQrkVJW+f5YxZ/XW73Jf0yFxvIIbzA5VrwO43GFJhmPbxcFRQcYyT51dgwXLZWFw
 qA8ppHE6tPTiIE4T5+DhKeqhnvWzlIXFQkI6Md3vhLOea0/Z8fDwLY3t8eS9zBBomD2vOUTlI
 WgwP2DnbN8tkQFsvZDoB0D//ucMFswJ7c30GSlR4FrvTPCNDdHMnZxkransQC5jURDrRHdllM
 jTb8udFVCbhxNgNJf/ke/bRSjHfav4itVJuFUDBdeyUWhe47KPBYyPpx3K4M5xoD1/YSmjOIG
 76bbnDhZlWNygnAXgPRhJAF5/Oa0y4B/gmORF3l6njcPUoxzUXApDPsdRa4KZ+O3EwFCNAGD3
 cTGsAqMv8ceJQbViT1clB3i0u8wYrd6zIVZ+KIYa38ZW49uqMcWJPZVYNodwhcqXbmqzqLw2m
 /37ayWoiMt1uzjORW+PEbeHl5g6M0H+3WMdDCih1HG9oPE9TucBVcCmseAXFsuG+iOWb2kPAQ
 o9AF9qRXBLvNvCP7bIOOnRgz5DgM4Iflb815VUMd0Cls0TGy5wFsAxPQEDI19gb54R1v6r9tD
 ngQmac0FpdZzYRcoAB5Zp9CuXE7oWOyr2i6Fy8lahJciqxGKW9jTyf3fzSHPoe1NK1OR9BPqz
 HW8DDJwQsPv+8UpmAG8emYw/80uBhnRo0/rWzPe4b5fDiBg9mU9fz0qeWBxJlOJgHcWhwDO76
 s/kgQlq41QPi9KUfG9rdrzFxxX56RQnYjRbS/VLgm8yMvrMSBggr8Cmu8JgiO9WR98Db2c3/2
 EFuBz8eO4h5mi0StywHTNPig6QgVg1mZFPlB4hIFBvsw+KstCM14rojQb1TFAJvVVQQIyChTt
 OHwuhS0NdOSM99lntvc2N05xI9AG+qOKKQUD50TNWylkXMcOk0l0xCrTkW1d4LceWQ+ers7c8
 WE9aVL7SvoX1oikayk23bOUHsA8ofxy96MHRyq0YQDrqXQ5WeSHLEElefy8Wn2jOLylRvBO+L
 jXLHR3gwXK4lyieiU96YfTyOmKtB3awooEhgN54U/3TJkjThRRXtogRVJT9vp6EcrPqdsAnLs
 dWNFJHDJq2lFv+eUjLEwKc/4f+vVSWAJu5piBgIb2X4q8xLfxLCujJ+gQYQFy9OHioyqxduzl
 LJq6au7bIavcDFGHr6ZhWrgCPcsPGdAkWgiBfbM10HeGrr36/fN6Egk3VjiqGSeNCvA+0SFm1
 xSgg9q/93WbnUMcBKUWZ32vRADVjKg/xxOCHJyCweia8Js6cteqAC/8hvsZgAnzZtKJ6grw==

> In thrustmaster_interrupts(), the allocated send_buf is not
> freed if the usb_check_int_endpoints() check fails, leading
> to a memory leak.
=E2=80=A6

I imagine that word wrapping can occasionally become a bit nicer
for text lines which may be longer than 59 characters.


=E2=80=A6
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -174,6 +174,7 @@ static void thrustmaster_interrupts(struct hid_devic=
e *hdev)
>  	u8 ep_addr[2] =3D {b_ep, 0};
>
>  	if (!usb_check_int_endpoints(usbif, ep_addr)) {
> +		kfree(send_buf);
>  		hid_err(hdev, "Unexpected non-int endpoint\n");
>  		return;
>  	}

* You may avoid such repeated function calls by using another label instea=
d.
  https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+=
goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resou=
rces#MEM12C.Considerusingagotochainwhenleavingafunctiononerrorwhenusingand=
releasingresources-CompliantSolution(copy_process()fromLinuxkernel)

* How do you think about to benefit any more from the application of the a=
ttribute =E2=80=9C__free=E2=80=9D?
  https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/cleanup.=
h#L144


Regards,
Markus

