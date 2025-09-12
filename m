Return-Path: <linux-input+bounces-14657-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B86B55332
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 17:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBB73AC6FE3
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 15:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB3431987D;
	Fri, 12 Sep 2025 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQMJzyYO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB5131987A
	for <linux-input@vger.kernel.org>; Fri, 12 Sep 2025 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690469; cv=none; b=tdVpr6ak/WFJ+aY57aNgguuX3dA313FQw9vBLY70ZJCTdeC9zaoxVHIJiveun0GPddjV+yVMo3pKxbTdlt3v5VRJWvfyZE9nlEuCO4LB3A5aeXgp/sQy3wvKaHYbG7/xUg6IdY/ikFgnY9rYgcuMgCVQ6XToQlsCM1rLdksfgvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690469; c=relaxed/simple;
	bh=V6Ijxc6uX7FuYAy0gAckheQWWiU02GGiKGJ528P4hyg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JO2ScX8yA7S1+OzRXDXDxLO6kVqN+gXHH6uE19P1a9JjE4Gg/uQDvVgTa2euQyEXwnsUQy9Xo+rCwiBzrl84yRGL4eqEy0wPdqDyxRQz8WfFEP7QGqg4fmx4JQXVea5VK9vfp4g2SfhiGs2TmnB9FME1hCqp15TwVhvqSaN7vmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQMJzyYO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD512C4CEF1;
	Fri, 12 Sep 2025 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757690469;
	bh=V6Ijxc6uX7FuYAy0gAckheQWWiU02GGiKGJ528P4hyg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IQMJzyYO19ZKUjjRqM+LZIPqdnWBWDmVTP8eyugNVCo6VOnwwXx8bZbi6+iEylhow
	 QHxFgPdpk5ec6PK82/REFWCCi2lDTQUpCj7vW5oAVxkf4He3h2v1AcPqXi8buatyaR
	 mkAR4AY37S2sqHF9OB3g/zJ4njnYJ69yW1vwENSD6Iys5zQ/CsKGPgLV027GnssBL6
	 jV4zNVKCaLIVrFuy7IZmLZiGhVXzXIisBB1z1UX/jxAIYRiwuEm2mnUr6qtVIPgHk0
	 AxmmvM6zJxqHS5sEMALlQCbWB4/fQwFMCFaZvONRLP7SCrUJfAAXl57/JUAbzHxLKU
	 dlSTnYdRZWJgg==
Date: Fri, 12 Sep 2025 17:21:06 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Amit Chaudhari <amitchaudhari@mac.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] hid-asus: add support for missing PX series fn keys
In-Reply-To: <20250819214919.78610-1-amitchaudhari@mac.com>
Message-ID: <6rq92n66-0n8p-879q-114r-0105p7r8q290@xreary.bet>
References: <20250819214919.78610-1-amitchaudhari@mac.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Aug 2025, Amit Chaudhari wrote:

> Add support for missing hotkey keycodes affecting Asus PX13 and PX16 
> families so userspace can use them.

Applied, thanks.

Next time, please try to follow the shortlog conventions of the subsystem, 
prefixing it with 'HID: '.
I've fixed that now manually before applying.

-- 
Jiri Kosina
SUSE Labs


