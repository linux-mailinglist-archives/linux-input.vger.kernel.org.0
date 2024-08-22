Return-Path: <linux-input+bounces-5742-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6849F95B9E8
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 17:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77D4EB2C731
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 15:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879081CC8BB;
	Thu, 22 Aug 2024 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDuattuE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5ED1CB31B;
	Thu, 22 Aug 2024 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724339678; cv=none; b=F8dA6fg/E71LXnQzyhfVsRr9Ru92ZuFQVwMZDji61lvWZFum4Jmn/98nzkB0ft92lZP/wIw2iASX7876JPyuFhmhGyPjsKL/LdjSKElabD8OEvsZBoHrbP5qf5yDeXrFRMP5NKjx7aO744+mWVfmPPop1jlQOU/ovFYET9UZUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724339678; c=relaxed/simple;
	bh=77fmTpb268lxUkmsKvsJAfmwXNKfDcoQsRsOama0J+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwzrXp+rorfXdrcOorIDyyZVXq5JLCvzlDkKkyrP+DjB3RPEoC/ylgwVxML9h1U/EWAkB6RFQAi9V8IQJUz3/cWGn7+KSH0D/7debi6vPfZoG7+sL3h59gnfVPhZilvNDiGrGLyo8+YyK3rpA6YunRLIlflMI4OcR9KxPEWcMFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDuattuE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so7131415e9.2;
        Thu, 22 Aug 2024 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724339675; x=1724944475; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77fmTpb268lxUkmsKvsJAfmwXNKfDcoQsRsOama0J+0=;
        b=ZDuattuEgBU5KvhlK8mgyFDSN1xPZefJI6rFAhic5LETc6vo40hrsqWvqA4nCwSgDf
         nlhD57D687nrXOuXTjZ4IivIcNVILomL/Qry6x10WHxhaJ7CxFKL7GfZA+r8JdvxUgL9
         wMV1jSetK2M5iLUe5z51BHztTySBUD8ULEtkZmpN887nWHuOteO6OcmtnW0V5Hj818KI
         p62cYcHAMHnU71v+DA4kulAs6mH4IwseA6rjNVZMel/sE+r09LLWEJbDpfQxNB6v5BC0
         C/rdGmEAIDf0dWpkpeHCh0OaUrpmRPDeb0DJ73swRoHi7bUSMi97VKBJvXoBW9l97QAK
         L4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724339675; x=1724944475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77fmTpb268lxUkmsKvsJAfmwXNKfDcoQsRsOama0J+0=;
        b=bF1r7Nq6z+nJqx5AhRv3BCQsJc8dQg24VotGEHS4XCYbyIUkorLxiDNheHFSXr0IHw
         l3pTevooTIsBFhL/n7vDf6c5/vJfmc5onx/bXekAfWg3b7t3Ekx627YEkPs9nW1dz4vW
         B6dvbMLCAGxm9LX0ZBu0fCtyWg4EVXpsUEn9BwK9gMuRspnJyjrN+SKNxpLNpNRfOmS8
         sjLPCueDCJ5J8AEZivqhygIz9jMQUgimqS4hkvmFXFUD7rNuzz8yQfnRdKtsYMkevGTp
         prOSJdmsCDOxYHj6IiyKaXo8yfgJB9GxT7L6Meaxrrh+AAcpe0olehRwdx+TnBv8QaC7
         LBBg==
X-Forwarded-Encrypted: i=1; AJvYcCVaOkqf0Zp9GDKhtV9dX9bnrxB7zsmv2UQ3MyWCrPixFUSmKu8zHt+dNPFGCYnPpqi6gxI9+NkD+BHZwF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlMy7inPlILAfD9F9K+VpsckxP0V3gYkwuy0qVub5/Tv3GlonE
	pYuA00y7+bUOUY5lF08UuUuALErABdLAYENdnhiziMvfV7yucVuDf56Qxk9jKzMrHv/wNXdePbg
	NO5KuCe/Uoazs4MWe9DH+qNP5pXg=
X-Google-Smtp-Source: AGHT+IGov/pMjupnpHYVJc6+65OTM4jElaKGQQjSxJ6LLffM0+Ijq+rtzAgmK9lGK35PMPafHNJoNX60akfSW52CyBM=
X-Received: by 2002:a05:600c:3581:b0:428:e09d:3c with SMTP id
 5b1f17b1804b1-42abf0a8d02mr37633075e9.33.1724339674502; Thu, 22 Aug 2024
 08:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com>
 <8a4c117b-7cab-4149-a9e7-c6214d6d92ad@wanadoo.fr> <CALTg27kBYb5+GOwBz4a1-xeM-21DrbUh7eQyNkW9K_m6TdSwNQ@mail.gmail.com>
 <171ecc6e-281e-4b43-8bab-c776faa89ccb@wanadoo.fr>
In-Reply-To: <171ecc6e-281e-4b43-8bab-c776faa89ccb@wanadoo.fr>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Thu, 22 Aug 2024 16:14:23 +0100
Message-ID: <CALTg27=xcMSyq0vyxRJWyeqABa-MBfvDxC3cKHaTPnA2X1meqg@mail.gmail.com>
Subject: Re: [PATCH v3] HID: corsair-void: Add Corsair Void headset family driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
	Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"

> BTW, the return value of corsair_void_request_status() is not used.
> Does it make sense to change it into avoid function?

Good catch, I've moved the error reporting to its callers instead,
that means we can ditch the default case then and simplify it

Stuart

