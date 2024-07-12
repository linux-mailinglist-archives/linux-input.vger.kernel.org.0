Return-Path: <linux-input+bounces-4999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C7492F633
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCC19B2303E
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A061428E9;
	Fri, 12 Jul 2024 07:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c2j44Jk5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C5C1428E2;
	Fri, 12 Jul 2024 07:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720769356; cv=none; b=JNGk+EHccjFx9jsdMmUo7z862+RJQgPS/EjtEdyUNH23vlmtBGZ13Zxn4UqJK/N6wLeHx3A2WJPQurGKM2R8YF1LSaYnpZPEnOJ1021QFQU18cQwcshGtP5+yN8QMGVMZSLsrbpsUjnJhhj6sP7P0Wnb6suyDfBuE2S8cqq8fIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720769356; c=relaxed/simple;
	bh=kN4cgTXrqq6pQRmoyzsUWkSwEjdVG9DE5X0WhR4ep+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRfm6pEICDVUh5vKmI4hrIiSuO6EfmPRQ0oUs0nHdMymWgEg07nNd2l7SfPaDksQ0ze5HV6Iif14dV+bssw3vsjqnvxfWUQByb/jxC2XJUwHtRMp9ZLG7/vwjNZrFGsVjbtXVkEjdNk9C2Nyr4MbRGcGScE7JcS6eE+kmX2KL84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c2j44Jk5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC04C3277B;
	Fri, 12 Jul 2024 07:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720769356;
	bh=kN4cgTXrqq6pQRmoyzsUWkSwEjdVG9DE5X0WhR4ep+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2j44Jk5WmJt9YpSo8DOHTnyzqeq/WBe5drPUoYnj/6+Ln9SgsRXErKfGuqLOBOJ9
	 P71CqrY1loSDrW9JGPYcnPl9WPPLYUOhZyMov6i8TU8/gusAsk6CM12s+y9dhaZxas
	 rtzacb6MfyuKAYugrRPtC0NtDTdh0w5LdMPPnego=
Date: Fri, 12 Jul 2024 09:29:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] Input: usbtouchscreen - move process_pkt() into main
 device structure
Message-ID: <2024071209-boondocks-synthetic-aa04@gregkh>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
 <20240712051851.3463657-4-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712051851.3463657-4-dmitry.torokhov@gmail.com>

On Thu, Jul 11, 2024 at 10:18:46PM -0700, Dmitry Torokhov wrote:
> In preparation of splitting big usbtouch_dev_info table into separate
> per-protocol structures and constifying them move process_pkt() from the
> device info into main drvice structure and set it up in probe().
> We can derive if we should use single- or multi-packet handling based
> on presence of get_pkt_len() method.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

