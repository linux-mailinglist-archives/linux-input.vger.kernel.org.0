Return-Path: <linux-input+bounces-14685-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F8CB56410
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 02:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCA04200F97
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 00:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2781D63C2;
	Sun, 14 Sep 2025 00:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctM31zlA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46F21D618A
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 00:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757811365; cv=none; b=AIEDjycmRm+SdSznZQX+TGeVKoacBSu4PBWo4OeKDF5y7qCmxTGGu4wmjLOX6CppHBXZjPTsndZDtfG7D/LD80/Rnwv8UxiIoB+BTT4yiXs0vOugxWup0G3R+XOlUcUoNtwHF2zCUgeF3L2YYF4OYko1TeI3ZRPLFzYTN83WEys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757811365; c=relaxed/simple;
	bh=sQOJHGjft/KlAachSJp5PgYvmPdmVPqHui94Gg1UBoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C28lxbQabE+rD7uXAI1akb6+QvnfPPpkCz2Fz8vSzMs79Pf5Z3/YNjyjj9k2KewjQbTlTJ+1wzppJwwP00I21BnlrbsGIwWrHQJJfITesXSzbXAP1geuBGjlof4/41yWmaiem8l3t6jV8cQdoaKo04xrRxmWZh/3JxVNqQBlHNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctM31zlA; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7724df82cabso3216037b3a.2
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 17:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757811363; x=1758416163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skpuijfI1kkYoq0fGNxEYqoTv07yh5MDibZzRDosEU0=;
        b=ctM31zlAJgmZAvZaHDja4opKBsk24alrTSWleT2DkpR1+ck0Ere+/+4zj5HC5qDp8O
         j27AuoiFPt1U7dde3jaRkP9zsm0z8oqO+AC3nUiux8RnqkRsZHFPm+PVDpfXpPe/Aolq
         nex38d/by8BixmB84bPYI2kE6ytSmDI/5KcnXx7ymD7FugrkINz2mqwx542gM0Ge3mCz
         0TD6NMd1jgHnEyNmfh+MW8bvA6BZHifvRu79HCOpWPcaZcIk2kDTJGmGYSjjLHu1StCw
         Gdnz0RsBHZKnGyGcGnDd3g08ObmJ41+QDA80oRQzI58rk6DsBwQUXDYruzfErRcP7WlJ
         cCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757811363; x=1758416163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skpuijfI1kkYoq0fGNxEYqoTv07yh5MDibZzRDosEU0=;
        b=dzNp5C91WlUKzUOKOmhwOA7jsgf16HZVlC3Csses7PkO8131cnm3+73SzOk+i6KtI0
         N5cpVkPFQwVuZYkrQbW49gLjZ0p7IZh9PM5Qt0l3wImAhDU2qLrOqoUzplctCbg9INal
         hwhYLzMFjJz/Y/2aU1I0+iD8qX+3zwqpNkbyL7b429i84eD9u974N8J1kILClrMy5mJD
         qVpr+E5CBCZzsiEFqJSUeAQtPSxNm2O/gbrLd0kcQ+AzeZyo1uEX1WT4ARn5uKxCH6RJ
         cplmIZkHMUaFmz8Gy9aWDdfEX4lXwoH0N3olb9RbvhSO17wRDedQCo4FOkZ9T+i/qxsM
         M+AA==
X-Gm-Message-State: AOJu0YxrjKks5D1ZdVRFx65quBVCBhdjPVbUIDDZPYg9k3lHk+jCfXb7
	w78v20mW+2CJ5D8it9Srdstiwvkgqpl3VbeK9xwgMrTPHFq/HZ4VEQ0Y
X-Gm-Gg: ASbGncufUdfJog8tpBDwBLC+CAsSWJY0oPMKKm/3NDrkJIRdbZIghzsLpUVnNOV4ur0
	JYb8tedOPuQ6lPJmicnr2KR/9oh1rLH1CfXy6B6IkhL2OHYAqi/qRpQGnn9BcelzisoO1RGb+4j
	IHPJzvfKZMfoakOsJsULNiFM/FkMs88lEzd2nALiw9yvaDBvnFLJZf3MauIgyXuovlvobhdZlve
	fOzcgcJrcDAw4n0bVn8aDlyoHxGpQpm50GMHYFdLBfEcKR6OLq2qRrct5tm4ZtuG/qqA9uYk9J3
	f/oRTZd8Fl0Cbm01LP9xWwN+GEM6DEdQQr6COal/osQTvKBt4Coax4onQ1/3k7JuDaYl7HGT00h
	XksNcDA+fwRB/fHo53dHzUA==
X-Google-Smtp-Source: AGHT+IG/MC0BNxR5psJcDVkiLJEWDgoRGy0p00LDxT4S1aXwdHypEa5Hz3n6uMlecE7b+WI3VYn9ig==
X-Received: by 2002:a05:6a00:8d4:b0:76b:fd9d:8524 with SMTP id d2e1a72fcca58-77612077d7bmr8482487b3a.2.1757811362986;
        Sat, 13 Sep 2025 17:56:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b18400sm9348698b3a.59.2025.09.13.17.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 17:56:02 -0700 (PDT)
Date: Sat, 13 Sep 2025 17:55:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Input: Drop melfas-mip4 section
Message-ID: <zhbhtoofltmrdxpgrqz5x7ferxoqsewq3bvrqn3pvlanau3bnf@g6qg2vrz75tz>
References: <20250910142526.105286-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910142526.105286-2-krzysztof.kozlowski@linaro.org>

On Wed, Sep 10, 2025 at 04:25:27PM +0200, Krzysztof Kozlowski wrote:
> Emails to the sole melfas-mip4 driver maintainer bounce:
> 
>   550 <jeesw@melfas.com> No such user here (connected from melfas.com)
> 
> so clearly this is not a supported driver anymore.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry

