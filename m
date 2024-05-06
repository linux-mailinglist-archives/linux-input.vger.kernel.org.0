Return-Path: <linux-input+bounces-3511-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FC28BD6BE
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC6491F221EC
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AAC158D7B;
	Mon,  6 May 2024 21:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAP7jtBK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F048EBB;
	Mon,  6 May 2024 21:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715030227; cv=none; b=R/JxbDhMRFFAHDK5NBJ/aZoyZZd3/X3b0owzbswOhOtwbA4lvoqvq0eESGWZAFhzFE6OPgbd08MUIXAbXGjEcmnp9d92UjBD8DVCsUb8T9lLS6pP3yOUfRKp8jiJodNHjtoUVo3xpATn40hcXmHIL60kGHXkBhn2sTzSNFIqc30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715030227; c=relaxed/simple;
	bh=YquaBrEpDPkqQRGGRnhFkafqZanD/kTCLFpD/qvs2aQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=f+MZzMmJNwXdXfMkQ5g6wyevoQAD7zVBj18h71WEWrQAXyzhwHAs78ax5bu1AWrO7jH5B3wZIb3YZfH1Ofv+3IV1McRes9fr4RKW4FhHMON9edIsN1gtfs6STMsGnyHHc0zxKB7c+/5VtKx5okS0XBp9Swlko/gOBA6gaXZJfTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAP7jtBK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDC8C116B1;
	Mon,  6 May 2024 21:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715030227;
	bh=YquaBrEpDPkqQRGGRnhFkafqZanD/kTCLFpD/qvs2aQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZAP7jtBKRJZF5B5JqyxGgvYuaSu8XfvT2DtW1MHWsH2pACn95Fos7hf/BVaMUMmxz
	 3x/iVwRpz3P5eCptQC0hepq6WJELgYHgOMPa7jganK6xWejt9SbBWt9//zveK4HpYw
	 MypyZnYHiLYnvek7bst89/M2Ltd5+ahs3xlpFvj0Wkp6oIxHQEH8raQWZ4+250aE5P
	 TPh9R34Uczsn2PjJEQB9t2QCkSg3cCBUvra/8LiZT1FAgGjw6JAIkR60qmpuqbKsrR
	 vA/OKn76bNLqHxPaRLrwKVJIedC2/iYgmWdIYuMVffBffRf2Ix0zwgxl7yLFDDJBly
	 cx6qGgg2+M61Q==
Date: Mon, 6 May 2024 23:17:04 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thomas Kuehne <thomas.kuehne@gmx.li>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-debug: add EV_FF and FF_STATUS mappings
In-Reply-To: <Zhp89Q8k13Uua24f@black>
Message-ID: <nycvar.YFH.7.76.2405062316560.16865@cbobk.fhfr.pm>
References: <Zhp89Q8k13Uua24f@black>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 13 Apr 2024, Thomas Kuehne wrote:

> Currently hid-debug only output question marks for all force
> feedback related input mapping making debugging gamepads
> with force feedback a challenge.
> 
> This adds the necessary mapping information to output
> EV_FF and FF_STATUS related information.
> 
> Signed-off-by: Thomas Kuehne <thomas.kuehne@gmx.li>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


