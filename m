Return-Path: <linux-input+bounces-4996-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A913F92F62B
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44C13B22760
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A1613DDDC;
	Fri, 12 Jul 2024 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vW/FBh+J"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BAD13D8B4;
	Fri, 12 Jul 2024 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720769305; cv=none; b=S0VIKanZHYwyyWO5KuICapaHxcjmQ54SyV3/jmeM4po1PnjgwqnsR8uQF+JsZmaL7fxExJ/jnVgChv8y4WchBWPVqURKWYcAn3rDZMejtpiXOHBDi7DJR0h5ginS++CsnclXhaDJXmDnVssCbMiNNJ7hVPfzxEQLR2haMT8iOrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720769305; c=relaxed/simple;
	bh=Iky2WPx+4OP80B9F95acPAPyfGnDDmeUABZwX3dhAQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBWWOLWN8wVsgodAuJcRNHFdsZXuzExUE3/hSs8R/53KS84erDSbKJAPGia5YteOtoUqKn/ZNZ4oBae7DZgzf2ZFfSfJnoSpq+EFueXs7biVonti8O8RwJC7wS9wwh9lexnwZXJ5XwE2scpqKyFF6AVSv/Mhojj2u8dUxjutWPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vW/FBh+J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC575C3277B;
	Fri, 12 Jul 2024 07:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720769305;
	bh=Iky2WPx+4OP80B9F95acPAPyfGnDDmeUABZwX3dhAQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vW/FBh+JXpIgMdlUyp1GBq68u18XUnHjn1Gt0pDstXO9F7sj+3m7lers87o8AvTtt
	 hnC4zJsDi+O43kqaTz7NpboOl3Nke7z/NZ0obhgXYSNjHGmZ9Idm1t1nKssrNlpcwh
	 mttexYrZIHoyBxYCFgumgMTQmBWH+ShKTxBB3WeU=
Date: Fri, 12 Jul 2024 09:28:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] Input: usbtouchscreen - use guard notation when
 acquiring mutexes
Message-ID: <2024071217-ladle-zoologist-e1e2@gregkh>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
 <20240712051851.3463657-7-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712051851.3463657-7-dmitry.torokhov@gmail.com>

On Thu, Jul 11, 2024 at 10:18:49PM -0700, Dmitry Torokhov wrote:
> This makes the code more compact and error handling more robust.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/usbtouchscreen.c | 65 +++++++++++-----------
>  1 file changed, 33 insertions(+), 32 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

