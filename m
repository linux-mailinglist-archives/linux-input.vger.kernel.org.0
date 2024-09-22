Return-Path: <linux-input+bounces-6634-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CD497E07B
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2024 09:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD19828143A
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2024 07:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F05193088;
	Sun, 22 Sep 2024 07:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bA9t9Rfo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2670193084;
	Sun, 22 Sep 2024 07:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726991933; cv=none; b=HBqdxl0W73JrzofntJgXzuWAAZHrAGe8/C2Ji07xoiyTc99ZjHVzryKUltG2n1mqp93qwAymzF7NA1CgPNHg+K93JIIcDgwXCxllaaiHlA/3SY3RP+SAQWOdR1eh2o5pr+8vDriwCKGVBKK5cJG/0DNlhTJXNqgahCJoVTxcEE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726991933; c=relaxed/simple;
	bh=NinLGJbLvvUeaYpI3hdBGPHp4bubibtbjmH6hixDR54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=io5JOLlRilVmvmanxLhfpphkH3jEoc7pS1Cn8ryMwE1Zfm6Oame6NEZrzzGHRAfa4VUvlj0trYN0NvPNStkYVOl9f5ftib3H3hiZfazzTusEwaQFVXXgwuGYqqQwEOxC/ghYLIoP4HRg3DaF73OCQtp0dT9DIEB/rXJBJ2bnIU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bA9t9Rfo; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-206bd1c6ccdso32781875ad.3;
        Sun, 22 Sep 2024 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726991931; x=1727596731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVjfLNaC5tM0o32TL0s4C4MdQKG3/t0bwJT6TE9NJ4Y=;
        b=bA9t9Rfororcl1FE45Neu6EeJGks2SlqGTZSHnVKgRPvGPwfifhljeHNlikSwIoY9k
         unt4QfsSlg5KyZoAs1cq/t75a1vb+o6KdtCSjB3wb6qsDHyafJTLRAfqCBVvBkOMX9H0
         r4eJXs1RbQ0qpGF7jk88rt02ofawO9vFk7SIax6Wb1VukaGglRrod7veGUEyAQzMCoGb
         HLzt1rfATjl2cgyS0B2njerPGFvStejUxzuyZW1RJJsKrYkq8OkZXG9Di4JPE4pSDnxG
         9vVrzRMZ27c1ZT0ATn8Lcn8pV7tL/Lo4lzOGn/HEFARa5ukiXXhfPBnKsjpz/BvjhfXS
         rPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726991931; x=1727596731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVjfLNaC5tM0o32TL0s4C4MdQKG3/t0bwJT6TE9NJ4Y=;
        b=RdXYbSxAIKYI1Z8rcxfFFjc8XtvncgUSSaJMI3YDgWrMnBipF0YxsZOGZdFPZRlYFp
         EW08HGpLaLHIWb1uN3EwkGS8NlhwrZ+XDh64WvCBok15e6SFZdT0TUvMyqKn4MlRxQbu
         00EvPkMG+P1LpTNfXb/4kC3jZVzgD+0NZLEy7NVdKz08TnuApWYCri5+mzm+82MJzfeC
         OlR14eRN6T1tFl8cTY9n/lB4XJKkcAS0kKkMEyv/vuxeooTC+r1na974CcbXXzvfFDzX
         SRSgAHdyBZcrjK7k88LyDidn6UgXBGZ1Of/aSOb/PW/b2n5gNBL/Mw8pfzn7QTYGB9Cx
         B+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp8RIMvCnQCkxnWY1HI9Em8ILGTiRrhgw/cj5hkjtpJVtnhbKQapn5OHMhGYjd8S6z4Ikj04hVtlXX0w==@vger.kernel.org, AJvYcCWz3z888YsWGnHcrzGtFkmj5ZtseLtWCdabojUwSGBjbO8dDYKyuLG7Zqy0qjTJrrwXimoqJNilZq+RXLPS@vger.kernel.org
X-Gm-Message-State: AOJu0YwWLHD2sIPSrvjFk2Hy4ju8O93qpjh9yHnSrFmTJM3tYqLk50U+
	AZyDsLP+KX2M4QXJzeQTl9MPIjeG6ksylCM3NEcbMFC7UMlh4Udx
X-Google-Smtp-Source: AGHT+IFPh6nNRMGhxDMacNCP3sqv9jOrAPjBmoh1Q/2goBXvG09Ru0tF/utZWX7Gruxb4QfZE6diOQ==
X-Received: by 2002:a17:902:d488:b0:206:8c4a:7bbb with SMTP id d9443c01a7336-208d8592f02mr115174935ad.58.1726991930966;
        Sun, 22 Sep 2024 00:58:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b28c:8c72:94bf:ec28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794731ac9sm117060945ad.261.2024.09.22.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 00:58:50 -0700 (PDT)
Date: Sun, 22 Sep 2024 00:58:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Donglin Peng <dolinux.peng@gmail.com>
Cc: javier.carrasco.cruz@gmail.com, kees@kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: ims-pcu - fix a mutex usage error
Message-ID: <Zu_ONyU6H0dZBKB-@google.com>
References: <20240921071501.263450-1-dolinux.peng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240921071501.263450-1-dolinux.peng@gmail.com>

Hi Donglin,

On Sat, Sep 21, 2024 at 03:15:01PM +0800, Donglin Peng wrote:
> The mutex_lock_interruptible should be switched to scoped_cond_guard(mutex_intr, ...)
> instead of scoped_cond_guard(mutex, ..).

Thank you for the patch but I already got a fix for this issue:

https://lore.kernel.org/r/20240910-input-misc-ims-pcu-fix-mutex-intr-v1-1-bdd983685c43@baylibre.com

Thanks.

-- 
Dmitry

