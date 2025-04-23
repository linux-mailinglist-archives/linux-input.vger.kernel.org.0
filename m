Return-Path: <linux-input+bounces-11936-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A37A97EEA
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 08:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1083716D096
	for <lists+linux-input@lfdr.de>; Wed, 23 Apr 2025 06:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C54265602;
	Wed, 23 Apr 2025 06:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ktPxtBmE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7131EF37C;
	Wed, 23 Apr 2025 06:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388765; cv=none; b=Bf9ISoz/tWwx1hTGDAyMNb086zyHq8sTB4YX1L7Q+yJUsYUzR3R4kV00XGaQj4iVVFCiY4gIDQxW9zUAGcA2QTq1NkCXPVWeS12/V7sIbU49CkYcrBHf5UfMWMtu/3rConH/YyPTRo6UVx1KXvJtyy0I/QhN24YrFmYc752k0ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388765; c=relaxed/simple;
	bh=E5BC6rRdnYsxKC6QMhHYPHQiZObKmOLDvalHCHAcDX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHlhRFaMClT9HXh5QkrmJoLT/ipYEo9L69i32XyTwKSulFE8z3VWv+hWdkcC96IRr415CbVo+fTKWqAgzqU5fMQmrVn/IWV5U7ZkFqjNUnkZAh4EJBcuoi8gzzDvZfaEShX5UQ3SDxbM4/oYKFmmTvRS2l5BuXH1jrQdjj+FaGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ktPxtBmE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E905C4CEE2;
	Wed, 23 Apr 2025 06:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745388764;
	bh=E5BC6rRdnYsxKC6QMhHYPHQiZObKmOLDvalHCHAcDX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ktPxtBmE/EMpoSCetqIa7gNOWGfnjxl9U8SaMEpJNozgu9C9IBm2wK9kFdAVQW2QF
	 N81+kYwyyIDrv6X4Gc9TuNc2+G6pR+okae831LxD5FrLnxdARoAZcGfjhNpzNbw2TW
	 I87T/laBqXTBX/fFwVqeSCwhn9tSHoZz1ZJI7FF0=
Date: Wed, 23 Apr 2025 08:12:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maximilian Weigand <mweigand@mweigand.net>,
	Alistair Francis <alistair@alistair23.me>,
	Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>,
	stable@vger.kernel.org, Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: cyttsp5 - fix power control issue on wakeup
Message-ID: <2025042327-stunning-backside-2849@gregkh>
References: <20250422184324.3181215-1-hugo@hugovil.com>
 <20250422145026.517153d645441bc5f51eae93@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422145026.517153d645441bc5f51eae93@hugovil.com>

On Tue, Apr 22, 2025 at 02:50:26PM -0400, Hugo Villeneuve wrote:
> On Tue, 22 Apr 2025 14:43:24 -0400
> Hugo Villeneuve <hugo@hugovil.com> wrote:
> 
> > From: Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>
> > 
> > The power control function ignores the "on" argument when setting the
> > report ID, and thus is always sending HID_POWER_SLEEP. This causes a
> > problem when trying to wakeup.
> > 
> > Fix by sending the state variable, which contains the proper HID_POWER_ON or
> > HID_POWER_SLEEP based on the "on" argument.
> > 
> > Fixes: 3c98b8dbdced ("Input: cyttsp5 - implement proper sleep and wakeup procedures")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> I inadvertently removed Mikael SOB tag, I can re-add it if a V2 is
> needed.

You can't remove it, please add it back.

