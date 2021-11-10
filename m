Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F03644BD84
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 10:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhKJJEM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 04:04:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:45310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230440AbhKJJDd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 04:03:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD7AA61207;
        Wed, 10 Nov 2021 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636534832;
        bh=JhdMOX7fsgIX+pknT7GGdFi9+uofxDJ6ULvqaQrt81M=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=rAijYhmvqdcNm2xrQWnZMy9zaAZEwUexcaNEzrI2yGrMfyfF+RZmIQjy7WBNw27So
         t33kJOrFanNB+oOAm1ITOHnOG/p340FDGdG1SIueb8/IKta3kGaqrUkCcf459CVytx
         McRFsD7wMNhU1U35gepzYzWxlSOG6Kt76pGxdu2FhzUliplfQ5SKIpu7huIpkviGxu
         QWpuePfE2k7feEJY2qO3JM9epEm078GdZBA5WlQsXd3vTVCh4+lO2lDb5q1iGvAiQf
         u8Yt4jwFNk+pqPCiTnIJvdO3OE9Sei2JUs2rTG5s9yQa/XWdhJ8uAsT0AoJzvamIUi
         HZED18nGpY67A==
Date:   Wed, 10 Nov 2021 10:00:29 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: nintendo: unlock on error in joycon_leds_create()
In-Reply-To: <20211110081208.GH5176@kili>
Message-ID: <nycvar.YFH.7.76.2111101000180.12554@cbobk.fhfr.pm>
References: <20211110081208.GH5176@kili>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 10 Nov 2021, Dan Carpenter wrote:

> These two error paths need to drop the lock before returning.
> 
> Fixes: c5e626769563 ("HID: nintendo: add player led support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for spotting it; applied.

-- 
Jiri Kosina
SUSE Labs

