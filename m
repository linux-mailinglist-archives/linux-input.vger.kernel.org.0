Return-Path: <linux-input+bounces-9058-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCBFA05595
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 09:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA973A5D8D
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 08:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9D41EB9ED;
	Wed,  8 Jan 2025 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/kzDlGi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10C81AB533;
	Wed,  8 Jan 2025 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325731; cv=none; b=r98IV/CXGV+O42aAtJ0YEmcJGLmxGxxNZ6nKa2I1q90OV6NCVsk+vWsTfatZNmJwhgcZVhFcDZ5gqT4cY+6HSjRGvtO6pRA1zyr1fSrTkkJ5XnESCtNkWkEffaZzpSlqtx+r1bCFbrdIb4TbRjnA7vp8V20mDV4tLG6SDyL7oKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325731; c=relaxed/simple;
	bh=WLiUJvTnbvwgJ2e2jizcFl9V81z98Y4LfozDSFDGzq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5gqu0T2s5awtGlAW+Xvlumx0f78rmzwHOnskbEPUOKklyeF73y+uF5UXqu0dvZLklteEjuvEIh/lNRkzFzP8PzECmO8XCZATwCXSLkvvvp68YL2pKytWS/T8LK1Ep8FMbPG6ogCLw07NggVYHovUS83OAsrY1zRbg5Vobou/Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/kzDlGi; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so19575575a91.2;
        Wed, 08 Jan 2025 00:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325729; x=1736930529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dEV3nRHoiTlZpRaNa0mL8YmEmkzQLNj/99WGhY7D8xk=;
        b=C/kzDlGiXU0EiffrmSuQHB0Uj4z99O9PbZC/3ZJ5eHxn8IVcCTfECcHT76MiJxHdNw
         Gh21EV1NcXu9H28+sygBQrl0AsPEuMVV1JEfkG899saRioiV6oT0ZR1VvowmGX4MB6jC
         Bo/IJpTExEFujaLcceL8YZ7N5Oj5GBMswInJyCYmBUlD0YbdIUZPjjvwnlrde3+A6d03
         1PXOL4pp3N0HstNzkfwvHYW7s6Zgz2vhEdKSwhRlaMMBviKCY+5+/6wWhnzGyrM9RBR+
         ciUx97LFDhsmviC0hv00Zba/2CNMrVyUvPQCXsdeDMvLtPJ+Ucagp2DJhssTy0cwD/w/
         cShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325729; x=1736930529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dEV3nRHoiTlZpRaNa0mL8YmEmkzQLNj/99WGhY7D8xk=;
        b=d6uuSsx3eWCV0DHTdZLvAHAEFpndekHC8qEwFZoMK2tqmL5yc6tvICn5UAvo+axkmo
         n0wgm1s0MpB0yXm0Tugl2NQIzblXf4s9Hq4mwlviyPUkGy8gbqKLkH/BlVE0lrpXCd97
         9whYZh3fqwM9wx9jFmAzwNPhocOXc9k69SiyVtdmeVAJIr2Pw5HXaGDL9YGyhVrh/KxG
         75egqIdf4+y87oUkblaJojb5up9vggS+NgkmSbHlvkimVyCb9fs+lpfmlRa/pklwk7Vy
         AMvyyzc8lPwkYBsJ0+wHfjG5ZPd+tao5fV5V/Bnw4NVgn+4y61BQi2YR5kODB0PW7P8f
         A9VA==
X-Forwarded-Encrypted: i=1; AJvYcCUaTxlctgDY1f1aa0dvsYxWYx09AlgFMjfNC5HYNSkQXOeIwZk60dTl5DEXXniufyNyQdKsR49SJk2wfvI=@vger.kernel.org, AJvYcCXllMjCDPQkH0kXCPBYWz68CG4oVBuC3H4CyB9ELLgbgpPmNqV+ACmuEDi6wp0E58TytZGfCgC/OC6q@vger.kernel.org
X-Gm-Message-State: AOJu0YwWXXecUv6LwR4R0m94N/+keL1aink3b8Ap99vwNjH3LRLZhXwt
	lzlX2h165bzVG4+TzFDlWBJigv0LEplVgvl2l9xu+ew18rWN6zB3
X-Gm-Gg: ASbGnct4JnK6/fqY5ExYZ8ZNmZhgBLcnhrNJrfWt1JCeHLvQiOXhHFM8znCPxuYyVqS
	dVj8ShpVhOSSHNpNAVf26Ny5FM8KN4EswRf+sUrBtXFyyKRtZdy6bH2dsfhZRUmIlRDKT1zXip9
	BoPA4qSQwZaBn+C5wl+7jnTzmHEJHvkHiOOj62dYBHHiupuk67OLMqFd6SPoTqUBMPbTVllsYb2
	F13DwkDt1shZYmX6swAuF+iLlLMdL326Ygvh1Ec26Hfzp5QHQX1ya8tkxmJuNHsyEPqb0eQTeCy
	T2fiDpgXjERazl3bEFBxhMpY7Myv
X-Google-Smtp-Source: AGHT+IFt6yglBzdu45lcZKpQn61qSWlD6NrmmN8E7eokh2PUNX0tWId0GEleVKxvnyjttHMEYAjgrw==
X-Received: by 2002:a17:90b:54cb:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-2f548ec9267mr3450483a91.17.1736325728988;
        Wed, 08 Jan 2025 00:42:08 -0800 (PST)
Received: from [10.0.2.15] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962940sm321592415ad.34.2025.01.08.00.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 00:42:08 -0800 (PST)
Message-ID: <820def99-4990-4391-a45a-0d3908d3306b@gmail.com>
Date: Wed, 8 Jan 2025 16:42:05 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 peng.fan@nxp.com, arnd@arndb.de, sudeep.holla@arm.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
References: <20250108011812.627-1-mjchen0829@gmail.com>
 <20250108011812.627-2-mjchen0829@gmail.com>
 <ux55pgpmkngxjsl4semw2cfiljbszvotaydrxrihdu3zphsfqc@vsk72c3wqorc>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <ux55pgpmkngxjsl4semw2cfiljbszvotaydrxrihdu3zphsfqc@vsk72c3wqorc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Krzysztof Kozlowski 於 2025/1/8 16:13 寫道:
> On Wed, Jan 08, 2025 at 01:18:11AM +0000, Ming-Jen wrote:
>> From: Ming-jen Chen <mjchen0829@gmail.com>
>>
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: Ming-jen Chen <mjchen0829@gmail.com>
>> ---
>>   .../bindings/input/nuvoton,ma35d1-keypad.yaml | 82 +++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>> new file mode 100644
>> index 000000000000..889f253b3bc2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> I don't see changes.
>
> I already raised concern that you sent new versions without implementing
> or responding to comments. So the fourth (!!!) time: Filename matching
> compatible.
>
> Best regards,
> Krzysztof

Thank you for your feedback! I now understand the changes I need to make.

I will modify it as blow:

   compatible:
     const: nuvoton,ma35d1-keypad




