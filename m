Return-Path: <linux-input+bounces-10364-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9B9A44E3C
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 22:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88CD41893673
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 21:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B9E20F08F;
	Tue, 25 Feb 2025 21:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MS0wPLRE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A141A9B46;
	Tue, 25 Feb 2025 21:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517225; cv=none; b=ezSl8RRGE8/kTw2Sf6g8nlVs0tZAFU7DXcGF568fVZt+AH0TzXj4SGBrqmngXWbTT2x1ZTG2m+bZndNjE6rUtso7uBZRJSMmW6dYQz9RMeq8p5tN+u4fyYzPTCVqV7equ9LpaMlsbPYbnpQHC2iwKKqBLNBluYCIZKm3vUYtCLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517225; c=relaxed/simple;
	bh=gHd6YyU8hxCStCyDMJkBxvOJTSbamQYUQnWLq+IIJ28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3KcnTCPO+B2lTWIBFn5CP6QemW/x8VBD0tY90VyFf6VR6BLwtxb2IsLTN3nHAptLU6nq4GeCdP/b0wziPUdWBq6WmsGARHqn3i5UoSqQ9quyKrCPiQQ0IeY/kZMcAcsQq6wVXp1+EE314rYdAjj41H3+kOCJc3Nc2goSnw6QBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MS0wPLRE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-220c8f38febso128596925ad.2;
        Tue, 25 Feb 2025 13:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740517224; x=1741122024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2lKMXTcP9qL47y07R/V20BzuvZTLIh58E4mh4qSXFr4=;
        b=MS0wPLREMC9WKW97Swn2hHdadC58v7/8YFoVMn31WiT1EMnR1hL23nGuB3XpU7c5Gb
         x4+5/GDxW5aL+ltVYJyu7v46Ivs8ZLKG4ObneAGx8n6H45PFd/Yr7vSTrk8Viequx4bE
         5+bzSk7A0tQgfSscBfEUS5GccJQSUJ00X22autuWQn3OAXZRbujKrfYT9Nb0Am9DIzWw
         tqE6Sr981Y3iKIdzpswjUwPOfxgImK5tpgliI7MXROvdkaakUdF1BaKVLvGj2bEBkrKY
         A5P0Glf/npjZSDc9A4vSoRptTZqf3a2idAp9V8gsUQ4U97Z+dI1p5Eh8v4PwLBydUqbd
         cZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517224; x=1741122024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lKMXTcP9qL47y07R/V20BzuvZTLIh58E4mh4qSXFr4=;
        b=BuU82lJZ3iRvZQnF2qx0EQ3ZvEY4BPggoN4pQV8HsQBxbTjYzbRT2F6DT9HE0FlAWv
         /tPcXYylv5VJnAtc10QAIc6odGY3icXDv5KwV0+xemqalGFTw19FSHh4pnS8xLk4Nwbi
         KGynp+rO2VUbN+CYSEY7rYVf58+Vd8ABZ7AZLaj3E3bBMJ4Cu7hw/RHWca0IfGddK9rP
         rZSmpOPhdWou2B2khO9FURfonENhhIlyN6qrORXR6RvrsRvZj4AfVrYmzZx3U4vzDs9i
         UC6SiWPSI6oiOlZuMrwLSFvTY9eOwVFhQ6oOU/lgqWklaF59MybJHdPjoNeIxLn/UrZm
         irvA==
X-Forwarded-Encrypted: i=1; AJvYcCXfN3z65IJ6KbieJXXt6Fask4zLePrk0mQI3+CWXBma8NVzA+WYD2KWMcUTbUtb14dzYrWVGQdSccSxwBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvI4EGRAZBs6MnR23XTRMtkXVhses6XOt1Hc1miExgOxgjIfWF
	RE2o400LKG+Ag1THMeozh+xWrG+CKUvhZK7SHiwDuiNOCTfTpgl8
X-Gm-Gg: ASbGncvbvfCy38yW5H0C3rra+yA5v6I3CMbIEdrJEbXAEFYYu/vRAU+NAhuNXNH6Gfo
	2HDdkaFT1oVZQ72IuHiOg9fGg2Uy6OSvGuCbBNildbK2KXwi4TjQO3Y36Umw/DBzBchuy6SLjVH
	xZPw0+9BYU/vpmEEdtLX55WrTB1rYBstlVRmAGpRZpaTIEL/UCq2s35BK1o9tGEBsH27sV9669g
	YtLq5Fq9EpZaKsahnFk7palf6H980ZLRD/ogy089nNUqU6+z0IZot7VL/84ojjHFdPkXTOTFUcI
	HuFMWiSRhLjJjNp//PUZLIcFcEQ=
X-Google-Smtp-Source: AGHT+IGZ1N+f9lvYNmuTfsbru7yuejlJ5Q8tgyfuRmepbxHDhgQqfVN3GAPFC+RgKbqeUEDg+qIg8A==
X-Received: by 2002:a17:902:e80b:b0:21f:4b01:b985 with SMTP id d9443c01a7336-221a0025a09mr302563935ad.45.1740517223611;
        Tue, 25 Feb 2025 13:00:23 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a092f0esm18885045ad.153.2025.02.25.13.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 13:00:22 -0800 (PST)
Date: Tue, 25 Feb 2025 13:00:20 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	pgriffais@valvesoftware.com
Subject: Re: [PATCH 0/3] Input: xpad - add Zotac Zone, TECNO Pocket Go,
 rename Go S
Message-ID: <Z74vZD7ZtKBTDlwy@google.com>
References: <20250222170010.188761-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222170010.188761-1-lkml@antheas.dev>

On Sat, Feb 22, 2025 at 06:00:07PM +0100, Antheas Kapenekakis wrote:
> Add two new xpad entries for Zotac Zone and TECNO Pocket Go, and rename the
> mysterious "GH Electronics" controller into Legion Go S. This way, it
> matches the rest of the device and is coherent.
> 
> @Pierre-Loup: for upcoming devices you do not want to leak the existence
> of, a little trick for enabling the xpad driver is via udev rule [1].
> This is also good for backwards compatibility.
> 
> [1]: https://github.com/hhd-dev/hhd/blob/06b857f31359ab04ce0fd92988284874cc4e1c7c/usr/lib/udev/rules.d/83-hhd.rules#L40
> 
> Antheas Kapenekakis (3):
>   Input: xpad - add support for ZOTAC Gaming Zone
>   Input: xpad - add support for TECNO Pocket Go
>   Input: xpad - rename QH controller to Legion Go S
> 
>  drivers/input/joystick/xpad.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied the lot, thank you.

-- 
Dmitry

