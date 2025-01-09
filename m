Return-Path: <linux-input+bounces-9096-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C34A07096
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 10:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2829D7A379F
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A256321506A;
	Thu,  9 Jan 2025 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kadWch8h"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700A8215187
	for <linux-input@vger.kernel.org>; Thu,  9 Jan 2025 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413213; cv=none; b=CNpqU7dBDQgQ+E/U4q2xksQOaK0zUREi2BQPC7bNZkWbvkq5n0B16g9x2VHD82ioHVxWHBxOMkzcDH3ohi20dQ8wHX2zuZAEWqPH/3htOJgq6fRWA/6akVnXjBu0HuQ5ojBNlTIu83TgMdVkhiKeUO7MWHmlN0mhajj0vzoeYDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413213; c=relaxed/simple;
	bh=XNUPb03xcvXIWJCFPeaIitndmjnFMTiZHWCoCHSd+qM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pjjhRA2J+9eRUyAGKjAAz7AasVdC9gylEjiIE+ly+J97EJ/rzyCwqiOXyNcsfdywt6XegrQ3nYi526vmlF8gkvzzXViIKYjgC0cUWwvY0QD0tytUAVACVSLVeoZeVLNJvm/8yxdw2BrCwYwwcZEC5HRtwmY9MtXqMMfG34n/lvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kadWch8h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2575C4CED2;
	Thu,  9 Jan 2025 09:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413213;
	bh=XNUPb03xcvXIWJCFPeaIitndmjnFMTiZHWCoCHSd+qM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kadWch8h0Eo6sw13UuarOYTz2Se/f6tRLFWwo0hB4UfWQ5QUAaoTYoVcEPxjDKOEr
	 wkFdU1SGU2mgClAvVucrZv0PDdM2gky8lsXUzrNzZc2vCtUHbC958NY5K/E6ibdWn2
	 0CE7xa/ooAvAGb+6Isz3y+XD4dmcJwFeCSrZ5nDn1w+CJVaeyJ/KOjfs0WXg1nhwea
	 U3Z6LFagj6KrubKZyR500LR1PaHgX8TCZyalOguziXYmgqg0RiU09qOJ0wMcbxGkhQ
	 zNqxIRfU5S+dLrmpWM8eRG87wJdeHLui+DGmwd0jZmARtuA0v63Rj+RbCatS+ovU2K
	 Glmfb14SxEDWw==
Date: Thu, 9 Jan 2025 10:00:10 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Ryan McClelland <rymcclel@gmail.com>
cc: linux-input@vger.kernel.org, djogorchock@gmail.com, 
    benjamin.tissoires@redhat.com, linux@emily.st
Subject: Re: [PATCH] [PATCH] HID: nintendo: add support for md/gen 6B
 controller
In-Reply-To: <20241212022648.11680-1-rymcclel@gmail.com>
Message-ID: <nn83rs7p-9o65-583q-764p-q9871so2801r@xreary.bet>
References: <20241212022648.11680-1-rymcclel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Dec 2024, Ryan McClelland wrote:

> The NSO MD/GEN 6B was a Japan-only controller released which has
> 6 buttons on the face of the controller. This adds support for this
> controller. It still enumerates just like the 3B controller, but
> will use extra bits in it's report for the 3 extra controllers. This
> also changes the events reported to match the letter on the controller
> for the NSO MD/GEN controller. The VID/PID it reports is the same as
> the 3B controller.
> 
> This also removes a comment on the N64 Controllers which didn't
> mean anything.
> 
> Signed-off-by: Ryan McClelland <rymcclel@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


