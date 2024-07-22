Return-Path: <linux-input+bounces-5115-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 072F1939207
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 17:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CDE3B21D1B
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 15:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379F816EB55;
	Mon, 22 Jul 2024 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoNfkVMs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB221E891;
	Mon, 22 Jul 2024 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721663210; cv=none; b=MvFSyyDmyXRk5Wm2pAq0h86fD5V7Gx2O69F30qwS1m93DGE4kQVOyCSZ0eNZ36pqno+Y4LS2xRzJdtXd57jOTEtR1/qWlXq9SM0pg4TodWFeCJxzkKka2DT7w0xl63+McADUKqPI0p/NpCCOuuF8TYoCb5ZVZxt24UoNjygApcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721663210; c=relaxed/simple;
	bh=M0qHKecT+ezPtez8suauFp9H5oe4ODGeXLXT0BBzyfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShiBYogPtLzT9Oqa/BeePicobs8kkBebZc6Kt0+NTKnzg1++EHUuVjr2Wd5blJo9RhRQlE+nI/keXxkstV4dXvs104gB+mfOThMcZqZp0x1s2WKCfzeza5NsRTymO63pljEU0W00OizRZ4bmsvBxAGDBXn36oGwSXyzUs9NmdJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoNfkVMs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA08C4AF0F;
	Mon, 22 Jul 2024 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721663209;
	bh=M0qHKecT+ezPtez8suauFp9H5oe4ODGeXLXT0BBzyfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VoNfkVMsjW7ZamKDDmHZrfWU1Tn7HyM/HmEekBk56xYoY4W5q4j8jeiOmdUXz5S/d
	 3v6xNyx0LAWMhnIeyR/b/diyrr0lpPse81OYy5AmGnKj1VzHwO2Les39JLHHbJ5ote
	 2ItSbIemFCxtLSGZkxeHD3ZVB7EfdNXYlOu7UicAbjk4l4lmZPsJaCSaRzT4Aq6vur
	 s3gWqMLPoRWUaIUfZOMHq3jm8L5tohashWpdG0bMzUztcP9YfoRfqu4JjfzxgmGVtw
	 mAS+ADaTAStDU/8qR3i0d71PdiV6nKOEHn7A3gVJgsfUqjiEih0T8CjXBWmSmaFXwx
	 v7HG067WDrpmA==
Message-ID: <03b977e1-a6af-4232-aff5-48bc6e14ef90@kernel.org>
Date: Mon, 22 Jul 2024 17:46:42 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] Input: adp5588-keys - add support for pure gpio
To: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>,
 "Bimpikas, Vasileios" <Vasileios.Bimpikas@analog.com>,
 "Gaskell, Oliver" <Oliver.Gaskell@analog.com>
References: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
 <20240704-adp5588_gpio_support-v8-2-208cf5d4c2d6@analog.com>
 <9c64adf6a686b2845c15b368592115f3f9ab39e4.camel@gmail.com>
 <SJ0PR03MB6343870FAE4E1054009C698B9BA82@SJ0PR03MB6343.namprd03.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <SJ0PR03MB6343870FAE4E1054009C698B9BA82@SJ0PR03MB6343.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/07/2024 17:27, Agarwal, Utsav wrote:
>> From: Nuno Sá <noname.nuno@gmail.com>
>> Sent: Tuesday, July 9, 2024 7:37 AM
>> To: Agarwal, Utsav <Utsav.Agarwal@analog.com>; Hennerich, Michael
>> <Michael.Hennerich@analog.com>; Dmitry Torokhov
>> <dmitry.torokhov@gmail.com>; Rob Herring <robh@kernel.org>; Krzysztof
>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sa,
>> Nuno <Nuno.Sa@analog.com>
>> Cc: linux-input@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; Artamonovs, Arturs
>> <Arturs.Artamonovs@analog.com>; Bimpikas, Vasileios
>> <Vasileios.Bimpikas@analog.com>; Gaskell, Oliver
>> <Oliver.Gaskell@analog.com>
>> Subject: Re: [PATCH v8 2/3] Input: adp5588-keys - add support for pure gpio
>>
>> [External]
>>
>> On Thu, 2024-07-04 at 15:26 +0100, Utsav Agarwal via B4 Relay wrote:
>>> From: Utsav Agarwal <utsav.agarwal@analog.com>
>>>
>>> Keypad specific setup is relaxed if no keypad rows/columns are specified,
>>> enabling a purely gpio operation.
>>>
>>> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
>>> ---
>>
>> Reviewed-by: Nuno Sa <nuno.sa@analog.com>
>>
> Hi,
> 
> Since there have not been feedback comments on the same for some time, I wanted to check if any further changes/actions are required for it to be accepted.

Please observe merge window timeline.

Best regards,
Krzysztof


