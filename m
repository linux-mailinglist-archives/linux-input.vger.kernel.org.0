Return-Path: <linux-input+bounces-15638-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45953BF8027
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 20:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6D0219A5538
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 18:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C177C34F25A;
	Tue, 21 Oct 2025 18:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYhA2PzR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D2A34F249
	for <linux-input@vger.kernel.org>; Tue, 21 Oct 2025 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069887; cv=none; b=DbjYNTzUIiMAkUNH0prc0XFVMGqKAjlMjLwtF+rjraQfPnMa3SCIqbatkteEvYprWhMDThPfx6EMwGkA+9pEwoHK+MUTX9tHv0Tme/CavWOBJnW3kg+Wid8EjmHV+H/PDllEbLhQrQZv2UJKPNFk7mO/O6W3dGqP89KuX86Hu8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069887; c=relaxed/simple;
	bh=jhCcagVML83e1HP4dBy858O3DExVw2BUwBiMlSzW8y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONNR7qKjFgeTwHb2m0Au2butWxviURachh37SZJ9uAy0Jg6/2GUT95dWXTaIYBzFp263a9XHBzZfqhjGrxDqA2KK/fwV75dvh2MbZbT4uih2UdSze7bGj4ZqyjqIXmDpmuZhin1h+BeJVK4ooDV5/zHl01BkRmCo8pmCcrI7UK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYhA2PzR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2897522a1dfso59244365ad.1
        for <linux-input@vger.kernel.org>; Tue, 21 Oct 2025 11:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761069885; x=1761674685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2QNqcW6c5+Npg9ifV37H2IqLMfiz3SDiycbkwes6nzA=;
        b=LYhA2PzR+Lx/QDrWtxPO56QuwNJn+aLLvSOeHBnK6HFKKGGQXeAvbGQu+QrfKZ2jcn
         gygoxIjflkzoS2PBiLESu4pQQse5rejUTJDjGfSaOjRESiI+mhEmQRPX8I1jjYPPx2fq
         rph8E1mGrkRA9GRgudff7OYkew91qLp/LKTd2GlysSd9cFP25PN5dVQ4Byp33FN/I14C
         mLm16eun2tLASFYIhDlnC9AXewoIEvbj5yT3H4Lszjl8Z+ALkE+B4U1FPkLjtR29vWnx
         B/Xnm2UBDnCn3Pa74rGq05crYIi258g9UemIR9v+HZz0UIdN7opRd+KJHwPEKh10dcqv
         aU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761069885; x=1761674685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QNqcW6c5+Npg9ifV37H2IqLMfiz3SDiycbkwes6nzA=;
        b=gxf4XVnVx+k08R4IKQzj1P8VHt+MM30bAI+A8ZlwpAzo75nthF8PeUnv/jpYvWG158
         DiFX8Mpu/4As8S17UO32rmZiRbBVVIvH0qSQGNGZClW52wG2VVtxmgHkU0ToeqJgSOC8
         zY7QeDeliLKS1zVq3+UDFlDTv+oV1H9KMqhHu4mHnoFcJMAK6eHc1mrrN59rc+KDIaxN
         expMqgz2goW1nqqo1XwFyubc1oYwA6haj3b74hjMGJfHW2vNGN/BfgnFlG1Ct+zh0C63
         myohYLZGp53ll1KhxFDpxZnwnnEj7j7XoGelOw6lTOHng3RVd5jjcooVRVApPtJrgskV
         YDgw==
X-Forwarded-Encrypted: i=1; AJvYcCWtmYrT8zfssJDSgcOGVBNaOmDUnTJ0efWO2zaKrH0+w+85VyUHNiSkespJvsrwD/vZs1cFUSNnsc+/xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpjCDh4HiD0RUNzKTieVNribt1j+pehqT9xWn/SCBXeJBNTVz+
	gvFTPgArMHx/KgoqDcyDgymHr/La/pEK9im764aqgeNwnUWxsV7nDlht
X-Gm-Gg: ASbGncvAEKQI/R6ysKyPrLG8F8C2Hz8AT+rE1B2/c/ytW6ExUVPipKws6FFwVHD44GF
	5eXL9mvvRLdQ+25BCs9JxN6DnrZ5EGv4loK/ft10asUPe4M9JnqQ0tg2PF58oFfR+YHFL0XiUsH
	UP93q34qPlx0/lV+BgcDEdnV31lDMrSldctW/2mRjJQc0ft61i5yub0OmUNNQpCe3naFm6DewXy
	mhpuraQhUvleSBtmwJbm243ybsrWjd0BtcriPY1lPjjfktSdfqv+m4uXycb80T84kV4WeXx3/3P
	4iuFKlzu6/u2SnVFCOvsElNNNQ2CgjIzHdHxnnC5oBDOx2aow6tz3yYhxVthwiDaufdZmy9Djzh
	2bMghyJkDWiCxwuuCX/HWGFRoDcyItU4NNhFXFG0Y2v7nVXyVYpnNdHd4RdK4PG4cAHBcBAT7Se
	ewpPwcfSRVYL0hzp0L74IxeDtO0PFnOWHahVXSprdEu5HZl4rzO38=
X-Google-Smtp-Source: AGHT+IFHxNyo0lIoDCYjMil0Lo93Z0LIGv1u7aWlc4Ygd62ZjbFDY0Z4GIqoMlga/4TZ2FuxfJzz1A==
X-Received: by 2002:a17:902:e549:b0:28e:756c:707e with SMTP id d9443c01a7336-290caf846e1mr241889355ad.33.1761069885196;
        Tue, 21 Oct 2025 11:04:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bf44:8af2:4f63:3654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fcc2bcsm115555635ad.33.2025.10.21.11.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:04:44 -0700 (PDT)
Date: Tue, 21 Oct 2025 11:04:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/2] dt-bindings: touchscreen: rename
 maxim,max11801.yaml to trivial-touch.yaml
Message-ID: <opdzievwmkkos5wyohrl3gydfmllcrw35bhzqa2gfi4kj3573j@ghlb4nndm6id>
References: <20251002164413.1112136-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002164413.1112136-1-Frank.Li@nxp.com>

Hi Frank,

On Thu, Oct 02, 2025 at 12:44:04PM -0400, Frank Li wrote:
> Rename maxim,max11801.yaml to trivial-touch.yaml for simple i2c touch
> controller with one interrupt and common touch properties.
> 
> Add optional reset-gpios and wakeup-source properties.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - add wakeup-source and reset-gpios optional properties

Sorry I already applied v2. Could you please rebase on top of the
linux-next (or my next branch)?

Thanks.

-- 
Dmitry

