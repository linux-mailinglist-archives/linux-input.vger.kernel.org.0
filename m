Return-Path: <linux-input+bounces-5298-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2385946832
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 08:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 763631F219BC
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 06:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F111482E2;
	Sat,  3 Aug 2024 06:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1pgsPk14"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE385136350
	for <linux-input@vger.kernel.org>; Sat,  3 Aug 2024 06:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722666806; cv=none; b=JBWVfXSWxqd8ofTITJ5OVFzQ6O8k2WfZyyOxqtOkZ/sub+ypFa91b2vf+YZGid/ynI1ncd1tQMmE7urCEAEU3eMulwYvZA/pupBirGhPHMJpKDFniaXhxVk2bPwEK2u1IIypkq2tMFgoq7QtybFVC/RcAkIpbk9IF6OQvgIsblQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722666806; c=relaxed/simple;
	bh=u5SO4sht5xGq2HpMXvDwLfAFQ4sKhEaWHWHvNvNTSN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otHVbuBm6PmcWBueM4R1WcZNTn1dDtthZlwToq/4+iP4cmDmC8UhJ1IYDBj3s2FDBo/T3xBPq2FUjWeqQJ5wMM9kN4rMoIX7u9JPpgrqjEOxTJqxwxPW61MWaAZbjzuviZA7heBQNJLCqKFgOxoQ14+hMy/BvotACm2tIGbcE6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1pgsPk14; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE73DC116B1;
	Sat,  3 Aug 2024 06:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722666806;
	bh=u5SO4sht5xGq2HpMXvDwLfAFQ4sKhEaWHWHvNvNTSN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1pgsPk14h20BDtcR948APkLDd91QnR7eaORLTA9lysgrKZxS0xcdbU3BYamRKCKIa
	 DGTw5aW0d8SBLLHQNZuyPZAfXKeqhh16x7qNQ4ed4XCXzA8y840ZNUlZddA+3iNWQG
	 1OvQdl5bU+I9RlizkLTUUROYOm9b1tzHn9INtkqs=
Date: Sat, 3 Aug 2024 08:33:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Input <linux-input@vger.kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Removal of cyttsp4 driver from mainline Linux kernel
Message-ID: <2024080301-unlikable-sepia-49cb@gregkh>
References: <Zq3Jc7Vt0BM5VWAa@google.com>
 <Zq3JxhVMPoZsviDT@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zq3JxhVMPoZsviDT@google.com>

On Fri, Aug 02, 2024 at 11:10:14PM -0700, Dmitry Torokhov wrote:
> On Fri, Aug 02, 2024 at 11:08:51PM -0700, Dmitry Torokhov wrote:
> > Hi,
> > 
> > cyttsp4 touchscreen driver was contributed by Cypress in 2013 and since
> > then has seen no updates. The driver uses platform data (no device tree
> > support) and there are no users of it in the mainline kernel. There were
> > occasional fixes to it for issues either found by static ocde analysis
> > tools or visual inspection, but otherwise the driver is completely
> > untested.
> > 
> > Should it be removed?
> > 
> > Thanks.
> 
> And of course vendor email is bouncing...

Sound like a good reason to drop it.  If anyone needs it back it can be
reverted and fixed up easily then.

thanks,

greg k-h

