Return-Path: <linux-input+bounces-13912-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C20BB212E9
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 19:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 713683E089C
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 17:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1E0296BA2;
	Mon, 11 Aug 2025 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="HW6UqpBX"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF4A29BDB3;
	Mon, 11 Aug 2025 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754932257; cv=none; b=iY4MBu5VRiZhhli9Pf7qVjdt93++eyTMTXtDdBiyO9ZbyjyxxzTJ4PZFYtGZs45cSAgOq606psWlSfm45AvYVhk88pI4jS1MrmR9Ri8C4XPfre9QenAh6pBkQLppsjjW9yDZOkSBd2R7q1sQYKzYRyKG6jr5l/23aZrPXLiP99A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754932257; c=relaxed/simple;
	bh=NfcpECgqdHNwW4J3rj9k/7ZBMdwz41KP0vR83+uTCm4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=NXxjbyrgev7DrpYH+2ETynasN7FWpWShuL/UMn9rMsscOysVHecLVGBeR5vE2QBMp6C6JH7kURLhl3gayRWsX9QLlCtvjQHTiTNMZaPBgXHNzUKxGNnY6iJyB1ppO22hSRWvGEE6ycrGA6Mi2cYDoJ+vRl60bPoCUCr9oO4X4lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=HW6UqpBX; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754932248; x=1755537048; i=markus.elfring@web.de;
	bh=iFEz9eT6F16hlYN806F59ir7VxzWd+QswdLQxOMMfBU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HW6UqpBXMEySXIUGN3fY2IbTR4VZeVs+7Q6pDbx/vSj4r+SnihLyKZ0/+JyRtPp4
	 CVeI+q98ivxCDFwzB4d/4IU67ur/pxhPIb9Y5jaEGAY49/gN5sutTRhtGKlfr/6xB
	 Yd5XJy6wQrKLRzaeq2tN4nP6nIAIX8fgYn7R4JrgLPkLzFoB4crf9Gk47kmtpCApD
	 JZMvx9uW9DUCYCgA2T4DgcCDRdVh6FNcouo3HchfalosZAWbZVcTfoQE5loGo6WIz
	 BaBdbeDhxu9JXW6EfkIUIMyxPvBhK8Wgi3M0Q1fetJmQAYmkEkI40QjCXfeKdCO1s
	 GiugdmVq+B77SmMjyQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.213]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MN6BN-1v4YV31uQX-00Tt0q; Mon, 11
 Aug 2025 19:10:48 +0200
Message-ID: <d37e7ccd-1d5d-4237-8a7e-a0eb10ec069d@web.de>
Date: Mon, 11 Aug 2025 19:10:46 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Leo L. Schwab" <ewhac@ewhac.org>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Kate Hsuan <hpa@redhat.com>
References: <20250810225617.1006272-2-ewhac@ewhac.org>
Subject: Re: [PATCH] HID: lg-g15 - Add support for Logitech G13.
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250810225617.1006272-2-ewhac@ewhac.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bWtxhUXcLy/ImE83BhS+Vieazvy+5acd1YLg7TCqsur3QJK51zV
 eeZcFK7K8XXTNkt/7aCFNAeJFFdpOp00GLDf0oKJCPCmGpSk8KwJIwbCqwMorpGS3gqg/WE
 Rosi8Di4FvyOY9sM0sMSIaQUa7M3m2aBfevZb8sELcD1+5mA7hLmczEhZalDyg5VTO5YzhM
 NIUlPYZciwiq3fM1afRpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SIdeQWToKv0=;H7Lmjt5s8wBVRuGOjfZ+fZAYbYw
 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

=E2=80=A6
> +++ b/drivers/hid/hid-lg-g15.c
=E2=80=A6
> +static int lg_g13_kbd_led_set(struct led_classdev *led_cdev, enum led_b=
rightness brightness)
> +{
=E2=80=A6
> +	mutex_lock(&g15->mutex);
> +	ret =3D lg_g13_kbd_led_write(g15, g15_led, brightness);
> +	mutex_unlock(&g15->mutex);
> +
> +	return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&g15->mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.16/source/include/linux/mutex.h#L225

Regards,
Markus

