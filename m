Return-Path: <linux-input+bounces-10354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8F3A4489A
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 18:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E32BE19E488A
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 17:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D591A08A0;
	Tue, 25 Feb 2025 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arYogA2N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BC042AA5;
	Tue, 25 Feb 2025 17:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740504894; cv=none; b=j/8dlB7wvZAiXaW60/wTGiqwoQ5p11NxCFjBGkyVYFEhB7S+Cj0ZDmT15XaElKyRJIoaf62cBFcGarrmSNUevD4cDAfCJlMWN15dIaBkE3xdF13giJIKdWtS86pdF5jD5cEbYqZB4vJlbOwT3LPrNV4cMdl9zrYtSq40N2NB2S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740504894; c=relaxed/simple;
	bh=LR7pXcJosTSUOOsJpWPomSYJcINg8nEivuH9TAYjqA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbzqg07Ld6rogaDWznrijncKPDMpG6wbSsU3NL2ANfpwB9pW2+A7RSScFUkdmA3swLjgJTmzwE7oLE3+E8VA/Dupjsn7bowvcOLc261ns+UmDXI+slMizVOYYfKYYnBwWlFbvhl+k+SB3UZnRHb6BQQChbOJrqn+B6w94DrNLGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arYogA2N; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22185cddbffso531585ad.1;
        Tue, 25 Feb 2025 09:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740504892; x=1741109692; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h+YoddM30ZuOoLuZFWAILIJYkTUfH7Xy1b0eiSahC7k=;
        b=arYogA2N7C7wWAibA5PZTFIZPsPUxBVMbyFTQSKLxFkJALPIdxaF1+YMEf8nNjFfhW
         IrOFoX3fASWsFfmklAZcyYKy7EYcdGvsjoT3uLXIhtv2Et5JH41hb8aGi++UL5hnhhN+
         AUl8GGTo0/R9IObAVhX+38L3M1A5gRBiJcBG0gQgiNK6pkMTgdVdcRZ7LtuEx7mEaoRb
         lZtePzDA/B6z5QPCLN77RUO3iHfFHVt3Zk3jeHwu6Pi3qw7ygdm9W/pqE9HsIsNO5H+B
         di7tU8ze85VmCU4WK0/QYNQk2EOSwIQjoVTSJz6GenoJrlof5hPbSSqAL1EapsHmNBK6
         spxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740504892; x=1741109692;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+YoddM30ZuOoLuZFWAILIJYkTUfH7Xy1b0eiSahC7k=;
        b=t+e9OPKK1SYc7wePUatu1U/ZnTIBJIp/3x/05TAZNkgN2jcjHTFBZDKf4NY7i+sVGZ
         xEewGfYxVQ4QlPHp+untA89nO77gspxa7fW2jbH7unf42L59oZtTIZJV/8rFsKoNjjvx
         sPOxkQDzeLOYsM0u13ydtTRM4BQZi9YAeffRKmbXyZ6TSmVPjgVI2O29mvv0tCysLUTL
         /nTtaq2YeROFw097/DdWXDnUB/rqsYMkEgnL2+h3HOx0U0JhY8zjCrFce1+JTcIEx4T+
         tAXMyFhvsVimwsnXlDWI5/gk/5iOtvd1aGlquxmqHh2l0r5C/fPdE/UBVinaG77s8i0h
         Extw==
X-Forwarded-Encrypted: i=1; AJvYcCW/AFAjTa45EhbdL7bvtCHDD1/eiWx6hVu+k1dMP5lu+Zj+8wT3tUg+2yr6j1JnlM+F1gxncOw4IhPI+QkO@vger.kernel.org, AJvYcCWOCNAddk4l4BwTwKzDpCSsJG841Rn+FNvkH5bm4vdVjKtP+F/pGdIyFvlAI+ziH8DvpHiGozTrMptuBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGc6ALlB9q7APksOvVzuxSR5ghTAyYJsslo/T7AlOljAP5TT9X
	P5qKcw0kwoVQTa+r24eswUpxyic9OHnir3DhWUc6DADuNySQCH8U
X-Gm-Gg: ASbGnctuawhO8pX/4kIMmQ3rdlUT3p3GtDDsoF6RgnsKANqug9NDJdic4fLLNe+mw7p
	ETL/Y/m+FaZSm1Yge5LZgI1CDrJbJz2Gk619PHX9vkHGmL2xbx8K+NRr9PqrGsevLKPxcrzzIzb
	oD7HZ+GOFSV0bJ+RrL3kojJZ42mxGHUq1E0hvt+wn68lp7tAp32ee0RYBMURBm3I7MXs9UKRVKN
	z0ja5tjzL5zCLw/ANSYE8jjY1TuIdt+ktDLYDww57GJZjs1VwIkdTIBnBOg/6rqqX2WM/4yYU8L
	XgBrIYRXpg9iHG+JzvBHw6Ov04M=
X-Google-Smtp-Source: AGHT+IGzT8D98mm/xfqHVwKnnruGiSqgtsx9ZMPyvQeorwaPdEAalISlU4iJJJ1meGZlaeeWMlSHzg==
X-Received: by 2002:a05:6a00:3d10:b0:734:a78:2f36 with SMTP id d2e1a72fcca58-73425cde0d6mr27762695b3a.12.1740504892200;
        Tue, 25 Feb 2025 09:34:52 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9aa4sm1834621b3a.107.2025.02.25.09.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:34:51 -0800 (PST)
Date: Tue, 25 Feb 2025 09:34:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: goodix-berlin - constify 'struct bin_attribute'
Message-ID: <Z73_OabHseExVhXs@google.com>
References: <20241222-sysfs-const-bin_attr-input-v1-1-1229dbe5ae71@weissschuh.net>
 <Z71j73PPLO5AwkxA@google.com>
 <2cedc1f5-3a6e-46cc-a214-497f899fd115@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cedc1f5-3a6e-46cc-a214-497f899fd115@t-8ch.de>

On Tue, Feb 25, 2025 at 07:38:28AM +0100, Thomas Weiﬂschuh wrote:
> Hi Dmitry,
> 
> On 2025-02-24 22:32:15-0800, Dmitry Torokhov wrote:
> > On Sun, Dec 22, 2024 at 09:00:43PM +0100, Thomas Weiﬂschuh wrote:
> > > The sysfs core now allows instances of 'struct bin_attribute' to be
> > > moved into read-only memory. Make use of that to protect them against
> > > accidental or malicious modifications.
> > > 
> > > Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > 
> > Applied, thank you.
> 
> Thanks.
> 
> However Greg already took this through the driver core tree, as it was
> blocking the general progress.
> Could you drop it again?

Oh, sorry, dropped.

Thanks.

-- 
Dmitry

