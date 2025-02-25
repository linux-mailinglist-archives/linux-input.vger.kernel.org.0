Return-Path: <linux-input+bounces-10312-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2134DA434E1
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11C8F177550
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814BA254875;
	Tue, 25 Feb 2025 06:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lgmtxb7I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154501DFDE;
	Tue, 25 Feb 2025 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740463495; cv=none; b=SItIvEAkDVCRNV5ylbbaVL8zQ4tGuJhRjXHNqj7QKxTunseyPg1VLuzE/XO9cMn3pXJ33RWtCE40s9izgyG+FGvjHpJPumhaajNO/hOszBOFv5Z8U2c0Jw908lY/NkHPAMs6SCT1mUalEOYKJcNsPRzLtQJzw+dB0J6hW1tCFMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740463495; c=relaxed/simple;
	bh=Z4I6G+KQDUqSNuTHaF8gaLVDgZnWE5kjj0A1LUt2NyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/Sn5wbJOhJlJZ3ozRj05WHk5y1AXS2HbAL5o09uj0Y98j9i5z89tFm1C53zsNHIZlTGcuePi04g7m+Y+nqAwD8mYJvgBeYc5qJIK6zZciSmtn8WitKKPChEWmXDVSJau1xEW20B2uLwTQuD9rCzqfwSMeKSFGZsrTavpKWHDCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lgmtxb7I; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fa48404207so10492638a91.1;
        Mon, 24 Feb 2025 22:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740463493; x=1741068293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4zkvRmKXEmTxPkOdAWhiJyLkOf63f0G+ANIPfpX19lE=;
        b=Lgmtxb7I7hlG7y7VQvWB5JX+nsDIppKGqzqDYpKl4FREr034snSV6cZwBcNCW8+xzJ
         BDmaF5P2J6WkqGK6vC0rVcdaquuA3H7MNlxOcjS8euseDNhuItvcgAH3MFcz99Skbx2I
         3my4FF4Y+devbfSSumcnN2cT5woRHy73uFpT5IdV39XfFv82cNh8fL7dFbkLi3HmXQu+
         U74O0JMhAuvkCe7CaioJCky0NBENU6lnyqhszpJ6SflryGbyRPUvq31BZFGj7bbqW1e7
         x3rImyhzgWt68ehaUH8KZz/iwuf+KfdjNKWanapReki8LS+LhEcz71cOsm+8WnQliQW6
         KdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740463493; x=1741068293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zkvRmKXEmTxPkOdAWhiJyLkOf63f0G+ANIPfpX19lE=;
        b=rTKV1TSJpGsSfBrCWRI3XtuVwoasjkdwKvyUGcbw6IKEYeK6tAGmqumLE5hZVOVTHv
         RsNRH1JMt0AtHnRQVuz4K1wTie4sevUnxau8waE7dUeCL5LEDwQXqgGmsIIcRmVzJVFs
         f8FT4DrRUHNeRLkBntXbsRLlpiFcQp4piQips2Sl0CP/ghBxo1Su+2IgV0t0TjmsYlg2
         LU0z8LuBLGUSDlsa54/NSEBcRg48I0YFVv1IjfGJjDwIBDgGlf6lGIF7B0d95TRZDNmX
         IWdZwoEIj/BrEffKYKjJPSk0TL0fh4GTbUaEX7ogmxbcOZsQZWJYLMVoaDuJGsx6lmTs
         RHWw==
X-Forwarded-Encrypted: i=1; AJvYcCWEYqEBQLL9ZYADnSy4/aLzhf2rciB21d7imrEWbNo0bZMuEDnAYb2lpsQKVJ2NMawVrHW4TSNX3rWSTQ==@vger.kernel.org, AJvYcCX26RBQwponVvJ1vs7yDvrs2ThM1smDmQltOlNoRQlvs6ooDntA2qjAGVPMromxSDHHPWz8X2bVjvGoDaDi@vger.kernel.org
X-Gm-Message-State: AOJu0YzyaqE2sJp/5svvoKKeDmWHdZHwuU1rt4YNd0gBQK2bznuRxqGF
	6JUbi+A3C6Gx7SicQ9c/sSPWF+z6RI9e7FcrnwerlOi3Z9LTzvRP
X-Gm-Gg: ASbGncvfTqCG4n4KLbxzP/iDzp0cE/d1DUkmjEg8Opo6O3Y9Ey9s3IOHAuoYvWlCFVo
	5qwX4kCQ0keNhMS3cf3xWHsofeSh+sGJnnweumJRXBB02cg0fukIx4zPCy+Lhutjbj57246QOk2
	D+kwRyLwFAnLyGeZykXx0kPBXWJnoOeEydhvVMnuY/NnKz1LiZJXy6Rl/2iZBKVqkh01VB9/K98
	JwNo0x4mmKX7JSzIWwlRbX8mimMc0TknVza+m8o3MS8h+aBiPq/MYLic19IvTjazICP49uyIw29
	HFC9xTckV/kbokFL1hxuNpE8AAY=
X-Google-Smtp-Source: AGHT+IGdmHKMK52laYm7fxvZNLpDI+eJA6lL8wlAO35OSYb8dAYCjQkrV+bwKoLB74xz37AjRW0CsA==
X-Received: by 2002:a17:90b:2d0e:b0:2fa:2252:f43c with SMTP id 98e67ed59e1d1-2fe692c8410mr2750547a91.34.1740463493213;
        Mon, 24 Feb 2025 22:04:53 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a00ab76sm6129795ad.79.2025.02.24.22.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:04:52 -0800 (PST)
Date: Mon, 24 Feb 2025 22:04:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Weikang Guo <guoweikang.kernel@gmail.com>
Cc: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [QUESTION] Plans for GDIX1003 Support in Goodix Touchscreen
 Driver
Message-ID: <Z71dgXzq_utoDqd7@google.com>
References: <CAOm6qnnhR9++REgtjhZpqNXkBbBAZsGAY8Oy89cXUF9S=Vy-9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOm6qnnhR9++REgtjhZpqNXkBbBAZsGAY8Oy89cXUF9S=Vy-9Q@mail.gmail.com>

Hi Weikang,

On Tue, Feb 25, 2025 at 10:04:41AM +0800, Weikang Guo wrote:
> Hi Bastien, Hans, Dmitry,
> 
> I am currently working on the Ayaneo Flip DS device, which I installed Kali
> Linux with kernel version 6.8.11-amd. This device has two touchscreens,
> but only one is functional. After investigating, I found that the second
> touchscreen has the device ID GDIX1003(confirmed by exporting the results
> through acpidump), and upon comparing with the current driver, I noticed
> that only GDIX1001, GDIX1002, and GDX9110 are supported.
> 
> I would like to inquire about the following:
> 
> Is there any ongoing development or plans to add support for the GDIX1003
> touchscreen in the Goodix driver?

Nothing on my side, sorry.

Thanks.

-- 
Dmitry

