Return-Path: <linux-input+bounces-7050-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C4E98F2DE
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 17:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 267BAB23382
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 15:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093DB1A4E98;
	Thu,  3 Oct 2024 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OY4zqSNU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968911A3AB7;
	Thu,  3 Oct 2024 15:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727970186; cv=none; b=iiokSl2wMp/JUmo5uARMd1meDjvUHTWDvxWNmaQFl21v9Okxrwprupu3U5IvCBRTrqHF4ZrZQjBnek86RS/T5PAlBawacRFugVq38fMaZtRSjSeZBlofBUXZ5S5kOM6jpLpI6AwI4x9wRAk34SPE9MMAETFydkahYd9etQyUcME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727970186; c=relaxed/simple;
	bh=prZshJkfmabyyRAwyGJtJ5vXD8y51RYE0suunTDUwzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8m4Wbh9PNiF0LjbhQtF2sadzpEJ5dtaY9SrEYvXceMCZ27EsGLH9BHwPei3CeV18xVdxEIVsUq+hoalqu+t6c86kKDhRZ9KP8vTNMRL0LcJXCX6oHpyb5A/Dywb4bu2XSmS9LDGkIRIMHmNGmhTacmj2fN10DgZEgJLjycK/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OY4zqSNU; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e0b9bca173so883469a91.0;
        Thu, 03 Oct 2024 08:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727970185; x=1728574985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hURBY1lzO7REooK5mjNAS8KwXTStCTB1Lf5ingG7fcI=;
        b=OY4zqSNUv7nK8yWbxxUKqd6p2PJja3aDqKmPMFfy/L7TzjVuaVUIkQ/ijIYQ8rEP3o
         xX3EIRZspOFKrnPSwZWGqlhVs6TYy8481o95WxW/jw0g94lrXUG5GhKpIgsyKYOYj8gZ
         djFY5iNeT7zjdiS4UQqngVteYVq0R3FhL5X/TSJOR/zmiyI6rply4s7GIP4OJLp99vZk
         w5Ku2Ke0JoJSOL1zQJLAKF3YhQgfMW90lzb6kaXasCuSFNyyIg9cgJJhKJBrvTI+2UP1
         oYjhJWS6ja3W/+huqSRAECrKVOhDs5bKHK6iR+H/PTquAAtsy3ISdCXr6G/bJ9MB5hpl
         vhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727970185; x=1728574985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hURBY1lzO7REooK5mjNAS8KwXTStCTB1Lf5ingG7fcI=;
        b=EL5sTlxB+XQZBC6cuija4uU97ffCPXfCyS7qK1XJ10rGjbWfzZoiySayox7byYoD9C
         YlvIZYpV2m7Rg9LB9aHmq6Gm5ItQOTKQKA1ttaP0GAlmTAtwY4lZMTMtTx//FhR0f3Nc
         PwCf1MflIcW9zqsbspxMkXsqRzqPuSDS9ABHipy7dgS5xTTfrrzKcqWcAnfYlxwuJOqj
         IuZHd7Zi2QdfUffEPdywSqy3e5FsfZKkpCrRfCBelcUEvjRR8BET/TaOEQ8ksJDL6Mxv
         Aft+TPnVCPaRCNV5sxsfMWH6KXYLrsqdqLg3B6rQAy8rqqbFVMWFKw2YSjGocNZXsLnY
         Sd5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+4RO1wkir1PCfMBUOQjzgBg6H59ztC1QnqFzA0iKFrDvoHpmwPNFY1JdULWQ8VlIbbFbfML1A4uDuHzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCYNoB6ZC0QoYuo4yYwwuluCmwSrKAEUBPNHIRJO84iUTqaPit
	CzGjz0XrKQu/w26HuRDOn7BDlqwizIpVMGyXHIPtbuLI3nj7yVzonl1nGTiT
X-Google-Smtp-Source: AGHT+IEIVgdQOv2W2/X46FmWBKGioeSwRMlz1/K7+Yl1EL+XxNm5Yp9DJAbwAm9JTMiGtaBP4UFqpw==
X-Received: by 2002:a17:90a:66c8:b0:2d8:7804:b3a with SMTP id 98e67ed59e1d1-2e1849613d9mr7746895a91.26.1727970184586;
        Thu, 03 Oct 2024 08:43:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fba0:f631:4ed6:4411])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18fa55002sm3917096a91.50.2024.10.03.08.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 08:43:04 -0700 (PDT)
Date: Thu, 3 Oct 2024 08:43:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: jingle.wu@emc.com.tw, josh.chen@emc.com.tw,
	Phoenix Huang <phoenix@emc.com.tw>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: elan_i2c - switch to using cleanup functions
Message-ID: <Zv67hbO1gDqgwxNK@google.com>
References: <ZsrBC7qDbOvAaI-W@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsrBC7qDbOvAaI-W@google.com>

On Sat, Aug 24, 2024 at 10:28:43PM -0700, Dmitry Torokhov wrote:
> Start using __free() and guard() primitives to simplify the code
> and error handling. This makes the code more compact and error
> handling more robust by ensuring that locks are released in all
> code paths when control leaves critical section and all allocated
> memory is freed.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied since there were no objections.

Thanks.

-- 
Dmitry

