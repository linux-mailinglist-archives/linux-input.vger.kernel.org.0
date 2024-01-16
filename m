Return-Path: <linux-input+bounces-1286-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDE682FCC9
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 23:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A2E1F2D490
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 22:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAC25FB9E;
	Tue, 16 Jan 2024 21:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPhVZgNU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0992321B9
	for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 21:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705440737; cv=none; b=QeG0AnjvlycsNj0uHG5uA5kdBxKdAT4bGOKNCbQ34EuJLZ4SSxKUAYASlZpmqrdtTGPsizvZb30fuNAx/f5yo1wkYFK75yVh6MAWcIa4DCfnPEiZ/YMsJ1hXNLuEcJVSshkdsqGw6HNyJ4v01zTQU5ryBZIAsBqr3eEOnXxlyfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705440737; c=relaxed/simple;
	bh=YAgupWKtvpt7abZb8CP9BmoSxDVIvPk7rpYnqZolhG4=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To; b=WXWm4EAmDcXAGB8muy02jkgRYix2MCq4shTl32kS4hvDiVAW6MmKryrE/t11P1OJZnm1DvCQOqWgtZyXB83koqvz16ORUcgr6BhLM4aKNq3naOR44HZEIoovyRH+tyfVNblRZT00aNFlZwDat5d0VcX4cdM4chr3El527PD/62o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPhVZgNU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d5db9eb0e7so11171215ad.2
        for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 13:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705440736; x=1706045536; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W+nZ73cS3qEKRTlq4O+SjSGQxovjWxiS/9vBTocukyk=;
        b=IPhVZgNUKLGPhOwoLY1Jav2OR9EamvGsy03Eh2pCtLnhOpQdfiM02/4wZlWBzlJZM2
         pbujiSt2sTgSHWx4sWi+upSZURxqUu3YUb2EnLmyuLw3pwB1RfQ85PY4r2uwoLWSVfGv
         31W0UV1JlR39SKSyEQvf+DpJVrTBfFZd/FuEf0nB9GeaaZw1Hh9URYpmqcnL7CSLQSKN
         1uQpuS5aHsd2d5DThCjHNV7ejBnrW0g4ZPnTHjfU67FJufvFYzfIdSHnNWAiLHKiRGXU
         fI+Z0NvfGYA/VwpQtbpc1YIymmKlKJG7TW1C92YPHW0I22dSZqMPqiT11eaj1pfYmUOu
         eCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705440736; x=1706045536;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+nZ73cS3qEKRTlq4O+SjSGQxovjWxiS/9vBTocukyk=;
        b=UdfhMwn0WubTyF+47+Nv/n0y4g2ShWppiU1JCfOgI7YsoiUSnYAcBi57d8tqwMPoPe
         HXcnGe2ZAuK1GxoSuTkVhIdSw2uasfhLHbnyfhwk4A+8wXnR6E1PbHnlkqHE1mT0SMs5
         p4bAr7R3jL+HGn/b6Jw4s3w0y8gNwt6EEJfoNGmw6zTS+qLpaD6h17zo6DmuIdINq5DA
         TcZmzK40u++8oKeXpFLJWQqTNK6Q9f0fMzS5Hkf4KWivD6EZ8ShWLIYg+AzP0e7Z8iWj
         TTUt3VeXtmQ93Ap1RsbYQba1QU7sA3uN0zPgOU5335ZvF1Fu7wLwO4CnFoBvQI+0rNUd
         SvPA==
X-Gm-Message-State: AOJu0YxTp+ooHPZ8IQH0EOiJTvLgTKFfuzqF6aCh4b6L+kJuLVtq18CO
	8oxj58LNQHxuHlFM4uoZFbI=
X-Google-Smtp-Source: AGHT+IHC09IFq5wv4jNq16wELtJAW9BaJVZhfgXqpuKr8x8CNl2jyuUGPeeiiWDEUY42a/85f5fWPA==
X-Received: by 2002:a17:903:249:b0:1d5:389b:d43e with SMTP id j9-20020a170903024900b001d5389bd43emr4803160plh.5.1705440735760;
        Tue, 16 Jan 2024 13:32:15 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5c15:9a6:f612:d37a])
        by smtp.gmail.com with ESMTPSA id ku15-20020a170903288f00b001d3b258e04bsm9811655plb.248.2024.01.16.13.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 13:32:15 -0800 (PST)
Date: Tue, 16 Jan 2024 13:32:12 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] Input: atkbd - Use ab83 as id when skipping the getid
 command
Message-ID: <Zab13OssO_-risMQ@google.com>
References: <20240116204325.7719-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240116204325.7719-1-hdegoede@redhat.com>

On Tue, Jan 16, 2024 at 09:43:25PM +0100, Hans de Goede wrote:
> Barnabás reported that the change to skip the getid command
> when the controller is in translated mode on laptops caused
> the Version field of his "AT Translated Set 2 keyboard"
> input device to change from ab83 to abba, breaking a custom
> hwdb entry for this keyboard.
> 
> Use the standard ab83 id for keyboards when getid is skipped
> (rather then that getid fails) to avoid reporting a different
> Version to userspace then before skipping the getid.
> 
> Fixes: 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
> Reported-by: Barnabás Pőcze <pobrn@protonmail.com>
> Closes: https://lore.kernel.org/linux-input/W1ydwoG2fYv85Z3C3yfDOJcVpilEvGge6UGa9kZh8zI2-qkHXp7WLnl2hSkFz63j-c7WupUWI5TLL6n7Lt8DjRuU-yJBwLYWrreb1hbnd6A=@protonmail.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry

