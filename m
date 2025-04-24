Return-Path: <linux-input+bounces-11973-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8415A9A9B5
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DBB0178FAD
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60220220680;
	Thu, 24 Apr 2025 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWsMMR5u"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349431E7640;
	Thu, 24 Apr 2025 10:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489641; cv=none; b=UAqWJrbhOSZVe+SSZNdnoaaavgTFkUvLL2enRs+KPHvh6hfoYLX4AA37Wcuc6+xSGy7pWu1PsGC34OVetF05+/uYDwn8LIC6qHAQfPZXEtJWaZLdP+2GemTYUdRXI3cvRqTFC/tYrXTSVLOGgbaveKFEhRLx0ts+2hLz4uS2ZdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489641; c=relaxed/simple;
	bh=mhEoDDJqfRQTtjooIeOKv+SFjaUwcEQq1obgPpxO9pQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OzrYNjrBDT2azxI69ZWUr7zSabAAZNbwG3+8SfOtLG452lh42SJvepvxHHUEbg99CjbznkrczR/UMYVHc7t3B7QRfRN6/4xnVMr0/S6Zc2x5Fy7sZXzxKQZTMuSCVynn8A6C6qM9bzicERim0R8W0vT0q8B36nxuTHJR3BSwO70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWsMMR5u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2524DC4CEE3;
	Thu, 24 Apr 2025 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745489640;
	bh=mhEoDDJqfRQTtjooIeOKv+SFjaUwcEQq1obgPpxO9pQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PWsMMR5uao0Jmjh9omfm46AQg+U2w2AFNMxMHi9wb9JHA7Wf61smENBd+C6wZhQ0f
	 2roxSYUqY0q/wstLm8e9Ik/Jyo1NtNiSsuiO+ZTWA39Y6ISQpblsc1Skf5813fmynv
	 rQtpHbs0PWnC3Vzl2ZGpRZAQgRrrRq8zdfkS2ogC06xPNkDjF/f9pCjJx/HWptUfqE
	 4THKztOiszcZyHy/XahqIAm93K7+GgqMu/rsfesaidSnFGynxWV3UAhQ30d5w1rEyO
	 7FsF1+90O8Hq/uqsegVJkSY+QrcRkixFx5EqzVKuO5t9q4O/qZ9v28RSUHQmA29wUG
	 YCdMp2Z+QMlww==
Date: Thu, 24 Apr 2025 12:13:57 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, bentiss@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    syzbot <syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com>, 
    stable@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] HID: wacom: fix shift OOB in kfifo allocation
 for zero pktlen
In-Reply-To: <20250414183317.11478-1-qasdev00@gmail.com>
Message-ID: <1qq0nspp-174r-58o0-q94n-n3p252s3600n@xreary.bet>
References: <20250414183317.11478-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Apr 2025, Qasim Ijaz wrote:

> During wacom_parse_and_register() the code calls wacom_devm_kfifo_alloc
> to allocate a fifo. During this operation it passes kfifo_alloc a
> fifo_size of 0. Kfifo attempts to round the size passed to it to the
> next power of 2 via roundup_pow_of_two (queue-type data structures
> do this to maintain efficiency of operations).
> 
> However during this phase a problem arises when the roundup_pow_of_two()
> function utilises a shift exponent of fls_long(n-1), where n is the
> fifo_size. Since n is 0 in this case and n is also an unsigned long,
> doing n-1 causes unsigned integer wrap-around to occur making the
> fifo_size 4294967295. So the code effectively does fls_long(4294967295)
> which results in 64. Returning back to roundup_pow_of_two(), the code
> utilises a shift exponent of 64. When a shift exponent of 64 is used
> on a 64-bit type such as 1UL it results in a shift-out-of-bounds.
> 
> The root cause of the issue seems to stem from insufficient validation
> of wacom_compute_pktlen(), since in this case the fifo_size comes
> from wacom_wac->features.pktlen. During wacom_parse_and_register()
> the wacom_compute_pktlen() function sets the pktlen as 0.
> 
> To fix this, we should handle cases where wacom_compute_pktlen()
> results in 0.
> 
> Reported-by: syzbot <syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=d5204cbbdd921f1f7cad
> Fixes: 5e013ad20689 ("HID: wacom: Remove static WACOM_PKGLEN_MAX limit")
> Tested-by: Qasim Ijaz <qasdev00@gmail.com>
> Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


