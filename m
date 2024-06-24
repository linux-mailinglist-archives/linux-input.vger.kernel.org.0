Return-Path: <linux-input+bounces-4601-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A85915309
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 17:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 074541C22BF8
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 15:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E6D19D889;
	Mon, 24 Jun 2024 15:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huP2xYUq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE68F14264C;
	Mon, 24 Jun 2024 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719244762; cv=none; b=nBMaRqZDMJJ8vYjvFSlyZzklAff3Y1HPDi47lpHkLowsH6WGZIRUnJNhGPtEDjyIDC7/VdDUmUXO5zQscmkyBGerw8VfLHVABlSVJuOsP+eNxCcmNMdfgYm+bsumoFKmrhJj/XSZ712o5o6UNG/B57P6EmhwJJVAvNW3bSnnWSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719244762; c=relaxed/simple;
	bh=wHqGhAxbzz+SB1GV1W9aVociq3nQeFE6KGPAfFcLHog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKWNZo4F3B9pnE9exT28rn+MpTenJTI0pNzK0qo1/TbpFNeBv+G0gmc+1eXZ1jNPhw+Y3CNXqbq1OJijz2Uo4XiTz66RMvlVN9kvRDFh1umTLkPbDVjIRBMyekoW4pvDIMLDYo0y2ln8tJl5Ld3RLkjQt1Z0oRREXvaK5S9rLtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huP2xYUq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f6a837e9a3so27104775ad.1;
        Mon, 24 Jun 2024 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719244760; x=1719849560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=maz/Xm+e+IKj76RV/P4WcFvHosnLou8zVyIOEviPv1o=;
        b=huP2xYUqaxvWU05LkHnoBUHHzMFglUNWsIKZnfA7wuyJNmlN3XuLgC00nb1BJlBit8
         uge3VcVcvxtaNO8WiZHNUuy5h/gyNLROmv3gmW7tbV0J5MVgP1Ru2jO3XwPmP8/qrB9w
         XV9yQPPDQSBx4fn0wZ2awL9PGTnhgjgcuvz1gF/axj+jFFicsMdAbpVFOH2fE1d1zdeO
         J6gojPfUe/10xe0GaR+ZHc4VjnvM80D4d5pSDjfeBbOyhniL/x8EcL1OIj5NA0ysIcxy
         Hx2lL6vUHJ+SQ6JvzO8ONzPab94m0O290eBkY7uPs2C7juHYs0d859ag/CoadETYYfLV
         W5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719244760; x=1719849560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maz/Xm+e+IKj76RV/P4WcFvHosnLou8zVyIOEviPv1o=;
        b=BkCkuEfgfLBxJgucfi4WJEA72eRO9Vg8g+S3TRogrhATgSO2M8VsDSyaMu1bkEYZhl
         GORHXdeaFBgfCaGqtARs3TG/yRpitg5MpPMRUo/4UNVVRK91sjoBOjRI35to5fIFqYmk
         3fhFL2EclJ9uRT1VmLHGdzGI/W8QpnTPKRMlZ4DnsNgiShK996ECVosDK9oPUK6hMjsR
         UoWzjtbSxXaNQOFO9Ld+GYBt6CDKAryriLJcdSsQQKs2IEIZP005CgG0uIC5O3PYEbo4
         eFlqncK37XV+BHGe51u2+/9gNY2tQVym57HC5SDjyETF8l44Y1PfbguTf4agI1Gxwnjr
         CTbg==
X-Forwarded-Encrypted: i=1; AJvYcCULHS9NGESSf6SgICQIlSc0hbLU6Btmp0M+2rG6Gq+vmo5mAmZhRgUpVdfW63w+5TpJUpfJj/5HPe+V/C3sqNQdYixsoDG5iBg8YFo=
X-Gm-Message-State: AOJu0YzO5lYn7MGoQhnetKKTW3vAanAltJJ+LDkPHJgDA3CbdF3A3RX/
	1ofUxGUR0OIOaNutNqjK9eiv8HR+eOAP/RtzleBfLLY2DumIiPNO23Xy9Q==
X-Google-Smtp-Source: AGHT+IHaEyJIncqduh0SpuQU4JcllCrox2tR2Mm8H9P5ehzwoTcNYzOUeYP67VAPvF+Bq/SLwbbxPA==
X-Received: by 2002:a17:902:e807:b0:1fa:2ae7:cc37 with SMTP id d9443c01a7336-1fa2ae7d4damr54000965ad.63.1719244759872;
        Mon, 24 Jun 2024 08:59:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eba1:6f76:e2d7:7858])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb2f1187sm64654825ad.56.2024.06.24.08.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:59:19 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:59:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [git pull] Input updates for v6.10-rc5
Message-ID: <ZnmX1XeOzU1NfgrY@google.com>
References: <ZniqQuGkosZYqIYE@google.com>
 <CAHk-=wj730guvRzh4wo16Cq8tq1D1tyD8ub4CiBxV4Bk0Kq_-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj730guvRzh4wo16Cq8tq1D1tyD8ub4CiBxV4Bk0Kq_-g@mail.gmail.com>

On Mon, Jun 24, 2024 at 10:28:09AM -0400, Linus Torvalds wrote:
> On Sun, 23 Jun 2024 at 19:05, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > Please pull from:
> >
> >         git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.10-rc5
> >
> > to receive updates for the input subsystem. You will get:
> 
> Nope. I get something entirely different. I think you tagged the wrong state.

Ugh, I was on a wrong branch ('next' for the next merge window) when I
created the tag. I'll fix my script, but in the meantime should I:

- blow away the bad tag and re-create under the same name as before
  (input-for-v6.10-rc5) or

- blow away the bad tag and use new name for the correct one (somthing
  like input-for-v6.10-rc5-fixed)?

I do not want to keep the bad tag to avoid confusion in the future.

Thanks.

-- 
Dmitry

