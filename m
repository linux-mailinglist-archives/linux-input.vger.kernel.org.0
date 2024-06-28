Return-Path: <linux-input+bounces-4713-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA5291C8EC
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 00:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704D12811B7
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 22:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166B680023;
	Fri, 28 Jun 2024 22:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZUHYL2c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D2E56444;
	Fri, 28 Jun 2024 22:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719612429; cv=none; b=GBwRvhTXWMRd9OYGYvWfClSYkPKitCk5hYFWsbBKZdFp/oxHmo0SeINWbXSweplU48gsvzzpUk1U07cJagxoVSSOocUDE1KPeZ7qMpQozyuGAjahPdQReBkKUDpEAB2zMTzxr5uttEvCdmaM4e3QQvUO8QBnvnGYHla76Bv92oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719612429; c=relaxed/simple;
	bh=GET8hi8INSTSnIgy3IYdHk0cgLUUvIuAVA6DIm9jUGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBvgE+O1z3avePfPElC9LXgaaaRZkwIS/cCT/lgZQo95SPGq8qButmijg3BiOWZk4atg7qorQh7+/gW0MTF3jBuvaJ7tQXSl/JIDDxvUQJziJlWd0b9OFf8DzbDaTS1/7fYIAOOCVl1P2ZUox0k3KaHgfEWPNZF8q0r8HJfzQbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZUHYL2c; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7067a2e9607so934556b3a.3;
        Fri, 28 Jun 2024 15:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719612427; x=1720217227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vPIh8SA0JDwMavV+AJXobT17jvbZvr8sqABjnH+0eqk=;
        b=KZUHYL2cJHv7Hw2ZIzx2Q5j+JNqI206roxDuZ+5k7ubU48cK5ZFFQA3/DaT5VokCw0
         q6H0z2NqpAr1iXgUJzlTXPdDAsQtcAw2pT0oWrLxXCsalnde1CfKrjvBajjJulPGSUgy
         U00JWBcp3dpOHW+gYcpxoyD0SutWUJsgGuOVOxQTPrPhp20aTwA7HqmB62sJLkmGy9sb
         lwoPdBwyL7mFJ6Bd9UBho0oj0RpA853wb5tgDKzRgrq6eVg0P0fk0HkqOw6FZgPlVvyg
         iY6IRRb2+7Pz/cNArHi1XSyayDwciOV8uU2ikRnVA4Fz3oOoW+eyJWSVpCXnmAj/epiT
         Vg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719612427; x=1720217227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPIh8SA0JDwMavV+AJXobT17jvbZvr8sqABjnH+0eqk=;
        b=rpPIAVN/TWTfvfaQjqVw2kTw1PnXLn5Us1XviQh/39vi74NmJCdjDTSBN/2bA4VqO/
         YtQwIFILRHaabrYHd+GJL7LKSvtIDs+b9v1C5Y0Jjh6/2FssGvJ1od5RK/YT1ds5qniM
         AxYfwtw0x+x0b4+AfjFr/TVris9eyb8h6+BeIkkWGR5cJs8xvq2l/gaQDM+tv0u4On+D
         U6Yx5bk4MH2iIiWeCTLhqj2ORjQlaNDv2zHkdXK1gDycUuoI0tZ4aQYEuYD0NMIPPjlf
         tpVhwFZCz6oiNNbu5Oj3kv1fJghcLPbkOdfbKCR37dROsciSfwU7c3amC8D+96J8UJ7H
         yBPQ==
X-Gm-Message-State: AOJu0YwWWMxOuNFUFb/AWfUnUHPr8AHv83M2rkfIzOOKZXxiAcZNdh/3
	8tFoeeeHkhHmycaIYqL0Rl//ggYc5gilpNhS1AE055wEIvbSjJghcQHbmw==
X-Google-Smtp-Source: AGHT+IFsjhznDCLubkZ/tSZy9BwuqqKHvwCWhVWI8DgC1XBdFThJs+Xm6891AnxZFerUsdnun+Wtsg==
X-Received: by 2002:a05:6a20:9185:b0:1be:e265:81fa with SMTP id adf61e73a8af0-1bee2658442mr5168116637.35.1719612426248;
        Fri, 28 Jun 2024 15:07:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9c98:1988:ce15:c0ac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf652sm2186451b3a.99.2024.06.28.15.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 15:07:05 -0700 (PDT)
Date: Fri, 28 Jun 2024 15:07:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org, Jason Gerecke <jason.gerecke@wacom.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: wacom_w8001 - use "guard" notation when acquiring
 mutex
Message-ID: <Zn80Bz1EB7yNwWL4@google.com>
References: <Zmkyvkr9AFyywy1V@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zmkyvkr9AFyywy1V@google.com>

On Tue, Jun 11, 2024 at 10:31:42PM -0700, Dmitry Torokhov wrote:
> Switch the driver to use guard notation when acquiring mutex to
> have it released automatically.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied since there are no objections.

Thanks.

-- 
Dmitry

