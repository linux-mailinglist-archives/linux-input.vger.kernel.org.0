Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2F6FE10B
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 16:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbfKOPTm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 10:19:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:38152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727412AbfKOPTm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 10:19:42 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB8B220733;
        Fri, 15 Nov 2019 15:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573831181;
        bh=dvjnEIHSy400gpeS88Oc5WlRkFYNGVT4az4buCDspf8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=qzdaMcVc1F5PwDHu6+K/I4YxoOLi7EEkGUPsvA5Bjn/Sy/BseGkKPwOSbMwDX9o6o
         YKDkaE7iqky4lZi5pIdfQ7cXUfPRpwUZZf377JY7Yj14KSaCTykkYvudnRcZRIEyMc
         cYzjDfbnRS2ig3MxBbJnFOFe/Rz9FpUYJYuIpbc8=
Date:   Fri, 15 Nov 2019 16:19:38 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Aaron Ma <aaron.ma@canonical.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: fix no irq after reset on raydium 3118
In-Reply-To: <20191113191247.1984-1-aaron.ma@canonical.com>
Message-ID: <nycvar.YFH.7.76.1911151619270.1799@cbobk.fhfr.pm>
References: <20191113191247.1984-1-aaron.ma@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 14 Nov 2019, Aaron Ma wrote:

> On some ThinkPad L390 some raydium 3118 touchscreen devices
> doesn't response any data after reset, but some does.
> 
> Add this ID to no irq quirk,
> then don't wait for any response alike on these touchscreens.
> All kinds of raydium 3118 devices work fine.
> 
> BugLink: https://bugs.launchpad.net/bugs/1849721

Applied, thank you Aaron.

-- 
Jiri Kosina
SUSE Labs

