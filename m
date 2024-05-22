Return-Path: <linux-input+bounces-3770-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0695E8CC028
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 13:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF27F2820A3
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 11:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA4C824AE;
	Wed, 22 May 2024 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uCIqXTdV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B0A7BB17;
	Wed, 22 May 2024 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716377029; cv=none; b=sqSf5GfgjS6rJf3iHxlujFllDuihULtCJJ1UDG1OcV1RJCqWKMT4ELaguYbspD20l16pszIqxk8C1q/wKdDssiuTmzpRpX1ThYqEX/05nMNQ4MBdY6g3eRcR+QrGDUBnrD+oOrd60Uh7tYDWeCvdcaUOuBpX76YRsHSckqxDzZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716377029; c=relaxed/simple;
	bh=CRdZCQwoGH/pqe+Cxhhg1rMngUYEDh2pXlpIhUBiTL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siI66mzcgouqotRaq3C/nCif+qQnRd+uNbSldK4e2+1UkADzUawy3glmcR4topQ2Blkwidc64UPttQTbr3WWnHE0W5CqcQuxKvdC0Ns9YhnLKOuSBpBdUEYjQwF36waV6/6R9HCrU9qJh07Qnmd4EC9JyA0GaX6QaY5E4Oklxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uCIqXTdV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D552C2BD11;
	Wed, 22 May 2024 11:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716377028;
	bh=CRdZCQwoGH/pqe+Cxhhg1rMngUYEDh2pXlpIhUBiTL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCIqXTdV4b0E7H2AbTwwVeX1itow6zbIPh8ZEwt0ZFKyAaDDAlLLwsu+d8wes4qg5
	 Nh5Ac8iAYdAu+NaNLqrDgscOSDa5bKS3dkILdSLJPruebICkpCf2/z9OuTED1ltYJ4
	 zzW+XHrwJI6Gh0xMPrPPyZmMTd8Nse03cNIB63s0=
Date: Wed, 22 May 2024 13:23:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: huanglei814 <huanglei814@163.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	huanglei <huanglei@kylinos.cn>
Subject: Re: [PATCH] HID: usbhid: enable remote wakeup for mouse
Message-ID: <2024052218-hull-urology-9ec9@gregkh>
References: <20240522092257.19373-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522092257.19373-1-huanglei814@163.com>

On Wed, May 22, 2024 at 05:22:57PM +0800, huanglei814 wrote:
> From: huanglei <huanglei@kylinos.cn>
> 
> This patch enables remote wakeup by default for USB mouse
> devices.

That is not a good idea.  Please see the mailing list archives for the
past 20+ years for why this is the way it is.

If you know your device can support this, please set it in userspace,
but we can not change the default value at this point in time, sorry.

> Mouse can used to be wakeup devices, but the correct
> place to enable it depends on the device's bus; no single
> approach will work for all mouse devices.  In particular, this
> covers only USB mouse (and then only those supporting the boot
> protocol).

And that is really not a wise choice, boot protocol mice have no
requirement that they support remote wakeup.  So restricting it like
this really will not help, sorry.

Again, do this in userspace, that's why the interface is there to do so.

greg k-h

