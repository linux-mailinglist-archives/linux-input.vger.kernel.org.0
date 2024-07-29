Return-Path: <linux-input+bounces-5187-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A55C93F620
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 15:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7911B22869
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 13:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1F314F9CF;
	Mon, 29 Jul 2024 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vcmsSRGe"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FA714F121;
	Mon, 29 Jul 2024 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722258316; cv=none; b=jh5ZDE+7aiEZFIzoI8C+0Tq19U+v83OEtHCs1w/VF5IdmNPNhnRUXJWowpz4Uc7hhFafvp0mIdcLh1FtzM+dlgl6ysAZEKwmFfLUndpxrx5S65zkuFIxamlLnBm+NHFzZoYPqy5ue7rKNAcsXr7QMQ3px8fFH8ECfcDqDddJUhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722258316; c=relaxed/simple;
	bh=qaWgxw0PjWzuNDlDh66f4+CB61ONtDk/pGABZxn43Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bD6B3E4GFkV8WtgNDLXQuWBI3weY+k9m1a+NZZMoxfHZJLAuw8hIh/lBDrVCgboi4kDzttyHovNqrvMLnZL6AiyoBElrRpM7OUd9KfTsXuMdHDkEdWwBCJAWpL+qjvNkydkuGi/XovBtB9huzwPryy1h4ui0qxGrxq7QOApeZ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vcmsSRGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F540C32786;
	Mon, 29 Jul 2024 13:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722258316;
	bh=qaWgxw0PjWzuNDlDh66f4+CB61ONtDk/pGABZxn43Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vcmsSRGe37jBMtancelZIZet5seRdAairjc/VEWgYuzADQ+bXg8il9JAI50950UNe
	 a4AxMtyWVM7E47JoEy11snx6nJySc5/EWBqPhRvtGTThBgBlw/A+GyoODEIh8mb2AF
	 2TIHoegI3xF/Hz2cUGhnkOeQaty0WNcQA+SO9Eno=
Date: Mon, 29 Jul 2024 15:05:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Henrik Rydberg <rydberg@bitmath.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
Message-ID: <2024072944-appraisal-panning-a0b1@gregkh>
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>

On Mon, Jul 29, 2024 at 09:51:30PM +0900, Tetsuo Handa wrote:
> syzbot is reporting too large allocation at input_mt_init_slots(), for
> num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).
> 
> Since nobody knows possible max slots, this patch chose 1024.
> 
> Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> This patch was tested in linux-next between next-20240611 and next-20240729
> via my tree. Who can take this patch? If nobody can, I will send to Linus.

What is wrong with the normal input maintainer and tree?  Why not send
it there?

thanks,

greg k-h

