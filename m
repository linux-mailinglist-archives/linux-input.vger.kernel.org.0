Return-Path: <linux-input+bounces-16847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE90CFF759
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 19:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5EEB0300A3F0
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 18:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9AF3A7836;
	Wed,  7 Jan 2026 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnYdDFOq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0653A7827;
	Wed,  7 Jan 2026 17:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767807403; cv=none; b=WXpiDnPx1nfEo0o/+C0/EgPksceMONQ9ShjxPV9k9CRJdlD8ts72LJO6x1vjbPDPpSnjOONzQ3hfqnuH9Exg0r57OJRpWZYkGMCQc36kPUCYHqoqkjAr/sFfxVi5KqZOL31WgoAQTdkoZAiRi8YpaJGgKqRypwG5OPezSQffRHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767807403; c=relaxed/simple;
	bh=q1d+oMNFKirU07Z6RCokzxX/iZ8NMhrsYRodJ8aRsn4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s4qAqs7qjgVUijU+F0vmY15OtpSRuNu6CscL3L+Lb9H5ng6fBdnM/ZIP+Ggpti5ZB90+u9dzEf0VlwXigkNN2x54aT2H1/w0M14kcJ0pB0ZXdb74mCfbMLc2eVM83eAvwAkcjLJg5U/k947ia6b7xL7dqUrOCKjI3XwBdKWLlms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnYdDFOq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92BE0C19423;
	Wed,  7 Jan 2026 17:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767807402;
	bh=q1d+oMNFKirU07Z6RCokzxX/iZ8NMhrsYRodJ8aRsn4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cnYdDFOqhPiC2WJQ0M5kr5VBwwixHi/W3/PTOrIYTQKQg8OhMTo+3kyW37HacZc4m
	 7F+u9C1WjY30vZk9krbc/BE9dLiWvz5MwazioMpaep0oH7/HA1Tn5fE/wThcWLXHny
	 qRdt1xxelaYIK/14qrSfZl7vHVqi1cILyz4uNI+wsCRtG4blJfPvNfN63agSVPxRtl
	 e1av6G/oDp8rBiJwtFEWGthHHoGrNdLcBhQwWSP4IIfmyZuI+ZbE/nihykntQ6eVEV
	 3ryoxkfWHd34wiBBjUBZ9QEdO4vfB6/bvUDtAGirdB2vYy8aLNGziK0FHUl6KWv2rH
	 YyTJlzvPcObmg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: jikos@kernel.org, Kwok Kin Ming <kenkinming2002@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251231181830.232239-1-kenkinming2002@gmail.com>
References: <20251231181830.232239-1-kenkinming2002@gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: fix potential buffer overflow in
 i2c_hid_get_report()
Message-Id: <176780740132.3457665.6740398736314208799.b4-ty@kernel.org>
Date: Wed, 07 Jan 2026 18:36:41 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Thu, 01 Jan 2026 02:18:26 +0800, Kwok Kin Ming wrote:
> `i2c_hid_xfer` is used to read `recv_len + sizeof(__le16)` bytes of data
> into `ihid->rawbuf`.
> 
> The former can come from the userspace in the hidraw driver and is only
> bounded by HID_MAX_BUFFER_SIZE(16384) by default (unless we also set
> `max_buffer_size` field of `struct hid_ll_driver` which we do not).
> 
> [...]

Applied to hid/hid.git (for-6.19/upstream-fixes), thanks!

[1/1] HID: i2c-hid: fix potential buffer overflow in i2c_hid_get_report()
      https://git.kernel.org/hid/hid/c/2497ff38c530

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


