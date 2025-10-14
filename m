Return-Path: <linux-input+bounces-15472-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC88DBD8A82
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 12:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 469F83B982D
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 10:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6F12D193C;
	Tue, 14 Oct 2025 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5iLGa8g"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446AB220686;
	Tue, 14 Oct 2025 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436131; cv=none; b=A77K5BR6tNy3QucnC4LPpxJamT2cq3BaO1wAorRztrtWtAM6NL3G2X1Sr5gYwOADt87QUNVRBrSE4tFajSEf7BidAb26YJpXYxUZdyzXvYGDNpDsYhXcVKi6lj6aysF1Aii9ZZ3/DVpsg5KBpZm1L626fk+bfbyi7O3H9ZKimWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436131; c=relaxed/simple;
	bh=itJ1N7o9oUHqSlT/IDvavG7JxS//NX9lwvnLAL2hRIU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YZoKPxcQF9gY+yKQSyFSP/46I+9a06rE1uG9cfUpAz4qSievr/a6eNPZOEEeIecrW0CyQ6tN/ZbQ1+Kcx/95EhzBOu80O4+9PiXp2GFtuA9zHNpLBcVf3dVXTWurNnvEvzI81k8Zt+k22waciB5MbIw30mJ6kCLHcOxLjNSpe04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5iLGa8g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A7FC113D0;
	Tue, 14 Oct 2025 10:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760436130;
	bh=itJ1N7o9oUHqSlT/IDvavG7JxS//NX9lwvnLAL2hRIU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p5iLGa8gHNLyd/7GfXZu+m2+J0HJv1yPTFOLqYO7YGK5aV1JuNRWMCr5N478TocoV
	 ZkATpO6LM/8iDFwFCvNRsqPh3RNy9ySm66l0oq8g7k0eXdkiQhaZZCzVmSeQ2k5dp5
	 JYJCCsx5Am7IhusbFTvZm1DhTI6WeysZjC86wS0JkH7bH3w5iw8NvGTt4kdX7JAGHv
	 /CLiuDBdn2BICLwjpwrM65bfXpsvQL4czIwdl1heYQ2/oP8XmlEVViErDBdZq5W1Wh
	 mjkxWSyWF5NSk8sRfJO983RMaeMJxxNtZMW+Do+BvoLH2pRLjrIgOKpwXF+097HZUL
	 RGp41bFUP+IxA==
Date: Tue, 14 Oct 2025 12:02:08 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Joshua Goins <josh@redstrate.com>
cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: uclogic: Add support for the XP-PEN Artist 24 Pro
In-Reply-To: <20250922213207.9224-1-josh@redstrate.com>
Message-ID: <or091r4p-6npo-s756-r13q-6pnon52731q8@xreary.bet>
References: <20250922213207.9224-1-josh@redstrate.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Sep 2025, Joshua Goins wrote:

> The tablet is similar to the 22R Pro, but with a few annoying
> differences. Its descriptors are bigger because of the tablet's split
> coordinate system, I guess it's just that large. Thankfully, this is
> easy enough to support as all we have to do is shift bytes around.
> 
> To help code re-use, I changed the signature of
> uclogic_params_init_ugee_xppen_pro to accept a pen descriptor so we
> didn't create yet-another initialization function.
> 
> I have been testing this locally for a month or so and it works great,
> and also corroborated this with a few other testers. Since this touches
> my 22R Pro code, I have tested and checked that it didn't regress that
> device.

Applied to hid.git#for-6.19/uclogic, thanks.

-- 
Jiri Kosina
SUSE Labs


