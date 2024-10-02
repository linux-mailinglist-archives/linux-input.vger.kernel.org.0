Return-Path: <linux-input+bounces-7016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1910598D3AA
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 14:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99A31B20E29
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 12:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F611CFED7;
	Wed,  2 Oct 2024 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hl8KVgTC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BE61CFED4;
	Wed,  2 Oct 2024 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727873569; cv=none; b=pE5gwNgp9CCNJY23fnS9SB/+Vq+/NWt7q2HQDLFpIIhkn5PEfjtMs4WfXkAA7J9R3FKskpyBSHWZCTIslOzCkYWSFInsroSTZ7ypqy2AutdE9mcYCVJjkBmqQhfIU9aHFt4psuB5+Bmx3RD9Jc5x1y/rfzqEiHAxfWOo/QheDqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727873569; c=relaxed/simple;
	bh=9BXVLPB5HL/AsiVffyG7sDFN9avsIyuqjYR1AJyxW7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZQXPj9eLGAy/ZjI0nmZLPEKdoBAvubMxYvS/Oj0fsy0tn+VF8/WPRcxadqy6lQCgq5meRZJBCNA5EF+obflvGs1+X0zrIgiY05xWIbzIYK9g30xjXlOGJLMIFvEm01rN2MlT8hRu0WF3TsH5jjIVNgMii5NHn6WhHvKucna3EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hl8KVgTC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73086C4CEC5;
	Wed,  2 Oct 2024 12:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727873569;
	bh=9BXVLPB5HL/AsiVffyG7sDFN9avsIyuqjYR1AJyxW7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hl8KVgTClzNo+tWKSp8NuYXy2c0je8FrSMEARnkkUhBf6tGk3zK/3lo89nHIW/Cj7
	 BrCEU54Mihj5XdZbk3D1+l4y+RHtBJk7FpGtNzelThC0/vQau86VNvsjqCGExAIyGh
	 D53oYInyk+Eis4/U3RuqLF9x6SBsPesOsvqo4ggPSgTwRonv9T/dFmyreO79zuEqzn
	 4ze2vmjmIeS/l/FS9pA8C1lgJNTkBTVBHpRWdRYBmQTpYTv47bOsb8O9ktk9TDjfe/
	 ovs5EKE3yGKMcdpdlu+D7IXg2xlQsWqSqnC0ucagvRYMP7yg9C/67hwIJP/WpGWHjP
	 6AaGq3Ri15xjQ==
Date: Wed, 2 Oct 2024 13:52:43 +0100
From: Lee Jones <lee@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org,
	hdegoede@redhat.com, jelle@vdwaa.nl, jikos@kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
	ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <20241002125243.GC7504@google.com>
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240927124152.139099-1-wse@tuxedocomputers.com>

On Fri, 27 Sep 2024, Werner Sembach wrote:

> Hi,
> first revision integrating Armins feedback.
> 
> Stuff I did not yet change and did not comment on previously:
> - Still have to ask Christoffer why the mutex is required
> - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
> - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
> 
> Let me know if my reasoning is flawed

Use `git format-patch`'s --annotate and --compose next time please.

-- 
Lee Jones [李琼斯]

