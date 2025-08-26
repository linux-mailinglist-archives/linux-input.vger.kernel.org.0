Return-Path: <linux-input+bounces-14310-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90498B35A35
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 12:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BA5E5E4174
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 10:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA7F299A94;
	Tue, 26 Aug 2025 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZtgRWLZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D6C27CB04;
	Tue, 26 Aug 2025 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756204874; cv=none; b=l+U5ZHtoDthMX2BD2dTQXLHPMvOyoziO5tWfmKt3zfIDmOfzDkeKe1ol662sY1PXnXPZ0uF7PiyA3begh/cggZJ8EyHWShkhTZqm+x7M48mgPvkWt1GPuW5c+/Ke2NQo3z1orxH0qLqHLfZlz/5ZKVS1bIaV2Bhvh4PW3jTsQAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756204874; c=relaxed/simple;
	bh=8F5wixv4vAXzlMJ0+36TGCXQhWivkRvH/9X3pZKR+go=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LPhrs9gn2XrxWuc/S5i8Nq8fZon0gYL/yO5umjWm7OBNhQgtvzy0cKgSYT8ENnRHvV2QqCxSHWlzrFJaPAeqPnQQqmyedi4JxA0DKbFoLeS8umhSY3IraDdorfCZ1z8mu2Yr1b0md5vuf+taWbJh9BWxbwzVzS6iqPXKXSgT9ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZtgRWLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0EAC4CEF1;
	Tue, 26 Aug 2025 10:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756204874;
	bh=8F5wixv4vAXzlMJ0+36TGCXQhWivkRvH/9X3pZKR+go=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VZtgRWLZx/Tq9uZxaAx/T6ZY/IcXq4RcN2kh1SbeB6DWTfWxndbNICMMKsdPQd4RJ
	 ksZCeWHpo2xFQ32O7L4FgwjFYM6GWIeEUgaOk91a4858dSKRDSEqMrz9wIqFGn9Q/B
	 mMz5RVbBW8qjp65y2OrhEFZdQt+imOhshQgi2wzdDxphnDd0yRncYVoLCCArAaQpGm
	 Qmb8XLftWR+IBUPXyErXGMAfgLJwiOBNafkINJZzRiDFlBm3rsKSbVYP9d3GxPn1rP
	 F0kKhk/1KVgjjFLuzi05VTkYX8COkbP52H8XaH8DiuJJrK4ceng6H2y27odRp0qOU+
	 a4JaDBGvv1nFQ==
Date: Tue, 26 Aug 2025 12:41:11 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH v1] HID: mf: add support for Legion Go dual dinput
 modes
In-Reply-To: <20250803160253.12956-1-lkml@antheas.dev>
Message-ID: <404sp531-6o34-rs48-po90-5276or97q405@xreary.bet>
References: <20250803160253.12956-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 3 Aug 2025, Antheas Kapenekakis wrote:

> The Legion Go features detachable controllers which support a dual
> dinput mode. In this mode, the controllers appear under a single HID
> device with two applications.
> 
> Currently, both controllers appear under the same event device, causing
> their controls to be mixed up. This patch separates the two so that
> they can be used independently.
> 
> In addition, the latest firmware update for the Legion Go swaps the IDs
> to the ones used by the Legion Go 2, so add those IDs as well.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Hi,

thanks, the patch looks good, but what is the 'mf: ' prefix about in the 
subject/shortlog?

-- 
Jiri Kosina
SUSE Labs


