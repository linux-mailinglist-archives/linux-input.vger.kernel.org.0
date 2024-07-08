Return-Path: <linux-input+bounces-4903-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B2692A7D6
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 19:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 448231F21A18
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 17:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C611474AB;
	Mon,  8 Jul 2024 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/unPdKq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AA378C73;
	Mon,  8 Jul 2024 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720458505; cv=none; b=ILgre8i0lPx4geBV2uAnwLVUPUOstVTm93057ciF6NVMM6S91oOS8u2Qh2DWrSbss/DN0aO0KhIsmvKQ1OJt9qDReYSAVONZcCwKLLGZ6PIeW8hZoPNDtOrb1FP4GtLTgaceUSD7tFWgbzNRcWTlrmy4cnSNtfiPxQq5aZJApUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720458505; c=relaxed/simple;
	bh=BqTgLx+0wRcTK/3ZMMN47PaeHKnWPpAqUgTXj7Nuc90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1Sge4j5AEqaaym1p1HIsWMQbVJST86BM4tyS1ktkjyqmDFNTt88QXOKiHQUEr5B6SzLEywI4X0pQ6itrK3559RkjyMS3atw1tgVRcB7kPEbAB/1WyJh42OXj2kFs4Yar6J13hNbpZSCXyXBjxj7JdWbNRJmCbS0HpL7EHsgvc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/unPdKq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70af8062039so2516029b3a.0;
        Mon, 08 Jul 2024 10:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720458503; x=1721063303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+xCwo0Qll+B7YIHIpiMJLZUhkmJAp1xH4lUbp6PMrE=;
        b=E/unPdKqBGNx8xTiL5f15VmUhfUysxFM8UK4ajlSLoRScKO9QTwvCgLQOZYqDWlj8A
         XewCBZYB3wDo+ukjS+wA9Qby50VgW1UJ8Ija+mCA6uT5gVg46VtbjdAmeHEAypM4VW1s
         tbrVP2bB3dUoyjarQDA/unGfpYFQDQRmVsQhqEDJvVDiEERiZpb2tC5QhOIkeggLIgIc
         Q7fFSqf45jak8Xh1oAvvWy014A30zvJ/8Brjs9OjRA0aYkmNgFKh/nvnKcEWBUFbeKhD
         dkeHZx72qy1AfwuBlOSM25c31AWETsLQcGEUd+0rNlYmb7RNqhd22Nu5hA5OOJtyugzJ
         F9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720458503; x=1721063303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+xCwo0Qll+B7YIHIpiMJLZUhkmJAp1xH4lUbp6PMrE=;
        b=aTDkTFinvDEVHDK4hUIxLoe+CgSMbTS+2XUysoxQquvp8ORn9FRqcACe9lDM8kWdA/
         oI5OEl1b4QKKNPVAMhg11kwGfauLsqXyKqofFqBcLYrWVRK0HouRFCNF9TOCxc4cmfU/
         8Pzw1IOqTAiUeNEoKt+FbvJk97QvkSD6TWCfxe/u9Akb9AWZMVWiIOzxj8xdi9hV/TNX
         uU04cD+WPyLWwQYTez5KH0mbBKCbEkT/Mn25MT8gPVBjaAboHTjESIzUlQqhHamOiYdc
         Zx9DmEF0WWHwwlt4tkVPCL27fMiyC2nIlsR+v7+4919C5H0/0e7s5CLiXcBN1dYiQjNH
         uthQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvk8fUPNpXu+lqJI6jGliBRmi10buK7LZKsgdomhQ95C+WzeTIvdJ3SUaa3BvFeySUxD3BOrPtQUCviacAZT+iN+BCkEbfgK9A52QUfYm1mzA/QjHYxCRGD/kgy0nbxqBLpIzGaaxBwhUd9Ev+t4b2ZsmeQsHcBLSbtca0mdyM9V2vyCG4
X-Gm-Message-State: AOJu0Yzb9osVcv07CJR8jRNCKoKVu1+qoC9RvV2jyOPjBWaJauzr6X+f
	wYi5CxLSZUjtrBBK4QzowNW+Kk9XHg6DF7/OL6AnNVtn2dWlWR0HQZMmEw==
X-Google-Smtp-Source: AGHT+IG8qhGDhkqEpLeGA+8Lo44gyRZPNrfK68aS83rLNSUglQ0AfX4k1FsXSCL9weU/AY3jlMhoOA==
X-Received: by 2002:a05:6a20:918c:b0:1c2:8904:14c2 with SMTP id adf61e73a8af0-1c29824364dmr12068637.37.1720458503494;
        Mon, 08 Jul 2024 10:08:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d2a4:59f0:2144:2c00])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a950c37sm8440917a91.13.2024.07.08.10.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 10:08:23 -0700 (PDT)
Date: Mon, 8 Jul 2024 10:08:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Davis <afd@ti.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: ti,nspire-keypad: convert to YAML
 format
Message-ID: <ZowdBObFaYMEASR5@google.com>
References: <20240612150711.26706-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612150711.26706-1-afd@ti.com>

On Wed, Jun 12, 2024 at 10:07:11AM -0500, Andrew Davis wrote:
> Convert TI-NSPIRE Keypad controller bindings to DT schema.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Applied, thank you.

-- 
Dmitry

