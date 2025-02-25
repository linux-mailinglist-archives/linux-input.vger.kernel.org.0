Return-Path: <linux-input+bounces-10325-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A0A43589
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 309D3189A458
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E415D256C80;
	Tue, 25 Feb 2025 06:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDWMu4N3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678A33D984;
	Tue, 25 Feb 2025 06:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740465660; cv=none; b=kg4WQwO497k7iafjye4rFzXuwYYQmcvRTeoHSc0dqe6ioUZgJNqthCf2SEopl+xigR2Pz6UUd7Dqh8/e7bpQx8hJg7ARHv8/AS3MI/R97WCgpnYUW98baaM/jU4+HPDGwXj/1xcrEZs4nDFfmhs2qMsnudIhFqp7zGgeji6aWqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740465660; c=relaxed/simple;
	bh=bP75iQdWMfulJf6yXOUhCLzS3q7ljtZNdMT5g3yO9kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgdGnJabGUQ6h1HgqVkknIkLkGZUY0LGo8eUu+Tq3Q60WfojnvBhvY7fISPxZXmo32Jdm3tghcuaOxB6mxFe2wodYAo0nYBFVFntL1LJtv/FrjtN/ZcDn8ZQLUcN3mShQPs9gx/FhoV99uurSAc1JL1XRytrNDRZ2o3YxPpzQOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDWMu4N3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220ecbdb4c2so29921575ad.3;
        Mon, 24 Feb 2025 22:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740465658; x=1741070458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2P/2v/Klk6zqg9pFD4grzPc6MwHkHIHVcHBwEQXLhQ=;
        b=gDWMu4N3YcRxW4gEaGEwMPtkGKoJ0NOednBiXiSxtM6IlMZxTV5QRLegaPtvkZSWTR
         UOuui23gHDP0g41JC+8m33SGaQaYwpJ1r8VhHZocoaAAedm3Zx8i/qp8dMi+Ke3dmoGb
         r//KkVusF2dBkkJAcYfW71iU4LxdhcIVdGTe7CtuKNUyJAwAD+rv0h/vvVYFeDvwvD5Z
         J33P9jTzqwEYifSQ0fFt+WFHjWCwhoRN/EzBcER68Fa972z4hyseWbskmXyGkawjuDzJ
         s64xhpjGIIJ9vPc9ZkHHMJntSwADtMJCAGmrrtVUkvKd2P4groferjQrYPieNsUM7n9G
         RpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740465658; x=1741070458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2P/2v/Klk6zqg9pFD4grzPc6MwHkHIHVcHBwEQXLhQ=;
        b=jaY0FTPOpafmQXlk5UaOVt4F/VdduAEB27ZI6Gthr9mNtQso7/d/0bvhWaJSxVTECK
         RV190tX162VSSvHiW3m+Pi0imIiiqO1VJG7FM2xXYHfDxetVUomjskjwLvUlDoAvAKQQ
         0O2f77ZaZ21qqJsdgZZP0Tt5d0lnugQGF/hbmc0CCN5C9+cr0X8IyqsmFHvlXJ5tTHBR
         PxPB8TGIxHAvEHQlrrBV2FAD+KyYQ8aJddnP5e7Oh1PuH8Kh/9DkoXy0R9iDzQYyr3fD
         rDYr8Mj42Q8j0ll/2y5ApzKrJpnhHxztEtwABXJMVaVP9q8EymGqvC5C0F53nj/vub2r
         rF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWq2uFWvbFyUE+TxXM/H+7XvZPvgFMfAnKItiarIZyzn1Hzg8Io28OSXpMM08sOND3H/qIljxxJSBtO0FQ=@vger.kernel.org, AJvYcCXILrTbTVjbyPKIUxx8Swt8uLM+i90BI1Q2XHFhDBxqCj7p+0EremoXbxqtpOgKTOoopBBZA3f81iBj@vger.kernel.org, AJvYcCXcylexuwGQL0JbFAHUILLhZJ4OADb54HZI1dC1wYfeNKN4iQr8AQpUGkAgQI3unzv4FTDErcobp+RBRq5x@vger.kernel.org
X-Gm-Message-State: AOJu0YxLAF75VwOgspM/GfNR19uJwsIN3aAENRcbIcHK7k77VnFJUApI
	LeaSYdlRkv9Wiv2S6HzSrc4YVrsN5+WBoH+XhGuXT7RcCsS6Wu29
X-Gm-Gg: ASbGncupPo0QIV8HjevSLLJoXgkwFQE5W2zEtuw9+5MQ2xcOFCurNyW2aQMmnqpL74Z
	Ii1gR78m7eO0p9qf9vJ+bWfh1H01cV8BKDUd8B7AGBIQpbY7kzftzU5z28uXGum/1QixZRvlQUF
	zg/RTdRuczaxqA0a694kK9So9kz4TIBkGCFce16ywSLwDD1jK3/mOgo5xbebF1fhZHln0tO2Miw
	xzrOSRPAS3tseiSh4eCYk4VKkqSFHiUQtH5ZRzuhfKAC2Hn0Nyx+MpTKQbzqECmHxeQku1YsrDq
	E0EDqdnabYEQxeXxApC/9QhwQnU=
X-Google-Smtp-Source: AGHT+IEOk1x5AoIYZW+55H4hzFIVfeVeIvyzhHdJ23TfluHygEQbpPwlmqAbahw8Whoj+DhzHTCW8A==
X-Received: by 2002:a17:902:d501:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-221a1148f3amr234622445ad.33.1740465658520;
        Mon, 24 Feb 2025 22:40:58 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a092edasm6677905ad.130.2025.02.24.22.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:40:58 -0800 (PST)
Date: Mon, 24 Feb 2025 22:40:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Manuel Traut <manuel.traut@mt.com>
Cc: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/7] Input: matrix_keypad - use fsleep for variable
 delay duration
Message-ID: <Z71l9046XyjxicFf@google.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-2-markus.burri@mt.com>
 <Z7YIKaG0jBHV2FSE@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7YIKaG0jBHV2FSE@mt.com>

On Wed, Feb 19, 2025 at 05:34:49PM +0100, Manuel Traut wrote:
> On Fri, Jan 10, 2025 at 06:49:00AM +0100, Markus Burri wrote:
> > The delay is retrieved from a device-tree property, so the duration is
> > variable. fsleep guesses the best delay function based on duration.
> > 
> > see Documentation/timers/delay_sleep_functions.rst
> > 
> > Signed-off-by: Markus Burri <markus.burri@mt.com>
> 
> Reviewed-by: Manuel Traut <manuel.traut@mt.com> 

As I mentioned in other review activate_col() may be called in atomic
context where we can not sleep:

"activate_col() may be called in atomic context, and if fsleep() turns
into usleep_range() or msleep() we are going to have a bad time.

We should either stop using request_any_context_irq() or figure out if
interrupt handler can sleep or not and adjust behavior properly."

Unfortunately this was completely ignored.

> 
> > ---
> >  drivers/input/keyboard/matrix_keypad.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
> > index 2a3b3bf..5571d2e 100644
> > --- a/drivers/input/keyboard/matrix_keypad.c
> > +++ b/drivers/input/keyboard/matrix_keypad.c
> > @@ -68,7 +68,7 @@ static void activate_col(struct matrix_keypad *keypad, int col, bool on)
> >  	__activate_col(keypad, col, on);
> >  
> >  	if (on && keypad->col_scan_delay_us)
> > -		udelay(keypad->col_scan_delay_us);
> > +		fsleep(keypad->col_scan_delay_us);
> >  }
> >  
> >  static void activate_all_cols(struct matrix_keypad *keypad, bool on)
> > -- 
> > 2.39.5
> > 

Thanks.

-- 
Dmitry

