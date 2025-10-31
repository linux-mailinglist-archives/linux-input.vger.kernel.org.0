Return-Path: <linux-input+bounces-15831-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA63EC241FC
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 10:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 059D658670A
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 09:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2745332E69F;
	Fri, 31 Oct 2025 09:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXDQOgms"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13D3313297;
	Fri, 31 Oct 2025 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901945; cv=none; b=c0TW76q8g0tPkEqohz7kRzVsq0Ik1ahqi/r6bIyIuS4wNWrqio6+ZbNmWj0Pv8vXBOM/uCyduiNoLuax2HluaxgMneWYI/TM66/qdWr4GgKGVf6yc+aeKhIipDgkLOsZXEaFC/f93rNJI/HCzn7MCF3gDFicunJ3ZgyM2wr24yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901945; c=relaxed/simple;
	bh=YxFWlobnh+pGA9POgtBySl8kFoJpOz8PjnuUH7Gk/9M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mqpwKY6+WHiJ+sqyDF5tL2Ssd0X8UjB+SPAyT6mp9FF9sLIiPYv27yOzQaWXpYlvq9458YcK1pupN9bae5f4gGoR5KL2WsaD1hY+KK4GR0ybt8PvTAkSdTZpQbB8Cc0ON5SgYiCcHnFgyNo1iMZ41I+jgD16g+BQZzPRr7CaSOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXDQOgms; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BF6C4CEF8;
	Fri, 31 Oct 2025 09:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761901944;
	bh=YxFWlobnh+pGA9POgtBySl8kFoJpOz8PjnuUH7Gk/9M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MXDQOgmsGQStzwwneM+Ow5dOEjkLTZ8F3beHtUaM/e/UVoCa2ZtF1252pI4PHAlWt
	 GRHjm4lFkS5Or2wZKdlilHMsXS+1cuuPKhFNzKbuy1KuV9K0NmxiFH972csdwBKLn1
	 t4NBn3fdePI5j/BEDpOVIU7R+NX2P9BZMUSN95ICNpW7Op2bl5PbLY3MMWOlBeMXx8
	 /hrHFR4hctYwKPS60DQFcDbch5YsXE5ZDHyJKviY50hBhNQWEC3tq8SiOLLQt3j6Su
	 vMG1spWEadWBmj5ySc34Y4NBbo/Sba8xQstPg+Ql5I6cFGFAWVhOVp3U+YeWX42kqX
	 q87Qp5WmRRtZg==
Date: Fri, 31 Oct 2025 10:12:21 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Willy Huang <willyhuang@google.com>
cc: "Daniel J . Ogorchock" <djogorchock@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: nintendo: Reduce JC_SUBCMD_RATE_MAX_ATTEMPTS
In-Reply-To: <20251030063704.903998-1-willyhuang@google.com>
Message-ID: <0rsnq664-1318-nprn-oo15-0n5q1sr9nq62@xreary.bet>
References: <20251030063704.903998-1-willyhuang@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Oct 2025, Willy Huang wrote:

> The JC_SUBCMD_RATE_MAX_ATTEMPTS constant is currently set to 500. 
> In a worst-case scenario where all attempts consistently fail, this could
> cause the loop to block for up to 60000 ms (500 * 60ms * 2, including the 
> additional retry after a timeout).
> 
> This change lowers the maximum potential blocking time to 3000 ms 
> (25 * 60ms * 2), improving system responsiveness and efficiency.
> 
> Signed-off-by: Willy Huang <willyhuang@google.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


