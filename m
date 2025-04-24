Return-Path: <linux-input+bounces-11963-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48885A9A8F7
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 584B01B84088
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F2B1E5B70;
	Thu, 24 Apr 2025 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="im3GCitU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C43A19F40B;
	Thu, 24 Apr 2025 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488116; cv=none; b=j/e6BBwStP7dOCJOi4UY1C73L3yFAw6Ipy9Z5kglZpQ/BHBOIgcTMmn3XX98jCK0EMfrWWYnxzWfWCD3SPPle5xoYx+TPF20TPYAxKHf9RiMDBL9Y8sR3RZ5LtAV97YbeIdWhJYG0dPn/z5BlonOHvVV6iJeONIo3Id+Cx5Gvyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488116; c=relaxed/simple;
	bh=n/inaBTjufm8fqFMcv+jCVKf3BgJPnY/qqhNvk76Af4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SPqmBuUXP5ptY+HP+r+2LuY0pRrLbtJShJ1079+j8eBNleJkT8NI7/K8niZkEo7fkFQvGWGORoMqy1qoCbm9og79nG77Uk1VZJv+o84erSucycNv0FkN0b6mXuMLF7XDeUdqmnqwvU5PmgKat8TvSmcIrhhZ8/z+Co9Dj4L7ZfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=im3GCitU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7D7C4CEE3;
	Thu, 24 Apr 2025 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745488115;
	bh=n/inaBTjufm8fqFMcv+jCVKf3BgJPnY/qqhNvk76Af4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=im3GCitUwHN4zIlUyrDEdtPOa55IhqKlViektf9CVVeGrfS0gIZ1YWTbFqIJZESk5
	 aTJIJ8V8E4qWBI6XCtKZU40ket+NFzXwm55UXwJzzkFfL0RBlwTN00+ZKY30rBOvFi
	 ZqvJA/q3zLdtqAmvyHPu/wYHQwVKvBs2rLFzNNXGmtUkqPtF3mSRke07BSmeH3QgmR
	 7EqRprp2dIfLIMGvpe8pjdK3e+6fgWUQsKYQagQpZouSt4yxJydzh4wH1L3wngT3nE
	 1Mu6Dc0IBFlwRpG1AAO2Ebg7G8+ramLXzW90/s26lRpzH3fLO1Ud9WyNuyjwW5HUZ1
	 pc/xt07Otu98Q==
Date: Thu, 24 Apr 2025 11:48:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
cc: bentiss@kernel.org, mcoquelin.stm32@gmail.com, 
    alexandre.torgue@foss.st.com, linux-input@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: thrustmaster: fix memory leak in
 thrustmaster_interrupts()
In-Reply-To: <20250327231146.6388-1-qasdev00@gmail.com>
Message-ID: <371o6n9s-sq4q-s071-24r5-8p22o933197r@xreary.bet>
References: <20250327231146.6388-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Mar 2025, Qasim Ijaz wrote:

> In thrustmaster_interrupts(), the allocated send_buf is not 
> freed if the usb_check_int_endpoints() check fails, leading 
> to a memory leak. 
> 
> Fix this by ensuring send_buf is freed before returning in 
> the error path.
> 
> Fixes: 50420d7c79c3 ("HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


