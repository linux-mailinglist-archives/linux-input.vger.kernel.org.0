Return-Path: <linux-input+bounces-13724-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE4EB1659D
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 19:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F95F3B4AFD
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 17:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AD02DECD8;
	Wed, 30 Jul 2025 17:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b="TgxOClRw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="iMDSyqpJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="brAOXp34"
X-Original-To: linux-input@vger.kernel.org
Received: from sender7.mail.selcloud.ru (sender7.mail.selcloud.ru [5.8.75.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD69248881;
	Wed, 30 Jul 2025 17:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.8.75.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753897058; cv=none; b=i/Po205d1hJKJWcZmHyBbMejUtfhgEfTb9CBmEUXHDFkvbog5dV23hcxVck4IcIjd5ynqNX4tco5u05aKfn3gqXGFzMtNnfegwvmB3XghLNjPVdIWD8fBPaUedn8JFvn5lGM4oeUreEYwkvsekb/HXCg/k7yaHhH3QIU0K1h7n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753897058; c=relaxed/simple;
	bh=KuAp5Kws3BtjVIC6VGoMNr0R2JfE/8TcKT577RClDco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxHWKxY2PtzjKj3n6hmXhYcgTK1cNXoieRuSoZFaz1HAAiTr6l8RkDTcmXQ11iWERz61ZRI6UfTyW+NVWjNcs05KXnPQI4DaV6vbDTagCbaCnbqzv+nfAANZVgwOSwg6hjf71aBSkqf94vlprg7ju7kGwB7W3juGojTbYw9g3/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxido.dev; spf=pass smtp.mailfrom=mail.selcloud.ru; dkim=pass (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b=TgxOClRw; dkim=pass (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=iMDSyqpJ; dkim=fail (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=brAOXp34 reason="signature verification failed"; arc=none smtp.client-ip=5.8.75.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxido.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.selcloud.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.selcloud.ru; s=selcloud; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	List-id:List-Unsubscribe:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Help:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KuAp5Kws3BtjVIC6VGoMNr0R2JfE/8TcKT577RClDco=; t=1753897054; x=1754069854;
	 b=TgxOClRwDNkNXGdALry2r0CUFO00qkKYfRSpB1r9v/20yl8JKy+I1tTIP2g0olD+3HZ8PsqBEB
	qB/80ua+PCoDfjUipzJGupN0m+sMJE+zLurPu0z6DSQf43RNZ0Lsasv8O1GSlAY9+IykzMtGpLgq7
	JsVtHvgPJt5vB6mYOr3E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=foxido.dev;
	 s=selcloud; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:List-id:
	List-Unsubscribe:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Help:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KuAp5Kws3BtjVIC6VGoMNr0R2JfE/8TcKT577RClDco=; t=1753897054; x=1754069854;
	 b=iMDSyqpJFz0ogca3il7K8kiCkXzXsQ9ki0ItrZElwIx931B6ZjVVafP6ztlmBiMR4aQc5CNxlL
	WFfwxi5WKnAjFRaMoH4wvuNB8uMyL4d1W5Av3LxMYK8trdqpZI6DAmz0053bPoRZx0bfCnnK65YH1
	Li0MhMXIzQCSTQQ+t7/0=;
Precedence: bulk
X-Issuen: 1120529
X-User: 280060488
X-Postmaster-Msgtype: 3849
Feedback-ID: 1120529:15965:3849:samotpravil
X-From: foxido.dev
X-from-id: 15965
X-MSG-TYPE: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-blist-id: 3849
X-Gungo: 20250728.224157
X-SMTPUID: mlgnr61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxido.dev; s=dkim;
	t=1753897042; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=oFQ+eSdmstCHth7xPSbS81zdluAWB1sR7CUbVouWihw=;
	b=brAOXp34I1a1ve3elQHUTZaHKFN0ASxyd97NDV9nv+4HWuh2IeeDHqtGyP5gKv3VzuxN1z
	QkdCGWWz1lCOUGRjZPkGI7HIxcySrPJatb6yLazVD51ZT+8ZvR4y/7hiW1aTUUrL1e5uEQ
	ubWtm87hLO3FlreeZm0Ppd9qzrBCWTA7l8227weGvQqr0L/ktNY8BYJeCyPjJ1+emylK3k
	ryJF+a8NMbaClbYqNFSavrwHHyn5SjsSMAzbKmESpM8BY73nc91pq78/8bezKlZNNGP1Du
	Ghdr4QK34BpdEY8Te4Qtl0wx9xskzUDJ7Wt4kAByfKmxZA06X+GUj4RkTNzNzA==
Message-ID: <26cdd07b-7b5c-4636-99c2-6c078c6a48bc@foxido.dev>
Date: Wed, 30 Jul 2025 20:37:12 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: Add WMI driver for Redmibook keyboard.
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux-input@vger.kernel.org, nikita.nikita.krasnov@gmail.com,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20250729190528.8446-1-foxido@foxido.dev>
 <8e7f2cde-f068-4696-8298-f83619dfaf76@gmx.de>
Content-Language: en-US
From: Gladyshev Ilya <foxido@foxido.dev>
In-Reply-To: <8e7f2cde-f068-4696-8298-f83619dfaf76@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable

Thx for review

On 7/30/25 19:33, Armin Wolf wrote:
>> +
>> +=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_BUFFER) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&wdev->dev, "Bad r=
esponse type %u\n", obj->type);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (obj->buffer.length !=3D 32) {
>=20
> Please also accept oversized buffers.
>
Sorry if this is a stupid question, but isn't any size other than 32 a=20
sign of a firmware bug?

>> +
>> +=C2=A0=C2=A0=C2=A0 /* AI key quirk */
>> +=C2=A0=C2=A0=C2=A0 if (entry->keycode =3D=3D KEY_ASSISTANT) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D !(payload & AI_K=
EY_VALUE_MASK);
>=20
> I would rather check the payload for 0x00011901 here.
Personally I prefer to think about it as "some value encoded in payload"=20
rather than "is it AI button release payload?", because in the latter=20
case alternatives are more unclear. It's just a preference, btw, would=20
fix if you insist.

--
Gladyshev Ilya

