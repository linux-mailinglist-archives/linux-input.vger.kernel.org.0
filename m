Return-Path: <linux-input+bounces-13693-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DFBB12E8C
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 10:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E36F163BC0
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 08:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8FD148850;
	Sun, 27 Jul 2025 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ha6w7e+r"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB783214
	for <linux-input@vger.kernel.org>; Sun, 27 Jul 2025 08:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753604571; cv=none; b=nOVKdeA4Uwee1NBdW6u4Vok5JDrb9d1iZGbHKuqNGOfv3vsvcCtwakmB0QiF1V3DBmrOeTJyNYg4uf2C9ISQ1KoiwlXMxCL/YbWxwXFCaeT3aUNaky42fEgmIhVWgxdBHjO67cULgStaFeEhu+CR5C+bHJvNTLeHiPCEyEJZHa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753604571; c=relaxed/simple;
	bh=FnH09hog8Rs8RVzkhA79xhgLMs95xPr0JoAgJ7GtGWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pwj2vruxPj9T7h/cfwQWZSJOYyp8NtPds9USP3z0uhz3A8h/6LXz2cdFa2V2/u/QwuI6BRFDeLKb7Kbu4auXeDoJ6QdVDuQp69C/yiOGWdrqNAHAebR203/dZilbYisXxmLTCNlqopcZKRM45TW4KG0SpIfCy3dRRZrNd0WPntQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ha6w7e+r; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2352400344aso30565525ad.2
        for <linux-input@vger.kernel.org>; Sun, 27 Jul 2025 01:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753604569; x=1754209369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=obIb/YWAGbmCe0P61iCLYfit9lCw0JVvqf34uwE6Ubw=;
        b=ha6w7e+rOpHtufdKNLt3ZQNtaj7SFEuVl7bWTG46mTkIMTkcz/XrD+CG4UY0X9okv0
         BOVEO8g/BerQWikanxYNCVKm8WbP/wEfbuH1v8ZlID5Pc+q2sPhb3buJtb3abMqs9AzQ
         BX0MkbXHSSeXNLxQFgBVvT9Un6qJNFJq+hJE5V/rwinoUNnBZSr21OS5ERp9J6c5FPPF
         3QLXg5wxHRMZPFrGBUEHesjPHgJREK3UbGKFo9VLuwHNimQyIOaxnagniAAsAKqEluwB
         aSXfdghu5aMShRlccBvHxIMhhbHV8QWOLee79ISiJ17xdewy6ZHYURMr8mR8W70/9aN9
         qRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753604569; x=1754209369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obIb/YWAGbmCe0P61iCLYfit9lCw0JVvqf34uwE6Ubw=;
        b=gpRzHVJ+JJIkdS4//uW1zWBMKtEFu+P5rTS6/y1X8bwBovv+c03GYKMVOKIZxFebJJ
         kGRT0SYpznxXFfMN/1M377QP6a/rKsPYVKYVLwy84fVNPBtnIuKOza0QMHAN/hSG0H2h
         W1NC787On1mztumgoqhMLzwaI6OlZ9WOPHiAAaAAYT7diNoL7gJv2lr4T6ZIuHxcKDCq
         KbKLX4EVveBwjsl+kvxbDzSAZO1oDNma5+oDBs7BXi0+hoRBOUBG9R8MaakNF/2PeWxF
         gl8z+IVsqv+AJR0kdp+uEwW6BBpgRSlNlBy3PMsqiDbPsPTCthfCyODcQxVNFGP4I/IN
         B/ww==
X-Gm-Message-State: AOJu0YwMYpd0emheyGhCKHZPpzHFqLoMAEviONhBJmo08XgPzWnlevrx
	Bgefmf4BAzx94QddkCTCN5zWN5+MBuxepL2G/SU/6q2a8JfZZ+mEwIgp+d2ShA==
X-Gm-Gg: ASbGncsxY5p9alUDA/Pvl+zOdkWeBs5i6J4iG7KAavlBovSUyStWIeGbd+Mb/mP1niz
	X3sD8kvkXuw7HjP0mLhX3zXn1OUTQjUk+gDjbU0Xe702QePlh2yOJd+ZEuBeiBpLRhu0c4w8ICt
	KGzbaLfMCQFNAk/OZjnQYjn61yk+A7P2b4mzMlmlcXty2Pvh3kMmuGU6olYQpEheBRYKsx96NjF
	KlFv1bp2amQd8mQXDEWFi3JRZ+hVqiVpJ29QVe9Hn6oUaq0fGnPmeZxOJhvLOCA+euUOyuOuHUj
	Y8ccc5/2Ok+LAfnW0p8P7HuUrsgp54Gw3Ms5sl5FCMRKkVDpt+aKCp+O9Ku1tLZFseRv00pR3WZ
	djWGpiH5vn8OfIcj2+eg6A7c=
X-Google-Smtp-Source: AGHT+IGIhoa/WBuiqVS2JMb3dESW/9fRm/wGRrinPMvbo+GVNUkZ3zAg1BYsYwZwYIzCKDtdXX2NvA==
X-Received: by 2002:a17:903:1b10:b0:234:ba37:87ae with SMTP id d9443c01a7336-23fb304fef6mr130113675ad.4.1753604569474;
        Sun, 27 Jul 2025 01:22:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:152b:d3db:2a19:4eb0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe4fc7a4sm30192295ad.120.2025.07.27.01.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:22:49 -0700 (PDT)
Date: Sun, 27 Jul 2025 01:22:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - Change buttons the D-Pad gets mapped as to
 BTN_DPAD_*
Message-ID: <bwun7yd3uwp3cqicg2euq5swxespqjiizxlioohgdk43emzwue@hzyz7gn4vfqb>
References: <20250702034740.124817-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702034740.124817-1-vi@endrift.com>

On Tue, Jul 01, 2025 at 08:47:40PM -0700, Vicki Pfau wrote:
> Since dance pads can have both up/down or left/right pressed at the same time,
> by design, they are not suitable for mapping the buttons to axes. Historically,
> this driver mapped the D-pad to BTN_TRIGGER_HAPPY1-4 in these cases, and before
> that as mouse buttons. However, BTN_DPAD_* exists for this and makes far more
> sense than the arbitrary mapping it was before.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

This unfortunately changes existing mappings, but I guess new events are
better than old ones...

Applied, thank you.

-- 
Dmitry

