Return-Path: <linux-input+bounces-10117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 782B9A3A8A2
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9653174746
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07261C701B;
	Tue, 18 Feb 2025 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Txht5cHu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732AE1C7013;
	Tue, 18 Feb 2025 20:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910109; cv=none; b=L9cad0qOhpxcqWShnRcmLo2qwsGWUttTGl9p1JRhyWnqSH7VqmvXS/k6Ksq3U/KN6PP9cmdPEyjW2gamcwFqBHE/JFiNNOrgVLUAmBRazWeFmFz8NDK0JVP0wafJosFKAmd4dMhEGiXbUm7tXbVaghiO9UTEMW0vFHgKp97uUXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910109; c=relaxed/simple;
	bh=B2KzuRnI3YtjS1jPmw4n0FSboR57dgQXbCwdXl/hyfI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gGi8inN0xpHrNoKozSjnlSzpkpLvgbuoaRUdrVJhNk2dNVHzQWSFzS9A2qNsFW+yqA+5dppruyXCYqC79vxUpC2fBZFwwfsR0rf/cKhheVpFsI+5jUoRU/n0r8pTufgNCLLNTOLUI2vh/SLXSelWMgCkaKJp/UiqJ5aO7cPt8JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Txht5cHu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5756AC4CEE2;
	Tue, 18 Feb 2025 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910108;
	bh=B2KzuRnI3YtjS1jPmw4n0FSboR57dgQXbCwdXl/hyfI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Txht5cHuKgiNz/+sWYn7SsToVlUjeSPoWRla1OXqNjuVamEPcQDjYwED8rnk2o2aY
	 tMJYYlgwZUDq/5FEhtlb61TWPHqAhdh5K9F3ugfMreKmI7DZBc2VoZcsniYlVPp/4L
	 hfKmJO2IHHKfJpQtf0btNSM2V2mBCkRD0Xu8qLR21zq7nt6Y5Rre1hGwoJNlNxqwBR
	 KSaeT+9wZGEBzJ9oQA0slg2WEtTgz0wcj/pdebMwJjZNn2FN/P5FOUuQIK85erzvmd
	 HzUctaMbpO1g0kpVf+KtCyJbFHK/H2MnHEQlbLmqe6g43Z2rteuus3ZOL+a99G+DVe
	 owdu11WhJeabQ==
Date: Tue, 18 Feb 2025 21:21:46 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
cc: linux-input@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH v3] HID: corsair-void: Update power supply values with
 a unified work handler
In-Reply-To: <20250213133854.100866-3-stuart.a.hayhurst@gmail.com>
Message-ID: <10p601o4-86ro-p649-s5r3-p8o065p46p47@xreary.bet>
References: <20250213133854.100866-3-stuart.a.hayhurst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Feb 2025, Stuart Hayhurst wrote:

> corsair_void_process_receiver can be called from an interrupt context,
> locking battery_mutex in it was causing a kernel panic.
> Fix it by moving the critical section into its own work, sharing this
> work with battery_add_work and battery_remove_work to remove the need
> for any locking
> 
> Closes: https://bugzilla.suse.com/show_bug.cgi?id=1236843
> Fixes: 6ea2a6fd3872 ("HID: corsair-void: Add Corsair Void headset family driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>

Thanks a lot to both you and Jiri for working on having this fixed 
properly. Now applied.

-- 
Jiri Kosina
SUSE Labs


