Return-Path: <linux-input+bounces-7965-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7439C124C
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 00:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 269411F2384A
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 23:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C729121A4DB;
	Thu,  7 Nov 2024 23:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fsvNtZCJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576C521A4CC
	for <linux-input@vger.kernel.org>; Thu,  7 Nov 2024 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731021714; cv=none; b=djTpjFqQjfMhYWBjuNf010TZuCcpKaVjkoavPv5vdbpXvd19YBOPh8cVPbok0bCOaMqImK0gPO60p1FinBzc0P0fF9/wypzeURNYkGFkUIrKKI+K1JOtiZdFIsHT6wSUyTdDuBc6EDuVUiH51gRWrBs+dWn03BqMVWnHEfDQ/e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731021714; c=relaxed/simple;
	bh=q9z7PgAuTgJKYKo78tR+96y0QE0UMvEbtE28j3CcqRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+cE12bGG6z9rfFpwRgilUdGIPZjsJ31FYxoOu8SnVzatfXFcDL6EvatSqPhwaSSd5ml4Qsc0E+RFUY8szn9xoazyJJyiKqj8Q9elbgFrayrn2pJuVPM0OiCGFzInKYoKIrpwP49s+XgaALWR38XJZ3I+2+Z84df4vhq026ljj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fsvNtZCJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20ca4877690so21945ad.1
        for <linux-input@vger.kernel.org>; Thu, 07 Nov 2024 15:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731021713; x=1731626513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y8S/d901xnzYyAQHBXI60hwhCt6gI95qj8wysFOz0IE=;
        b=fsvNtZCJLzsEATlZSicZmIwGPDRPQb/yOAS2zD3SaCw9r7X4A0UFcM5ucD4HHoNb7X
         OSt8hhMcQUxWsFU0MY93jBqkvC3W3VToNt9FQEb5mJ6WR66kBYVlW6sGtiH5hI6rvoSA
         iJcBjVcid/81sHcMmM7dp/lG0n5PuNsIjI9oFcS8QA0RovUTgioBV8qOdx5xwiA6C5sp
         Ay8YCRmCxmvHju5q4jQuWUkno5P3LrmJfRdtrtwdIcE8xipwW2r3d+OqDZYPx50OJbOg
         9zmNhIfi/NrSCUtMoL3F8kwLnA1fuRRfgZhCBPGbTnWNBnRB/pKMPkVlAdBcGu0+hc92
         5QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731021713; x=1731626513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8S/d901xnzYyAQHBXI60hwhCt6gI95qj8wysFOz0IE=;
        b=gNmxERDE5231Zq8cjPV998kIx9izVvygjv8e/qwNvoP2CjBghuqGYXKRuXpfjHjy9p
         XY/tkbZszt1IO22Je2jKI/lqwQ6lR5DcZyZ36VnWaiw6emrJxdtHEC4yr3spGbQD9nj6
         kCmm05HXhe9kMgBsQ/GIYR0+a8/Ez5jjg1m7X7/i+AEyJJX1DwC4j0FtGXAYk6Pns18z
         OomekHRlUyctvUMIyfIiNN/XaR0YF/K7KWM5XrfEPmGUUaRCTf2QzhZqcfIE4HFnahAq
         hQDOVxSjlTLqREaDlukslVtfzAiEFslubUT+z4NR9hfZWitl6ml8/WU/koOw5vayZMQ7
         Hzvg==
X-Forwarded-Encrypted: i=1; AJvYcCUtHLiR6loRLAgoooaDcGD5bdf6MYXSJ4xhDtUbBEA6lDeb9osEtOJozvR/uu5GhKGH0BQgcfEf01GEQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9246BsYOoJFtVVzzkCZyPn8OjlwwaVk8gObc9kXdCdECfG69z
	jRb68VPDNP7Y6cZeVKNcp4iXIeFVVv5hV93XsT3X6nUC0HAslgT9IHTqZ1A/ooSibATsS+pY+aa
	zwQ==
X-Gm-Gg: ASbGnctJ6SGKAeUvP9g0Pg7kG0evMh9QB13YFXEH5LXsULjKbG4Vw0UGQDtGh/1FT1i
	sXOS46KK2jaz86ROr1Gxr8LX+Y4ekjEXqOtbED+DEOEWTwD4s6fydghDZBTBc9AJuZIeaYxb2O1
	+mi9StguTVr4r6WRnff3Del4vHE7CAukBzOY3BHDOcf2eO7IE0I852T+wHK7qfPc5YP9OGsKM3S
	7y6kk0HV1f/I7DDCPy1EpLgR/m7egSksRUDI8oOK1CVMt+mr044BgVO7pOESXwWw8JQ7vT9tp5q
	oWOI3JFdAPLQltc=
X-Google-Smtp-Source: AGHT+IFEFbAQf8I2GfAWhDyEHpKkoxJQe/psNNdqSAhgo2NIuIl52BNhUqi6pJJpSflkJOR6efMsJQ==
X-Received: by 2002:a17:902:dad0:b0:20b:13a8:9f86 with SMTP id d9443c01a7336-21174a0fcefmr5018195ad.28.1731021712523;
        Thu, 07 Nov 2024 15:21:52 -0800 (PST)
Received: from google.com (180.145.227.35.bc.googleusercontent.com. [35.227.145.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9b26b9bd8sm183214a91.5.2024.11.07.15.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 15:21:52 -0800 (PST)
Date: Thu, 7 Nov 2024 23:21:48 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Terry Tritton <terry.tritton@linaro.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, Aseda Aboagye <aaboagye@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Terry Tritton <ttritton@google.com>
Subject: Re: [PATCH 1/1] input: fix generic desktop D-Pad controls
Message-ID: <Zy1LjKNhvPcdwg5l@google.com>
References: <20241011195808.2201-1-terry.tritton@linaro.org>
 <20241011195808.2201-2-terry.tritton@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011195808.2201-2-terry.tritton@linaro.org>

On Fri, Oct 11, 2024 at 08:58:08PM +0100, Terry Tritton wrote:
> The addition of the "System Do Not Disturb" event code caused the Generic
> Desktop D-Pad configuration to be skipped. This commit allows both to be
> configured without conflicting with each other.
> 
> Fixes: 22d6d060ac77 ("input: Add support for "Do Not Disturb"")
> Signed-off-by: Terry Tritton <terry.tritton@linaro.org>

This patch LGTM, is it getting picked up?

Reviewed-by: Carlos Llamas <cmllamas@google.com>

Cheers,
--
Carlos Llamas

