Return-Path: <linux-input+bounces-5627-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 399EA955CB2
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2024 15:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ADD31C20B14
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2024 13:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B561BC3C;
	Sun, 18 Aug 2024 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="DWgh4t1z"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD11B666;
	Sun, 18 Aug 2024 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723986793; cv=none; b=gBMZDLqenSkunvOle49YH6MrUL4NdPoOr2I7Vr8q396tos5HNAuHcIFKuR0+chrum/DVrpRmdtj3z9WTo8DwXoWGNYo/MMcAk62VkR9a7aU60zh328+iV51qBtXMTYNYMgF7KCqGw1kcSth5ReJQdXw+BWBhN58BsTEo6M+fFN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723986793; c=relaxed/simple;
	bh=wzKRVbF0+iIEwH2adiCkjyvf9KMRxPZMHSR//B5cIzI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=VdhpoGcUdmK8Hq84jyxpCAz2AA4buSgF032c0m3Ydj2cH2uMpQpeKqSAPd3YkOrYYpZPeqg+FAdkfEGkt14pKqhga8a6rHW0XJ/FKUMb1EhlZsZ9eEsK1jU9M1tQ5kl84ezCniqL98Aq2PBXslOiO2glN7Igo9DIpXVrJ49EjV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=DWgh4t1z; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1723986776; x=1724591576; i=markus.elfring@web.de;
	bh=wzKRVbF0+iIEwH2adiCkjyvf9KMRxPZMHSR//B5cIzI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DWgh4t1zw7Esbf1tYAgp08w1Jv8h5z/nu4AQfGWwSCJ2soiNOrODLP1rMj+cMza0
	 yzCs3cLyWzCJ34QV+ZfRWb2sUk0n+xJ/dKlVzsHPCgmmLfUOu0oGMjgjDFiNwH8M1
	 J3HtsDMnjWTbPhJzWdM7h/LGGBSOMOlh3gn48b0Onxp6XQ9SanoJzkTFD5atv0U61
	 yJTQuWjNvW9yORQFBAxn018q9swbm/Nlr8DYv/sDCeWmGUm+UnhVJ3xoPTXhWGesl
	 ZdTsA0EPfP4b4ihloND3e6wiiHiRGRvbbIqaCt0BctrkbzaLj6Z1uhqSiOPbcqqeQ
	 RlV1cYE1gLxe6Y1Y9A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3V6E-1sgDgA1epG-000WKu; Sun, 18
 Aug 2024 15:12:56 +0200
Message-ID: <aa331200-205e-4b00-ae02-343c96c52ae8@web.de>
Date: Sun, 18 Aug 2024 15:12:55 +0200
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
X-Provags-ID: V03:K1:Bgo8Mjcj/UCW6RoBpCIC+Zuvxemp49W6vDQLsezt+tiSkJAhPN1
 JDy1nOzqby9HbXjRzKALuFAFQyUezPik60QtsCl2DYZva0MqPdo5Xsh1R/XTDVKEtpCJx+c
 jQm3Si8a7vid+/N1fUmjPBOrLvNe9z6gyw9YjQKI9ZNL6VB+hLaBQVk1dlcJLWSUu8+2vZh
 5nT7WE3FCSw1k6I8Fz+Ng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yEqxYLdwEMo=;Ty+Fj4klsSrBwo3/nLBKK5ejFw/
 nqltL8LOU+jxBFAI9EvoTnV7UwbGtqjyU6e58R9MdpftR4PHQqQhWR0xFVH448EpdJsaqb2Uk
 TaYHbOc0v8idNBXtW5s90jpacNV3EaQYzPokmg9LPWaZHsKyLJoSWcp6UJyVQEra571GdVJ3P
 tQLcJGUzqQfDa9CHrEy1LRHcP33qjEo2Wk3wP6OS+PpEvH3exAuvBsLhpC3qTCHJ3l30DPN1H
 krtg/HUXXzuaO+JD/DmORCzOpi4F9EyiyADH6QITL2JnhKiv+oQ660S/QsGivXlnK3Ru2yy4s
 If6Nm7xWKOqv9bQHaaLdnFD12eI/qgYXAVGVd8V6cfoFj4Xv1RwkZEpNj1RA/0EnIfQfhPHbY
 2A9CXr5/6htdXgIMwEqbjZeFGWoEWhe6NqGRYHQ1GJCEecUOqUms+USaqVEP9gkPOwOZvFrxn
 z7joKPMFlpVnhbGrXliIqs+mDT02fvtv+SYqaX+yKuk4/ZnUBIZYGm/B0afSiDuz8BpaSpuF/
 XuPbdtxmyJweo6oOWh/bI57iRy/+0NbNqqXPqlcO1J3AmI1P2K29Jnjbu1aW7/o7doWhhiN8J
 VwOaMslzpGVTV3qIREGQOokCaJdedg0rLMOb62DqqN18ZPvZ4MronY0/ew/NF7B32XDMSE0pN
 p9ekjZ9Xdke4AUerFJ+8dWsw5w3gqI1NRzT+jPCr7h9StIpmbaoHuavIc0sGTNwbRrTVZD1aE
 J+L72ZJ2fev5cqz0k71TJ7Dtl+gcQLFpK4g/C3kg0z5QX/+IPePwmGm253TvqqIhuoOPdbYm6
 BMV7JNBURo8K+IJREF0koTDg==

How do you think about to distinguish properties any further for available
device attributes?
https://elixir.bootlin.com/linux/v6.11-rc3/source/Documentation/driver-api=
/driver-model/device.rst#L38


=E2=80=A6
> +++ b/drivers/hid/hid-corsair-void.c
> @@ -0,0 +1,851 @@
=E2=80=A6
> +static DEVICE_ATTR(fw_version_receiver, 0444, corsair_void_report_firmw=
are, NULL);
> +static DEVICE_ATTR(fw_version_headset, 0444, corsair_void_report_firmwa=
re, NULL);

* Are these really changeable?

* Can the macro =E2=80=9CDEVICE_ATTR_RO=E2=80=9D be applied?


=E2=80=A6
> +MODULE_AUTHOR("Stuart Hayhurst");

Would you like to add an email address here?

Regards,
Markus

