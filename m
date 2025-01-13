Return-Path: <linux-input+bounces-9207-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B164A0C291
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 21:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1233166D94
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 20:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711B81CEAA3;
	Mon, 13 Jan 2025 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWznAxRw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2861B422D;
	Mon, 13 Jan 2025 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736800030; cv=none; b=BHGakIZHNMoKmUkU0R9gZW9qKuEy7BqelYZPLR3fDLewG3Vv7OaDTUkxxs6Y8oRLOeIqsw+vEzWeEVVZ7Jr7WgUlJ/KQ8nW1+HaR9L/qS4N057q7CV40nfxUk+8prDsFKxGcN7IJnmiBZqFg0tv8wK6R8vJCpX7DMwTR9RJVEB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736800030; c=relaxed/simple;
	bh=0dCOaUnuqkPfIoSPnAD2C+z7gUNcBRfEh4MxNMjV8aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3Ahonq50uFU8aD3rv3Zr4ZyZfY9ZqdoemEj8dJZECffpR38b3L3Z1CmWr4XWY5zASjGuV0dbTWLG3YqKb/S1Y2VIJgffJa1eCWf5Bd87Ua4uqe7/dZBrWEr9Z72Vu4zRS4pHqlB9c8SmEiX2ETqUGaT3LQgih2DyM4Kr3kH5WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWznAxRw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2165cb60719so84565425ad.0;
        Mon, 13 Jan 2025 12:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736800028; x=1737404828; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X5mxXeT9DKit1k2ECAuwyw/5k6XxFFJ/CLunbdEHZyk=;
        b=LWznAxRwHvggOYmPCb952ffV4hBFo1SRYhZTDONT4Bz7iBMcadc0EfjiHz99K2xTnh
         sVYwVPiIOZXhMjVh3JyB6IPcHGZqNM77eATx3fuc1SkyzE2k9AY7q9WF+3I48A1JLI7d
         E09sKVBFQLYEyo3JCLDZYyMfE0/x0DHT0YIqkKTxIEWa8ZNC/BJzB+lqrzvLyFOBVMkN
         9cgNQoupjd31JJZ5Z+AdWaJj4lHgSN5k4U0+pVil9/64EB6Cjj7+taujmT1gpePMqKTH
         GVbctjakuepQPnqZ1LvPWLd9sTFqelRoDm7aFzNDuE4/2/Px+Urcx9DWRI3d9eQThNaE
         Ix4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736800028; x=1737404828;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5mxXeT9DKit1k2ECAuwyw/5k6XxFFJ/CLunbdEHZyk=;
        b=VjLzth7ZIKckFCbjke/qw6VUp6S7HcdnY/0ImWPMp68xs7eMWvJWK4fS5B3/FdaqrP
         1jjyY3Ou1UcZpHnMz7Nlks+jfmSUZkRYLsgrR/hNR0vfgxbQ9mzOfDeJEUKoFAmmJCM+
         PYQdqsV1O+2LSlH5xHwnqQASGdiaHFWBLBC/cF4D7vIy7lOC702f1CVMbZUipn5GqCRv
         deFp4ehRdDJQeRxxTWX7I++av5T+0HK1HCoexIVBDDdoBwgdFqrbREJt4m9Tk5AYbxlK
         08A74QFs7E8XVmrBPT4HDTMbdd1zc8809VdlJnNZMDrEFCeliKQVSuNihdeA4KcziMwX
         8lpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbq94TRa//nCA9Xq3Dg0CS3g22/vanvDll0VwUiBfOF1IEKS1Y+4MeV1Kj38MCB6PLYIbOmYeHOUNQHRDWwvEJDA0VHQ==@vger.kernel.org, AJvYcCVlJEAifcnULzHJJFEFObWK3vupcn+1QNJF8NURHQesUl0iYIg9yJbur7YhyAXRJtW+HfmV/cVxCxYQzA==@vger.kernel.org, AJvYcCVprIemQ1YTfo89UBDnFd/9Rw9FBoNrZVCy7NxNY5WrskEwHbGCuAp+VCv77hPSyKrnZkRi5spxwgk+uup+@vger.kernel.org
X-Gm-Message-State: AOJu0YwI+orO5zZKqsZQyKekzZzx6wfq2hbZiqMrmqyUyfBtpLQZ16NM
	O2m8Y2KmywAAcPyY/594pUd9eEzJ8QFSvI3//kNLQ799Dkk8sLkU
X-Gm-Gg: ASbGnctExQdaFTWwQFLvEPIHgm0WuZ+TfyZY6MHTyC1muO/twKh5yKmCiRYWoMsZlvO
	XC2FvUj6k0iuxVrbriSpqSm8BsFcxooP4CproknpK+mKcgf2txxyEdYdtlXkGcxrFsZI7/mnAaN
	6qnjY10auu8uNLTmCR6Hc7FnsPXzmAHWVCaY9KKv3gX1qjVbQQ4Uucv7cpe/wxfxMP1u8UyaCD9
	Hs049131Rv2X2l1FltJHb63tgeb0Huo303YkjzPtAVS0niX5Goh8GaBrw==
X-Google-Smtp-Source: AGHT+IGOSI45c5PHRpXPAqlz7JHToVEKfsvVQo3RVZLPxbZqIry3ER3WLUU/tRau11RhLwp3NZ+bEQ==
X-Received: by 2002:a17:902:c941:b0:212:4aec:f646 with SMTP id d9443c01a7336-21a83f767f5mr273389145ad.33.1736800028199;
        Mon, 13 Jan 2025 12:27:08 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:2345:9641:c9a2:f3ca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f253e02sm57667115ad.225.2025.01.13.12.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:27:07 -0800 (PST)
Date: Mon, 13 Jan 2025 12:27:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, o2g.org.ru@gmail.com,
	Hans de Goede <hdegoede@redhat.com>, corentin.chary@gmail.com,
	luke@ljones.dev, mjg59@srcf.ucam.org, pali@kernel.org,
	eric.piel@tremplin-utc.net, jlee@suse.com, kenneth.t.chan@gmail.com,
	coproscefalo@gmail.com, linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, josh@joshuagrisham.com
Subject: Re: [PATCH v2] Input: i8042 - Add support for platform filter
 contexts
Message-ID: <Z4V3GVy5L5_H7-65@google.com>
References: <20241222215042.7709-1-W_Armin@gmx.de>
 <b44f5e56-e05a-4f0e-a9e0-2b5fe5cefa1f@gmx.de>
 <996ee62d-7a0e-5058-6ebe-0a9c51d3ea99@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <996ee62d-7a0e-5058-6ebe-0a9c51d3ea99@linux.intel.com>

On Fri, Jan 10, 2025 at 04:38:56PM +0200, Ilpo Järvinen wrote:
> On Thu, 2 Jan 2025, Armin Wolf wrote:
> 
> > Am 22.12.24 um 22:50 schrieb Armin Wolf:
> > 
> > > Currently the platform filter cannot access any driver-specific state
> > > which forces drivers installing a i8042 filter to have at least some
> > > kind of global pointer for their filter.
> > > 
> > > This however might cause issues should such a driver probe multiple
> > > devices. Fix this by allowing callers of i8042_install_filter() to
> > > submit a context pointer which is then passed to the i8042 filter.
> > > 
> > > Also introduce a separate type for the i8042 filter (i8042_filter_t)
> > > so that the function definitions can stay compact.
> > > 
> > > Tested on a Dell Inspiron 3505.
> > 
> > Any updates on this?
> 
> We haven't heard what Dimitry thinks of the reasonale you gave in v1.
> 
> I'd like to have this as it allows us clean up the globals on pdx86 side 
> even if i8042 is still limited to a single filter (and uses globals 
> itself).

OK, this is better justification IMO, because I do not believe we
actually have an instance where we do not know who owns and should
activate the filter on a given device.

Please update the commit description to that effect and merge it.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

