Return-Path: <linux-input+bounces-5106-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FE937F5B
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2024 08:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92CE71F21C21
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2024 06:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5566815AF1;
	Sat, 20 Jul 2024 06:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="GlS3pVWe"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC912E61;
	Sat, 20 Jul 2024 06:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721458694; cv=none; b=CgK3zLaXOi3m6OPAUoPPrguaXllCDIO4j0sVW54XMeTREpQjpwYr4K5ref5VIPDNrQFAEp2ak86uS5jjOHxRIwNq8d2F+22383xobjFyyO2I6rXl3NqaHTVrRN9kXh+pQRCwmQ2gBP0IzEEm4kz3VWGaDcdcXqGJlzWdDhXvL5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721458694; c=relaxed/simple;
	bh=M5L6dWDAc1ou/EhVWLIU6nU2qw5ijq61Yo/lqnsud80=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=MJayc/KjitXwkqY18Zxee1mp4y1f7uT2oJtp5GPKKD2vSkhbOUOPywKOnIDbMy/iYw3ZLdQU6Sdlqrz3iJUKrTuhz9R9DKvR5dI+SCkEUa4Vehq7gA4SEgdrlcaZkzpF2SUBuNuE4OzaZt/HU8rdU5Icg31EHecm3dWoqr1F8P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=GlS3pVWe; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 8016C401C4;
	Sat, 20 Jul 2024 11:57:59 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1721458680; bh=M5L6dWDAc1ou/EhVWLIU6nU2qw5ijq61Yo/lqnsud80=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GlS3pVWedP+ZRBjFW6aR/R6nayB6owCO3ITEjaNzTuyK+BMu5OUL8X1KcbKoS+3KO
	 fbiULf8HGAHrT8lAtvcwanWuf7YQcS9jp4GfVIRlcfzrl1wWPvQ4//KffnarmPtR8H
	 gOcCISUwAFhKoxL7J4BSAxJiaVWMDoX+/IxesaPT8jibYmJqxABEev+saM3n2KKv1C
	 kt0FieLInXflBF/UxntpkR+XDodPxD5ioHc98u/C2JnWqOzXCf+QWRh0F7eA8H91cn
	 CEHtFD/DW7hoqaI2HkVVXTAUDBaUnxgpqDxlsoJCpEdJP+6rCZkFFeqyb3Ww52ip6O
	 boh40a6kCxVtw==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 20 Jul 2024 11:57:44 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Srba <Michael.Srba@seznam.cz>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] input: zinitix: Add touchkey support
In-Reply-To: <ZpsE8mQpahxBQRE-@google.com>
References: <20240717-zinitix-tkey-v5-0-52ea4cd4bd50@trvn.ru>
 <20240717-zinitix-tkey-v5-2-52ea4cd4bd50@trvn.ru>
 <ZpsE8mQpahxBQRE-@google.com>
Message-ID: <b0b86f2f6f315d791e7e0391142720b9@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dmitry Torokhov писал(а) 20.07.2024 05:29:
> On Wed, Jul 17, 2024 at 06:55:34PM +0500, Nikita Travkin wrote:
>> Zinitix touch controllers can use some of the sense lines for virtual
>> keys (like those found on many phones). Add support for those keys.
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> 
> Applied, thank you. However:
> 
>> -->
>> +	if (le16_to_cpu(touch_event.status) & BIT_ICON_EVENT) {
>> +		error = zinitix_read_data(bt541->client, ZINITIX_ICON_STATUS_REG,
>> +					  &icon_events, sizeof(icon_events));
>> +		if (error) {
>> +			dev_err(&client->dev, "Failed to read icon events\n");
>> +			goto out;
>> +		}
> 
> I wonder, would it make sense (and be more efficient) to issue a single
> read of size sizeof(struct touch_event) + sizeof(icon_events) and the
> parse the data based on touch_event.status?

Maybe, but I would be really hesitant to such a change: Original driver
also makes a dedicated read for the "icon" data and per my understanding,
those "register reads" may also not be really "register" based but rather
kind of "command" based, where controller will start streaming the data
based on the request for the specific "register". In this case i'd prefer
to not accidentally confuse the touch firmware by over-reading the data,
if its somehow firmware-version-defined.

Thanks for giving it a look and picking this up!
Nikita

> 
> Thanks.

