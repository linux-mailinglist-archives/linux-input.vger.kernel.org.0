Return-Path: <linux-input+bounces-5661-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A51E956B6E
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 15:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA7BA2816A2
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 13:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12A8165F00;
	Mon, 19 Aug 2024 13:02:14 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B29D1E511;
	Mon, 19 Aug 2024 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724072534; cv=none; b=i0B3snE4fjFIrNtjV/Lx9zQnA/VOqbFdH6UATApiyEGHAGavEKICNjJpwJeMhRU842cVVqhBJWnCtCtBDscKSP9qtN6aSQzC0/czu3PiFWMOPSFVf2IkNFXw9YiNdD/JD2jvU/z7ryMIXk64S9coh2I3HPB1lUw8zL0QvzSxzbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724072534; c=relaxed/simple;
	bh=wlg9MmfmOvXGbW2slVDQsV2THSzWJEKgowAMFKx/f3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLmaTqVx1EjQ/28X3h0bRB2JWN5uB9pzA2GcktrCE61syqkKgRIwODMvrcEVshwzbttQ/aZIodp2kQWssTeYMTuH8DV7CpICnooRKL5zjtttd9D7l1Ag8BYnzKW2eC/JSpC0AtHCF21JA6YdCbpoNkPfFaN0QIaQj3m2UEgUm3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280bca3960so37644925e9.3;
        Mon, 19 Aug 2024 06:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724072531; x=1724677331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTb2zfTIhXKhn6cILgKLUji5CaBH4Ca0a+gBMaag84c=;
        b=BJ7kHMkVm4L4HPZ3eMqmdZFa1+CyThH9qUMp93xDIk41UH7RREinob5NMx2BNV2dZb
         oY9PWc/H4D96rGKzwMfi/dSbupE3IU74+1AedPpPXjgqh6+ysHpIoZy9d1At/1kjF8GG
         ocwiPd2AJehA8nrhHiDoO5247RCENWGoG0xQwdG9cPhEd3FltYSZ9hH3zWLHDv1iXITd
         s7HgmCd2BmQejPFmcoC0Mey1Ud9qGY42ZoEsXGbeJBf/6YBpC1iFr5uKwrlVSmBQlOp/
         phYMJ4JABB88dbQnXOpGPY5XLsWSUPlGLvtIEntSh0JmwZRmy8ncy8ZDDsZazENz6iQ1
         M1Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUWKNvT4jMf/ugEqBKgvHj5b+rwcblrFU7U7vfGh+zUPWJBP3pgNu9q4dpDpf1dvVC2KURGqx/2Gy8Ge8JvNRZCUcBE1jJVU8rs7iuzSC78u/99lKPAhpec2b5Mi3Kqml5pn5QBjoW606Ajo4UpE7g5JvOVHGcjMoMZ1LZAAufPcf6koHLuxce1GWZjXg8GQfGX2ThCizEV4VeAeHjGmG70ljkSQpk7f60=
X-Gm-Message-State: AOJu0YxnUPp8FV9MpEFMZl3mEmaKimcbda1vNRguV2c6OfstmgoPwbUV
	UrKIfk7QsGs90Sfb+lpKyVXVHBn8PetqA90kaCOL1J4f3AwO1ZVm
X-Google-Smtp-Source: AGHT+IGe7qKWLoE+lF+obZj/DNDDMIKCZepnyVorYkHN/7Ge5gfG0iuJGJsy1DBEhqaA7wqaC2s5HA==
X-Received: by 2002:a05:600c:1549:b0:427:d8fd:42a9 with SMTP id 5b1f17b1804b1-429ed7b8a77mr78706145e9.22.1724072531165;
        Mon, 19 Aug 2024 06:02:11 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed650e41sm108443555e9.19.2024.08.19.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 06:02:10 -0700 (PDT)
Date: Mon, 19 Aug 2024 15:02:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 09/14] dt-bindings: input: samsung,s3c6410-keypad:
 introduce compact binding
Message-ID: <dbs44pwxfhsnmdzsd32mp7rlhq6w5fanu5bakuisxmyz2ehbtd@cdfr26oicjll>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-10-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819045813.2154642-10-dmitry.torokhov@gmail.com>

On Sun, Aug 18, 2024 at 09:58:06PM -0700, Dmitry Torokhov wrote:
> The binding with a sub-node per each key is very verbose and is hard to
> use with static device properties. Allow standard matrix keymap binding
> in addition to the verbose one.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  .../input/samsung,s3c6410-keypad.yaml         | 57 ++++++++++++++++++-
>  1 file changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
> index a53569aa0ee7..28a318a0ff7e 100644
> --- a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
> @@ -16,6 +16,10 @@ description:
>  maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
>  
> +allOf:
> +  - $ref: input.yaml#
> +  - $ref: matrix-keymap.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -37,6 +41,10 @@ properties:
>  
>    wakeup-source: true
>  
> +  keypad,num-columns: true
> +  keypad,num-rows: true
> +  linux,keymap: true
> +
>    linux,input-no-autorepeat:
>      type: boolean
>      description:
> @@ -81,12 +89,33 @@ patternProperties:
>        - keypad,row
>        - linux,code
>  
> +dependencies:
> +  linux,keymap:
> +    required:

Why "required" keyword? The dependencies should have just list of
properties. See example-schema.

> +      - keypad,num-columns
> +      - keypad,num-rows
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
> -  - samsung,keypad-num-columns
> -  - samsung,keypad-num-rows
> +
> +if:

put allOf: here and this within allOf, so you the "if" could grow in the
future.

Best regards,
Krzysztof


