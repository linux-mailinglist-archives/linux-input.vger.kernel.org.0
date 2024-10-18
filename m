Return-Path: <linux-input+bounces-7546-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA7A9A48FA
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 23:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 952651F26ADE
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 21:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1844718DF7D;
	Fri, 18 Oct 2024 21:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnwLCXso"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F3218D640;
	Fri, 18 Oct 2024 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729287345; cv=none; b=Rkqp4raPqwBNpMUKBVJboLuVI5OgCd1srzzNEpZo7PU1ZRzczVkhm/zRXGjISjrjFl1LUjl/qBlbQoJecd2lwv5w239osXNbyJmCmLDac3Ve5qJcIx6aCwki13HD0/FuVZ2qYD/XTZ+2f6jSvH9VFoptX2/XRDiKs+zRgyr33gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729287345; c=relaxed/simple;
	bh=KIffxykfL3h1uDKevQF5ftf+F3ZIwnW9DrY6NdV6qag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJoC+MAU7YVAw4MPHKVb9YW9mvsnKwgRkXbbXhBiboxr2vLe6iHBquCZnwMs8/A+VfMBFJDMGh1+9W1tYbPY0kequhf4bfbDVrBA4Pxfr5mkQ2w/9543EaXoOe7BpqQpL9QPSkRdssiQ7lWLVuz9+X5faqF6Nem/LlGFcOeGriM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnwLCXso; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c6f492d2dso30716975ad.0;
        Fri, 18 Oct 2024 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729287342; x=1729892142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P5rB5JMEcHODKkmdP3WiyQGAzagL0JhKyqvHyazu9tY=;
        b=JnwLCXsoh9lOLnq2ZF4NrMxNeGxQHN8XWFotAxqAnWk0VKMi4Zhl4hlm1R6Xjuu02O
         1DH4VjAYb0Vi5OdKkQiIVltEESD56cANS+Cm+SAmwe/7vkINGgSW6VpwujUpsFfq8K5Q
         chuL7By3BSVU1izLPX5YjCcpQrUqkVcjwYiQY72ewZYkaVEAGjnhJyBp9GO0eD8+Y5kA
         2d8lEcoUDQDzdMg17suEs2JBk6A5AHLLLeZUmQBoVnRbzyd8CGSD6ZZpA7ysfWK7QUBJ
         vr62LrHvVMcBpQVZO239eWxcniYKJdTR7FBJqnafv8/GfVECuIye+qyWvUFTODmcZqNK
         5tMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729287342; x=1729892142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5rB5JMEcHODKkmdP3WiyQGAzagL0JhKyqvHyazu9tY=;
        b=pKID3Tk6mDYM5RT+cUPGLHfBmqYQFTP4RCRK1YOihFw3zACCwM7ixA3ChGMMhYth1O
         Vw/yMyljM2kt8s1OuwwZw7jY/u/EonsFW7YkIsrsLdq273HaWsEdc9IuDQkDhR36tLB2
         Jx2/Aop9Nlz8IAXB+POSbx0KRM65jILPaPw6A/USsFMiZ/lQ9gbJoRISW6/90sPMLfOO
         WumGl45G1ZVQZMgZmCfLyDicKkcc3tJGMxU7s2SAvP1+Y7csXCDzx+45E98ASJD5v9SS
         CZJ8tfbAF9FOcfp3KhCFzbh9CDmQHSiQK4oUqMXNCmLgmcmggOCbwfUHQ/f1iXpWOy8n
         AI+A==
X-Forwarded-Encrypted: i=1; AJvYcCU0vGAXEaflVuLYD1Xox8GpSsP2Z0v0fWsJ2fpw38CXHdpTPy8IhflUN1UR4F/o/4Uyo/748edVG0jbEMnX@vger.kernel.org, AJvYcCXjrkbWKfOAMTXPvH6yeuvuDRztCI4tZKXr1bO3LqAhUpqM4MGttgR8ZLQXMEcd4eCMjxWL24Vlftbz4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzEUPAHauJDmspueN+YKirgQ/TRhGXuap9L2Qy6FIlK6BHBjc/
	fNbxBhB6+4WFGmhrdRpIPS6acEzGAsznpkG2PC5pSqc+2ySFkPanlHlIgg==
X-Google-Smtp-Source: AGHT+IHbUB96KXkACJ2NWC7MocJKNneaCg/LfVQ2tE/vmKO7feBwv6s6AOTqYtJKBvYhn31KUlCYPQ==
X-Received: by 2002:a17:902:e844:b0:20c:81f2:3481 with SMTP id d9443c01a7336-20e5a794060mr51833485ad.22.1729287342419;
        Fri, 18 Oct 2024 14:35:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:351c:e27f:10e5:484c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8f3d36sm17250165ad.216.2024.10.18.14.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 14:35:42 -0700 (PDT)
Date: Fri, 18 Oct 2024 14:35:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Edwards <uejji@uejji.net>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] Input: xpad - add support for MSI Claw A1M
Message-ID: <ZxLUq8KHvBlINRIc@google.com>
References: <20241010232020.3292284-2-uejji@uejji.net>
 <20241010232020.3292284-4-uejji@uejji.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010232020.3292284-4-uejji@uejji.net>

On Thu, Oct 10, 2024 at 11:09:23PM +0000, John Edwards wrote:
> Add MSI Claw A1M controller to xpad_device match table when in xinput mode.
> Add MSI VID as XPAD_XBOX360_VENDOR.
> 
> Signed-off-by: John Edwards <uejji@uejji.net>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

Applied, thank you.

-- 
Dmitry

