Return-Path: <linux-input+bounces-12184-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3146AACE46
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 21:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE81F3AE59C
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 19:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DE91FBEB1;
	Tue,  6 May 2025 19:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b="Gn7PHoV2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4457A1C3C14;
	Tue,  6 May 2025 19:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746560674; cv=none; b=gL1anuh+MBhLT/7moHmgzz9eG3HKknKNFLjz6rbOZRoihfMuBF2J7BbRQNRk5DkcaefoY72Xu2KZZvIINWP3zjfJQlwVcLpHxs/oC69TSDH8BzUSR8qhayjJRAOcLjyL/q85ADrz5FYQgiR9WZ5FWqSuX2k0bsmdyE2O0YbttSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746560674; c=relaxed/simple;
	bh=1fY4vMNH/YfAWs2Fy6Clb6aZ7y/rTqWRxq+qk7V/hR8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OA6z9a5tDSmT5y54T0Aeu4/PoObVHtW3qzhVLnaUGz0aPPsGePKLHTUruU6zEQgQ8Ez0jTnkyKDnkDsnpSBfOAwl3/QCq7TlgspY8JMF5l+9tYG4B5IEyaaOsXTDzCiRxWpNa+XChgmpUtxfQ7N4Qpioex47GQFyRuOpR86SahI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com; spf=pass smtp.mailfrom=joelselvaraj.com; dkim=pass (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b=Gn7PHoV2; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelselvaraj.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=joelselvaraj.com;
	s=protonmail2; t=1746560663; x=1746819863;
	bh=1fY4vMNH/YfAWs2Fy6Clb6aZ7y/rTqWRxq+qk7V/hR8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Gn7PHoV24ojQcFFVKV6/3lEmdFz8dtVZRFo8yP+C/qZrp+a1Hdmq/99zrYgyMSUw1
	 No/XsdUoVVKX2t4/fPZW8cIDUZS+h17eTVWrfEI3lGH3nsOARoajdFLfkJ3n0HTSxO
	 KeW4xvBiAhjVS1t5AQGWToYqR6/wZxnLRJ8RiXTEoZOc6+AEQCXVgHyl9RNHs7dDTn
	 pqChPGPsow81PVJjxnh/5WOqqN9W/zdd+sLH1tG8pdMNhkm76qDsrvSZeMUi/U1iGK
	 qGYMhE85zr/f2Y3c8F5EOQVN8mbGEk0Nbw/ZUXMavb6zvCNQ0gXfo0m4wSofoVt8of
	 Q6hicAGf7Xj0Q==
Date: Tue, 06 May 2025 19:44:18 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
From: Joel Selvaraj <foss@joelselvaraj.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v4 1/4] dt-bindings: input: touchscreen: edt-ft5x06: use unevaluatedProperties
Message-ID: <b9da8309-d34a-4610-999d-509062aad31e@joelselvaraj.com>
In-Reply-To: <p7pyyb6orbqpdk46rs55simotv44i563j6urvrlj4sb7yzqei6@6ezdhwcwpklx>
References: <20250506-pocof1-touchscreen-support-v4-0-bfb53da52945@joelselvaraj.com> <20250506-pocof1-touchscreen-support-v4-1-bfb53da52945@joelselvaraj.com> <p7pyyb6orbqpdk46rs55simotv44i563j6urvrlj4sb7yzqei6@6ezdhwcwpklx>
Feedback-ID: 113812696:user:proton
X-Pm-Message-ID: 93aee6d45e7ca36d2b8859ea9c3b8b4d30a77d3d
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 5/6/25 14:24, Dmitry Torokhov wrote:
> On Tue, May 06, 2025 at 01:18:38PM -0500, Joel Selvaraj via B4 Relay wrot=
e:
>> From: Joel Selvaraj <foss@joelselvaraj.com>
>>
>> In Xiaomi Poco F1 (qcom/sdm845-xiaomi-beryllium-ebbg.dts), the FocalTech
>> FT8719 touchscreen is integrally connected to the display panel
>> (EBBG FT8719) and thus should be power sequenced together with display
>> panel using the panel property. Since the edt-ft5x06 touchscreen binding
>> uses almost all the properties present in touchscreen.yaml, let's remove
>> additionalProperties: false and use unevaluatedProperties to include all
>> the properties, including the needed panel property.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
>> ---
>=20
> Applied to the input tree now, sorry about the delay.

Awesome. Thanks!

Joel


