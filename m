Return-Path: <linux-input+bounces-2485-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F2886F51
	for <lists+linux-input@lfdr.de>; Fri, 22 Mar 2024 16:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3C91F24460
	for <lists+linux-input@lfdr.de>; Fri, 22 Mar 2024 15:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FA44D583;
	Fri, 22 Mar 2024 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="COJyZ6FO"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF5482D1
	for <linux-input@vger.kernel.org>; Fri, 22 Mar 2024 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711119631; cv=none; b=mJnFSrGodEw2G0qtZ3wdx2rW/u5wJ9Yk3dPsGelaD8ElgMPjTOWOmGojjiZP1sUKo0dNsrpwwCZKagDBOs8zp4l/+4QgOOgPSUu2mlZfsojJbz22aEeCGlEmRyD/TA7DW3Q1Yq81aeZrXLVqQ2ypb36JHT7YbLtpdujabzDX75s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711119631; c=relaxed/simple;
	bh=qXdtNxvPpsbpNODgvKjpT5XrGKp9Pc9HMJY7AIX1h3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ltrO6E1IXoZuJl33QjDdvGzJFg41j3QtOzADJB73yq4KinLU7DG+gIQ+xubKGzicptR/25o+8K5wFVWFTGUEY8XSvDv5sckrC2WUxCagGjxFBGCzD50bCe+8jeln0IblZ2jQj4YXJMQTGFrqHU7QEYBzuSsTUw1E4L2Pm+MMdgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=COJyZ6FO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711119629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ot97iwVakR2lkEIdq7JcwHUhieIrzYpSO8j17uVWGlI=;
	b=COJyZ6FOuIon+FQ+E1/FTPUqOdGYH+sEhw22jkTQm1NQsin4/kWhth9vzH43gEyFHRwedd
	i2Wtv6yxtCxzyjLYwhswrl99GEBaupdBX0SW/tGBlm3tDreu7y6yp4qWRCXwoveUPXah1x
	nHWLwBX7MhBLD68vX8WxpILHJJXT7ps=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-q_9APlwAPOqwTa3swmxrgg-1; Fri, 22 Mar 2024 11:00:26 -0400
X-MC-Unique: q_9APlwAPOqwTa3swmxrgg-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d4af32be9fso22458671fa.2
        for <linux-input@vger.kernel.org>; Fri, 22 Mar 2024 08:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711119624; x=1711724424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ot97iwVakR2lkEIdq7JcwHUhieIrzYpSO8j17uVWGlI=;
        b=r4/JeJr64udlZcuNNylxzt8ynN5bUahoqSz34dpuedJe4/YyQMtIRnuYJFiC4RESL7
         n6bAQD4/WYVy9ISOqkanhP9toOwFxrM9mmMWCxUYimZuoW4WA7dK9XIcHN+nYukNk29A
         CcxKoRfaqkwzjkhuzJKV12QDKh+MO8k2r/JeerRWE9E9ZjvHQDoMQ645S31/ZQTUXifd
         C1Cnq6mh1pte2OlSkftPI+sqY10pFOJt8M7pxEA3mXXGuw/ACXAe1bvCfOe4Pnej2A6U
         S6wJ6A/Eg2o8YcHg4Tx1TIDoEsqUQEagFLgpVeEg1KR6NCPlGC/kUDD759VcttWdi6K1
         VA2w==
X-Forwarded-Encrypted: i=1; AJvYcCXPJTLAHgd7zwjomp0QoFU4CXUXGz+57pyl+XI4iHTRjf8i+LFo726ZeCx9ab3ErNZy+mSH/+WZQ7+Nik2BbZHl5iyl23kVv/TbEUY=
X-Gm-Message-State: AOJu0YyvIF9QqxBzxmsyPDttt9ApQfYxEkYz6CqJjX6VqkcPkXBwoSPj
	5k6iDhbUGrYnDlZ5UvHHm1leIRKbZ0GyRFMYUz/hWeb4Kneqz3IuXRKglP90rMB8ODHV5u4SMWb
	fePQ01BV3qafBE+tUae9jQ4FBkQU/we2pMisJB/RYMB4bdnaPKMF7Hauc6X5Yu2sbqPSID9p+9Y
	Oc068uy0WMENq03lkGtOnbzOEsfMgLaTOnaeI=
X-Received: by 2002:a05:6512:612:b0:515:9ae2:93b0 with SMTP id b18-20020a056512061200b005159ae293b0mr1451125lfe.19.1711119624757;
        Fri, 22 Mar 2024 08:00:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoRqFuVFSCcYFtb/4CXLayeI15qnsRqHHZP3UDWQYikqtlTHVTRgMB97SI5tl1UUWqtCQprd6t9b/Lw0uFLEw=
X-Received: by 2002:a05:6512:612:b0:515:9ae2:93b0 with SMTP id
 b18-20020a056512061200b005159ae293b0mr1451109lfe.19.1711119624396; Fri, 22
 Mar 2024 08:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315-b4-hid-bpf-new-funcs-v4-0-079c282469d3@kernel.org>
 <20240315-b4-hid-bpf-new-funcs-v4-2-079c282469d3@kernel.org> <1c1ea8cc-22ba-40c4-a26a-5339c3050678@infradead.org>
In-Reply-To: <1c1ea8cc-22ba-40c4-a26a-5339c3050678@infradead.org>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 22 Mar 2024 16:00:12 +0100
Message-ID: <CAO-hwJLgx=vndgMRW=f-Gy_36CJLqwAzOoELbckvBn8NvCJB6g@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] HID: bpf: export hid_hw_output_report as a BPF kfunc
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 5:06=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 3/15/24 07:44, Benjamin Tissoires wrote:
> > +/**
> > + * hid_bpf_hw_output_report - Send an output report to a HID device
> > + *
> > + * @ctx: the HID-BPF context previously allocated in hid_bpf_allocate_=
context()
> > + * @buf: a %PTR_TO_MEM buffer
> > + * @buf__sz: the size of the data to transfer
> > + *
> > + * @returns the number of bytes transferred on success, a negative err=
or code otherwise.
> > + */
>
> Minimum change:
>
>       @returns:
>
> Preferred change:
>
>       Returns:
>
> "@returns" is not documented.

Thanks for the doc review (and in 5/7).

FWIW, I'm still waiting for other reviews if any, and if there are
none, I'll just amend the commit before pushing.

Cheers,
Benjamin

>
>
> Thanks.
> --
> #Randy
>


