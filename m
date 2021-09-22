Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7594142A9
	for <lists+linux-input@lfdr.de>; Wed, 22 Sep 2021 09:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbhIVHeY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Sep 2021 03:34:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:42978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233156AbhIVHeX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Sep 2021 03:34:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B9DB610A1;
        Wed, 22 Sep 2021 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632295973;
        bh=ciGWIAguuE7hsnsC1pwMVFs4MC1KbTS7E8IIgqu0jGc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=sVAJiF3o3n+GCgfk+MdlZL1eaI5r42JpSEuReQlXp9fYyp3WtkIrXh98Ker1ASRCA
         kkskhAVNiuX2Hl/Rkp2KheGQqbRuSN54gmQJ+xAmQFfVudGtq8BtvqT8UzTY5HKczW
         //jErVmAPcSyHeErjMqXgyY5IWRKpyMiK5H4y/+pJcqVRlCowV7N4LqIhylajvD2jC
         7osbXoZKta6us7W8s9c3BHdNu2ZOgNnFIcSa6hLfF81G71UkVt+qaECbAMOfn8vNGQ
         I1aVniQ6dyt23e/ePSz43LGkpSz7Rh0q94Eg5iXJYPLzmxH3FnG6TxfaMabL/vhDRl
         h8FGM3ciYuRlA==
Date:   Wed, 22 Sep 2021 09:32:50 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Alexander F. Lent" <lx@xanderlent.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: apple: Eliminate obsolete IR receiver quirks
In-Reply-To: <20210916193840.419682-1-lx@xanderlent.com>
Message-ID: <nycvar.YFH.7.76.2109220932410.15944@cbobk.fhfr.pm>
References: <20210916193840.419682-1-lx@xanderlent.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 16 Sep 2021, Alexander F. Lent wrote:

> This code has been dead since 2013, when the appleir driver was added by
> commit 9a4a5574ce42 ("HID: appleir: add support for Apple ir devices"),
> removing Apple IR receivers from this driver.
> 
> No other Apple devices use these quirks, so drop them.

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

