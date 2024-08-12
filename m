Return-Path: <linux-input+bounces-5522-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD3094F53B
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 18:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66201282140
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 16:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6BA188CD5;
	Mon, 12 Aug 2024 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhNdYLxy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5717B18800F;
	Mon, 12 Aug 2024 16:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723481327; cv=none; b=UkMV8aAL3zRLgLZb2t5Wsgu73L2pM3eGJ5Arqbei65DD7e7aDqxaIrWfvheYz2tU0snC6IqXxM1pnaM1OVent/bOGFES4x+YkBsKT/a8JfwrhSenU5kScPS+UeJgcmHxD3iEbslXxvyekMO1c7N1m68XBj9tHbs8H8VNyoHY7qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723481327; c=relaxed/simple;
	bh=XlaiAMQh1V6IadrgEMbgyeLhJ3AoIR6vUvuyik168Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keuL6UCfJK6/UcYlAkx6yBWn9xeZ5jfjmuDe3Cz/7LtEoe2Bi1/vc4k4lUYKEaloA32fzROSupqj5VKDlWd51uYBzx7FDPAiuBBSXqntqe6LZwP5C5rOd/4flzwPa/X14ltLk7lwVqeMDKHs9FfHIfMGhEJhPVVsVQnj766QlYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhNdYLxy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fd6ed7688cso39185535ad.3;
        Mon, 12 Aug 2024 09:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723481326; x=1724086126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpMVxN3h+wXRgJtl6Puat78aXyyI7hCBpes+Mit4XIQ=;
        b=dhNdYLxyxePKerR03jMHVOzAd5FeudD9npsvmSuYvHTL4Y9ciWZKI2H7DhpnETIz1h
         3KONYZtoxmF9/swekkqJn08cNIuYdFYStbJk6ioTIEtIiO2u/BsCkDVuFzQxgphJawoj
         Hl6AI371GsJOT2acZOzU4VdTRr+ol7x+59gnjsJp4gAhLl+wEKBKPaLiRgxk7jenhbXV
         AELFbv8Eb5tfdxzVqRWnSI+CXeBgZL9dz719XeH6q3hHl4ude/M7/i5VUrEefJ+AeYr5
         ui7gXpgf9ipdLvxPBEx6yNGGTr7kdBb4ZXs3Cl4MdDTHQaQ2ueC4QJDrt0g7MM6iWJcq
         sT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723481326; x=1724086126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpMVxN3h+wXRgJtl6Puat78aXyyI7hCBpes+Mit4XIQ=;
        b=GMaVkgnk76xbqs7R0uBxTSi33xeMjBVNDqMyyp3YaKMxiLIVNmsJtCAwf/v+J8ql4V
         owOjuOERzuJjnZ8roMN2zH9xlWSLwvSj5h/T2hSqdIY1cABZXfnE91ctcNtR73a6TFb2
         skLhPt+LUjdPPvaL9Br9V8KHFPQ6tQAu+L9SRfcKYbC2eT8A+jgYGRrFNFXuh3q7V4Ov
         yeaL+d9b6VcPiasPV2YRqUktVtvsnEgGNMV7BYYpGLVxJOmPGYyiLtgrIv2yHXqHuCHl
         PyLgj9/7dK4BNqi4BrSqg/MwDyOuuBR0zskSaFCs2Pp655drMCr+Xje9d2g4CnsgJAlB
         5q8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRJ2MH5bOGYBnxHftyRvgUxZMfV9rasxF0uXe8r47fP24VazbJHS3J8Lt3txMwAmjjH34xf6DxfbLlgSv0@vger.kernel.org, AJvYcCW4Ayop5JYk5s5XF9Hap5P10Cd2asr+f3cnTIjIWJF4L39P0orKwWLqEW7cor0XawaeCeF6kVldFOfr2H4=@vger.kernel.org, AJvYcCX9OcWx5p5prgG9ZLWgrqm0MUlzpky4gQqfS4xLMSdUXoxwfvCFTUD2FmmOENPqCa4qktMqqXUC43DO@vger.kernel.org
X-Gm-Message-State: AOJu0YwwFsZO77l+ElPKN3Qg9fF8Mx0hLzKaldRawfLdPiLobYwYQuPA
	DbF+RayQs5rCRtwsEcv/8GOGu2HCsWt7s012EkP+Agw/PUDV8XjU
X-Google-Smtp-Source: AGHT+IHdDf7SW+xokXQj9UeB5NGIK7iiYD2rn/ORwOD8E5Ll4AimeY8xbAADkg0XqSxW4hNHVgstXQ==
X-Received: by 2002:a17:902:e74f:b0:1f4:620b:6a27 with SMTP id d9443c01a7336-201ca120464mr12826775ad.13.1723481325443;
        Mon, 12 Aug 2024 09:48:45 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:53c5:10b0:cfab:3972])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb7eeeafsm40051455ad.26.2024.08.12.09.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 09:48:45 -0700 (PDT)
Date: Mon, 12 Aug 2024 09:48:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert ad7879
 to yaml format
Message-ID: <Zro86hWQVyaOAQKf@google.com>
References: <20240810143840.3615450-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240810143840.3615450-1-Frank.Li@nxp.com>

On Sat, Aug 10, 2024 at 10:38:34AM -0400, Frank Li wrote:
> Convert binding doc ad7879.txt to yaml format.
> Additional change:
> - Add ref to /schemas/spi/spi-peripheral-props.yaml
> - Add #gpio-cell
> - Remove  spi-cpol and spi-cpha in example, the place hold 'spi' can't
> correct detect spi-controler.yaml. So these two properties can't
> be recongnized.
> 
> Fix warning:
> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb:
> /bus@5a000000/i2c@5a800000/touchscreen@2c: failed to match any schema with compatible: ['adi,ad7879-1']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

