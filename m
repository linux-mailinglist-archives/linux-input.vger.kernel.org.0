Return-Path: <linux-input+bounces-10537-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 332FCA4EEB6
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FDC4175257
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96ECE2063F3;
	Tue,  4 Mar 2025 20:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqpQPLD2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73340205E18
	for <linux-input@vger.kernel.org>; Tue,  4 Mar 2025 20:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121206; cv=none; b=t3a39CePvCu07LsRTQ/r2h4t5XsqL29J/TCwv/sXBOz9wQ5Ct5EC8j5FdDRiesSicARHuA8cAdFduqVcER7/vDLWBjYYCDLqWDYXJTYjyiVWq+/q6MBm5uwq19zuTGs72kTBexy560tfkzSoHG0YOQ8Btpwf5J57zldTu/502qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121206; c=relaxed/simple;
	bh=ZdB/PhkzVPTLGQgFy4lKsCk+VSHuR6by4lNMaxEU9Yo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jmfzsqSEQUmNwUf/a6FuZ3Qt87qK8BzryaikQKcr9zFNAxwwLIIHQxb5wxND4wnGMknJUr417FJo11eWdExOxv6RXsCjxvNcJmdRN8wGNcSsGHH65NXEXgmFfAmsFo3ah667iDSn25lXeDok9D7aKGOH7K5pZF43kkC8oPZ8cas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqpQPLD2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F58EC4CEE5;
	Tue,  4 Mar 2025 20:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741121205;
	bh=ZdB/PhkzVPTLGQgFy4lKsCk+VSHuR6by4lNMaxEU9Yo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bqpQPLD2iO2fdA+Q+gA48MWzMB5Y6RQyr/6g/TFZ88QGzBv8Poyxco4QwBpv+kZy6
	 OtXKDTT25HqNUrrA3opYWa2aCXq79y9P8srnt1KRSzK0hFPkYV0XYgtXwdpvm+E/hu
	 wxncQzVMJDHX0cHVhpnevgYvihiCtKCQTd5ho9g4pf/EEK5ETrO66WTAc4t6s0E4HM
	 oWxlHj2DFYF+IHjIGMkSHIvn2FrANSW/PbbtbbgW4GCM0UzRHOEXKicaOWKqGj8tqX
	 KmwtyQSEvtMbiYxcTjwDh0Fcdrvp6p3uGxerUBLbha0iFq+Bza7wspmye5m1/YDjst
	 vyr/kkNXG4kDA==
Date: Tue, 4 Mar 2025 21:46:43 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org, 
    syzbot+0154da2d403396b2bd59@syzkaller.appspotmail.com
Subject: Re: [PATCH] HID: hid-steam: Fix use-after-free when detaching
 device
In-Reply-To: <20250227234133.997805-1-vi@endrift.com>
Message-ID: <06po5nqp-829s-3o28-q3o3-nnnn0n2no34o@xreary.bet>
References: <20250227234133.997805-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Feb 2025, Vicki Pfau wrote:

> When a hid-steam device is removed it must clean up the client_hdev used for
> intercepting hidraw access. This can lead to scheduling deferred work to
> reattach the input device. Though the cleanup cancels the deferred work, this
> was done before the client_hdev itself is cleaned up, so it gets rescheduled.
> This patch fixes the ordering to make sure the deferred work is properly
> canceled.
> 
> Reported-by: syzbot+0154da2d403396b2bd59@syzkaller.appspotmail.com
> Fixes: 79504249d7e2 ("HID: hid-steam: Move hidraw input (un)registering to work")
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied to hid.git#for-6.14/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs


