Return-Path: <linux-input+bounces-13446-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F850AFF1BF
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 21:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3487565092
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 19:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7512405E8;
	Wed,  9 Jul 2025 19:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="epB1bncC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A68B2405E1
	for <linux-input@vger.kernel.org>; Wed,  9 Jul 2025 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088923; cv=none; b=TS6PeDnxL+m/5Fc4V6cdjylloY9/fUjd3ANXZdIqretN83PbD8+MMOz/FunKLtAqwt7RIn96o8HeNsa9jSxLUnrptVXmzJVSMc08ln8dEQfVfcGaAq0UoEs4kELfMRAlZWHdhQ27smwbB1+6OkzdGLIReCbBceRDP2JHEkODp88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088923; c=relaxed/simple;
	bh=nABOqvLvbuNcHutPLrwVGSq1wuzT9ghLqCr6KnZkr2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQUuOjy/iVNCBrhlSbPJ6vIFGU6FGitokfauR6UUZxGvvPryPzw9AJd3AiFJg1GrtxfXPPYUzJb097YHt3nrRHwJWw9BLphlE7PEKNlMTVZ6k9ocM71sVMeh4/D2LDGcOVh9BJTlnK9g8z+Y47LIj53Yfho0dl38X3AxxEkHheI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=epB1bncC; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d3f1bd7121so24647285a.3
        for <linux-input@vger.kernel.org>; Wed, 09 Jul 2025 12:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752088919; x=1752693719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BjoFCuTSE1ktjsRKop+omQe5NJ/uDGXfke16S6/nYp8=;
        b=epB1bncCbTU5KjKnwFCcFNZRMLfaJiPZ7x9yfc3jyQvN0ThwTqq3hDqZ2R+T3aiFjj
         U1MSMGBPlRI0gcBgWMyLgIc9wXSnYIye1SlhDIahayG3dSroqyts2DQDjbosxi6rzRRr
         /iMwbpV74cRnzDKJJUScjd9eQWOum3ahnSR2SX2P7Iq7q8XDW8Mw52h5pbiLZqlZbH9d
         ho4a2+IWmnpjTG8o7Tp/S/5A665KsLWcbGsfhV7Uq7xbAxhNP4MPMhIkL3LLLfiZrwP6
         DA6sZHsvbddjqarLacEcoggUKLXBdq06uXwNAv0k0Dg73eeeMCG4SEMj8A6uJNi5Gz5K
         yrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088919; x=1752693719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjoFCuTSE1ktjsRKop+omQe5NJ/uDGXfke16S6/nYp8=;
        b=Sp5xQb8iW+TUAhVuROcGxg8TbCm3ilS3AElZID8ieJ6DHhsauPbExXStFJteMzvzea
         IaJo0RlfGzUwjLZb0bAUTsFzDqI/3gDVC6ZsFR+s/CsRzTJ8yj5HkzhkKAlyz8DndvL0
         QdC42z0EMykBnSPuKbrDrgsk8reYu1icjw+NWiNxuz0DwFFdv0+28oHuWsHf9FEwJQKq
         chqbKw9VX2mOBrSEee0nZCu3KQJENi/0grjATWEreaqyCbyMoLSnn47ECLDmnswCxqix
         8DH1qkTdbQjOgqz2zMSw7qaDS3t6l/VZpNzc5HIyiaPXrkToiSf3f9itGMYggF8fUsRA
         qCqw==
X-Forwarded-Encrypted: i=1; AJvYcCW2h5jLgCTcOW8J9tDjge5e7eXWJBbvWHJM++nLfdk+820+QJOztL7Mp3TVQS2H1TJA7vQx1FI1InEQZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjJb+W6LAMRVuNYl6q7bk7eB1MuYYh0rMQzmaTDu8Lq1ZkguzK
	fzzvJBPGEzngpdRCeFRI5BbHYGnkkfHcIJx7T+gA//HKxS4d6u8Ntp1cvo3R6vb+vxmNtwFhR11
	YWVM=
X-Gm-Gg: ASbGncvQoTKQoUYJ9iT7vTP/R4gb7pNLlK8oWTU674dtxdKloy0BL1HZo2LNf1HXaNw
	plUwqVNnUvNDCUXkyImZGZwTcr7Q3iw95F9HtrwR2aZ7fzTTTlMldCYKz0t5I7jkBOCdFzt5gKM
	XH3XVJdyI3jdPlHmLXvEK6LI/1RTcvejJ1k2WVosmbwob+GjeXa5YWP56gdEAcKmZJNrX1F/lgi
	ByvyHqwv+lMnBQlHYPEk7LzA4CnotHvTdVLPHHeeF9iz1EMNpoW9VBIQyBQQ9eawaVUhVRypNpx
	+xyDfQtt/fQEnEV/bbMej+ioCBpA1BAN2ju6RetcXwwYj6+r1FROvxcWNiY/R3q1vLV6alrRJBm
	Gb/h32r4oBiQ1mQJE6k3fOHY1jp2r4alCFI+ZDU4+jZzhDlRmRXn5Pl8=
X-Google-Smtp-Source: AGHT+IFOSD/52CkUfN120+NVeyHEaWqXR7CigCUbMAZ+zmGqjrg6MuFpCoY5xBIy1kbi8H2tMGIAkQ==
X-Received: by 2002:a05:620a:488f:b0:7d4:5854:32a8 with SMTP id af79cd13be357-7db7e4456aamr559755885a.31.1752088919355;
        Wed, 09 Jul 2025 12:21:59 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-52.harvard-secure.wrls.harvard.edu. [65.112.8.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe90a8esm989876585a.78.2025.07.09.12.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:21:58 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:21:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Serious bug in HID core
Message-ID: <25b196f4-7362-4136-b5b9-bd53d1cc1c48@rowland.harvard.edu>
References: <c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu>
 <drcvdlw2kpuvsbact2gy4hvqp2i3au3shv5ozp3qms7qdfvi7t@7jofrodxeimb>
 <e3a58c95-9501-4ec8-902e-2a73402d1fe3@rowland.harvard.edu>
 <5rkp3gbrqvsdgia57eyw65jnu4wmpx6sbk47kmv4akmz2q7nzz@clqgtjfk2qxk>
 <b18af9f1-e3d8-429a-b313-38cc279e0f87@rowland.harvard.edu>
 <rwo5cqptiqarvl7qhgapao2uld3aqs27llhtqm5crop3v3rx64@j7h64nqsv6rv>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rwo5cqptiqarvl7qhgapao2uld3aqs27llhtqm5crop3v3rx64@j7h64nqsv6rv>

On Wed, Jul 09, 2025 at 05:35:41PM +0200, Benjamin Tissoires wrote:
> On Jul 09 2025, Alan Stern wrote:
> > On Wed, Jul 09, 2025 at 10:44:35AM +0200, Benjamin Tissoires wrote:
> > > On Jul 08 2025, Alan Stern wrote:
> > > > On Tue, Jul 08, 2025 at 05:51:08PM +0200, Benjamin Tissoires wrote:
> > > > > The second one would need a little bit more understanding of the fake
> > > > > report descriptor provided by syzbot.
> > > > 
> > > > I suppose we can get the information from syzbot if it's really 
> > > > necessary.  But it seems to be a minor point.
> > > 
> > > Well, to me it's important because I can get an easier reproducer and
> > > add this corner case in the HID test suite :) Not to mention the
> > > understanding on how we can get to this corner case.
> > 
> > I can get it for you if you really want to see it.  It's just a question 
> > of asking syzbot to run the reproducer with a patch that prints all the 
> > report descriptors.
> 
> I would very much appreciate that :)

Here's the output from syzbot, with all the extra fluff removed:

	96 01 00 06 01 00 03 00 00 00 00 2a 90 a0 27 00
	00 00 00 b3 81 3e 25 03 1b dd e8 40 50 3b 5d 8c
	3d da

This is the full USB report descriptor contents.  Hopefully you have a 
tool that can translate these byte values.

Alan Stern

