Return-Path: <linux-input+bounces-4852-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CC9927498
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 13:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91D2F1C211B4
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 11:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26EE1ABC36;
	Thu,  4 Jul 2024 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqC4ER7w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105AB157A43;
	Thu,  4 Jul 2024 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720091428; cv=none; b=JOsr+f7WXna1XWxZB4ojPo4rWUXCC6PqPMOM8wx25FK6/G6jztrYjJQJghEAPJQ7RMmHFcwR1nlQ7Nsp4EwP31JL9+bqGjEiPtkNbw6ynbs12ieTp4qPtJZhOcMKfvNWLSEUg4jtU7qiqPuWhhvqqiAhobXSbXkPIF08OzcZwY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720091428; c=relaxed/simple;
	bh=Cn6EFTEupNmBXXrM25JWIikQivHHK6O156XYlsfZqg0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aZNc6eT00eqbU+n/BKkv81kpNcA49+KibWS3+N5tlr6raf69HHIVzQAjO8AAQpjTmhy5M/uKSgPzu4mR5b/GHROEtpKV2uqOdTxqGo9Z9PW1DhRQu00CNwVtUZBevz0kGCs1UX1jZKVp+D/o36CW/xX1kPZNorpySCdqPqg8Q/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqC4ER7w; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3679e9bfb08so280222f8f.1;
        Thu, 04 Jul 2024 04:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720091424; x=1720696224; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cn6EFTEupNmBXXrM25JWIikQivHHK6O156XYlsfZqg0=;
        b=NqC4ER7w0yo8lk1SC7tcVRYetA7LkA3+UWMMKXKRvA15fEXr1WL1QJYSGTqq6YdTH3
         YoSVuQ2ASFk47/u1Nejmxf26XWJHAnVp6AVVhNmMP3zZRzxzNWd3m42YMZPqXrGp3YtO
         Ew9ddJdPqrjPTwLXOOUA629Rw4YLpM1RGTem8WFMYNblb5ssqhFg1XEheZE7I8iVs8OW
         Glc1Igi91k2cxo5sHUTsAxzVZ3YIYyttOlgeMNe/oermuNHi+oqRsmnYJ0xCuKfGuKW/
         ZZbUgkuhqH+/tpKswvNZwgnWu7MGqtnyABFWpKEjFtfk8QIKIdl/1PX/r/pGQkubmNLi
         jJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091424; x=1720696224;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cn6EFTEupNmBXXrM25JWIikQivHHK6O156XYlsfZqg0=;
        b=W5durXh2htF+oLxs+M/cOPMOxBk6PjlwXBM5y8OhKqIEIMKuwBHmj0fiDquiFNn5mm
         Ov/q+0Uitn0XFPN27dSOeaAHpbA3w7xMGqUNKhHDMLHIvYU4eyrRi6OITgvpoEw7Cq4/
         Rxb5U7RQQWCKEIOkPsMZlMLmFviemXTx+dJXYARXHLXhIaHwYrkLIqTnWyfwLI6IEpkV
         g2mq5B6CCsEP5zMn0RjVIhcH92HySgsaMxgXPiNES2CZSmf3ae+m7A5UTt37W09TnN3M
         x06wnhOGe0pavbUA6wfelWOeseLBa4Gt9r3jsfrzCM8Npcis0I5CuagDeChS64hNHExU
         Ee0A==
X-Forwarded-Encrypted: i=1; AJvYcCWm3SBpPV1o9yGFAlyC3SHg/FQ1Q9qwTG/FqCfvysxSaLGzFHp9gBOjkIZCxgft7FwAQG7JCowP9xtH/tsAOumqgxmyZwLRgch0YcIUh23VWlqu5ld/pb5Kt4jpLgEpVF9cgL7A4wBPNw==
X-Gm-Message-State: AOJu0YyekBF65Q6M2MstxHdz/u+WG7pKFSyk1MxdRDEjxgD/5kIaiKBA
	3ufzfTOuua+P7mSXCuljQU5KAZezHsJJbGumqpYLLy6DB/hkoeGx
X-Google-Smtp-Source: AGHT+IGMQSlil8JTanApMIBQFcFsXnaHD3PtMhX6P3RY6oydutyJ656/6xCZ+5S9VtHVZ0RxAaM3zQ==
X-Received: by 2002:adf:f98e:0:b0:362:ccb1:791f with SMTP id ffacd0b85a97d-3679f6ef7a6mr1269979f8f.10.1720091424151;
        Thu, 04 Jul 2024 04:10:24 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a0593e2asm972553f8f.15.2024.07.04.04.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 04:10:23 -0700 (PDT)
Message-ID: <7b55e04cb1ae0966fdb9fa22cb680b4451c233c5.camel@gmail.com>
Subject: Re: [PATCH v6 1/3] iInput: adp5588-keys - use guard notation when
 acquiring mutexes
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
Date: Thu, 04 Jul 2024 13:14:17 +0200
In-Reply-To: <20240704-adp5588_gpio_support-v6-1-cb65514d714b@analog.com>
References: <20240704-adp5588_gpio_support-v6-0-cb65514d714b@analog.com>
	 <20240704-adp5588_gpio_support-v6-1-cb65514d714b@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-07-04 at 11:45 +0100, Utsav Agarwal via B4 Relay wrote:
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>=20
> This makes the code more compact and error handling more robust.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Michael Hennerich <michael.hennerich@analog.com>
> ---

Since you're "transporting" this patch, you should fix the commit subject:
iInput -> input

- Nuno S=C3=A1



