Return-Path: <linux-input+bounces-4032-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0863C8D7AC0
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 06:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB53F1F22255
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 04:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F15EAD7;
	Mon,  3 Jun 2024 04:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jc+Sp4nU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C718E02;
	Mon,  3 Jun 2024 04:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717388663; cv=none; b=t+09z2h6YTgHNsw1tzAxz1K355CkSun+HR5OP0iCU8Fa/yFnGLTkQ1nHCu7xV7HYOWAzzFb1FAlxjy5aQ2WS9riES98SHe+tPneX1dsJbxQ0ax5EmO6HK9PhsIRmt5wJGTJmaLcgKwTovtmhHiu2owjLtbRxLwpxSsyRJZ5Q++E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717388663; c=relaxed/simple;
	bh=7+AARR9EM1lImN7ABWdHMnV6qmvU1VFk6uEUzZRdd8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luNgt1FnywPUNBRMHcupGB1NfRLZe6pXwqo6uukK8jQH02pTP+9aSmMpklJN9Fe/Rcivu6Uqag2AWH7CwQqE58+29S/i+WHYNOXroP+JDGc21gGy5niiTCPoQgI1q1Ogoz1UlPwU+rRcxXy/RKmqfxvY5oqv1uv2uGkW6T9bqhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jc+Sp4nU; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f4a5344ec7so28288365ad.1;
        Sun, 02 Jun 2024 21:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717388661; x=1717993461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jlVcDS1I5Bxaw0wfjWq8Hm3Z3QjYdFcFypu8e1ti3i0=;
        b=Jc+Sp4nUh869WTixzyV28/JeSRQam1wYfbzweasR8TBJ1fYbNvT0vKaD0Fhva6I+aO
         9l/6MHpbzZ92l40mg22iiMC9f/6WOx1RE0rPObjo9iViDld0+To1kxzzWjc/yWnssjr2
         UqHA6SA66/FjvDBfbr6NWrelShE7GpT9JemeYkEUDb25Sl8AMB9VPRYLPNAFU6Xrovpj
         WQriijPoFwxyrT7pifw30Fe0MZN7qeQ6zl1H8k/JuaYb9yrkoAD3JNNk/boggKdmCki4
         u25+CCEaa/ruZbKCiOQPBnXM4ktAxuS5dJwqASymu9s7/hvGKKHFDZZ0zpDnGY6wX3Pw
         vpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717388661; x=1717993461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlVcDS1I5Bxaw0wfjWq8Hm3Z3QjYdFcFypu8e1ti3i0=;
        b=JcVBem3eL71tJnXYVHjpWOd0b7AwLqRWvGC8Qff1zaWVTkYiOR50R8yjjXnJZ2JE0H
         pVeTd1I5nEC+N3FWzI1ceIspJ/eXc+WKAOHk7DqKN+74faNwf8cfOsEHkXCo9URGlBCJ
         kYc9/Ymc24R9Q6uWHW5PqRz5odWyHc8TdYdvtweLwCVZQqYfncPQDv/5WZua632JxykD
         wYbH9sDDWDYlW6gUG0ZwVboS0gviK8n/CuA3CGn64WlzlZonjRXD5pIW0uU8i4Tp3CzO
         //BWRqKrRtKA2GdbYN+X/zGzPgXaPunNW+za27+DOdIjaUe+K2aeD9VvMwcwJlrodpQL
         TfBw==
X-Forwarded-Encrypted: i=1; AJvYcCW9blYL/300h84Xuy76Bv0HFQKo5daYV9asWp+TjRizIZQwUyGZuzPAbuOaUSWkxDGB+DUkQhJS3N2eFtSNrXj1OP3E4nUzwi9QGpNT
X-Gm-Message-State: AOJu0Yx5h6e3J0A0m4yGIzD5tqXB+8ohsNBSjlJL8dkYO3EHSZmnXdh0
	XF0xT+IDO/gwRhl1oGJlwB1pHr5lJ1n2xt3Ot0q1Tiw3QnlkwvqNRmY4vA==
X-Google-Smtp-Source: AGHT+IGXt0fnlq6CpCAtwReNBByWPtMcGO/yr7sbU8IV9d6nmLBLvr+Z8wrao2HVo0ZNolIaI0QHDQ==
X-Received: by 2002:a17:903:22d2:b0:1f3:830:783e with SMTP id d9443c01a7336-1f6359f183amr113258965ad.20.1717388660562;
        Sun, 02 Jun 2024 21:24:20 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17fd:ad4d:2690:4ce2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63235aab4sm54606685ad.71.2024.06.02.21.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 21:24:20 -0700 (PDT)
Date: Sun, 2 Jun 2024 21:24:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: tjakobi@math.uni-bielefeld.de
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add Ayaneo Kun to i8042 quirk table
Message-ID: <Zl1FcW36Qh1zIi5t@google.com>
References: <20240531190100.3874731-1-tjakobi@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531190100.3874731-1-tjakobi@math.uni-bielefeld.de>

On Fri, May 31, 2024 at 09:00:59PM +0200, tjakobi@math.uni-bielefeld.de wrote:
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> See the added comment for details. Also fix a typo in the
> quirk's define.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Applied, thank you.

-- 
Dmitry

