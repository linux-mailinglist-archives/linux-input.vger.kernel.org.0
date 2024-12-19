Return-Path: <linux-input+bounces-8684-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E10F9F82E4
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 19:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D80C1882B8B
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 18:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F76D1946DA;
	Thu, 19 Dec 2024 18:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTRcdm3k"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB93F1922F1;
	Thu, 19 Dec 2024 18:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734631293; cv=none; b=Nm+sXquNdDZ2Cu6K6coBKA+p1vk9f7EbtKC6cJjn50QU+wimRhR7KNkkrwdStzK2GV6+dHDcePFZX+kg63uCr6neVyEKIL9TMkFKnT4gVcZOr/qmQzMxdRJZSy5v9eyFcVNG68qUt4hsKHj/5k4LSoD7S6qbAt++ZFQ86Ps+2gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734631293; c=relaxed/simple;
	bh=zDJI/wcilfMpuIAtvvPC/Lr7SBMR1bp1t/RDobxoOxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8CESeDh2WSVO1Puu4wy0eDN1UfgrsbsdyTe4R2zgUTHNoQ6uEJFsC/ffEk7JFc2ccYVQh9GNmYG5xHoNp50cbh3f4ahx4ovW/6L44y4Qai59fKh//87oVx4ltaChqD6g40SnD/Ya0DwbBTW2NkhLf66GovS6DN8cN+yoAXH4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTRcdm3k; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21669fd5c7cso10652575ad.3;
        Thu, 19 Dec 2024 10:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734631291; x=1735236091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8jLnk4Z+vvN1552UHP6CEB1kIaNhAd1hpu37raqx5U=;
        b=bTRcdm3kI6tGJL8O5/AI5SQuphc6bmR6CsEJVVkXebfpFpT2ruE4v6sPn5vBVv+ZB6
         7AffTLNHxcKbzcciFt9XOq3vl40Ca1E7dhRWdbOnsOh+lQSSkzyczyTglVOGlX/6XwT+
         mTCuhPyPfzQSn5UI7i13ednsao7uYRUqfM+m8Niix6t77GNJedimcc+vUhnrzrgy+q1+
         oV/RQ79JJ+OU+cupeJ0txg5OYS7YchWph1NR/E3BgFbvSLwaSx26ZfCcaX0ij39TGo6V
         GYSrYIGElz+/2lQtotb2Dccr4YkSRAP5KvlQdOgb1FnKGgGF5I1SrfP6g/2w80Kajigc
         ip0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734631291; x=1735236091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8jLnk4Z+vvN1552UHP6CEB1kIaNhAd1hpu37raqx5U=;
        b=BHySsV6fNu1rrTohrqDcyhdA7lOFs/7mtKgstXiZW7pYUdcbbEmt2sITdTWu7xl7MB
         7Xgf7wQKkDdsyt/nMWKSlNoDyZgUP7nkje7ioI07SZg/tcRQBHA29qC9g1zfNif16uPw
         DBVJ+/Ril42kQl4cXvtURTFloMZ+QJXhwMQCOe/LEp2EfAjFzNeUp/fcsWJ0UFnrOE29
         A5d+yRFMpuP2kNU4rNpjCcUDBTC3I1VGrGlLchheWe8cbnqHXaTxARJ3aofeLq/ssQAz
         9LdQVfQoOCBEtu7ft0a7RSQBAFHIFmQCGfZ2I99rblVMul8Rj4ggJb+tcetCr3LphkIH
         OG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIwhhZyVH5tSp07E5WgQ9NksxT4Sjwb4iQ0pXbzxwTz0VM4BfgrtC2PtHOzv1zvLu+mLmq5ovo1JvlRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA6i4qXc6zOHP/T8WlaAu4B4CG4Ae3hOZYDV02i00wx17jX9c4
	FignNhs45ey9StKS1qNNxu7pXAD2/Bj8cPt7bJgXjSghjABV8OmaZAa2qg==
X-Gm-Gg: ASbGncuC76o1O7Apvrag0JhorDgKOS5681AItkpjFj/pE2lARXdF1N7OmCug2Izdcye
	fsdm+v5Zk3sG0QV7s8NzWKoPyhMIrVCS3sVOYTair6CbSMilII+h0oHKYXaDfVSE34kLOk6ABvQ
	b7EkYgctwFRLLvwIsFH3A3m2Y4I6hkOE/G9W+t6/u/VbL4wgPY4Jt1llbCw/GiZUANJfhvkyBVf
	vCdAUaFvZecjYjBRN3cXVjOMOuCrKHDp4VLhXpRYfON2qhPB511yl/3Fw==
X-Google-Smtp-Source: AGHT+IEskVifirPUiQuS9isjBiKujpYs6T6VW+REXfV4AELLILV7rrn19cjjNTZI6ds11AGSteowiw==
X-Received: by 2002:a17:90a:f947:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2f452170123mr343031a91.26.1734631290516;
        Thu, 19 Dec 2024 10:01:30 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:afa0:e44c:aa7e:5cd4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0195asm15257765ad.243.2024.12.19.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 10:01:29 -0800 (PST)
Date: Thu, 19 Dec 2024 10:01:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] [RFC] Input: remove evbug driver
Message-ID: <Z2Rfd7Q_8pOPkZRX@google.com>
References: <8n377s5p-3r9n-ro38-3r2o-p536745552qo@xreary.bet>
 <Z2HzxziYyF9-vxns@google.com>
 <ss361op7-9op7-pr29-5pr7-4867rqn1rqo4@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ss361op7-9op7-pr29-5pr7-4867rqn1rqo4@xreary.bet>

On Thu, Dec 19, 2024 at 06:57:48PM +0100, Jiri Kosina wrote:
> On Tue, 17 Dec 2024, Dmitry Torokhov wrote:
> 
> > > From: Jiri Kosina <jkosina@suse.com>
> > > 
> > > I've never heard of anyone having used this driver for debugging at least 
> > > in over past decade or so. Since we have tools like evtest, this driver 
> > > seems to be rather superficial.
> > > 
> > > Also, it apparently causes confusion among people who accidentaly enable 
> > > CONFIG_INPUT_EVBUG and are annoyed/confused by their kernel log being 
> > > spammed by a lot of useless data.
> > > 
> > > Let's just remove it.
> > 
> > Agree. Applied, thank you.
> 
> Thanks Dmitry.
> 
> I don't see it in dtor/input.git though .. ?

Heh, I said applied, not pushed ;) Sorry, my bad, pushed out now.

Thanks.

-- 
Dmitry

