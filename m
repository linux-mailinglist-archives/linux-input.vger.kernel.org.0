Return-Path: <linux-input+bounces-5521-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F52294F52A
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 18:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE157B20995
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 16:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764EF1862B2;
	Mon, 12 Aug 2024 16:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlJnWMhX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6841130E27;
	Mon, 12 Aug 2024 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723481220; cv=none; b=OBeuQHepW6Eiqax5JoGycM/mMrmW29ftv3bjCz2fF7rbVfELNSnakptIhxqeyj2C94uzOYECrg/oU0bh/uD9nnh4nQAYNAGYgTNTDbVbt0TXIoU/mUcu/lY8abK8fV91AKB7l5DVCO4O8wIN5LoE5pqh7zYzYEJ2NahpmvEoKO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723481220; c=relaxed/simple;
	bh=s6vDzpdyj1kaf2RCIORy8HKnudLqeD/U0PkwfPHu9xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3sz1ZbCTUcrCm92V93Irw8/zHZylwvsgS5MM2AI5DP/Z5sV+zH/LHBR4f46ZNj/KcrpWscA6mqVvUzNzcgWkW2RWTi/VLxaISq20YdvcFMkh+RU5+JKvGknH2gZMB+BiWPbmMaIxq5R378B4dWASARvsnRMy0IaZnFOagm9+tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlJnWMhX; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5d5ed6f51cfso3088791eaf.0;
        Mon, 12 Aug 2024 09:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723481218; x=1724086018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+sdxd3RJ6cYc1xTCNB+pQD30MwFIoG/sMhDILuZx+8I=;
        b=GlJnWMhXmM6LLxjy2P+wf8vp8no87sM4lmQy/roTh5vMwM2CFU/ppZjgkGhX+ovPcq
         g/X9FP7EXQFKbbHEOowTLWmja9QBVramAnRGV6asfg8tlc86JcLeEhTpwYdYmChtZoNX
         +DtOFi0JxMGW4p+jVqpgH54C4YCTxAyDRgMc9aPDMnktm86nPhSDF2RvkDrfZqjJHRBt
         bm+/xT09L3xgKg3mCckwAdNT3iZRPAoYFAz7DcE6mt45v1nv/xOTM/SN6dltHHt78Glk
         RID5Na4QHLdBKhCuVvwYZZm5Nvqcc4VOOs6LpA9lIznMJfpVMUraoozhVgrH5WXA9g/c
         txzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723481218; x=1724086018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sdxd3RJ6cYc1xTCNB+pQD30MwFIoG/sMhDILuZx+8I=;
        b=PDNs2VCXlA1LU2rheP/DihyxNdLs8wgWHIfoeBUT2B/XZHJ9QL2PIpZ8QiDWBx8KRh
         CptH/45PRy+lQcTuIfZazNK3U4P8PTfAakWRl6qLPfIvcJcziGMB+eCVawudPy58Y9GV
         WIeHR9PWp5x/k5/yirWfok8OGDRhE7NQBFqWjDOWfoOC87Qfqh3DKnkcCuAzI/hf47RO
         BQeT7uI02oCPm3bpjPJEsjiMhcVYmuV3/vPoH+uv1Du/ZHBHKugbFdNGkqgFy5UlQiMs
         bIhzRIfmy1MrWXpVBI8by5HldOzUlPgaS7FSem8XAaPLTD/k5XeElpjzaQy7CyHAOLf7
         x7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVAoIMQPGX4M8qSKOpErSLZXHxA6Eq9dFI7nuzvzpPLqsG6TrQa52gjD8prlh9D56TVcOyMxd0PYyQjq9fQ4s/tzciQKK7SQ59rq5lV
X-Gm-Message-State: AOJu0YxRl3d75vTZl4DTBK2hvKoptmeWVQqOL9VYnulx3km8xH+4koaV
	QnzLlE1gmGogudzRR9tCBRa81sUqBdbxhYSmMNCWqDpnHc6KS9/S
X-Google-Smtp-Source: AGHT+IFX1Bc/MZ8kTVn1mWM9fv8YIQybjzrAlBntH7k3WsvYhrrNJUmzUE+6wmNaRfgwpWY+M+o9/w==
X-Received: by 2002:a05:6870:e314:b0:254:affe:5a05 with SMTP id 586e51a60fabf-26fcb6ca3ecmr880564fac.21.1723481217802;
        Mon, 12 Aug 2024 09:46:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:53c5:10b0:cfab:3972])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e58a80dfsm4207501b3a.52.2024.08.12.09.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 09:46:57 -0700 (PDT)
Date: Mon, 12 Aug 2024 09:46:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vojtech Pavlik <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [RFC PATCH 0/5] Removal of a few obsolete input drivers
Message-ID: <Zro8fpgvqa74aki4@google.com>
References: <20240808172733.1194442-1-dmitry.torokhov@gmail.com>
 <alpine.DEB.2.21.2408090122060.61955@angie.orcam.me.uk>
 <ZrmUnaLJ5Ft0_tst@google.com>
 <alpine.DEB.2.21.2408121448250.59022@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2408121448250.59022@angie.orcam.me.uk>

On Mon, Aug 12, 2024 at 02:53:30PM +0100, Maciej W. Rozycki wrote:
> On Sun, 11 Aug 2024, Dmitry Torokhov wrote:
> 
> > > > I am wondering if it is not the time to retire bus mice drivers since
> > > > they have been out of favor for close to 30 years, as well as 3 drivers
> > > > for portables from late '90s to early 2000.
> > > 
> > >  Are these drivers broken, e.g. fail to compile or crash the system?  
> > 
> > I have no idea because I doubt that anyone has tested them since
> > forever.
> 
>  What's the rationale for your conclusion?  How do you know nobody uses 
> them?

Because they are either require ISA add-on cards and it is quite hard to
find devices that still work, and are supported by the current kernel,
or internal peripherals in devices that are no longer useful. Do you
expect anyone using "Gateway AOL Connected Touchpad" in the year of our
Lord 2024?

> 
> > > Otherwise what's the gain from removal?
> > 
> > The same gain that we get from removing obsolete boards and
> > architectures - less maintenance burden, less work when we need to
> > change some APIs, less energy burnt by 0-day and other bots, CI systems,
> > etc, compiling useless drivers over and over and over.
> 
>  Well, you don't have do do anything about these drivers, do you?  They 
> don't scream for food.  And as to the energy, well I doubt this really 
> matters, the amount is noise lost in the overall consumption.

I kind of do even if they did not require much involvement.

Let me ask this: why do you want to keep them? Do you know of a large
(or small) userbase of bus mice enthusiasts? Note that it would be very
easy to "git revert" the removal if someone actually needs this.

Thanks.

-- 
Dmitry

