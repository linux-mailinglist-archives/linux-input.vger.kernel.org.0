Return-Path: <linux-input+bounces-5731-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D353695A7BF
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 00:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 117021C21C2A
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 22:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F5F17BB2B;
	Wed, 21 Aug 2024 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyttoDyV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFB3139CFE;
	Wed, 21 Aug 2024 22:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724279133; cv=none; b=ggiSo8llMtd46Lo88pA4CaibGo5ldqabD/hllQizB7WKxqMRIwvhIkP+MAeY1Ybfu7gMOeiCa0M4SOlFAaXIo0uISKY0ZGvoMjSBaKEUhHyYkq/eyysubwOHwhipSAPnott3BQkUCigexNhdU3KEAP3bdPTpTy4jbOxHFXN/MIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724279133; c=relaxed/simple;
	bh=mLvLUZ5Ksp/REY0LJFygplugK6ca+l7k2mf7meJXDk4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gHtNxisbH7ce3ty/30XgYdZhoPZZ8DVgxifqU66kodd/PUAR8VISCw1NkWPBjftrlvmmdVkwZJcgbookOyEeknr60pJRQZf8hQI7ND+JYXIlCNg5msPhR3YvCDpmUlk7SyEdOTM3/e7l++jT2XeQn8X3c2GQzuSzHLwHuUNuQHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyttoDyV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AFFC32781;
	Wed, 21 Aug 2024 22:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724279133;
	bh=mLvLUZ5Ksp/REY0LJFygplugK6ca+l7k2mf7meJXDk4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oyttoDyVeNfew/exwZt5qeU3jPbr7/Kr70a2dHJrNVM+PWWSZyK9uzdYwPLKRirWn
	 MLZIMnHLvSDCY0XYsilfkxcD71e4IqREGXeyyumo1Vu5lLsrl4+oKMFOznS/kvczcL
	 ccF7GRQqk9yjeZeHSoXSAciiM+4yJlAqhxweI7Gvy0YnpqjeZteTNR5Pjj4fJFPnWA
	 1tKZJTG+YtB+hs18ZxG2IqETJKGMG3NhDfB09lhzliCgjylW4qwmnQq0e++LY46Tzx
	 CTcVBjXIW9UwF+6qo2NU85BCVcgvJI6IN56qws4Km8djdNlBFtUpM6yJT87z+CN7xm
	 YRN1PnNqP85cQ==
Date: Thu, 22 Aug 2024 00:25:30 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Max Staudt <max@enpas.org>
cc: Roderick Colenbrander <thunderbird2k@gmail.com>, 
    Roderick Colenbrander <roderick.colenbrander@sony.com>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] hid-playstation: DS4: Update rumble and lightbar
 together
In-Reply-To: <0b58bf46-503e-48c6-ad1c-e54a5c13e7a2@enpas.org>
Message-ID: <nycvar.YFH.7.76.2408220025070.12664@cbobk.fhfr.pm>
References: <20240820142529.9380-1-max@enpas.org> <nycvar.YFH.7.76.2408211632590.12664@cbobk.fhfr.pm> <CAEc3jaD6sv=O+MbH5XtHvpXgXyzBROfLDYX2rGoa+3QCOJ-Srw@mail.gmail.com> <0b58bf46-503e-48c6-ad1c-e54a5c13e7a2@enpas.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Aug 2024, Max Staudt wrote:

> > My gut feeling is that the previous fix is less fragile, so let's opt 
> > for that one.
> 
> Let me know if you wish for me to resend v2 with a Signed-off-by. Or, I guess
> Jiri might just manually patch it in - please see this as permission to do so
> if you prefer this.

Now in hid.git:

	https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-6.12/hid-playstation

Thanks,

-- 
Jiri Kosina
SUSE Labs


