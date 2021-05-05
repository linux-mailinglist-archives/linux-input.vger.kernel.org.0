Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5DE4373BCC
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbhEEM5P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:57:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:52968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232079AbhEEM5P (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:57:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BCE1610C8;
        Wed,  5 May 2021 12:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620219378;
        bh=1Zb271JesPBFdCkjkmH+mJDmXEwhClXgDm0amicCorE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=spgNN0pht9qa522MLfkUkpEHovaH7HzB8UG7vltGjHJxk2xRZrXXGzZdZKzf7MzvE
         br/AKZiPaU6QkD7MhqWrIrZr0l+tN6JEfWkF3/y0quH6O+WZGbyRn7JyHCDmNvxOBc
         wCPN2Zy/UjZUrTzEsgtDXK7/s+/Pt2ilJQXwFRaCKjsLa//k5BuYnUfvE4QiI/yux6
         ZEXhkbF97Y2aYjT0HgQUDNcGTIaZupZ/ROmlwBfoll0EDU4UXaXHFfLrTeheHWLRMA
         KviUoo3GT7njXHLsT4gaaF2o1EJvQVZK79J2zKau42A3iyOTWwMjto77k+VWfrhdPK
         UMD5lb2QGTi1A==
Date:   Wed, 5 May 2021 14:56:15 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hamza Mahfooz <someguy@effective-light.com>
cc:     linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hid: remove the unnecessary redefinition of a macro
In-Reply-To: <20210429000514.11650-1-someguy@effective-light.com>
Message-ID: <nycvar.YFH.7.76.2105051456060.28378@cbobk.fhfr.pm>
References: <20210429000514.11650-1-someguy@effective-light.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 28 Apr 2021, Hamza Mahfooz wrote:

> USB_VENDOR_ID_CORSAIR is defined twice in the same file with the same
> value.

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

