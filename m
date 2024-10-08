Return-Path: <linux-input+bounces-7134-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0676993FE1
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 09:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E210D1C23D9A
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 07:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D231E25F9;
	Tue,  8 Oct 2024 06:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3nAixXm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2F81E25E4;
	Tue,  8 Oct 2024 06:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370377; cv=none; b=EXO9O8zsdjdsTdwn8gUwc8ubPLIeMSYZU5JJ/3ds1bAnpUQANfFgy5eQGqU1UM01z/yVJlmHxoXPSKfQNH59OCBYl0X/bdriOshXS1GNtRJK642p1Ol3WwzHvd9USZ3Po5hPG9sWgXigk/ai+cigIj+5o40T82ulCQ+ZVB2HScc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370377; c=relaxed/simple;
	bh=IoycYPJDZUZtbUYHl5wzuEWI24PAV+KkCdVO6xvTC/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NErMBbjzsyyc182n8gLIE/E+JS56kJ2FO51H6bsnS/jEIVUdu0dCpYjzQr1WB6hxleyn4FTzbJGqpBtoNgv71Wgu11qRrGtxfIomj36t/X2kxJ94IijmnXMWJ5vils3tn29Q6tpU+shm+avK4son2XezNlbeuk51OSLNM3jHaWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3nAixXm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC81C4CED1;
	Tue,  8 Oct 2024 06:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728370377;
	bh=IoycYPJDZUZtbUYHl5wzuEWI24PAV+KkCdVO6xvTC/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F3nAixXmPAlXBaohbQRbyK6TErRmTtTVYp6jdga4oIrF67BprXKXawPDDWSbd/d90
	 V3O3bSCsso91CaihvPUbKKRxV/nkTHjoXBR9pTYktTr+Fgtnpmq0muLETtEOHQjUZ5
	 RksEERQ7XWPoH8voskUi7fByLMCGAwJirIR3OMBxU8BYDVepR3jh5d4admE6//Qu93
	 10TuLZV5mocu3B5l22eVYIM8urenPI2l4Azd5iTy2+Ut24UiMkEO6MbSe7eLkJ0iZj
	 j0WJixiB1s4sj0oVqGjn9z7dKi8ALwVCdF6luSbxQUPeKbDzt+UwswHoUYz/cdQ1nP
	 PNZxmb5f1Wevg==
Date: Tue, 8 Oct 2024 08:52:55 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Kees Cook <kees@kernel.org>
cc: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Erick Archer <erick.archer@outlook.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
    linux-input@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] HID: ishtp-hid-client: replace fake-flex arrays with
 flex-array members
In-Reply-To: <20240923002249.it.617-kees@kernel.org>
Message-ID: <nycvar.YFH.7.76.2410080852440.20286@cbobk.fhfr.pm>
References: <20240923002249.it.617-kees@kernel.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Sep 2024, Kees Cook wrote:

> From: Erick Archer <erick.archer@outlook.com>
> 
> One-element arrays as fake flex arrays are deprecated[1] as the kernel
> has switched to C99 flexible-array members instead. This case, however,
> has more complexity because it is a flexible array of flexible arrays
> and this patch needs to be ready to enable the new compiler flag
> -Wflex-array-member-not-at-end (coming in GCC-14) globally.
> 
> So, define a new struct type for the single reports:
> 
> struct report {
> 	uint16_t size;
> 	struct hostif_msg_hdr msg;
> } __packed;
> 
> but without the payload (flex array) in it. And add this payload to the
> "hostif_msg" structure. This way, in the "report_list" structure we can
> declare a flex array of single reports which now do not contain another
> flex array.
> 
> struct report_list {
> 	[...]
>         struct report reports[];
> } __packed;
> 
> Therefore, the "struct hostif_msg" is now made up of a header and a
> payload. And the "struct report" uses only the "hostif_msg" header.
> The perfect solution would be for the "report" structure to use the
> whole "hostif_msg" structure but this is not possible due to nested
> flexible arrays. Anyway, the end result is equivalent since this patch
> does attempt to change the behaviour of the code.
> 
> Now as well, we have more clarity after the cast from the raw bytes to
> the new structures. Refactor the code accordingly to use the new
> structures.
> 
> Also, use "container_of()" whenever we need to retrieve a pointer to
> the flexible structure, through which we can access the flexible array
> if needed.
> 
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#zero-length-and-one-element-arrays [1]
> Closes: https://github.com/KSPP/linux/issues/333
> Signed-off-by: Erick Archer <erick.archer@outlook.com>
> Link: https://lore.kernel.org/r/AS8PR02MB723760CB93942370E92F00638BF72@AS8PR02MB7237.eurprd02.prod.outlook.com
> [kees: tweaked commit log and dropped struct_size() uses]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  v2: - update based on feedback
>  rfc: https://lore.kernel.org/lkml/AS8PR02MB723760CB93942370E92F00638BF72@AS8PR02MB7237.eurprd02.prod.outlook.com/

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


