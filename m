Return-Path: <linux-input+bounces-14448-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E2AB41C27
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 12:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 342D44E14ED
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 10:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C642F39A7;
	Wed,  3 Sep 2025 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUPe8Rjp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5C2F39A0;
	Wed,  3 Sep 2025 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896310; cv=none; b=O3NE3nCMQ/N2jnYpjW4uC9zk780m9lEG6L+TriKrnOqKXe1Vhf7mH/4RJF5C/OGAYSiK+yojQMU26O5C/fkB0V16zTcFh4gOXXfylEapVWAXrbjYgaE12kKFVW0vrkxCGn9OYxiflFjmwDm90bfb3M0GAXC5eUBYpz92eWs12zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896310; c=relaxed/simple;
	bh=mEqfqIFN4bM6DV8MElBDJVLtVNf3iLrehirNhXZIsBk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=As6tlDcyNvxlMuzvp+5LH6xt4qVD00BrWCE6N8d68exQCkxYZR4Mx0DKP2AQB/27OWsIK/5xGv5nqm9AJTuTKzCMSODkawBbGU3U2PSUheBB8y9s3rp9uPNzQLQtpt4JfI0E2C5zA9lbLrjqdA22ilVVhI4iXeeIJTTuafcM99s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUPe8Rjp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE010C4CEF0;
	Wed,  3 Sep 2025 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756896310;
	bh=mEqfqIFN4bM6DV8MElBDJVLtVNf3iLrehirNhXZIsBk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WUPe8RjpCcpBowXq0/+Ziajl57mWKTKeXJwmPRn+TZewubJLYLC8jGnOPXgGIaFMy
	 XWJNs9OwNnCwE4RP5L3ISNHCOg8Ig4KizN2DiD4lkDlx3o1i5oj6P7EVHFpZ7e9IWc
	 MfZgnZEQi6VCMu6j/ovD+Ltbs1yleN1K7bIuH0rVRgOLD/i19b+gQe2KlV8toJju6K
	 uqwSQL9W25UPZULm8ofRVy3PuwRPJbtscxi86KB+eT3pwLvvzvEP/or2Rm68A5D/A6
	 oxkwaG7N0Fc3MMzWNC+dU+CnvJ66xEo813WqJfcGFAfxSEsGXjCzFz71IFRqtjsWno
	 pXYsUl6zNDYRA==
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Michael Walle <mwalle@kernel.org>
Cc: jcormier@criticallink.com, Job Sava <jsava@criticallink.com>, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
In-Reply-To: <20250826134631.1499936-1-mwalle@kernel.org>
References: <20250826134631.1499936-1-mwalle@kernel.org>
Subject: Re: [PATCH v2 0/3] mfd: tps6594: add power button and power-off
Message-Id: <175689630841.2597045.5125819314695096057.b4-ty@kernel.org>
Date: Wed, 03 Sep 2025 11:45:08 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Tue, 26 Aug 2025 15:46:28 +0200, Michael Walle wrote:
> I took over the series from [1] since the original developer was an
> intern and is no longer with their former company.
> 
> Changelog is in the individual patches. But the most prominent
> change is that the pin mux config is now read from the chip itself
> instead of having a DT property.
> 
> [...]

Applied, thanks!

[1/3] input: tps6594-pwrbutton: Add power button functionality
      commit: 170031ff27dd7a07fdedee7f3710a19dcdf889bd
[2/3] mfd: tps6594: add power button functionality
      commit: d766ca01c208bdf0f36098607efe1e250ccf41c5
[3/3] mfd: tps6594: Add board power-off support
      commit: 2215a87b02ad8d353cd3edebd1bed01db2458986

--
Lee Jones [李琼斯]


