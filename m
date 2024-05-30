Return-Path: <linux-input+bounces-3972-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA5A8D53FB
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 22:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A823A1F24063
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 20:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5698E768EE;
	Thu, 30 May 2024 20:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acrC+i0L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76E425634;
	Thu, 30 May 2024 20:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717101853; cv=none; b=ixHPwWhRmW/jHdq0hLg3wBzLJ8rXQBUmc912HPTR0N5rcOBDnEY/FiFScZNpH6qKBR3exyHZOnftcR+omKfQY/TIHM5/2SqHEksGQoohxwqCObuaKlKskN9nIjQ8r+UNoxXeItZYxMZOxe63UdHZzvMDIb5uOcglwS/x7QhjVX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717101853; c=relaxed/simple;
	bh=iIv8OvYeES0t/JaFGpjVn8VOyxh5v0yLgFssAm2zZJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQVU5J9aWil4rOY8z3iWKoVJG2WxOd8C7Mo+IV3XVfmpOQ5+HKYgp6TVBxb58eNvXJqt/G3MjVTW4z+iN1kYo2lvY/fh0aEd3KNjQjpoGI9+42a4ZWxxC0+u0n5/F+Av+XQHM049LipnwWWCNZvkmtNrBaMueMmx5V9BTt0+yi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acrC+i0L; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70244776719so78480b3a.2;
        Thu, 30 May 2024 13:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717101851; x=1717706651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X1/q38ajc2cigpnUWtYXKrDTQJnogN5TA72dnoPxc4w=;
        b=acrC+i0LNWQDNPbx0azRUCU+nBcaIhx600qu3eeDKu/vDz1LHQ6AOYY+10wQa3MT4c
         Df8ox8BaXdBo6V6ESpxn5kylG+4X/2aphd9EcYh+zUGK5aiCj2VNQYWQXzMC9GomhoMb
         /V2EzG/MPYB6Jm9IivqBQYvOsjkZYx/tPeM85rWGH11/oP2m+LU28x/6loff843LA6GS
         jpYmbSWFi32vnwlUWro9C07vVaW3mR4MKVD/rbwxjDfkG0wOb9q+H5cLeHoEFsroX0aY
         sKnE51AfWLqQ2dBRdmrnmJV2F7vcgDBrG4nMgaDhTMPQpC+CdP27GlZqF/YnyNS7zP4C
         E4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717101851; x=1717706651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1/q38ajc2cigpnUWtYXKrDTQJnogN5TA72dnoPxc4w=;
        b=eFIhh13ugVMNEzWYyQPmRnY9v8PEx5VgwJXEGP1SUWHqLj2E3q5hj9nJfOrpCy66zd
         Ch245klIzgEhuutbadUHbMkSeIrza1UbLP0l5q2UAg+4jOyyBYfMR3wdLw/+apTkPr0K
         gp+vYZy0HsyQ8owZnZkzQII+mwfnX5ZHe7YALcK5NHqoAbA+OU2v/zzi+JLuSRnrYJRx
         /ChagylEmoGcP/Eb5n7l5SlFm5vBA16s5wLJE691PlQs19W0gpM7kaiF/c0v9xGp/sZ2
         dVi0Mnv+GAGyHymlpvh+ozr0XLCjMQtNYF/dcdOE3S+v8bDcePA3ODi7C7AZS5RBxl7k
         VNHg==
X-Forwarded-Encrypted: i=1; AJvYcCXpY9LlgnhoYLSt0V9uOIV+FV9OPRN5yhNXZH6lKlDy062oKN5UpN2WNYezAreq0tGGog24X/CVs0zJPlyNCkAEKwltYhckkY1H5BcM91LOsxBMkj/8mQRMaq390RoI3+sBRGQOzqxRtiw=
X-Gm-Message-State: AOJu0Ywfe3Cw+IE79XQRZHXIELXE2xzJBxYSOf7yOYoQ3I7IQ1wpIeyU
	nPdzAh0wH0Ny8xJhJzDtwxYicD5PKfrOPnMiR9vIJLOQpwM1yGJA
X-Google-Smtp-Source: AGHT+IHj8j/zqaOBcjIT/XxOQNe1B+xo2dkm5mX/TzMHOSAr352c3GTLXoqD+H9hb7VWqXR5OoAM0g==
X-Received: by 2002:a05:6a20:3206:b0:1af:dae8:5eac with SMTP id adf61e73a8af0-1b26f23d501mr82943637.46.1717101850942;
        Thu, 30 May 2024 13:44:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:509f:4b2e:3586:eb1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423cb359sm146595b3a.5.2024.05.30.13.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 13:44:10 -0700 (PDT)
Date: Thu, 30 May 2024 13:44:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "Limonciello, Mario" <mario.limonciello@amd.com>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Chris Bainbridge <chris.bainbridge@gmail.com>, hughsient@gmail.com,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
Message-ID: <ZljlF1fE5ypKWoGk@google.com>
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <Zlc4V1goFvU2antl@intel.com>
 <197d195f-9206-41dd-8ff1-f4bb4988fb9b@amd.com>
 <ZldMKZ1MzSDXOheJ@intel.com>
 <g34f3sdk22grheq2vaaonkl543dtk7nb5sffqgmkl5ywtj5skk@p5ht5ug33q4z>
 <873b7a7b-139d-498e-89da-098cb3d7599d@amd.com>
 <CAA8EJpqODpGX-RthQ8qu3oU80qXp8a-N1Chz-dcQXjKYoDfEgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqODpGX-RthQ8qu3oU80qXp8a-N1Chz-dcQXjKYoDfEgw@mail.gmail.com>

On Thu, May 30, 2024 at 11:07:53AM +0300, Dmitry Baryshkov wrote:
> On Thu, 30 May 2024 at 07:41, Limonciello, Mario
> <mario.limonciello@amd.com> wrote:
> >
> >
> > >> Also a direct acpi_lid_open() call seems a bit iffy. But I guess if
> > >> someone needs this to work on non-ACPI system they get to figure out
> > >> how to abstract it better. acpi_lid_open() does seem to return != 0
> > >> when ACPI is not supported, so at least it would err on the side
> > >> of enabling everything.
> > >
> > > Thanks. I was going to comment, but you got it first. I think a proper
> > > implementation should check for SW_LID input device instead of simply
> > > using acpi_lid_open(). This will handle the issue for other,
> > > non-ACPI-based laptops.
> > >
> >
> > Can you suggest how this would actually work?  AFAICT the only way to
> > discover if input devices support SW_LID would be to iterate all the
> > input devices in the kernel and look for whether ->swbit has SW_LID set.
> >
> > This then turns into a dependency problem of whether any myriad of
> > drivers have started to report SW_LID.  It's also a state machine
> > problem because other drivers can be unloaded at will.
> >
> > And then what do you if more than one sets SW_LID?
> 
> It might be easier to handle this in the input subsystem. For example
> by using a refcount-like variable which handles all the LIDs and
> counts if all of them are closed. Or if any of the LIDs is closed.

Yes, install an input handler matching on EV_SW/SW_LID so you will get
notified when input devices capable of reporting SW_LID appear and
disappear and also when SW_LID event is being generated, and handle as
you wish. Something like

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/40e9f6a991856ee7d504ac1ccd587e435775cfc4%5E%21/#F0

In practice I think it is pretty safe to assume only 1 lid for a
laptop/device.

Thanks.

-- 
Dmitry

