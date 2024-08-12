Return-Path: <linux-input+bounces-5512-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E652F94E5E2
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 06:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A334C282282
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 04:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3D714A4DF;
	Mon, 12 Aug 2024 04:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1FWNHol"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C297614A0B6;
	Mon, 12 Aug 2024 04:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723438243; cv=none; b=nQl2VMztuLAPmlbOdsmPqPOarIpOws9frF4bM3Pd5zA9dD88vZ93COWnzYiskm0MCIVtGRLvnBpfELhqF2pwjFDhES0YLLmYUvjvnpe6wEjClJlWMSPz4H+4EcqgRZgsjBomVYWzeET1oNKIinbBdZgnwGmELErbNmPKTA1jkMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723438243; c=relaxed/simple;
	bh=83JlpyrmSKYQ9oB+jFn8pgVxmbcWz1kKoxJsV1O4jLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sR+gWuMEepTpRUC7EncNr6xEaAdUbhiJYqScQkYjQ0sliCU+AJV3Ef4UsjwVxugElDzZaGAvO6ek/QvCdtGFX8YIcNlFUdZAbUIvZ1QZnYG/H+pTJc/ecfpNmwz8kXUglSCCJkszEGQbUJy0GN6EH0nGbuCZiRs4nETpJ+3MH7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1FWNHol; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2cfd1b25aaaso2558914a91.0;
        Sun, 11 Aug 2024 21:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723438241; x=1724043041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=epDmqodpuDaGpWQoRGAjwmBzK4pSCsyAmap9TuIm5M4=;
        b=c1FWNHolhHv3NBC+6+azvWvkLiW8ELyJmHLvwoR5TBU03PFw9GcGp4rEVYGgkmyuD4
         oX0lXF9IwfhfSPDHL+Vrabe7wn8E5mtJTFNC8GZI8RduuUiYK6F9Fp56OZ24Ez+UVgr5
         zwe8vuJsXoyfomUyU2Iflv0N3D18DVwWlpJcOFoj+a3E8E3zvMxRu5CrGZ2E8fVkHqPL
         115aRGX/rCHIpHadylHwNAx+Ool/wCyhg7kWKwHtYLPIVqNMZuGIel1MIAOLbRfs+6Ft
         433M86vA9WBPdUL9Dyxv1lE41fghdnYWMtt8L9Y6PzgntVe3dCTaM/NOE5ynsS8DhX/q
         p4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723438241; x=1724043041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epDmqodpuDaGpWQoRGAjwmBzK4pSCsyAmap9TuIm5M4=;
        b=gIHltV06kg3sxDstcwgeAmw4KyRU4NqCAHhFF7jVZbSfY0Cz3bJwsRPIjhar48oW4N
         T6bRx1avHc87FgGFGml9GumBuFdBL72B0CZl5oeop6MizQD/FM8lGSnO9OGOnx307OH5
         EQ36WNtqv/CA2jD/Z7U/SWQcXi46NlY6TmpJmGMFwkyROqTTO/lxwuus4GNCZEfNDKf2
         1EiGkuJFUtQW7PG8GtNpawmO8JpY9jNxG2EXTyfug/lRnzuk/VJycZSrX+13GyvONbUH
         cbRe7Kr2pyXr3MGbg2W6lLeEARykymfMP5hnrQtglZJn4+T8O4IkwkJzfVPuZd3BqgM3
         ZbWg==
X-Forwarded-Encrypted: i=1; AJvYcCX0AP5bzSmi/c4+apkURq+sSh84zLePTNhUPxjQakKYnKWTN2pHfiITIov9LHZyM9HJHvR7hi9dGlL4M1nXvIEf6tkla6toN4HQhtgj
X-Gm-Message-State: AOJu0YzOqLhpTwXOg0InL7tbW7i/1D09hQYBfgxlWZaivtE8HPaLb/mb
	c2m5HQlzqSWDsErSK9Wr6nnEugJdizBWTWSjd+axAgTVWbbtlhMe
X-Google-Smtp-Source: AGHT+IG/70rWs4MdJeAexdrUyx/sK8/F1XLw1L5eyXGEUS8uoeWI9U74fYh2v8WnKxRFZB5M15jorQ==
X-Received: by 2002:a17:90b:4a8b:b0:2c7:1370:f12f with SMTP id 98e67ed59e1d1-2d1e8078dd2mr5272374a91.40.1723438240814;
        Sun, 11 Aug 2024 21:50:40 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d735:aa04:8b70:6332])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9c64b14sm7291000a91.5.2024.08.11.21.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:50:40 -0700 (PDT)
Date: Sun, 11 Aug 2024 21:50:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vojtech Pavlik <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [RFC PATCH 0/5] Removal of a few obsolete input drivers
Message-ID: <ZrmUnaLJ5Ft0_tst@google.com>
References: <20240808172733.1194442-1-dmitry.torokhov@gmail.com>
 <alpine.DEB.2.21.2408090122060.61955@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2408090122060.61955@angie.orcam.me.uk>

On Fri, Aug 09, 2024 at 01:24:42AM +0100, Maciej W. Rozycki wrote:
> On Thu, 8 Aug 2024, Dmitry Torokhov wrote:
> 
> > I am wondering if it is not the time to retire bus mice drivers since
> > they have been out of favor for close to 30 years, as well as 3 drivers
> > for portables from late '90s to early 2000.
> 
>  Are these drivers broken, e.g. fail to compile or crash the system?  

I have no idea because I doubt that anyone has tested them since
forever.

> Otherwise what's the gain from removal?

The same gain that we get from removing obsolete boards and
architectures - less maintenance burden, less work when we need to
change some APIs, less energy burnt by 0-day and other bots, CI systems,
etc, compiling useless drivers over and over and over.

Thanks.

-- 
Dmitry

