Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2876F3CA96F
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 21:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242872AbhGOTGm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 15:06:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:38430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242784AbhGOTFn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 15:05:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BA70613CA;
        Thu, 15 Jul 2021 19:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626375721;
        bh=VNYXS1+EO6k9ErzzdYrR5pTqdNnHxOE/8xNvIWzk618=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=EVfX4vvE5CZwEN7GtJglnBLgMirZhIGPJ6E+7ZlebFSDQBP3HBzYbC2LLXAUmtXcl
         UgOoanDEcAQGVWjEAyxvDu95MoWDX9NE+KUdYc6IO9wnXAJU0evUAAP+sDkwE5FvKi
         cjodUCL1Bvf6YMgL1TtigPvI6X0QrLopS8bwBxHKfoqVzfY58b9y//t/kHR7NxFXOd
         M4akk5Rh3qEH516M1A1wXJGrcLBH0GKxzGXgo2QtW6nbi7k/FHgY9KjGuTU2j0Dqoe
         d/j8Y3+h89FhZp3gM3H6Stdspph6FcwxlaCZTb3ESBqYMABEtCfI8Gw+yXZlSmIzsI
         mHdPkPHxtWafA==
Date:   Thu, 15 Jul 2021 21:01:58 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Luke D. Jones" <luke@ljones.dev>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: asus: Remove check for same LED brightness on set
In-Reply-To: <20210704222659.882193-1-luke@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2107152101520.8253@cbobk.fhfr.pm>
References: <20210704222659.882193-1-luke@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 5 Jul 2021, Luke D. Jones wrote:

> Remove the early return on LED brightness set so that any controller
> application, daemon, or desktop may set the same brightness at any stage.
> 
> This is required because many ASUS ROG keyboards will default to max
> brightness on laptop resume if the LEDs were set to off before sleep.
> 
> Signed-off-by: Luke D Jones <luke@ljones.dev>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

