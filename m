Return-Path: <linux-input+bounces-15833-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D03AC241F8
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 10:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 940684F2429
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 09:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D596330B0A;
	Fri, 31 Oct 2025 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpVWlOVl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB5233033B;
	Fri, 31 Oct 2025 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761902400; cv=none; b=nnbx1vV0tBdKOwHo6mh2uvrvN/fLrYBGmo9qCfUKbRdR6SSQ/YLIOMNoXX943qo4nro8+9BPk65RkCVJT5x0oruhy//g9jvp6sc+EE8H2g5qvweQpAS7P1XLoQKS4aoBZD2XU3v5g2jU/R+P4/SrExfB0WiIecmfU1/w2sCBhr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761902400; c=relaxed/simple;
	bh=2izc+m6ByT7IZNpgNq+SMz1AiakWNdEUgaXuELTlT5U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mAnJkty3JLRafSDPZyowmc3pG+naO+hNnWpjnbOKXfLCgdDH1C79GmxaWHg6PauOamoS4B71X85wUG2kGnlKeFJ/B6hyPnod8Cj8oUJwEE3Lzpjw0bL7fPshQq/xrAISii2TVS3Nqza5G7RH4JPgoKYQlfsKvrGkhUND0Iz16eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpVWlOVl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDF6C4CEE7;
	Fri, 31 Oct 2025 09:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761902400;
	bh=2izc+m6ByT7IZNpgNq+SMz1AiakWNdEUgaXuELTlT5U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NpVWlOVl28HePkeBZKY0tz5vmlKr5VsCukLxjh9FPk69lXaT/1Rs1L6s02t8mlmNj
	 gelUFj67Hi4oOROXdYQAH599Vi9EAwq2+O8gdC6Jch8r90sH46AtL86CLY64zjWZFg
	 IWqCc48WA9SGmlvsBJME+g8Y10QYLbPm09Usic3bGvGqXPameXFGj/8H1WamhSJwHb
	 RO4pCBwXSh0Wdyygdc5GTORKcFA0coode0bnCE5sgtRbqC9L37+/7wrQ8GsqOJ23vy
	 1ha5i8dYcE4j3geTFwWOOPZ3EHD7GQ5LTh0Tv6FAoY2b+gnn6js6ka8GaOKXaMSyZD
	 apKI1YoV1FgxQ==
Date: Fri, 31 Oct 2025 10:19:57 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Atharv Dubey <atharvd440@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: mcp2221: fix slab-out-of-bounds in mcp2221_raw_event()
 Inbox
In-Reply-To: <CAKTQj-6bWMxzFaUa89KC83vF0u1qUKd-RbLOLcyYOD+16+5rjQ@mail.gmail.com>
Message-ID: <89qopp26-1556-2763-s9q5-9o5799qq127o@xreary.bet>
References: <CAKTQj-6bWMxzFaUa89KC83vF0u1qUKd-RbLOLcyYOD+16+5rjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 26 Oct 2025, Atharv Dubey wrote:

> From: Atharv Dubey <atharvd440@gmail.com <athrvd440@gmail.com>>
> 
> A negative idx value could cause a slab-out-of-bounds access
> when indexing the report buffer in mcp2221_raw_event().
> 
> Add a check to ensure that idx is greater than or equal to zero
> before accessing the buffer, preventing invalid memory access
> and potential kernel crashes.
> 
> Fixes: 3a8660878839 ("KASAN: slab-out-of-bounds Read in mcp2221_raw_event
> (2)")
> Reported-by: syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>

Thanks a lot for the fix.

The patch has however been line-wrapped and damaged by yolur mail client. 
Could you please look [1] into fixing that and resubmit?

[1] https://docs.kernel.org/process/email-clients.html

Thanks,

-- 
Jiri Kosina
SUSE Labs


