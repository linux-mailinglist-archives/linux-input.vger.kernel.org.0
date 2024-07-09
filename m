Return-Path: <linux-input+bounces-4917-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF70C92B045
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 08:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E15EC1C215E9
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 06:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6BC1514F8;
	Tue,  9 Jul 2024 06:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jg0LDzEN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61D813CAAD;
	Tue,  9 Jul 2024 06:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720506765; cv=none; b=VnituDqzT3v6HQfHi/Xt2eigv1k+SDQJdKTsxdC7e1qFREWBI1j+sCugeDEIx6pZZsMmnq33UlknWVVI3PX3UILvUzHs+zKbgz/9NoCpJNUGvrCzGZ7ce4mTJaSfJvupblLWKIAxgElb2Ej6jsjsRi3GESGdfR+lwy36knOp4Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720506765; c=relaxed/simple;
	bh=tZRcUZ+95IAQt8CTUWBeI5BuFARsGGVBApsv+FuXZIA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jJecO+/hg6O+Ui3seoozJ9dYIqbCu/HKNk32mO+LhyU1MWqvdnWwpqP4DltSJaY9Po/viudYWx3WQfmI7KZty+8lD116xdt2Nx4IbNdrAOOMXoMqI59S0iclZ1HTmSt9LNlzlO7byT6OETLpGKV/fMiaiM2xawYZ+KlpTuBC590=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jg0LDzEN; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a77d85f7fa3so531945966b.0;
        Mon, 08 Jul 2024 23:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720506762; x=1721111562; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tZRcUZ+95IAQt8CTUWBeI5BuFARsGGVBApsv+FuXZIA=;
        b=jg0LDzENzJ+CRgg6VtV5YBEWIBQVMJHygAIXI7odD0RgxR/qIN0ro/Ix671Yi4pz4b
         0nC051tryBucrQntJZ778jQvI+MCcLUc5cyu1KVCtRFbrsMyPM23ArNO2XQ0eGEcA9gL
         q4Hn+R0zLkJapDaoi30ivpMnlTIFPfKnESGlHlIc5MUI1WcakTMUiAswqkXJWpieGzjN
         01y/PZ/oitzoQM5cMhoMFpPXAuxi2enirmAvRdMuTYuiBuhAswAzgXoy9mYW0rJVR8fi
         0/eFSCuPNrDQGVyToUb1qpi6d0CWnw+jWH/keO+OxWmQYoPNrM8OT0n1vr0A1nj9/xul
         bsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720506762; x=1721111562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZRcUZ+95IAQt8CTUWBeI5BuFARsGGVBApsv+FuXZIA=;
        b=ME1Vdqnm3POVGIoNFa7s7KFlhf6n0eI5XL+9lZIAlCwfUy6tAnmMgRNI3PN7Nqcfpu
         7YoHCiuuRmF5vDL1NRReVOZG2hF6q9m6Y6jr2XC4U/sdcGz6x1vkTst9h+3TH5is2KvW
         606t8IsWvcrmbgajMgdNlcc6af6iDzyMWeYfSo58bADDtUHgApVFL6R43cOw1SlOmR/U
         pCSC3gzzE3QfTLmL3Gnf2fMu03ucGS6UvkCI7K4SIlp5PnvnQZ77/EP34JX7mxPAbqAD
         0liMs+Vb8PG6fWPijohe6aU/hAP44JCbvsTEtsEghgoPSIpwbBZ7uQV4ekrqFedfOEbw
         oO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9OCBssRHqF48SxjrLOEwjNDyePMEh2HvDj0t7vQSxN8Mr0kSCMhmMWYT1OOmxon7WnXCH3aWtQLSq6pd4n/iMqQS7wJ/6/+VdSEy4wc1vRLCN6ToJYsb3jqdHNpKZ4fYcsopUWxQDeQ==
X-Gm-Message-State: AOJu0Yy4Q+U/x9TdavOOUOAp4W1B1LL7pP24pVSOm33/LAzF4ds9TIq4
	jiCR/wRhY9ISYDHYNSMOAXaM8zQiLYhKYzTZDba6rG5dnVQSGniI
X-Google-Smtp-Source: AGHT+IFYWv1no8Ke6U6rKRrYT/DMqxmdb4f0/Poh8xIj3JXlzLBuWHNHfAYGbNOAQB65ZfZxwEsNfA==
X-Received: by 2002:a17:906:24d9:b0:a72:9ebe:29da with SMTP id a640c23a62f3a-a780d30cc6dmr89115266b.35.1720506761706;
        Mon, 08 Jul 2024 23:32:41 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a872e23sm50534066b.225.2024.07.08.23.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 23:32:41 -0700 (PDT)
Message-ID: <9c64adf6a686b2845c15b368592115f3f9ab39e4.camel@gmail.com>
Subject: Re: [PATCH v8 2/3] Input: adp5588-keys - add support for pure gpio
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: utsav.agarwal@analog.com, Michael Hennerich
 <michael.hennerich@analog.com>,  Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arturs Artamonovs
 <arturs.artamonovs@analog.com>,  Vasileios Bimpikas
 <vasileios.bimpikas@analog.com>, Oliver Gaskell <oliver.gaskell@analog.com>
Date: Tue, 09 Jul 2024 08:36:35 +0200
In-Reply-To: <20240704-adp5588_gpio_support-v8-2-208cf5d4c2d6@analog.com>
References: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
	 <20240704-adp5588_gpio_support-v8-2-208cf5d4c2d6@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-07-04 at 15:26 +0100, Utsav Agarwal via B4 Relay wrote:
> From: Utsav Agarwal <utsav.agarwal@analog.com>
>=20
> Keypad specific setup is relaxed if no keypad rows/columns are specified,
> enabling a purely gpio operation.
>=20
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>



