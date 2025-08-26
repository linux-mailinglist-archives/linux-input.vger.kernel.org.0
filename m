Return-Path: <linux-input+bounces-14309-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8486B35A30
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 12:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36F6A3B035E
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 10:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1949429D283;
	Tue, 26 Aug 2025 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYe94YIw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE217332C;
	Tue, 26 Aug 2025 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756204806; cv=none; b=kTd+6kvpLEQXOJh+6HL89qHmuidzK/5J5T8U0NHQU72FCI19+NRG7biHg0IVoPD8qxR6QTv0cwMDFzNBPmJfslQLK0AD8QNe9PPSkt/oWCcGG2a45uF998Vyyb9e/B8FmmlkBS4KCs7MTVgKjZTc1Xtye4UfbbTqKG2aPQmNQ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756204806; c=relaxed/simple;
	bh=F3NNapuWMmyj349NovOvKMJRb9z/5mKZ0S7SZG+Oaik=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=X+Ewi6aJrxqmm7BcvxpPmFPDn5tuDl9dAGauDvfBPsxm2vEQ4U+Er3urlE7qi935nJXEV4y70KIzhNHWAMCsKy5EuHVFtEUsyx/nZGkF1Sw60OUPf2yN/4qo+8amGAq0HFmhvgCY2TBjl5rCYZHaAQMFpq5V//TBBuVK+MfNhFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYe94YIw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05821C4CEF1;
	Tue, 26 Aug 2025 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756204805;
	bh=F3NNapuWMmyj349NovOvKMJRb9z/5mKZ0S7SZG+Oaik=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hYe94YIw+AL22LXaFNX1aMUPbv523AOfriCyJkkk7CJkulj1qkKkTkfg2gAqfmn3G
	 M0EXzuvPWDQaXDyr+aiFz9lbFN/wkiuDJIzUrsmOi421GzLX47WoiIebqos7QkkgIl
	 2Ez9NBS29/oTj3L7sTWcKYNIE1KOQIiZEOfLciAQuSWH4dzeBp1EKWx8/j99tKEB1M
	 c4RTLtfOeAGTEFmIVu2aFZ34FcVqcAYJ3viYz7Gunah4WeVtLIgUsz6/NYmdNrXqW+
	 A2qU/3Uk4I9xkdYg68JEJTtmksbOWhdsQ1Az9EcFAW6EwdCZbIUkEn+9KeAOjzjs/H
	 /NcVkm2PAhLAQ==
Date: Tue, 26 Aug 2025 12:40:02 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Martin Hilgendorf <martin.hilgendorf@posteo.de>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: elecom: add support for ELECOM M-DT2DRBK
In-Reply-To: <20250802134542.21692-1-martin.hilgendorf@posteo.de>
Message-ID: <1p4705qo-s11o-6soq-qq96-n10nno2r445r@xreary.bet>
References: <20250802134542.21692-1-martin.hilgendorf@posteo.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 2 Aug 2025, Martin Hilgendorf wrote:

> The DT2DRBK trackball has 8 buttons, but the report descriptor only
> specifies 5. This patch adds the device ID and performs a similar fixup as
> for other ELECOM devices to enable the remaining 3 buttons.
> 
> Signed-off-by: Martin Hilgendorf <martin.hilgendorf@posteo.de>

Applied to hid.git#for-6.17/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


