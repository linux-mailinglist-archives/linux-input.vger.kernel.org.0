Return-Path: <linux-input+bounces-12670-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A75AC975A
	for <lists+linux-input@lfdr.de>; Fri, 30 May 2025 23:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A66791C06575
	for <lists+linux-input@lfdr.de>; Fri, 30 May 2025 21:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3979921CFE0;
	Fri, 30 May 2025 21:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BL4HS0Kv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA07C8F40
	for <linux-input@vger.kernel.org>; Fri, 30 May 2025 21:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748642001; cv=none; b=VMrj0KORDei7WmcCQKOFzoIcUPqAhhbiJ4bI0KxfH+M8aMmtYVaFOLkBTsC86UIQSAinUuIe6AI93qS1ArG6WsBZR1+4Kvo54ILHkQF9Tip7oj9TkLTwQfbw1Ap9XLk+e5wEF2mb1YcGUaFjN+180AfYiX6s0vHY+t1R4vumIXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748642001; c=relaxed/simple;
	bh=UAt8OuvHwkoZeE5JIGsOTX5FtS1+X25KlMx5JXD/DTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0m3+S5Or0ypcTgN6zqOByjClrCCoqsuuRNPV+Zuc1/NEu+dDLtKmqjVQU7s7ZBLOP2wU9T9120F+KwFc6tQq6vS55TFaggO7S9Cr3JoKEawXKrwYSY9gvMfmEPj1m4eEoYbQj9S9J4F8uWkrGM1dgZeWKG5HYY3YgpkNG3DW6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BL4HS0Kv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2349282084bso31777645ad.1
        for <linux-input@vger.kernel.org>; Fri, 30 May 2025 14:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748641999; x=1749246799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bMRXk/yyH6ZosLfzRtYe2ae3sRmHTWgg8bwbC1QYX4E=;
        b=BL4HS0KvTDqBQq2gJaxvwSdKMKPznsZ0lQQpXltf7/isfUD5qb6j2C+DNrWYVYfPaw
         1UmtmRXmm9MCHTntZkXO+snozxbGOh9/ilu5XGu4eEKFoVcZJ2kT2Y6z+JmGc+Llsums
         BiTY3DgxOagwnQ26kH/TIOHrK4tpQLvpYEBoh5XJct9yuKvrxxUQz5MO0Ac6BvdzZ9Dk
         XVW1/3IqGLGW5CjvLWyKgpXQ+K2YhBIfl5CfY94ZCqJd3EFd9EKGLefmTQ39vxGU22F4
         xId8f4IctaZsG2aChB8jwJCfGeD7TzVYdTUKQwUvWkImJVqpQPEzDOrmQNVDYBT5K0Lv
         lf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748641999; x=1749246799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMRXk/yyH6ZosLfzRtYe2ae3sRmHTWgg8bwbC1QYX4E=;
        b=l3Bi2HbGtvLH2ZhMGF2ZCKll9WYUPTugalOGc/nGDdf59TuYlsWksXO4eVxRh16tVn
         uPuR5N2d+oRAai3VX3AcZhrWS47wj7ZeQJsVuh2O/Dpf8PHHA0EUJ4TqOWit7yHMS86X
         0RINhxUOZTHEVc9dwI+2SmJMqwKJlYH3crz6ORFVobuFES3TjqCfcC0uRclKO+w+QpFf
         V+dkhUrS5Lmb4SY4L2Ie48ThD6GEdwz6054Na6NZfVXN2q2OYsTAqz7InfuyjrS24iT5
         mGG+90TamyIiiF2yOQYLocCizeWFUzTMsmQ2wgjbkngP9OPfMHhUGB8VACAV1pNN0CM7
         i2Kw==
X-Gm-Message-State: AOJu0Yyf6cqMgRr8cXOklwZ4L26amWpbA5QxR1keLuj98acveQslUPnP
	IfhbTayriMDCq8ObLnW+fhGiJxs1G7VVTFzmkfPuVKX/dG1jeId8zgau
X-Gm-Gg: ASbGncvZTKxNZocF0i1on7yJXUqxJkJMDNIfDoYAvG0wE2BEuPns4Ep/p3p6qFUPMKu
	5KkEdNBklcMXUHXpLGzuq5SlqChcKkRJDZw2/4B8zVpsc84+l98VKJvlprEXt1eVxjZiXJKDBwy
	r3IQ5OXicIpG688P7t7xi2fJWBFjLcmFY2s4bAI9Aie2msu0LvZwrWX3DZ+7Vqig/u1z4XnX5kz
	hQ5Rsh2PglrtCJWV4w+5xaUSANtcQr+UCzaCPCa8JiFFCvlp735vA7qfhZd5sRtIlHnMNcY1tDb
	rZtbAr0IT0NmI0T1ujMmVl/N7V2bSYSu/TFH3Ww+OvcW543pMwAWl2FiwThdSJM=
X-Google-Smtp-Source: AGHT+IHMyHBKxdvloteUoL9V8ug7RrNPN0nBBkVpD7xxKZkaS4l7StyowYwcL7mHO67vAiHvT0rMUQ==
X-Received: by 2002:a17:902:db06:b0:220:c164:6ee1 with SMTP id d9443c01a7336-23529911409mr78265335ad.32.1748641998784;
        Fri, 30 May 2025 14:53:18 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:24e0:5639:ebc6:8c16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d21802sm32799785ad.215.2025.05.30.14.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:53:18 -0700 (PDT)
Date: Fri, 30 May 2025 14:53:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Markus Koch <markus@notsyncing.net>
Cc: linux-input@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Input: fsia6b: Increase size of phys to hold full name
Message-ID: <wei2gdgywkub42bfbm7b7koh5ln2d2akz72vxo6vcqbfd53bse@4edazsdbkrha>
References: <20250329172237.61874-1-markus@notsyncing.net>
 <1b73dde9-7c26-4b80-a355-64782355b97b@notsyncing.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b73dde9-7c26-4b80-a355-64782355b97b@notsyncing.net>

Hi Markus,

On Fri, Apr 11, 2025 at 07:38:12PM +0200, Markus Koch wrote:
> Hi,
> 
> I sent a patch 2 weeks ago [1] and haven't heard back yet. The same
> happened for another patch I submitted at the end of last year [2],
> where in the meantime the patch of someone else (doing exactly the
> same) got merged. Therefore I have to ask:
> 
> Am I doing something wrong? Is there a preferred way to submit patches
> for this subsystem that I'm missing (like Gitlab PRs or something)?
> I'm happy to change my workflow if it helps you.
> 

No, you are not doing anything wrong, the issue is on my side. I have
quite a bit of backlog and so often go through my mailbox in LIFO
order. This means that I might sometimes merge a "newer" patch instead
of picking up the first one.

As far as extending "phys" I indeed do not want to do that because it is
perfectly fine to have truncated phys (or we can extend it when we
encounter a device that actually needs it vs doing it just to appease
the check). I think switching from snprintf() to scnprintf() will shut
off the warning. Could you please let me know if it does it from you?

Thanks.

-- 
Dmitry

