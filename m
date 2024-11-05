Return-Path: <linux-input+bounces-7865-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE089BC4E8
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 06:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D11FC1C21406
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 05:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98C5185940;
	Tue,  5 Nov 2024 05:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kulZ+AKq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8701C383;
	Tue,  5 Nov 2024 05:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730785760; cv=none; b=dz1voiGXQ+7qO4nCKGdH8GvZGe0jT5KibJWqDMcitdv1rljcmXBi0T50g2Ywr3sV0JVG74xm3psAYCdu9WnnAJtAxlT+5DnnsapZiTKHIjVnieatFlRZcTimBvBtufMtHXL68hkxuU7V1XGRwAsOgFvEFRc3feC5gN+t5bernEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730785760; c=relaxed/simple;
	bh=QCc1CcWl8qzd8Oayz0qzgWnGz7p/UNSbTN3wZFKIjOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5uYJmE/Vqg8/Y4/SQcdeiUpaeAD+Rd3DDx4Tg+bxG24vhTy6fwKjsHX1CebMSQXh+bm9xX4SM4Zt8EigR9VX6n8ykBmxsAlXgxGA8kLAIeGrpZDKY7KrI/nG1bZ4HbtIWmMCQptOOW2WqPy27XJ53hc+ndrhDrLPfm5k9DsCYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kulZ+AKq; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ee51d9ae30so2961498a12.1;
        Mon, 04 Nov 2024 21:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730785758; x=1731390558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BcELZ61LW1II9FFVnT5q9H6VhpRQxLxD7r/nck8P+Ds=;
        b=kulZ+AKqS/l/iH/4nqPph122mv571eK+4txMbAqGWiF+EPakvMDvKG3M0TuqK/XKEe
         6uFQY/I0Ekz6tBNbtp3pXJ3NpKBy9+YMdEkLdVCLmJopgIKdrXPdpNSh+t4FkvHMKBnd
         v/HCUau/74B8PGsxw9nDsOa7sm1ng334mAX5m8HUii0uIh6ykkY/XO/kz92Xh3CnnFa5
         h0DZbMw05bbh8GWTn4fOw9kUxJzrqNH9YccTTnRSoBzt97mvjMtQmkmlBFWFYMzovKdz
         KPJYTZT3QioGaYh4NJJJGuPko3j8oC8q1VyrTeJooWbA0mP2A2TwEJengnCe1J1rt59K
         ptlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730785758; x=1731390558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcELZ61LW1II9FFVnT5q9H6VhpRQxLxD7r/nck8P+Ds=;
        b=IU7VlXLBS3uUlKWB/A5ccAdXkqauXxlQITF/8g4czurFKG2nobu7w1f1db1BmD7/ae
         ALoPET6medZKVT7QF2UdhqVwguo5asjyEwxT+C9320dx9sYTW8MHke5f0ARqdlG7mUH0
         jfBdoyCTWnkBfAz6fmG7LNbjAQGShAvSY6cK1qr6FX7wn/Kafe9Cn55Y1eeVs+A4Wffm
         le4xHkW2yAgU98mdoUR6GSIiFXVu26Pkv0EryqavI54biTcEj6T2z5ZudUht6vICg+EC
         BTQqICZN5kix5BSGHJZ68oWO0UuKFzUYcD4A0gt4oYp0LgOpPKPrNQLUMOj0yMIaFspg
         e6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUSPGkbNWpxK1YgCyncQJx6z/tnMxRw8thK+QTfZgpG7e+FTYS5jT1wAkZBAzzi579TIAAqvAvt3QO6AKJsfu4=@vger.kernel.org, AJvYcCXyaaS3qb8xNbUGYDDE8QI+t4ift3I0NBuCKfQxItrfnlzGovl8pUpxtsMdAPr0eYHgZ+crF4pHOHBgXj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE6CSd5sXEJd6rCL/yHkmZQoZoXPqsonsKNzrhm1/9nmZi/f+Z
	ZDl+tC+GIx6aZ8H7QID1MET6DJ9m45wDHP2ZFTpfdJvNPX8UPTzvvOObgw==
X-Google-Smtp-Source: AGHT+IH3Ib+k0PANQyehmWIaDu8nhrZF2Sv9GCJZqHN/w7XITkFwND2IBnCQ+adLtOMtFRs71seSRg==
X-Received: by 2002:a05:6a20:918e:b0:1db:e90a:6b24 with SMTP id adf61e73a8af0-1dbe90a6b7cmr5618157637.25.1730785757688;
        Mon, 04 Nov 2024 21:49:17 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1bb4:1f23:1031:ac0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc315ac5sm8497972b3a.200.2024.11.04.21.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:49:17 -0800 (PST)
Date: Mon, 4 Nov 2024 21:49:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - Fix a typo
Message-ID: <Zymx27wcWCs7v7ui@google.com>
References: <f3365eab359feb9adc6e2dedcffc976f3b272d8b.1730538673.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3365eab359feb9adc6e2dedcffc976f3b272d8b.1730538673.git.christophe.jaillet@wanadoo.fr>

On Sat, Nov 02, 2024 at 10:11:24AM +0100, Christophe JAILLET wrote:
> s/synatics/synaptics/
> A 'p' is missing.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.

-- 
Dmitry

