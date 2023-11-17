Return-Path: <linux-input+bounces-114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 911177EF3D6
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 14:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4638B1F26405
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 13:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5868B315A6;
	Fri, 17 Nov 2023 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XL4WFYPt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3116030344;
	Fri, 17 Nov 2023 13:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F892C433C8;
	Fri, 17 Nov 2023 13:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700228956;
	bh=MjFrOhJtCFbeDO2PKegUmEUN+m5y+Ah3nPMU+UZJFtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XL4WFYPtj3milAMCpLXLrtv+4UD9tSnv8AsPktprQrpmDylVjVqGYoia/1cBtEMX5
	 31omLmPLt3TUo9Dtai+E7HqtjI7EJ6kwvwv3dSXlNHMmGF6iU2Z/Cto4rB6Q/X4oH0
	 Nm+jnYMPefK5yL+j9IsLvhnAhqL0LLpp8Nn7sEOg=
Date: Fri, 17 Nov 2023 08:49:14 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Andr=E9?= Kunz <donatusmusic@gmx.de>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: Re: Found a bug with my gaming gear
Message-ID: <2023111719-excluding-spotter-ad54@gregkh>
References: <bd1a6eb1-a8af-4181-b9e4-c7b8d3af1eea@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd1a6eb1-a8af-4181-b9e4-c7b8d3af1eea@gmx.de>

On Thu, Nov 16, 2023 at 11:41:34PM +0100, André Kunz wrote:
> Hey there guys,
> 
> This is my first kernel "bug" report ever, so please bear with me if I
> didn't catch the precise right way to report this.
> 
> The bug I've found:
> 
> I'm running stable kernel 6.6.1-1 and as soon as I install it, many of
> my mouse's hardware buttons stop working. I have a Logitech G502 X Plus
> (it's a wireless mouse). As soon as I install 6.6.1 the mouse's hardware
> buttons won't work, i.e. only the two side-buttons would work, not the
> buttons (and/or my created profiles/macros) would. I have a few macros
> assigned to some buttons, which work perfectly fine under 6.5.11 (and
> earlier), but as soon as I'm on 6.6 they'd stop working.
> 
> Just wanted to report this and I hope there can be a fix.

You might want to notify the linux-input mailing list, as the developers
there should be able to help you out as they are the ones working on
that portion of the kernel.

I've added them to the cc: here.

thanks,

greg k-h

