Return-Path: <linux-input+bounces-5903-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D12D960D6A
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 16:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A673B1C210F3
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 14:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EE71C462E;
	Tue, 27 Aug 2024 14:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XA4WS/1n"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB4E1C4621;
	Tue, 27 Aug 2024 14:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724768376; cv=none; b=YBXxFnciec9rZ/BRngCIE0UxLQsWGxmHKN1QSyDDgrc3+FNJzfgWpCnjX+AGaIQhUAV/6Lm8UxgpjxBExciIIw9qXIm1bGDT56bYMT42K4IrCMBHSg7R89Ez654mIfJ7HiDvpdgFauDG3n0AtGzF/sI29RSG3f4M4U4Bvr0plX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724768376; c=relaxed/simple;
	bh=S6McFQmGOpJlViE4wv/KFavdJ1mfdcw4NSI/+DrdjsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emvm7QoUDmCxuYVZPwuTwxkjFJsRFvUi+swCAe3kSvpHdZN2FYBWVDJ/qa7N5J1S7zoXfyguL+PXLnpJR0+E8PE3uD/nBW6jwWMeWA59dnFhxsfCxLicrTIVEfuG2K5WaZFrk/UvazPZUm7b0GPYW8E4kMLrjaDB25EyXZ6TndI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XA4WS/1n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EB3C61051;
	Tue, 27 Aug 2024 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724768376;
	bh=S6McFQmGOpJlViE4wv/KFavdJ1mfdcw4NSI/+DrdjsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XA4WS/1n4Nb8FRW79/g2qtYjvygCi4Oo9Udw6Aarw3Ax/9CfiKGKXPSIxkjyWRpPk
	 hlqgTRD1fFP8sSvwpEH85lPEk0g93Rs867XTzoVsj0TMIUGRb7/Ls0XdloyFSGEgrY
	 JM+PqvlI5F6vbilLbw1Hdu7IY1jjhldztJ4SSt3s=
Date: Tue, 27 Aug 2024 16:19:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: George Kennedy <george.kennedy@oracle.com>
Cc: stable@vger.kernel.org, rydberg@bitmath.org, dmitry.torokhov@gmail.com,
	penguin-kernel@i-love.sakura.ne.jp, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, harshit.m.mogalapalli@oracle.com
Subject: Re: Backport request to fix a WARNING in input_mt_init_slots
Message-ID: <2024082719-evasion-karma-3726@gregkh>
References: <1724766547-24435-1-git-send-email-george.kennedy@oracle.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1724766547-24435-1-git-send-email-george.kennedy@oracle.com>

On Tue, Aug 27, 2024 at 08:49:07AM -0500, George Kennedy wrote:
> Hello,
> 
> We have seen a WARNING message while fuzzing with syzkaller.

Then don't run syzkaller :)

Now queued up, thanks.

greg k-h

