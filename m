Return-Path: <linux-input+bounces-16044-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5FBC53B05
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 18:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E0F90347A87
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 17:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B8A345731;
	Wed, 12 Nov 2025 17:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jNzX628Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CECF3451CA
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968332; cv=none; b=lM/EDjFHOn0TbNTDMliYukX41Ea9lpFCLpLczceHoFmamsysMHFmuZyt4VKgJPHMlEiM25EslcVuPVoYRzuKvuCDHVj8w+mECuTtWdHjqTWeN684KG/ndz1xRbnzXcUwAlj/U6SW3eheREMq0YJrrCcgKvnmQb39n0AO6VkUCTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968332; c=relaxed/simple;
	bh=OYOJXQx/bay3QRd1kgdNJdgiv4E6Yg2DDwWtx0GstKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEvHXL7p/Z1bDTFr0lZ2knlCE88+hBDt4phfmc7/PZWWOepoyF6bipXsCPIMgoTCLBVwUdIVRj+czjMruNH0AL798UIsjkDib6iSWXK9j+TUA2i1B7UymaAQfUxMUfLFHps970IDWaDpIOR7Bx23zdLVzw+3gt0EMM2kh8LlZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jNzX628Y; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b220ddc189so141290885a.0
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 09:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762968329; x=1763573129; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fLXs8CVokNNyf7sAHF+EN7UaZyMO6+J+ZGjUUY5TXGY=;
        b=jNzX628Y9kXSvZ5OOSe5wQFqwvMzQ+IiOlFXSHKAxZ3KMh4f7HEDw9uxKWanDT5NWR
         RCGwznDf0zSw1nN6vJpKTPeKKnTJIE2Vz/VotNN/6Jh6Uz7vHi1a9grTG/WdK1r88HhI
         mCTkVi8DVLgmGEThVoAKeeaACbniEECrG6XHv8nIqhedw/e+uQtr3VKnGAyzScOSf1yl
         NjqQM9HvgWgoF5Qm+BDZqRtYnRre5yZWvGUZNJkWnenuV0fPofV4yHKBg6jzhEKbH5ZF
         1TAibns+IFPI6eT4l8M4qhUEpJMHWJmdzxBz1Y5fd5jIHDkzApEVuQWhHEObOUMVAZvB
         SYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968329; x=1763573129;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLXs8CVokNNyf7sAHF+EN7UaZyMO6+J+ZGjUUY5TXGY=;
        b=KU78g0A5yYQNTQMdVF20onMFsQkCdNC2arPFL9fqEVY5+5hCR5PqNQbdU8g3z2SSzX
         Lktht0lanm4v78xiGOZe5pKyOJmFHK9H3hU8Kgvo+Gl8oYCZIDrhpQ1E4kro5fplj/MR
         as39QoUydGsmn8UsQo3Jaj53Sm4W4nOT8W1YRJBye6vG4k0QxR6dS7qx0AkmPV+l3yyM
         Prj14s6FgbPKKVEMOL1S5Cc0/V5e1dzT32JxriMrNbImJo+zzzp27EwhFsuxoNQtZX9f
         sThEyhVfaU5B7MWdBVYHodKb2jlq6ErgW/z1uxA0lF8Sv2EPMCxFFaR/MiAxBxxhqLBy
         +vbg==
X-Forwarded-Encrypted: i=1; AJvYcCVH74/C/x56xuPIn8fmLmKi7dLwTZBLivKx5CeZkQqUO+mIKURVrP2JwG15X8rOnI5cdTvLHib0OhS6XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdDYpYyEJ2DorJ22P7F2wXK19k7xqR9MPrGKS1x9np/npxyN7d
	W7Vzug7PLHLIN3y6N8in0fGQV64vJQGEB+NY75k6HpJEFPnzLvNvJAcCYf1Fw87OlA==
X-Gm-Gg: ASbGncuKBQEfHBW5NL+cVYu/XeswtB2tZ6zJ90J09J1PseHRQ9lNiEViYQVV8Zozq7q
	Eq+fejCp38LpGjrZ5pRdGxrQ3UKjEwY2Ci+LsmYA9S4X25uBh0jcERpeV4+UUmm7TWyEJaByosU
	Pof4KqUCZn+6ZOMXN+RJbDNPiONtrBDa340TvaJVgHO7Qr3n99DLSmK7MLN3uWsUb5DQTdYAMlQ
	34Dz5IWFXmuTBKl+JjfejPY8acLjLBa7GKbCb13bVfTpiH7NMsVZwgRVv4dXe02nKvVKKtrqVou
	zcsX1R1sSWPts8eUZJLVQgPNhdfg9n6dmuxx1hsfiJ49sIsEaercPZ0x3NrD1ZYxQo4r+wN+W4q
	qzzz3dWbmJtZd6Kyg98S7a3GSkwP4+42blNkuQFkypmwz3zghGtgFBPqhp/WSjn/pfgvQa9+qzq
	sVJEj18mA6wGAzUXAjFSflcvLtxuW9dSI2Ta2oeL+hpJtFqggCBwNZvB7LLazJpTiKpi7LjPp+Y
	oWppGVN
X-Google-Smtp-Source: AGHT+IHiovmU/aYhQm59y8iiDlZbTx5G9WMKAnCIH1B6dtt1Bx+dfhQEcbptLPGc2D8z7piQZb4+jw==
X-Received: by 2002:a05:620a:2950:b0:8b2:6ac7:aa4f with SMTP id af79cd13be357-8b29b7f93a7mr459919785a.68.1762968329313;
        Wed, 12 Nov 2025 09:25:29 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-29.harvard-secure.wrls.harvard.edu. [65.112.8.29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29aa26dd4sm226850585a.59.2025.11.12.09.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 09:25:28 -0800 (PST)
Date: Wed, 12 Nov 2025 12:25:26 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: Rodrigo Lugathe da =?iso-8859-1?B?Q29uY2Vp5+Nv?= Alves <lugathe2@gmail.com>,
	michal.pecio@gmail.com, bentiss@kernel.org,
	dmitry.torokhov@gmail.com, jikos@kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linuxsound@cosmicgizmosystems.com
Subject: Re: [PATCH v2] Apply the quirk HID_QUIRK_ALWAYS_POLL to the Edifier
 QR30 (2d99:a101).
Message-ID: <58edd03a-a7a7-40af-8228-18004dc6e737@rowland.harvard.edu>
References: <20251111203350.3c9a669e.michal.pecio@gmail.com>
 <20251112015356.1919586-1-lugathe2@gmail.com>
 <ab81f525-b4ea-4ac7-94a8-9d8eabca957a@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab81f525-b4ea-4ac7-94a8-9d8eabca957a@cosmicgizmosystems.com>

On Tue, Nov 11, 2025 at 09:20:29PM -0800, Terry Junge wrote:
> Hi Rodrigo,
> 
> You might want to wait a couple of days before sending a v3 so other 
> reviewers can get a chance to make comments.
> 
> You should include the HID: tag in the subject--
> ...] HID: Apply...
> 
> The patch should be sent
> 
> To:  the HID subsystem maintainers
> bentiss@kernel.org
> jikos@kernel.org
> 
> Cc:  at a minimum
> linux-input@vger.kernel.org
> linux-kernel@vger.kernel.org
> 
> plus any of the others already part of this thread.
> 
> On 11/11/2025 5:53 PM, Rodrigo Lugathe da Conceição Alves wrote:
> > The USB speaker has a bug that causes it to reboot when changing the
> > brightness using the physical knob.
> > 
> > Add a new vendor and product ID entry in hid-ids.h, and register
> > the corresponding device in hid-quirks.c with the required quirk.
> > 
> > ---
> > v2:
> >   - Fixed title
> >   - Simplified commit message
> > 
> > Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
> > ---

One more thing about patch style: The Signed-off-by: line should go 
above the --- line, whereas the revision information goes below it (as 
it is here).  The second --- line isn't needed (but it doesn't hurt).

Look at other patch submissions in the email archives to see more 
examples of the style.

Alan Stern

