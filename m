Return-Path: <linux-input+bounces-6817-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8E098883A
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 17:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03ED3281BB8
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 15:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1721C1C172C;
	Fri, 27 Sep 2024 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olk2rzgw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E420118BB90;
	Fri, 27 Sep 2024 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727450581; cv=none; b=R+LZrRIoPWi1hxJWSyb15nBUB69LtAwOzZtbcHENXwy0lsZ5Fi13jRH/Tn8h2L6F8GpeR8n6Lmm7qWQdBF2VnAQJWlgXGLTxhtfLQstaHktMn2gi7NDxSUavE0abutrnyWm12tXAJpVVRvWwftzlWWzUMzvyKDkcECwbzf/QuBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727450581; c=relaxed/simple;
	bh=7xDLUYpghe7ztbYZ7nJ8ARf2+zZfkNO3rZJgf6ACqgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iImLbS4aRt1di9X63IV9F6oR8BlZwDrf7BKimpWGvhDm7piugLSMsiuCa7gsBktcerlAiNMAZABhiae1N6ZO+S6MT3xCM5UQXc2exhIzV/x0m6pmbIjVjGXlcQOBnivVJ2VNZUXQO61mtBLwUm3E8qdtE3VgqYQPAuQBg7f5rU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olk2rzgw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81878C4CEC6;
	Fri, 27 Sep 2024 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727450580;
	bh=7xDLUYpghe7ztbYZ7nJ8ARf2+zZfkNO3rZJgf6ACqgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olk2rzgwfwWTyQ3BUW/pJzqFHmLuW5keUJ1axU6qN3o8hZiate2WYUb27o+801YBs
	 cTO2rvoK2CkFyTDF9yGSgBu3QGC/plJVbH0iGqpJQoIlgyGbRXNWGvMUBVpgpU1iLp
	 TofKHVOvFEWpJBBXX2DtnA2H2xieSwYs9FQffzxPbSGWGb6w1pilhiK1jTEGVQ/Kk+
	 WpF15F44/5D8qmWfr6aPZQykjWzSgld4lIeQ3f/rp+7g83KgasDZhvcNKzcxQSau/0
	 mhrZiWjNIlZfFMfTwffidAdFiUrwUWF3MD830V2S6ujk5+V5pfB7HNdOhbuA6tn0Iu
	 RweZVlJfvTSWQ==
Date: Fri, 27 Sep 2024 17:22:54 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org" <mripard@kernel.org>, 
	"airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, Orlando Chamberlain <orlandoch.dev@gmail.com>, 
	Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
Message-ID: <dsby3ndmnqpxnqh5eykhdcodrlabdtry4j37ywaz2xv4ghtyao@m42xdqx2iujj>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
 <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>

On Sep 26 2024, Aditya Garg wrote:
> It has been more than a month since I've sent this patch set and I haven't got a clear yes or not for the same. I understand maintainers are busy people, but I'd really appreciate if I get some response for this series of patches from the HID and DRM maintainers.

Please look at the time. You sent this a month ago, while v6.11-rc4 was
out the next day.

I was personally taking time off and came back at the end of August
(roughly at rc6).
This is then a problematic time to merge new drivers because they won't
have enough time to be in linux-next before they are sent to Linus.

Also some subsystem are more strict in term of what can go in and when,
and IIRC drm had been strict regarding that because it is heavily making
use of sub-subsystems, and they need time to put back everything
together for sending it to Linus.

Then, when -rc7 is out, I bet no maintainers will take new drivers for
the next 3 weeks:
- the final version will be out the next week, meaning not enough time
  to test in linux-next
- while the merge window is opened, we are not allowed to take any N+1
  material, or this will break everybody testing system.

Merge window is closing this Sunday, but I realized that there was a
regression in HID-BPF which breaks the CI, so at the earliest your new
drivers will be taken at the end of next week.

So yeah, I understand it can be frustrating somehow, but please avoid
all caps in your subject prefix, this really put other people on their
nerves for nothing.

I have a few objections to your series, I'm going to answer individually
in the patches.

Cheers,
Benjamin

> 
> Thanks
> Aditya
> 
> > On 11 Sep 2024, at 5:51 PM, Jiri Kosina <jikos@kernel.org> wrote:
> > 
> > ﻿On Sat, 31 Aug 2024, Aditya Garg wrote:
> > 
> >> Hi Maintainers
> >> 
> >> It has been 2 weeks but I still haven't received a single reply on this
> >> version of the patch series. Consider this email as a friendly reminder.
> > 
> > I think it makes most sense to take this whole set through hid.git, but
> > for that, I'd like to get Acked-by/Reviewed-by for patches 9 and 10 (drm
> > bits).
> > 
> > Dave, Daniel, .. ?
> > 
> > Thanks,
> > 
> > --
> > Jiri Kosina
> > SUSE Labs
> > 

