Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E282B373B43
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhEEMdK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:33:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:40772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232389AbhEEMdK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:33:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9BEE613AA;
        Wed,  5 May 2021 12:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620217934;
        bh=ILiV2D88/fcxuf6nqlI+ZspSpTn5uVJ5xNMXpsO3Ows=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=HOFQAzUxjgiRZvuDBz9fBAbdVQ44xuzBaAwKRI/PFtdRk3f2f8+e7wBajvM5lTq8Z
         7+dttQgwE6a5jK+k76yfm6LQmhtp19RaUHe4UQLLM272ho1Ib8Tl/pLfxckgUjLQ7c
         ywA2RYo0jir/CxLyg9/ZOSaQ3u2T4TpSNWN+Q+UCX13xkmuh5gbiED+u050nL/IG83
         mG7/G0NKzF201DyVtWp/wNBCwOvM3zbx1Gmro/gzm7VY0LzbU+k20yAiLw0fo6Rh6J
         bKF/sBAFFvpUR5OPOaa3+P/0/nFPt+xOICoCGwJjkxXdklfejoUhbnnu7OTh3gk9XE
         5Vi3ZAAiUFiRw==
Date:   Wed, 5 May 2021 14:32:10 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Maximilian Luz <luzmaximilian@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] HID: surface-hid: Fix integer endian conversion
In-Reply-To: <20210411113402.2594945-1-luzmaximilian@gmail.com>
Message-ID: <nycvar.YFH.7.76.2105051431580.28378@cbobk.fhfr.pm>
References: <20210411113402.2594945-1-luzmaximilian@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 11 Apr 2021, Maximilian Luz wrote:

> We want to convert from 16 bit (unsigned) little endian values contained
> in a packed struct to CPU native endian values here, not the other way
> around. So replace cpu_to_le16() with get_unaligned_le16(), using the
> latter instead of le16_to_cpu() to acknowledge that we are reading from
> a packed struct.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: b05ff1002a5c ("HID: Add support for Surface Aggregator Module HID transport")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Applied to hid.git#for-5.13/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

