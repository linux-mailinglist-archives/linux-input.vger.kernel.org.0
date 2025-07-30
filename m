Return-Path: <linux-input+bounces-13725-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A2EB165D6
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 19:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E03018C347B
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 17:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571C92E03F5;
	Wed, 30 Jul 2025 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LESnxYKX"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C1298CA0;
	Wed, 30 Jul 2025 17:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753897959; cv=none; b=REIehhnI5ek+DKogTGEO/AJKI16KxWq8YmgKq12yAoPjA0g4v9/ieqLphTld9TwJugZS5RYao1pSGZg2QV1SoNqAOmYl3JOHrV8KPOP7mJerGhWDksn9psZJSOxkz/vyR8Y8ZMfbRdLxdT8ix/SxLXmZtbDcyRSWxS22QeT3br4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753897959; c=relaxed/simple;
	bh=SCkXsx0wm6meXruWe84Vj7eAxA79Rj6gwbw3/EeudJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R57h2/MVtFP6AiQr9mjlk7hFdlitmkk/mpUsib+SGOk0BIvwqiBHsDp/i0RqtHXGIHfbckssxJQQbYohh0xIk10IET3P9ucxKWYCWZUQ+XUXlMKrbgQNTBsLE2d6qx8AiOSYiWeaPXJBgPaQuzCNceHrIzU0sV8CZVXw7xjzo4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LESnxYKX; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1753897953; x=1754502753; i=w_armin@gmx.de;
	bh=SCkXsx0wm6meXruWe84Vj7eAxA79Rj6gwbw3/EeudJ4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LESnxYKXL2OS+G1ctps5mJzEp9tTEoiKKBD2R3YHYfWWm0FFj9sxNL/WfPZpiMGp
	 Xriqs7CRhmOvYmtExvxn0TGsrEhvEeazUYzrVldrQTU/mxBJWFUYTKfrTCtGgq5xQ
	 0ih8JRvwFJBSKEc9gYcZOSLrBjGB2ksiRz0oBqH1SopvmCtZLbKniUnFzcaZ2VkC1
	 ZOQ9R9Ao0mu+Z9FVRUwz8i2Ux+zVqWMb6Z7cFIk69oHLLhZGnhamo9iy0yq/Dh4f+
	 w5/WALd721wSnABqYzkNx5CYmG1UNJ2kvRPQIF7rj95IxXdn+QVb0PIbKI7wiOwD5
	 PSkKt4huQr/nd3xKUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqb1W-1uLKcL2Wsi-00bVJz; Wed, 30
 Jul 2025 19:52:33 +0200
Message-ID: <a308c0f3-ddab-49bc-8162-e98082576895@gmx.de>
Date: Wed, 30 Jul 2025 19:52:32 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: Add WMI driver for Redmibook keyboard.
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: linux-input@vger.kernel.org, nikita.nikita.krasnov@gmail.com,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20250729190528.8446-1-foxido@foxido.dev>
 <8e7f2cde-f068-4696-8298-f83619dfaf76@gmx.de>
 <26cdd07b-7b5c-4636-99c2-6c078c6a48bc@foxido.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <26cdd07b-7b5c-4636-99c2-6c078c6a48bc@foxido.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hewpUnGXSgmSPKqRj8ME3qBLAn9FqtxCMa58ivGs2SA/gNkpsXS
 M5PT1be97PINQYCBje16MVnT5+r7W4etnMwBuUrAWsWvxEV2R5QzQWm09k/jdBCogtjNGlC
 4Scj0bEdWCv2PvjjaInKe3PCl/OA2dUe4so3KResBEsgXyzz5d3PVyxplT7G1Sn4ns+pdbG
 PMB8E7xk/w1ibi5/P4Frw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+7O5iX9puuU=;YRnXHzq/4VehqIUBi44EDCmJiRc
 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

Am 30.07.25 um 19:37 schrieb Gladyshev Ilya:

> Thx for review
>
> On 7/30/25 19:33, Armin Wolf wrote:
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_BUFFER) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&wdev->dev, "Bad r=
esponse type %u\n", obj->type);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (obj->buffer.length !=3D 32) {
>>
>> Please also accept oversized buffers.
>>
> Sorry if this is a stupid question, but isn't any size other than 32 a=
=20
> sign of a firmware bug?
>
Theoretically yes, practically no because the Windows WMI-ACPI driver does=
 accept oversized buffers :(.

In order to support ACPI implementations that rely on the Windows behavior=
 your driver should also
accept oversized buffers.

>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* AI key quirk */
>>> +=C2=A0=C2=A0=C2=A0 if (entry->keycode =3D=3D KEY_ASSISTANT) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D !(payload & AI_K=
EY_VALUE_MASK);
>>
>> I would rather check the payload for 0x00011901 here.
> Personally I prefer to think about it as "some value encoded in=20
> payload" rather than "is it AI button release payload?", because in=20
> the latter case alternatives are more unclear. It's just a preference,=
=20
> btw, would fix if you insist.
>
Alright, in this case you can ignore my comment.

Thanks,
Armin Wolf

> --=20
> Gladyshev Ilya
>

