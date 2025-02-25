Return-Path: <linux-input+bounces-10324-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 541D8A43573
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC331666F4
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC602566D1;
	Tue, 25 Feb 2025 06:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoJrXeJx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752021C860F;
	Tue, 25 Feb 2025 06:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740465480; cv=none; b=Hp7TVkCuvRKApd6TAM+VuKFzBbUFubYrdH2AAxCXx/TVsvQu2fC6rFmtmXqeq2Z7hAAJWF9FICDvsUK+gnrGYnw+z74rXF3HsGUvSoI2MQ8sUbhEOWpr27vEqFkp1eto7bRq+zdQVb2j43SZP0Ym9t3UQlxatb5otOkENOuA4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740465480; c=relaxed/simple;
	bh=7qVvZMSXjkvHN/DZpiXwIXDx2q7nGWyA+wRR0d0itBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3jOGLSai4hSE/nhmeLSWVZvo28GV6d8Inzs1HvZEzhbe4FVhZq0cl/u1FOvc0buG70LjJVpcBWzWx2kCYG64qGLthOIXJqjjEdLdeCWC48NCcs87LbBEUi3QBTdYJDtvdY1DJ2wnTBEoc7d6vQfbP/cqCNvNN6Wxoq+I/87Zt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoJrXeJx; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so8429032a91.2;
        Mon, 24 Feb 2025 22:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740465479; x=1741070279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=76ILTlfnlB6kCOD5q4hGLEZcImYGqMx/cm4TThbrhfE=;
        b=MoJrXeJxzC0CVyp0IOTwKnqps2H39pb7Afy0+/gCF52h+k7Br2oHnBt/1PYQH4Xtnt
         aUN7iiUOHcPbseeFuYqvN3oywvlmCyhkyT+gxGmGTEAZuG7sWCJq8e1DLV3zi5H5G03O
         avMnC2JLeG8Eie437o03sWFUE2i5NbhCWqOO8E0zg3vV20R6dNs4QdyNPLi14z6ZIPwf
         SlL/4ztccCYqx+Ax2nM9M15aCnJpyMWu0c+nG8tXI/JQfYvRdlioY/bN5znbS+1x20h6
         HhPZ88h+2+lBgRhCe66KFzaGYzAy38DQVDP5iZNnZLrZjW1V1RzB+tAXwxS3/bBXMoVF
         e2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740465479; x=1741070279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76ILTlfnlB6kCOD5q4hGLEZcImYGqMx/cm4TThbrhfE=;
        b=uOvSaJmDdJgSqHTD0qgTxUGzs/AFL6/tKOVfF9DgXXQWYLDIxfn6y6u/PNkdVrN9R5
         O6nk6CIaA+3K1Lad17KCCn9s2OdfjNjanbL87SG3rl4AEnvpPZPv8I6Onni4r4DXs38m
         OxVDL9UaaadJjQbtoKw8S58UF0yzCtuuxSeao1jtpWcq2tU5go4y5MAlPeSv3Obe0AhK
         OuHvAtXeEmStWD4jPmaXTQeU++Xd1yIdHZ87j90cw7hVyaSefZPuR3f0V5BcjYocr7K3
         T+4rxFeWPAHRH8eq+XTavWvXvuWtKjZa/BKcXQMVkGtRfaJiJRUBGDd1MwtgfkmjJwFB
         dNPw==
X-Forwarded-Encrypted: i=1; AJvYcCVh9k++QjDVOOxXeAH3bok/t7ZTIv4HI8WX7aHNI+KM8bWq5wIpWhuSGKOXUaHSpdYQ7glTOLuHyEDHTgU=@vger.kernel.org, AJvYcCVi4O3ZQrgYGUOxxI37TjDyouzYnUyArH6Fp3L6B78VFPyAp8tJi4aEn+kxew/ESoOgj7rpEXkNIM1DP/Fv/g==@vger.kernel.org, AJvYcCX7HFt7QgAPQ+0lGcP7iJRWjch2AAxj0qJanphYpXA00377/Jb4K3ykb4u6Yjs5z8qsnDDPy0+/ny00@vger.kernel.org, AJvYcCXEpkcFauhEbGDNg9TWq0+C/sOq8SyHYUJESJf7oSIIfSYKWzouliY4h4O7gdRhDSN3whNcn/cFwnfH0WSW@vger.kernel.org
X-Gm-Message-State: AOJu0YyKhj//QDO63vfOmg+4krm1yszDxXSPoMy5iMpAcoPQ2Jmgl+U4
	Ku7nSyWYkgvbRSYWPDwn3rWm1RkEdf1xV8l3A0IuQ5SWxrkSlrYOERhTyw==
X-Gm-Gg: ASbGncsVcXH5LqEETHgJvtd1E4LYq3Xs1NUY8VbnKwmf9qwe63XCK03STBf+PY8DM1R
	w3C1PT2qWl1X0ewGLqGwcWDcxLQ7y5bWU/MKJsaKkSbLx1eTgZUI9DPfpIZfjSpRltPnytC5L3v
	zuNUZoslnK7qBXNPxg/nT9BA5hEvPWlhGLOu041iiaElva+vpMXfLuFxM9q82XIgG2edv51j8mx
	Rs1xVMEzb0BUyp9gxr3pxVizyWL+q/LEqjO+690R3IRwrvsrnk1Fizxyf93y2kEiYmgRXa2vyaB
	B5ObvjLmDAb1m8hSVBQvE2MH/+g=
X-Google-Smtp-Source: AGHT+IEZjAqeXMVte6OODUKt9bwKyvO0mGYOvzQMby3ME2hZsTSKm+0hYtRb78bfbj/5KUl1eNfYMA==
X-Received: by 2002:a17:90b:4d12:b0:2ee:a76a:830 with SMTP id 98e67ed59e1d1-2fe68cf3ff4mr3709890a91.24.1740465478641;
        Mon, 24 Feb 2025 22:37:58 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6a3f21b7sm744181a91.27.2025.02.24.22.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:37:58 -0800 (PST)
Date: Mon, 24 Feb 2025 22:37:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>, linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Correct indentation and style in DTS
 example
Message-ID: <Z71lQ4DJJ82Y2Cjs@google.com>
References: <20250107125844.226466-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107125844.226466-1-krzysztof.kozlowski@linaro.org>

On Tue, Jan 07, 2025 at 01:58:43PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thank you.

-- 
Dmitry

