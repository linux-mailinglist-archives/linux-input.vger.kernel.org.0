Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6ABF3B2E8B
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 14:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhFXMHt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Jun 2021 08:07:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:55772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229437AbhFXMHs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Jun 2021 08:07:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5FDC613DC;
        Thu, 24 Jun 2021 12:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624536329;
        bh=QRt9BUhdryDuOCzNWCyDrqVE4QwtYRomdv7yMTB/nMk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=EpFi0xXq/cFCB6PSCxSO0RdIf4hZ98tp7GqO7uhD7gV9megfhjyZYqp+Tzh7h2BWV
         d4atNYSky4ccXBNvKgc+KLgo4frKHw1Mhp77kWgxrL2LEqq1/xpnrhf24VJE5HLbUE
         06Of7pz4wionkM0F5MFhZ6Pc7wHApHb4Kqw+YtWJXtnhv/l6JQ/xpgVydOgh2DF9Px
         fk8+IcvNiLkQ1ATwHA7Y9jv/HXW426/EbDzgiFJ3XdTwMCMPp7PB50VlG2eqw92Z1U
         6GGyzjz7Eitn4zP6zp1hNC0hx3wz3JFPtlNjlznmLJSiZ4TG37tl1fo5jKf00RUV+Q
         PAvKV91Sc2dHQ==
Date:   Thu, 24 Jun 2021 14:05:26 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
cc:     benjamin.tissoires@redhat.com, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: hid-pidff: Fix missing error code in
 hid_pidff_init()
In-Reply-To: <1622545518-18949-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Message-ID: <nycvar.YFH.7.76.2106241405110.18969@cbobk.fhfr.pm>
References: <1622545518-18949-1-git-send-email-jiapeng.chong@linux.alibaba.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 1 Jun 2021, Jiapeng Chong wrote:

> The error code is missing in this code scenario, add the error code
> '-EINVAL' to the return value 'error'.
> 
> Eliminate the follow smatch warning:
> 
> drivers/hid/usbhid/hid-pidff.c:1297 hid_pidff_init() warn: missing error
> code 'error'.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

This has already been fixed in hid.git via 3dd653c077efd.

Thanks,

-- 
Jiri Kosina
SUSE Labs

