Return-Path: <linux-input+bounces-16771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCF3CEF2FC
	for <lists+linux-input@lfdr.de>; Fri, 02 Jan 2026 19:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56D2430076A6
	for <lists+linux-input@lfdr.de>; Fri,  2 Jan 2026 18:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8628314A9B;
	Fri,  2 Jan 2026 18:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="eA6aa1Oy"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D661279DCC;
	Fri,  2 Jan 2026 18:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767378505; cv=none; b=VLhx45e4flg2jCqyovyh5+Igb5ynyKY/Pa/pIxElmXXrpNj8k37ztDSgjyWSdrNKGi6VgaN8MyGmJ/GtJX/1i0d91iyrQJjemn7Pdu80UITOCtQSimdmQUSm2r6eK2+tHGV0lvPs+tpTN4jPpxBKwKKObFxHYjbkHcTRqZ32Fbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767378505; c=relaxed/simple;
	bh=rzd4cdNyttZGMTbWraAxdp3bc7+1wcry0q1l1zsNhYI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Awu2WYzACmz9Poqj/mFHDCgbqScPqVaAFNXq6EtR3jHla6OsClRqnBrZc9Z0LQXqwjaUgJREvw4R5/ycZrcWPx7MKoS/V081MqcMTISprkV9i+3VY9R+V38DkYQoyJi1sRJLSl1Q+pQmmYOlsx1RN6pmoDVwrcdHYicByMToJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=eA6aa1Oy; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767378501; x=1767983301; i=hendrik-noack@gmx.de;
	bh=rzd4cdNyttZGMTbWraAxdp3bc7+1wcry0q1l1zsNhYI=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Message-ID:In-Reply-To:
	 References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eA6aa1OyNBg1YfeQdYd1MRv/sEoCmgpDq94IYFcO/ENI9/Zwj2QlUL16pwQcnxkK
	 izGTTPP43B+ZiDdWWkRiCxcmqCU+elKPFLibbY7pgOLFHRjX5G0/uxlJoTHdl3EoW
	 uUySkym0SqpO2uhB1TGLAXFXyxUAvjIegHcz3mOgBAgvK7IP1GfYAZH0bnJ9ywxgf
	 ZX6u9HrkItVvbk3b6JY9K98QQ04vHmw5F2n1AsvDwlxTvXNL8uSabMqWh6j5j3Djj
	 mdQRwcEaiiMs1wxmeKrIMyq3zw2c3VC3F+mffOarzXx2tf4NNRgwVy1Tzul9ovQzx
	 TQne9CZoTZZAiQXniQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.85.36.251]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6KYb-1vw40C1yTB-0167Uo; Fri, 02
 Jan 2026 19:28:21 +0100
Date: Fri, 2 Jan 2026 19:28:20 +0100
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <d1dcc3b5-58cd-4e88-a06a-986143a41761@gmx.de>
In-Reply-To: <5zfoikfpctpvphtzmthqb3ue5zc43ueriaaesyyqkvjm3b25re@7w2uo4es5har>
References: <20251205152858.14415-1-hendrik-noack@gmx.de> <20251205164952.17709-1-hendrik-noack@gmx.de> <k5rhkjmttba4aznb3xa44pqaxepsfkbe5ap6g2ln3rcgunvkky@262tpqra76v7> <5zfoikfpctpvphtzmthqb3ue5zc43ueriaaesyyqkvjm3b25re@7w2uo4es5har>
Subject: Re: [PATCH 2/2] Input: Add support for Wacom W9000-series penabled
 touchscreens
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <d1dcc3b5-58cd-4e88-a06a-986143a41761@gmx.de>
X-Provags-ID: V03:K1:eS7y0UJKdw58yfpyYSx7zrqNCIPklnK6kXiwf2yrpWpKpzNlTFW
 HPxpPAo+a090LklWiDpnR3YLOffMTVxM4pCv28Sl1jYHE8++BHIsPuh1LimKomCsL9fEi6T
 GubVjEIBL7+2ckfoiWIdff2YbPIwNbYGGQAMtuaaK7GZOEypHpPU6pKdVpEfdayRTel7hR8
 3f/uPJx8nj/WVa6l9xzkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vFOnQRmBMW0=;7x9SQqW54VSiKnXLSeO4PRdSda/
 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

Hi Dmitry,

09.12.2025 06:41:44 Dmitry Torokhov <dmitry.torokhov@gmail.com>:

> On Mon, Dec 08, 2025 at 09:35:09PM -0800, Dmitry Torokhov wrote:
>> Hi Hendrik,
>>
>> On Fri, Dec 05, 2025 at 05:49:52PM +0100, Hendrik Noack wrote:
>>> +
>>> +=C2=A0=C2=A0 struct gpio_desc *flash_mode_gpio;
>
> Forgot to ask - what does this do? We do not seem to be using it except
> for requesting.
>
> Thanks.
>
> --
> Dmitry

The flash_mode_gpio can be used to start the chip into a flash mode where
new firmware can be flashed. The chip starts in this mode if the pin is hig=
h
during the power up. It's in the driver to make sure that this pin is low a=
nd the
chip is not accidentally started in flash mode.

Thanks

Hendrik

