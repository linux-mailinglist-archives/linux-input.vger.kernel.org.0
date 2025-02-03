Return-Path: <linux-input+bounces-9721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5130EA25E77
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 16:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2DA57A26D4
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 15:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056AD208974;
	Mon,  3 Feb 2025 15:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azFlkXGU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAE9204C04
	for <linux-input@vger.kernel.org>; Mon,  3 Feb 2025 15:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596129; cv=none; b=TYR7gnMnvpbk+LR/18SBm5h86G4rELk+Aq5SwT+1SdreoAcTsIjDp9uaCWR/XJS9yryYGONYMBK8FTr+QXbjq+gIyf5BwHnSmH8mHFLMmwHer7+6LDjq80/FdA+piJOmto7zpu1DvUUrYBUJysBTjblcD/EwBM09k7zmc4VDRfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596129; c=relaxed/simple;
	bh=5dVUITHoV1J1JzvY9fQ924d+BkVdZVBhZseknGtt4cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCXkp3vMF8F3TTfSfAFCHOfdDbL4/mX3oNp9yE3cLKpOyQrntaVgB0BYJkCaDj4ihhD6tHNq9NJ//PcG6ZvyZhUQL9xouUR21hhg6iy5AUAaHoO6GWINh2pkC/ZCRLq7AQMJfYcFaaKfHsYceGiZfhmd3kvx8sAeoOTvTa/RQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azFlkXGU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216728b1836so75604765ad.0
        for <linux-input@vger.kernel.org>; Mon, 03 Feb 2025 07:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738596128; x=1739200928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GuhPfrf396slM+k4b+qxe+8YCE0MtqYS6ku5FeW3UJI=;
        b=azFlkXGUOtvnaSnPbcQH4tx4st9NqeyFELBigGomPNPYhApAxXiy7lO4Yi36elMPSA
         9d3P0aILEls8pw+1vICks/XfqhzcjjC/i+nQrihG+wu91/FxU2IWQAc2whIRU+MZxt9w
         63l2EssSrNqwlnocFfJcqqBZbWsy6lY0+V6R9srOWcpxbR6eW8y+Cc1nthCx+jel6Y6j
         d/pfkCZRhSA+jbAp0HOidWs+SxSqUczUCMerqsC/m96mNXmY6XQ9oK1Phn+YTDwYURtb
         2cSRrIgTUkxaQQAY8vEgsrn9hsKU1v0d1ApS/BCn12v6TwivEws+Abp5uf8VdnI/U2oA
         +WUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596128; x=1739200928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuhPfrf396slM+k4b+qxe+8YCE0MtqYS6ku5FeW3UJI=;
        b=McH4ogIcLYQCDuq2mRt9AlHhUe+vahdId3ISGn6I3KlXdzEtNzXmhodS0CnFAfoikG
         mARpPuSb0bKYP/L+VdNxAlcfvK7RseuiC0uBQ4D6DmtFV+rm40rH4ZLZbJPqK45S09ha
         YkCMt4z0lMmO8Wvb8rVjpRM3N3zZmaz/aoG/6SVNB2FVbXiX8hiMTo7D+BRRmBUzSjh9
         GEI2m4XHJJxW827hQlCYGfhum9y6Z7ktNVRNNQqdy0uGyMsbVCmr4lMJwWsfWDf8WUqO
         jsrbMyUPipxQ27gZsYBiuBAoluzwqT3cfHcmnK4jZJLImgckmuK4UfUeUyPJJGh+gR7x
         AXfw==
X-Forwarded-Encrypted: i=1; AJvYcCVtRvLbWusl8JDGIq6+cJLhWeMsBj8H3nCqlAilL0kAYkllEgluoaPTyK5DnQzOHKaQ+DIWxqjncxyMrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8FqNxgwodnc2QGzWil/6Jb3rJZMdl9qA82p/bTYJLTt1x0gIo
	XjymI9rm2yTSMPCVyutqnrDMT8O5YJQcq4w2lvUKKT7O+r4EFKDS3ynfxzLz
X-Gm-Gg: ASbGncv9yQvFx/uLYlnjZDZRbtBYSuiqxkj+iT141T/C3rWhVkdXZhYyJdd47dLNxrk
	rD0CVOfkDFzkLogMKRCMRSG09ISyLv1TCKjEv0owEGNKpE9+xSPRhmkw1j75399tHXo1TX+mOeq
	QKhAyd//pH1zHP4P5KLJ4Vnrhn1KvuEG4yyyATQFgu2O4w3F4RbkJ8yLJuGxuVCByFI0Ctxq1bO
	i8CNqgELUSE9uNaLUoQ6MqMFvFZ9AOmtBuLGQdSM/9SXU/hZc3Pyjp4Z2uPlDu9Vb/V5cPktJl2
	kNTwXPQtyswmRX3h
X-Google-Smtp-Source: AGHT+IF+YHRZ+AGJ7FxXz0zeEG7REJHiTlJ08cj2SAltrOt/3ycpn0wKOPzBp8qNXUSw6qkdRGPEOQ==
X-Received: by 2002:a17:902:e809:b0:21c:e34:c8c3 with SMTP id d9443c01a7336-21dd7c671a3mr362815245ad.24.1738596127624;
        Mon, 03 Feb 2025 07:22:07 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:bc03:a12b:a196:21f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3303c9esm77562635ad.198.2025.02.03.07.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:22:07 -0800 (PST)
Date: Mon, 3 Feb 2025 07:22:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Nilton Perim Neto <niltonperimneto@gmail.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - three devices added
Message-ID: <Z6DfHWLTDgPgoGO9@google.com>
References: <20250122214814.102311-2-niltonperimneto@gmail.com>
 <2025012328-audience-tucking-405d@gregkh>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025012328-audience-tucking-405d@gregkh>

On Thu, Jan 23, 2025 at 07:04:58AM +0100, Greg KH wrote:
> On Wed, Jan 22, 2025 at 06:47:07PM -0300, Nilton Perim Neto wrote:
> > Added to the xpad driver the following controllers:
> > 8BitDo SN30 Pro, Hyperkin X91 and Gamesir G7 SE
> > Also changed the VIDs to better describe them
> 
> When you say "also" that's a huge hint that this should be broken up
> into multiple patches, right?  Renaming an id has nothing to do with
> adding a new one.

It was a bad wording. Vendor macros were not changed, only comments were
updated to reflect the fact that some of the macros cover more than
a single controller. It does not make sense to split this apart.

Thanks.

-- 
Dmitry

