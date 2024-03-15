Return-Path: <linux-input+bounces-2398-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE7D87D424
	for <lists+linux-input@lfdr.de>; Fri, 15 Mar 2024 19:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB9911F22C72
	for <lists+linux-input@lfdr.de>; Fri, 15 Mar 2024 18:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73561F922;
	Fri, 15 Mar 2024 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvHPM0MA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356F44F201
	for <linux-input@vger.kernel.org>; Fri, 15 Mar 2024 18:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710528786; cv=none; b=ekaeHQgsf+PmChMT8FqCkWRFM1H8aVW2Nwuv8exe4B/KyFaFS1/Wc71Fs1NpqeNnKXF8iJN/IDhiVUrJCzD6OGcKQ+zAQN/ogDMJXErJk5BX8I8La0goHVcvSCgR19mbEgkhgHAuBPS1hM/mQLxBIxUCf9uIzqYxV65RQwtXnDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710528786; c=relaxed/simple;
	bh=Bcu0c5HRQOqjG64GVY4ZcFkcSCRYZigbaRNKpKul/jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CT9ZAmnZw5Zt4NtaY1TFf8X90nfoAffwR47A+uFBo0OMMuLIVpRTK9JavubSC83evZPWUixOsu8VtFMeYDT1Rr9PrrqyFBQPm5Yclt79bRGFZbC+yXlE0OyVATFa+TPguEJxrktk9QY98J16nKQ+XxQvN/YHkqdtpYbUhhqr4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvHPM0MA; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29c4fe68666so1946931a91.0
        for <linux-input@vger.kernel.org>; Fri, 15 Mar 2024 11:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710528784; x=1711133584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p3iby9yB1wms/PKzuqsKcxxHcQUt8Oe8Sme9PaWxSag=;
        b=HvHPM0MAQ4+YvCT9mwUNj4cWnUPxK+EvF0Ab+SE5hgr3TUPPPI1P1+rgRD7zt8yhK4
         +6EcK12jTO2bAfSvnSjW1cmVvg7Dp9vIEucmuaocEw2pNoZyRLH7NkAz4kTcGDGfroqT
         /Q1fmUPFidLlRLoGgn06yl57WSs0Gs6Eu198oMEdpTvgmPU58VV+VEuMaYMlBVaB5Dg9
         1LEf+s9SyIAcYJUD7y2R/m0+rbKvhcbmAvRv8wrqvEaSlf/GJVu3H1yIOdgXyHqPizjj
         vrWWw+FLQYP9ZtO11yZYWvSyKX+luxoRZITX3lvlaj2HFp2NwRdx6Awbjlw7oQ7IUSo6
         8FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528784; x=1711133584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3iby9yB1wms/PKzuqsKcxxHcQUt8Oe8Sme9PaWxSag=;
        b=extIaQKx6cLRfEOgM1Arz+a527WsaVSRGWsrI8O4ijuxGBFsvQ6X3hBqo+IIo/Pd2N
         nHB4t2FnA4OZ5HenjsvCRmG2DXgnb6jdV5pJdvgqBB0ZlbVUF2iaLxJZJ7oPL1XxihiS
         On7zVvZq09pMYwZLu6/B9xIj6YDKBTZe6nWeT5CFkeM4OBzW1x1TxtJM5X+EUhj4NDjL
         roKmLwzsHmRTUnCTfS5pBDOGrJgX2ifY2yYkZyCrHSBlbsUNMgQysp6Ej5enXxcBbHVY
         Q2GcW1tw469qUk4gdIsU7LRunCYsN/n5yQ+d4/5FKH0i1IwuB9yk/AuNYSfzArmyoiV5
         TuTA==
X-Gm-Message-State: AOJu0YwEZZW2/WYHXUEvly4up8DeLwIq4DZzjhCFU6PJGcMLKxAouAd+
	MpWFRthmQLShvPZgu2nog2GRRtZKygKFy8OFQ63vc2LRcSS+SyMmsfLR3pPm
X-Google-Smtp-Source: AGHT+IGOjEFZV5LmNVD3e71G//wjkY+axFAqLDPY2rFSJX3xLTN59ohxHjFZj4EZSmd/r0n3ZpvIdw==
X-Received: by 2002:a17:90b:4c48:b0:29f:66e2:d2a4 with SMTP id np8-20020a17090b4c4800b0029f66e2d2a4mr1389pjb.20.1710528784375;
        Fri, 15 Mar 2024 11:53:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c446:74f0:5cd2:d078])
        by smtp.gmail.com with ESMTPSA id gt11-20020a17090af2cb00b0029c7743cb33sm3267474pjb.40.2024.03.15.11.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:53:04 -0700 (PDT)
Date: Fri, 15 Mar 2024 11:53:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-input@vger.kernel.org, Stefan Eichenberger <eichest@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: Re: Advise needed on stale patches
Message-ID: <ZfSZDbyczmodyI_j@google.com>
References: <20240315093307.GA5060@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315093307.GA5060@francesco-nb>

Hi Francesco,

On Fri, Mar 15, 2024 at 10:33:07AM +0100, Francesco Dolcini wrote:
> Hello Dmitry and Linux Input people,
> 
> In the last months I sent (or was involved in) a couple of small patches
> [1][2] (bug fixes or small addition to an existing driver) and they have
> been around in the mailing list for quite some time (months, 2023-09-20
> the oldest one).
> 
> I am not sure on how to progress here, therefore looking for some advise.
> 
> Maybe they did just fall through the cracks, in this case just take this
> as a kind head up (or maybe those email did not pass some aggressive
> spam filtering?).
> 
> Or maybe the changes are not deemed correct or something wrong was done,
> and in this case it would be great to know what we could improve.
> 
> Or, maybe you just had other priorities (life and work are challenging
> at times, I know), in this case, if possible, I would love to know if I
> can provide some small help in any way.

Sorry, I am swamped with other projects. I just responded on the
mailing list for the patch [2].

Thanks.

-- 
Dmitry

