Return-Path: <linux-input+bounces-13154-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F68AEC3B0
	for <lists+linux-input@lfdr.de>; Sat, 28 Jun 2025 03:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D6CE5644CE
	for <lists+linux-input@lfdr.de>; Sat, 28 Jun 2025 01:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B5F43ABC;
	Sat, 28 Jun 2025 01:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="lwMs/H8Y";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="lwMs/H8Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB882F1FF1;
	Sat, 28 Jun 2025 01:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751072466; cv=none; b=f8/fZ7rsswuwjNGPkSdWKSFrhC0srDIJDX1Tkwihnza0sFpVmTiifm9W5gWcyiWYnPold7Dt+PFQOI77q00wcNupAFi4uIkc8zOtf/FtUQM8UfpJaSNkjRjwNCNqorGHHRqRnnH9G3nPHT5kfzRyISFWey0fB6UmD8hPGrUNblA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751072466; c=relaxed/simple;
	bh=gcBkyhi3zYGXarPBn7yBaq1CjaIcyEkwlZd3FoDqsn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9iojvsyxIGEiSOAujSdSbcppvV/GTGG3mcyBMvp8OrQfVL4doMz/oAlUxdd1KR8sUvNTtIT/ZjP9vMGi3KtM8PbNVv/L8isAlTuLn7h/RY0+hnU9ZfaifHo7zCJZd96JLdezpJhByJsjCEynBh6Nm0df5oS5+3lRHO9Iqgki68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=lwMs/H8Y; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=lwMs/H8Y; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072462; bh=gcBkyhi3zYGXarPBn7yBaq1CjaIcyEkwlZd3FoDqsn4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lwMs/H8YH9a4VltY5rQ/Etn2tDX9d1srdnIGAwoM90Jh6LXhXLgkTchBb8J5xyG86
	 Tdp8ja1zq6xLNIohp+JO1ZVztnVH8CxYvtnS/6QR6BZXULYmw6V7/cNeRYlxqnZs8p
	 CdBRsKTUMloY5beHui1ARoRpt2GmeZh4znnIbIupTzGQOYW77XEzqdAFJzq0rN1L3u
	 BWc4R8a+5RokDjkJRy9Jchtg1pr2TWiA2uDw3rV2wbK6EQCYMLTNZbewBlLEGY4TkV
	 qrExMdTcLz4C2xVtq8Hc5JCr0lwVtBMuBwB0cLtvuUy5l+7WdTxloo11duOPXigC/N
	 qo83zI9cXl57g==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id DC09F3C4FE4;
	Sat, 28 Jun 2025 01:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072462; bh=gcBkyhi3zYGXarPBn7yBaq1CjaIcyEkwlZd3FoDqsn4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lwMs/H8YH9a4VltY5rQ/Etn2tDX9d1srdnIGAwoM90Jh6LXhXLgkTchBb8J5xyG86
	 Tdp8ja1zq6xLNIohp+JO1ZVztnVH8CxYvtnS/6QR6BZXULYmw6V7/cNeRYlxqnZs8p
	 CdBRsKTUMloY5beHui1ARoRpt2GmeZh4znnIbIupTzGQOYW77XEzqdAFJzq0rN1L3u
	 BWc4R8a+5RokDjkJRy9Jchtg1pr2TWiA2uDw3rV2wbK6EQCYMLTNZbewBlLEGY4TkV
	 qrExMdTcLz4C2xVtq8Hc5JCr0lwVtBMuBwB0cLtvuUy5l+7WdTxloo11duOPXigC/N
	 qo83zI9cXl57g==
Message-ID: <01f8dcff-c614-4da9-8546-e3bb0e4cef61@mleia.com>
Date: Sat, 28 Jun 2025 04:01:01 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
 lpc32xx-tsc.txt to yaml format
To: Frank Li <Frank.Li@nxp.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250625163431.2543597-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250625163431.2543597-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250628_010102_919351_A3DD3FC9 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message. 

On 6/25/25 19:34, Frank Li wrote:
> Convert lpc32xx-tsc.txt to yaml format.
> 
> Additional changes:
> - add clocks and put it into required list to match existed lpc32xx.dtsi.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

<snip>

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/lpc32xx-clock.h>
> +
> +    touchscreen@40048000 {
> +        compatible = "nxp,lpc3220-tsc";
> +        reg = <0x40048000 0x1000>;
> +        interrupt-parent = <&mic>;
> +        interrupts = <39 0>;

interrupt-parent = <&sic1>;
interrupts = <7 4>;

> +        clocks = <&clk LPC32XX_CLK_ADC>;
> +    };

With this minor asked correction, feel free to add my

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

