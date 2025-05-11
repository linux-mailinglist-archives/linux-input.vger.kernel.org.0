Return-Path: <linux-input+bounces-12262-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F863AB26CC
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 07:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19F113B57A3
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 05:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FCB129E6E;
	Sun, 11 May 2025 05:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIiAhsPJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A58288CC
	for <linux-input@vger.kernel.org>; Sun, 11 May 2025 05:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746941947; cv=none; b=X3yqVwHKyAMJCQGSvcP9+2eYE6spqozpKSIY4I49k4y1Syd5/L1fflGGensGHGQgpC+hVTbeEYLjtwgIHRPJ7eRB8i2AlMUMP9cSL7NMr1ZnD2uKiiig9Q4RbYwTJnbn2VTG3wkgFffV1qSeKfPUWSXXrBUsIWgrAkxGxioCQDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746941947; c=relaxed/simple;
	bh=d/oBfnk9iHSNOAImfJ0ExL9zFrq4wQibMCOW7oYTl78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvMDXa6EzRnl97mYQPTF+9+BBMMkMciPicM5anKCX8dq/QZk+bfAHxyOX9Ir/GfAIpuKwWmMttParNGaw4LMJqin6/cZJ72HNe93OMfo1ri+8IfIp7bLN9HAWCtQx818otBrY05aXGnhnVuKK55iAjbuO/N/NlJrgGg6TYgNyXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIiAhsPJ; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af523f4511fso2837444a12.0
        for <linux-input@vger.kernel.org>; Sat, 10 May 2025 22:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746941945; x=1747546745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y8P1fLrMIC1OjKOh15FFXe3sVPAPS9hvKlSZEoQoUks=;
        b=IIiAhsPJn/8OjjI+hykFS9jNGW3KbZ1P47hCFp+zHVGFDZhvjxrO4WpJ1ushCee7Ur
         NyjIcGfU5k1ztq04EN1npaen0tVAqP44pLu86LlQB3islerf8AntB9m0xmHQrWG9ALQr
         aXlfJjsoFJPMt6gFYBFLrlaQKyUDDgytNSMkbAoA/ETWNC/Mm2T6jSO6DG3D3V4kHc2x
         4S1cPXtv5Yu9PPqr6a17zbw9NSYzHupqWdo8aLu98kiUYuqKV0s0xiSrUgYydO9Fq9op
         4NTRk6MJYPGt0+pwtviCCqAlomjt2F8P745z2EkAp7hkYibQp8pe3LkcCI37ZMAIdQtr
         +ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746941945; x=1747546745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8P1fLrMIC1OjKOh15FFXe3sVPAPS9hvKlSZEoQoUks=;
        b=Yg/+7bGKqjRfWr85hRn17zjVdxhoGhvdyuu8D27mgh5E1j1e9oI8A4PoVilaT+2+J0
         IT+sIIUqK6/sqbcuyoaZSyH68g3A4hySMzt+gXKmonUkQZF7Do53a3jiKcxVVSSZL4AE
         w7SGzyaDoqkwToPPqlCdaS1KCvVSk1yvryCera8f9GDudDpOlgoYqrWoa0KzD1H2tWO2
         cErfvvvxy1QNn6mLhZ6HXX0A443cCT/awiQeH1cyfL8jWj5aRydCY9eKNfWbOsJwTMOP
         b9/fv4lR76GZwEsulvc6ExdvXj0zT2OT4LCorql+w3UT/FtQFKnnCPaCRrUVa7xYmB3q
         UC9Q==
X-Gm-Message-State: AOJu0YwbFMD05sd/Ha/FjQxlRbe3PWFr7D0Yoqw5C5wzaF8nKgLw7cGn
	4J2un/Z+71K4GJhEp7CpCXMyBMC3truxJuPKuQHVXlmPbrrfDFg+wwlmbg==
X-Gm-Gg: ASbGnctRYj6uvhHWZ8gu0XdoOL0fyButfuSOt+Gs6SqhnEYc1Np0c2CccUn81RT5t+a
	ibYEWd3y9ZWMjhy4GOty1LNiiS0VdIdfuieuxPoqyptHFucMF1k0cDvan/XHzsTroG/rMlrpIFi
	91+kuXChjUIVtp2U4PlZg0lPhWU7hbo48MlVVzK+0UAoIk3NMYUlulSE7wgDrH0lZZ3iiKE2q2G
	oYoHZP1l6cTFOBUWqhfhwduuYCf9IqympiGYRNH7at+v/1npF1DGLg4qdEnoimFQjMYCup2KwD9
	2Qj4Y33eUttYl6uMnvyTbjWLUaxQ1RraGSle6IXGXdmByMmKaJDr
X-Google-Smtp-Source: AGHT+IEPfYIG9VQH3XVINYABUDcuMQAVgaER/qTGw58J19LLFiOO8DWiAsNjh8CKIqlkLNq/4SwNDg==
X-Received: by 2002:a05:6a21:3946:b0:1f5:9098:e448 with SMTP id adf61e73a8af0-215abb547c3mr12561161637.5.1746941944802;
        Sat, 10 May 2025 22:39:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81cd:844c:3bd7:4808])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2351b7a87dsm3144156a12.70.2025.05.10.22.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 22:39:04 -0700 (PDT)
Date: Sat, 10 May 2025 22:39:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH 5/5] Input: xpad - Fix xpad_device sorting
Message-ID: <3nuvqlkitlldfc2uyb52evbhsvreipph53372mncwohklb6poy@oxrfcvjqwmk3>
References: <20250328234345.989761-1-vi@endrift.com>
 <20250328234345.989761-5-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328234345.989761-5-vi@endrift.com>

On Fri, Mar 28, 2025 at 04:43:40PM -0700, Vicki Pfau wrote:
> A recent commit put one entry in the wrong place. This just moves it to the
> right place.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry

