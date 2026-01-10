Return-Path: <linux-input+bounces-16928-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E037FD0D3BE
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8135F30090C8
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA8622F755;
	Sat, 10 Jan 2026 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdfxoGzH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9936B1EDA0F;
	Sat, 10 Jan 2026 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768035922; cv=none; b=JYYukVbS6LUy//59H7W9xoi0SvdrF79VWivEv2C1IrKoeAZLMrjWoGZpXxmgsT0YKRPE30cLa8BgjBI/GGZyUTCaxHWt0tnFdZHqyd9m5kjEunupPSGZFII8dslba5+bR7b3OX/7bXzP+As6dw7Azgx1WgoSBH9eIDfRSNyOkPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768035922; c=relaxed/simple;
	bh=WUG9sVtwTDsAga1V9I5uGe8xTFWC7OlP//ehFiFFd0U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CoHyHAeUS7fpwDvjdRt0pbrjItk/dx6xV3HgJCJrMHC6zvBj5u9pOJQOil98sQDLYxPJ1qgjcITHbn1JXj+SkxBwFaCUJz315N636tiNOAwbCXndhBcZRECi5iEo51U+5HbBoW2rPXzK7+xpc8VZ2DrUW50F1UAziV39ilaizmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdfxoGzH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915BFC4CEF1;
	Sat, 10 Jan 2026 09:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768035922;
	bh=WUG9sVtwTDsAga1V9I5uGe8xTFWC7OlP//ehFiFFd0U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EdfxoGzHs61Y6evGf5oQSdqYPnmDiNt6jMcO9jNQwWNr9zxZTB6ypLp0Bf2SZxtvj
	 5F2jLWjBZJwwXpvU+Ie8Nm9BLbJYv5GOv80xjROwZWscIg3fWVMdRWSWPAWP5CeRbt
	 lvS6E5yN4MeERn9J/K9TNRYYOklLlvufwESCqn54ko4rxOeJhcF5b+byrapwjW99Tm
	 +t7PTFvstyQtwopoKAJ04oa4gmI1dyXL9KFF5ZyF8sACHmjnFTEuoVVNrILh7GcX6R
	 PGhxsgm57/5O6V4PnXJArv4JgDhHZ77zi4LEMABNAzYNvfNVx2hUw0dEsXz5ncqDgD
	 0rFxc0IUylicw==
Date: Sat, 10 Jan 2026 10:05:19 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Brian Howard <blhoward2@gmail.com>
cc: Andrei Shumailov <gentoo1993@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: add quirks for Lenovo Yoga Book 9i
In-Reply-To: <468q5375-r032-so88-p263-r663p7646q01@xreary.bet>
Message-ID: <7sn017s4-8049-rs08-0o52-rs6r1953qo1o@xreary.bet>
References: <20251118020723.6600-1-blhoward2@gmail.com> <468q5375-r032-so88-p263-r663p7646q01@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 10 Jan 2026, Jiri Kosina wrote:

> > Add required quirks for Lenovo Yoga Book 9i Gen 8 to Gen 10 models, 
> > including a new quirk providing for custom input device naming and 
> > dropping erroneous InRange reports.
> > 
> > The Lenovo Yoga Book 9i is a dual-screen laptop, with a single composite
> > USB device providing both touch and tablet interfaces for both screens.
> > All inputs report through a single device, differentiated solely by report
> > numbers. As there is no way for udev to differentiate the inputs based on
> > USB vendor/product ID or interface numbers, custom naming is required to
> > match against for downstream configuration. A firmware bug also results
> > in an erroneous InRange message report (with everything other than X/Y 
> > as 0) being received after the stylus leaves proximity, blocking later 
> > touch events. 
> > 
> > Signed-off-by: Brian Howard <blhoward2@gmail.com>
> > Tested-by: Brian Howard <blhoward2@gmail.com>
> > Reported-by: Andrei Shumailov <gentoo1993@gmail.com>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220386
> 
> Applied, thanks.

v2 was actually applied, just the response was improperly threaded, sorry.

-- 
Jiri Kosina
SUSE Labs


