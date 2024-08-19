Return-Path: <linux-input+bounces-5633-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADB795616D
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 05:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CFEB1C21432
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 03:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0617B224EA;
	Mon, 19 Aug 2024 03:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFIqM1bd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8795A5464A;
	Mon, 19 Aug 2024 03:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724037907; cv=none; b=AYIIf7BEkDDYVkOpjZVx/43KTFfk8T/w6guTMKTSGV2EMZ1pI/GDnHU/kGGgiQS/KN14NPeRPicUJr92q2LoM9pa9Go/ZhOe9ep1PwnOb+oEJYTTNZBBlpGQbLlUy8asjrX7oyGAsj6Mj69Xy7RGeiOjD1wmPvsrUe3Qtjhq8h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724037907; c=relaxed/simple;
	bh=bgI0G8Fn72Rxqq87UXM49Ehflc/VPUK06RevINtBC1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atV+29cteTplbHojR3/JBbU0FrDr/i5nuHjzfL68aFOnn4VX7UlARUsXGBar3crzqHmKkYA7VvQBlwL51cKWXjnhVwnae37hPdCNbx8Av0Trsy5CK3l8D/6FCCt+JgHFKOnIS7b+raJrAYN5FZG9VP7UtS9FE4HYndfSs1T1LNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFIqM1bd; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-70968db52d0so4283471a34.3;
        Sun, 18 Aug 2024 20:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724037905; x=1724642705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LRa8lv4SQNw2ZtQDULmxx7KlayrTU8FifJF1b2nbCo8=;
        b=CFIqM1bdE1RjZ5i/DV6RmrfSTI424qyaRox6IbgL5HZHfn8NcqGTpEGQr3R9wuynXH
         gOubnkj6bOt3eP6KtxWxcEDa2xM6dQ6mVQt2ngqlvwac4eEbq5YgBE9x7RQQ19M+78Cq
         dtRQmX89sZeNcnr0lbTMXGk39NUcaW86+We5Wq1qsx0CHNo84QVZdNXvVUFbZEvzXoXh
         hua2Ap8sKAqFF6MlfyzPfDNWJCigvzFVrPedeVQyQoRbg6Hr5Jq9uQCUmELfrFeIedlT
         WJHeB1ZIwE656pVnnNdXENokZapL6WKp7q9h9pCqVamM6MWlXfW/DbkdhgsUJR8/EYDD
         jBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724037905; x=1724642705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRa8lv4SQNw2ZtQDULmxx7KlayrTU8FifJF1b2nbCo8=;
        b=q0OajxrjbxeI6hYu0OFnSjRskoS9ZUkHJboXM6pB6h2CgT6DdTIS0mt0RXFRScfv0r
         vQfOYmNC0DnBJDxMj3CfbWKe55GaWSW79S7uu+DIw4S8jUjK7miLWBwWwWz7PSpsUByq
         lwgb97LKLV2NesupaMGD07ln8rTbsONLAURbQkvzvFCCFkmSdeL1v5009rvweCMxrP7Z
         HGFgjn29IPenfMAbDuYVJCY28e9DNk/RKss7/tfiiiIhKK9cgCDPqpu9BjGPKrj/8Bg+
         3XDeTsDgoeFYE8rxjaxaINm5tDaIUSrtvDKSyupNys+vQza+jqpk/yrlYedkPE6J6IyH
         p+yw==
X-Forwarded-Encrypted: i=1; AJvYcCUUwBv0JUogQuHaGWoN/KwyV4KQ+EgS3n5QUz8bBVMdr3+6Ky8MrzaPQkaLf3wZ5BW/QHguPGaGyeF8qYSBh9LfKYDEljQgg+Sz8BCH
X-Gm-Message-State: AOJu0Yz1CKyr2nP4hqyyLvR/jbypx3fdSi7mc79or5hrq/q21vOD7ywt
	gcFPNuSM6LqZHwihwtDSaNQ4AOBvDD9qchfL6B/vu9erDuvVjC+C
X-Google-Smtp-Source: AGHT+IF84DN8HQzV6zoD72eLq74bqYTaY+2ulQX/D4cbqR9Q1bhMZhzIhyY5niKl43jsZCkgi8Bxww==
X-Received: by 2002:a05:6830:488b:b0:709:32c3:68ef with SMTP id 46e09a7af769-70cac8b67cemr12602626a34.30.1724037905237;
        Sun, 18 Aug 2024 20:25:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61a70c0sm5831917a12.5.2024.08.18.20.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 20:25:04 -0700 (PDT)
Date: Sun, 18 Aug 2024 20:25:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add Fujitsu Lifebook E756 to i8042 quirk
 table
Message-ID: <ZsK7Dot6ZZoQ6Na4@google.com>
References: <20240814100630.2048-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814100630.2048-1-tiwai@suse.de>

On Wed, Aug 14, 2024 at 12:06:19PM +0200, Takashi Iwai wrote:
> Yet another quirk entry for Fujitsu laptop.  Lifebook E756 requires
> i8041.nomux for keeping the touchpad working after suspend/resume.
> 
> Link: https://bugzilla.suse.com/show_bug.cgi?id=1229056
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> 

Applied, thank you.

-- 
Dmitry

