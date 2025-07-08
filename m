Return-Path: <linux-input+bounces-13423-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B75FAFCF0D
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 17:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB4121BC2206
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 15:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA8E2E3361;
	Tue,  8 Jul 2025 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qh4Kk4wS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98742E1C7E
	for <linux-input@vger.kernel.org>; Tue,  8 Jul 2025 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751988060; cv=none; b=rqZ+PlFkOAo0I+w8OiId6jFq5C5MrgwnsAfacaX6eM1A7Uh5YdqJghyCE++AsLHWOy1jnV59TnfBhZO5d3DVpXA/tVnJKhCSBtefUzUYVqXmPPlUFJfQoU44IpOj5EILGUFx3gQEgaBxHxMzl6n2mpMFIfXZUxdc6uiA+RbDDXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751988060; c=relaxed/simple;
	bh=Jl8nDac21d6aO+lLe0HH42UEuj+RjbsDvvlsVPN1Nj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZU0H/NX8adnC8DMDCQF30WsPyQ/t3qBeLvifHt5ZbGyRkG4h/h2xVN9chuZs+ezS3dKr+Nf8Nm6RsELqUseTmrEd6AgrJ76DEcMciupDARDGC4+lTL/E0u2G0ZjXvQweuoPusmsWNWQ5ZCMwab4pcYYUUFLoev7XE2gVIzH1cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qh4Kk4wS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F244C4CEED;
	Tue,  8 Jul 2025 15:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751988060;
	bh=Jl8nDac21d6aO+lLe0HH42UEuj+RjbsDvvlsVPN1Nj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qh4Kk4wS5hyWhMdswubCVlvoDBryAQNZEfjq1/dt+1yNGicEfOOK/2rGhljbpIAjz
	 IHN6TwPagqEiAd1Fx/UkJY4SLjaP5qMrKpiwIBx4/qE+JYG156iVO1TjKsK7x7rTM9
	 /y7V6tNgi8D03USIt5rmCORnlsUu37EIA+CncaV0=
Date: Tue, 8 Jul 2025 17:20:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nilton Perim Neto <niltonperimneto@gmail.com>
Cc: vi@endrift.com, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: Re: Re: [PATCH] Changed Acer NGR200 to XTYPE_XBOX360 fixed the table
 because
Message-ID: <2025070806-unpicked-protrude-400e@gregkh>
References: <92a568ca-e08f-423a-9de0-3f5b2946e721@endrift.com>
 <20250708151204.14680-3-niltonperimneto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708151204.14680-3-niltonperimneto@gmail.com>

On Tue, Jul 08, 2025 at 12:12:06PM -0300, Nilton Perim Neto wrote:
>  Not sure how to procceed with it, I only want to fix my mistake, 
>  However I'm fairly new to doing git over the mail list (I just use
>  github/lab) It was previously on the wrong place and the wrong xtype, so I
>  changed it Now it is on the right place on the tree and the correct 360 XTYPE
>  Just want to correct those issues

Please take a look at the kernel documentation for how to submit a
patch, it describes how to write this changelog in a format that will be
correct.

thanks,

greg k-h

