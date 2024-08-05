Return-Path: <linux-input+bounces-5350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D039480A1
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 19:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04F021C21FFC
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 17:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FB015EFCC;
	Mon,  5 Aug 2024 17:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B67lwN0l"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D995815EFC4;
	Mon,  5 Aug 2024 17:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722879818; cv=none; b=t6+xhRwQ0Ug1si6hLHg0vvfrWF4fdBy/2+PBaq8zAMbD8EJuB7qJ/DQpjggTFW+4YLbVf9XfcFyC4W6gTCY3iTedM59YJ0p5+5L71MIqcEUk4NIuF2T7mpftK/9MVl7r4yqRef286NVUd84JuA8z1AaWZuqlix4wgJQwqywcsJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722879818; c=relaxed/simple;
	bh=7iEvSy8XdJU+7hG+oLTLojMm0JoDRp0VXX9Jh2e8Ryk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYStYGmltrC29t/ii7grcgf8tblunc/taDPZqgPOkOV4YU7+hcyEjmC3PH9ekg6VeGlaUUibpDmHDMqm3v2Pa1q/4bNl8YpowxOd4r/YcsLF+6z9Ur90YHQGu/Tz2ksXd2ocvC05KNpYkxfonThMyVBXneHrEsgylXvyjFjmfHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B67lwN0l; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70d18112b60so4499280b3a.1;
        Mon, 05 Aug 2024 10:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722879816; x=1723484616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7Qb26YQiKVCF2nelzkRKW8oh/lfGZj2sRLW9AxbmkE=;
        b=B67lwN0lg8U9/bGuX0rsSpUe5+MyMXLLc1+iZpO2OQK6fKR+HqeHRuCesgpdAutkY0
         rRKZOStx/KTRRBpSOkNRxnOSD9p6bLz5MxMRrzZ91GTQWHOt8N9WGtjbUoZa6y4QNAn+
         AzOgtw/T1dIUx8BM/h7ZWU5AlOjJnji+E0vKuN5xyw9wpOjPxjccN45dix3JdogPs5he
         YiBkZPefCGP3kvjPwmUSXeSbQKK0RMzfa36IzmtE1yTG4wK4WjTDydico83W1OjS2CcL
         LYo9h7Vf4Xp6PgvgP5a9aWVzJ5aw1uGlVoK+C1S69mM6TEhcRHbIVBynwSmuLX7exazW
         sGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722879816; x=1723484616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7Qb26YQiKVCF2nelzkRKW8oh/lfGZj2sRLW9AxbmkE=;
        b=lbyhos6vHxFTkgbvTaLbZxNNZ3Hq++huQ3Hcgzj6H0N4RxBuaRkEZc/hfUTGltaPa3
         9ry2A4F+ChUM+E0ZJ4GQ2Ld7xLq08tTHlascq5duH+2gw8m9CE5WI3/pLFMZVZSYwMSq
         g6XfWXdFwqUQc6YdGU2wnlV+TdQOxH+H4A/3chCD4Lz0zRrLUebWh97zDPSkzGlqXEri
         ZiTkazSQaZksQbDVjXq16YIfBji63IbYsz7Hry3l9rte8/9/ELL1R8ybzidUl6EQcFvu
         rNr2lDbazzdO9AV/CCRGm1wxWD83aglENFQDxUd6BYJ6e5wjkkojpkLjER1s3gU8Osge
         in7A==
X-Forwarded-Encrypted: i=1; AJvYcCV1IKcBR9zXrjppMXzM5RRqU6tnxXz4uVsq187l06/Or8Ex5Qm9F9MKB9f2vhQlFebbybH9eLCbUHbBhlnlxI0EesqlfRTLVVcC8AgHtSyxnWk45ReN25w9as8Csm7tnbXTFmn0EgnViac=
X-Gm-Message-State: AOJu0Yx7bOzsz6NFOlAJEV0knFdhuB25r26KC4jqgTd6LySUN7gJyGFq
	n/cIlTfTOe66u+TQtctKTH8yOjsgWBZ9B7CaK9aC7bMYxy+P/ly0dWjZVQ==
X-Google-Smtp-Source: AGHT+IFDYClWiT+zvczcHNTpm2EDfLIol4zOVM0VQ1yRGAj3RMkCqwiVkNFYsk7lT4/UwfFXapDdow==
X-Received: by 2002:a05:6a00:6f5b:b0:70e:98e2:c76e with SMTP id d2e1a72fcca58-7106d9f5bb3mr19098035b3a.6.1722879815998;
        Mon, 05 Aug 2024 10:43:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b116:76da:13a7:247b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec42759sm5671059b3a.69.2024.08.05.10.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:43:35 -0700 (PDT)
Date: Mon, 5 Aug 2024 10:43:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Input: ilitek_ts_i2c - Fix spurious input events
Message-ID: <ZrEPRW7Yu7kcgOu6@google.com>
References: <20240805085511.43955-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805085511.43955-1-francesco@dolcini.it>

On Mon, Aug 05, 2024 at 10:55:09AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> A couple of fixes to prevent spurious events when the data buffer is not the
> expected one.
> 
> v4:
>  - remove err_sync_frame label, return directly instead
>  - removed reviewed-by
> v3:
>  - added reviewed-by and take over series from emanuele
> v2:
>  - initial series, sent by mistake as v2 instead of v1
> 
> Emanuele Ghidoli (2):
>   Input: ilitek_ts_i2c - avoid wrong input subsystem sync
>   Input: ilitek_ts_i2c - add report id message validation
> 
>  drivers/input/touchscreen/ilitek_ts_i2c.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Applied the lot, thank you.

-- 
Dmitry

