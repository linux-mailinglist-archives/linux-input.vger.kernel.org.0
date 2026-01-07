Return-Path: <linux-input+bounces-16848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E07B3CFF258
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 18:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA107300487F
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 17:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4683A7F62;
	Wed,  7 Jan 2026 17:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iw0qnIPj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F053A7F53;
	Wed,  7 Jan 2026 17:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767807465; cv=none; b=s5kOT4a1ZuUhwkG2ZlHOclOxpWhcjy4e6y9w5A1s1UyJM0YlJ2fdzV/oUwzSCCRUAFR+cNXBoIlq9jXqUhfmsq+9eWgiqQd8yQN1qsZkPe56by8Lf+qYVqviRxS5urWhDijNJCvOEsvmXFWxD6pHjANCvoFcS0cUQR4dWOofa64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767807465; c=relaxed/simple;
	bh=3XFNVAR3MSBoM7jHSchH1yFrDq0lEuf+d98BgRL3ft8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cc1iemlgmGxR5Ln2uNtUiEeb9lVnO+mZ3/llUA36zuPpGvLYtk4sCnCd5Hse3FFlfML+NB+08MVucHreSUfVTFGigaaI+pTBviU7sNRGPr7OHogh6nrvHvPJNhh4S91c1GW4YlY0NT8ZGVzrdDVnHln945GVGuZX9fufoagWbXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iw0qnIPj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2324C4CEF1;
	Wed,  7 Jan 2026 17:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767807464;
	bh=3XFNVAR3MSBoM7jHSchH1yFrDq0lEuf+d98BgRL3ft8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iw0qnIPjqvpYqs9Oz8Foq8tW3rdEURlgeaJsvUKOhE+kvLLduSaT96ZDoiNQdl9nw
	 xCi28HLW8kxkbQQNlqm6hfOlQdzQVDbS7Kam0Qbnz2zIrlcyWgaSyhyd+aimbTzKIM
	 o8PgrrjqODZxPkOnzrfnkkmGyT3D/tVKUoapX596JJSdyKKMDhz0ct+PrH/zDby98a
	 FTwwhlJN/NVEFfGXMAsIOJmhCgzMJ7+U1mcw961WQGzWLrcjJkoke8P486NQiwSkMM
	 F8DoOo4Ok1uybWOU4gDoLuL5SlzbTFuw5+uFgRuH4pd8qVPQefQAbOqckfBbhyO4UG
	 d0c/TsQhhT85w==
Date: Wed, 7 Jan 2026 18:37:41 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: kenkinming2002@gmail.com
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: fix potential buffer overflow in
 i2c_hid_get_report()
Message-ID: <3hii36exlwshxkpruwp5sdodsqredlfhac2447mgqiivcmfva3@4hgo7k56ejpf>
References: <20251231181830.232239-1-kenkinming2002@gmail.com>
 <or6uoheepcbcx4sm36g7z3ccevhjn6iv2ddztx6mpw4qgbdoyo@n3yfbkwlye5i>
 <aV5_76eRrcGJ1ehE@anonymous>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV5_76eRrcGJ1ehE@anonymous>

On Jan 08 2026, kenkinming2002@gmail.com wrote:
> On Wed, Jan 07, 2026 at 03:20:13PM +0100, Benjamin Tissoires wrote:
> > It makes sense to put this min call here, but it's already present at
> > line 304 a few lines after. Could you remove that second check (and
> > unnecessary one after your change).
> 
> The min call at line 304 uses ret_count which comes from the first 2
> bytes in the device response and indicates the actual size of the
> returned report descriptor. Notice that importantly ret_count can be
> strictly smaller than ihid->bufsize because persumably not all reports
> have the same size. The behavior will change if the caller provides a
> larger buffer than is necessary. With the min call at line 304, we will
> return the actual size of the report descriptor (without the 2 bytes
> length header). Without the min call at 304, we will instead return the
> size of supplied buffer.

Oh, you're correct. Thanks.

Applied (as mentioned by the automated reply).

Cheers,
Benjamin

> 
> Yours sincerely,
> Ken Kwok

