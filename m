Return-Path: <linux-input+bounces-5652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B979A9564F1
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 09:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECDF41C2177F
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 07:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54587158D7B;
	Mon, 19 Aug 2024 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="VYXPdh7m"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1308182B3;
	Mon, 19 Aug 2024 07:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724053718; cv=none; b=M7+GEzrYnY13nUQlyFDPAp1gDxbcoVnatxRME6je+07Laae5U0cRJuEI0RJlgIDwJlFTc2iHwOCMjbsUTqERwtaAopIwl42xeaMJi/DTRgRfA2CgGe4Yif/SbT9agOTaKXNYTEUFO1uqwKgEKbc+uAijpFUIkqsAtUhS3DBl6no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724053718; c=relaxed/simple;
	bh=vUiSOdyrdJww0IqXn5nkYGcRnV7XOVRUa3PBkZoSgfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAARKxe2L84vYPhYagN1NQz1H4+9Umy4xAzqelXlNPVv1T+etH91Ju3JKaJkDwqq5a0z+fiGBFbstEFxwjWDZUUSFCL0pMkq63ZESvB8hhXw8ck1ddP6XVuFbqJd1dRGfxNYKOVpxe0n1UEXm4O8iloJ74LhhYGoIYCJtC7lGVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=VYXPdh7m; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724053696; x=1724658496; i=markus.elfring@web.de;
	bh=VWKo/9R3f+Grm1MGR5RJYm3N5mIRhS89dVQ2+6Q7PEQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VYXPdh7mbVpM0jVuwhZuiDzkEmQp9FzKyN/3J5uBk7bcBVEEw31WBWp9Wr3DRf4t
	 N63cIHtQjWYs6/NOAOy1n1uivXzZJwvyL5ILw+WJ8CSxC13jKBlB8rTGlnDOYRvEd
	 rq3aggFgck53jUPf5zOrSpAqjE0TV6Zs4IJxy3xQHDX5TF9+UOWGJ41YfXSutZ0i7
	 PWxWviRy7nI6ojz4cmBqST0ythPDbLWyQF+YfAkv0txFA9YSzXTfrElbbrY1EgENb
	 DJf+YuDurGENIAXQkZuNQRvbSmSD5p6GMm3qg0H0PMTXzTuyeRv2wXlZmLnxQpLMv
	 eUD96jOSrw9yy/8fqA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MxpiO-1rw4zh3n94-0116MY; Mon, 19
 Aug 2024 09:48:15 +0200
Message-ID: <bd07e14e-eae8-4264-b275-9efdf635cd82@web.de>
Date: Mon, 19 Aug 2024 09:48:15 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: corsair-void: Add Corsair Void headset family
 driver
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20240818231940.34635-5-stuart.a.hayhurst@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240818231940.34635-5-stuart.a.hayhurst@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iYioochLoLrCAWM+xWOqHwRnBqljl2e1l/mvT2Y9aRFjDyZ3JQG
 mN9QAq9CpthkdoEicbo/YXa3+SijJp7n7LQjXvqmtck8a6KX8YHIkTg0mxx/A/wjQodoyTP
 QB6AAFvUqw+IZBf5kTiNLS+eCXRFzgcTO5yu0sGpkndkk6alLFIjL0a/F7y/0l8+HKvlODC
 vRfs4MWBxWFab1Qb/A9iQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2g5KdVHCcUA=;Zr7bu68qEGYKZJhsO9IBHbPBwwt
 6+NEU7Uy7U0DMK4PCrEALOygVWDytR/lJnfb1L3NZySFHmSprHtaocqfKL8q/7WPuJJen8l3m
 zJ0wjx/zn9rzARfpScHLb2AfkKMJdrVOh1VQcr4eDtjpFmADQbdxXnxXPDT1DRkZwbVUTrkwM
 4f5UzmamCVk6l0fjqQdlxSM1kMpS8wVZOvtcuu+5MlQfH3AiS20IEJ3jFVRpLXCcpIdh0TgMQ
 W7UczzyMhMnhe46sKENRRg3ispeiaxrDbptU9k97cR0Y5CIe0J6HJMcpDukeINdomQhnW6IFV
 lGONT89n+7FUFzwNmYW4TXXx2x0DUQEkHh5ksOwFnADzd6lNuzr///h01v+ALqg+r0J7t24L5
 1kN+q18BBwm9AiJ4XLkmzh1/qwQkgVDOvMq0LZzG5nKH0tjh1tyLVxJ16LahwrRfB5VxOkEsV
 ZWnqJjryDayIMjHLmYTe9kesy/w8Sk+h4Ci3c2sDuwufRcu16n67EbR9IqQFMVTH19DikUpQW
 nRR2PqE0ZVo8zxpTln43txE0BUITJfMOfoUdzt94bxjyyZUd9L7IGJ95ruTkan9+YvMVxdVSu
 ZeqaTTM4/Gdguvnt6CRYMGiaMIrG28N0Rqq2Jguq16az+LesTvMPgzZ/R1/k6XwerlKXeBiEB
 kw+40jGTYm/t+C9OY9yXLsjSaUNiifbYZYi3PPvm5kgB8P52fUciyqexweZV7+tkT16Nd80j2
 NBNJlKG+Nv+4eV57CIt2gKwwTr0VxVF0x5HJ8Zq93DT2DFuI4/Ggm8GvoFreHzBBeGI+8S2ps
 cB+aOJbgQ9SwTJKTucF+WqqQ==

=E2=80=A6
> +++ b/drivers/hid/hid-corsair-void.c
> @@ -0,0 +1,857 @@
=E2=80=A6
> +static ssize_t send_alert_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
=E2=80=A6
> +	unsigned char *send_buf;

* How do you think about to use the attribute =E2=80=9C__free(kfree)=E2=80=
=9D at more places accordingly?
  https://elixir.bootlin.com/linux/v6.11-rc4/source/include/linux/slab.h#L=
282

* Would you like to reduce scopes for such local variables?

=E2=80=A6
> +	if (!drvdata->connected)
> +		return -ENODEV;
> +
> +	if (drvdata->is_wired)
> +		return -ENODEV;
> +
> +	if (kstrtou8(buf, 10, &alert_id))
> +		return -EINVAL;
> +
> +	/* Only accept 0 or 1 for alert ID */
> +	if (alert_id >=3D 2)
> +		return -EINVAL;

Can condition checks be merged with the same return value (for less statem=
ents)?


> +	send_buf =3D kmalloc(3, GFP_KERNEL);

Can such a size determination be explained better?


=E2=80=A6
> +	kfree(send_buf);
> +	return ret;
> +}
=E2=80=A6
> +static void corsair_void_battery_add_work_handler(struct work_struct *w=
ork)
> +{
> +	struct corsair_void_drvdata *drvdata;
=E2=80=A6
> +	drvdata->battery =3D power_supply_register(drvdata->dev,
> +						 &drvdata->battery_desc,
> +						 &psy_cfg);
> +
> +	if (IS_ERR(drvdata->battery)) {
=E2=80=A6
> +		drvdata->battery =3D NULL;

I suggest to use another local variable for the previous return value
so that such a reset can be avoided.


> +		return;
> +	}


=E2=80=A6
> +static DEVICE_ATTR_RO(fw_version_receiver);
> +static DEVICE_ATTR_RO(fw_version_headset);
> +static DEVICE_ATTR_RO(microphone_up);
> +static DEVICE_ATTR_RO(sidetone_max);
> +
> +static DEVICE_ATTR_WO(send_alert);
> +static DEVICE_ATTR_WO(set_sidetone);
> +
> +static struct attribute *corsair_void_attrs[] =3D {
=E2=80=A6
> +};
> +
> +static const struct attribute_group corsair_void_attr_group =3D {
> +	.attrs =3D corsair_void_attrs,
> +};

Is there a need to organise device attributes into separate subgroups?


=E2=80=A6
> +static int corsair_void_probe(struct hid_device *hid_dev,
> +			      const struct hid_device_id *hid_id)
> +{
> +	int ret =3D 0;

I propose to omit the explicit initialisation for this local variable.


> +	struct corsair_void_drvdata *drvdata;
=E2=80=A6
> +	drvdata =3D devm_kzalloc(&hid_dev->dev, sizeof(struct corsair_void_drv=
data),
> +			       GFP_KERNEL);

Please improve such a size determination.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.11-rc4#n953


=E2=80=A6
> +	goto success;

Please apply the statement =E2=80=9Creturn 0;=E2=80=9D instead.



> +/*failed_after_hid_start:
> +	hid_hw_stop(hid_dev);*/

Please reconsider the need once more also for this information.

Regards,
Markus

