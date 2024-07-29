Return-Path: <linux-input+bounces-5190-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A07E93F83C
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 16:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B265E281812
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 14:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC878188CAD;
	Mon, 29 Jul 2024 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qCgKQK1p"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F4F1553AF;
	Mon, 29 Jul 2024 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722263322; cv=none; b=k/uV/ntSUsJiIgdm1CcbzV1AB4HyPdeJwGbGlHqc8JTkzxEVnpTVxyUlX2SJFwdw3bYI7inIxRFMg5tsUEepqFo2Y1s8miJMMLtByzBgOQoDUctOGFTCebXgJwg2t1Z21MYy93N21bJX+MPWC8mHAd418k93FpiJowd8CMhqRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722263322; c=relaxed/simple;
	bh=u3aBnlBIWIm5mjDYRAHGO98z292LKT5DZ12e3C3WyTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCK6NIuUcyi4hKVAx4kLfEdXRFJsuQAk4PB2TnZlLyWwmEsOu3QbMR3vVZuOKuahYeJ6eHBWo5imvnx45jBhIvmqWd2DT0HMRWsnn8CWUcGDNOFQ5AuCmjWIvktYEs4kHe+YEhvYYQQcpsgfK9hM8ZHo+xV/CdlYNG/WQQV/UYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qCgKQK1p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86656C32786;
	Mon, 29 Jul 2024 14:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722263322;
	bh=u3aBnlBIWIm5mjDYRAHGO98z292LKT5DZ12e3C3WyTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCgKQK1pfZ8JBZJwJ4QTtJYrKqzTBmGQ1zIMlx1gmKhWjdl6Ew9Ffg0jLrTPxtQ43
	 udOb/ww1E+eIuqqHTYVj5wR1wvxaqgXTxirUwOp1H8Ljopkr5y/4kB6G8+I/hAOA1a
	 I6YX5bumYPAz7oWL9WPEUdYUjmQ5JTOrYG4lDJSs=
Date: Mon, 29 Jul 2024 16:28:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Henrik Rydberg <rydberg@bitmath.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
Message-ID: <2024072930-badge-trilogy-c041@gregkh>
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
 <2024072944-appraisal-panning-a0b1@gregkh>
 <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>

On Mon, Jul 29, 2024 at 10:15:26PM +0900, Tetsuo Handa wrote:
> On 2024/07/29 22:05, Greg Kroah-Hartman wrote:
> > On Mon, Jul 29, 2024 at 09:51:30PM +0900, Tetsuo Handa wrote:
> >> syzbot is reporting too large allocation at input_mt_init_slots(), for
> >> num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).
> >>
> >> Since nobody knows possible max slots, this patch chose 1024.
> >>
> >> Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
> >> Closes: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
> >> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> >> ---
> >> This patch was tested in linux-next between next-20240611 and next-20240729
> >> via my tree. Who can take this patch? If nobody can, I will send to Linus.
> > 
> > What is wrong with the normal input maintainer and tree?  Why not send
> > it there?
> 
> I don't know why. I couldn't get further response from Dmitry Torokhov.
> Who can make final decision and what tree is used?
> 
> e.g.
> 2022-11-23  0:28 https://lkml.kernel.org/r/03e8c3f0-bbbf-af37-6f52-67547cbd4cde@I-love.SAKURA.ne.jp
> 2023-09-03 13:55 https://lkml.kernel.org/r/07350163-de52-a2bf-58bf-88c3d9d8d85b@I-love.SAKURA.ne.jp
> 2024-05-27 10:35 https://lkml.kernel.org/r/7b7f9cf5-a1de-4e5a-8d30-bb2979309f02@I-love.SAKURA.ne.jp
> 

Again, it's up to the Input maintainer.

