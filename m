Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66173B3003
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 15:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhFXNgC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Jun 2021 09:36:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:57248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhFXNgB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Jun 2021 09:36:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9FBE60FD9;
        Thu, 24 Jun 2021 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624541622;
        bh=O2I69TLhOqa5YCAAvlK2YkSpMRBWz/dmGuYy8PcAUZo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=OpLYG3zybn8V4R1zfKzmH2mKfSVAh3286XKCokDK8lW1IOFZyzpppT+2v8uAOYdUF
         1J2M1TSbj4+TXy4rL+I71aQ9eTISTa+yjsXMwiZV1Yqsgyaqi4PeDiKkvV8tvyXH6y
         yaXnttJe2FrAuwTRXIkDi6p9NOShUcoldjcHPlDV3HTyJvzQpZS7VsecKhdLdu7KBX
         mH4cK+CGwaSdjYF319AS+XzHhw8RvZlNgzPbPszm+C8FMD4DZEsvmwXqm8OnUi0Yqb
         bq2fz+dd1SHyJlX8+3iIWZJoF/OflsVJfA8H/5o1rUQIzltPyhYi0lZSWT/E3/hoJR
         dvNRJCxNgc1iw==
Date:   Thu, 24 Jun 2021 15:33:39 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] HID: magicmouse: register power supply
In-Reply-To: <20210522180611.314300-1-jose.exposito89@gmail.com>
Message-ID: <nycvar.YFH.7.76.2106241532511.18969@cbobk.fhfr.pm>
References: <20210522180611.314300-1-jose.exposito89@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 22 May 2021, José Expósito wrote:

> Unlike the Apple Magic Mouse 1 and the Apple Magic Trackpad 1, the
> second generation of the devices don't report their battery status
> automatically.
> 
> This patchset adds support for reporting the battery capacity and
> charging status for the Apple Magic Mouse 2 and Apple Magic Trackpad
> 2 both over bluetooth and USB.
> 
> This patch:
> 
> Register the required power supply structs for the Apple Magic Mouse 2
> and the Apple Magic Trackpad 2 to be able to report battery capacity
> and status in future patches.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> ---
> 
> v2: Add depends on USB_HID to Kconfig

Hmm, why is this dependency needed in the first place, please? I think 
trying to keep the drivers independent on transport drivers (especially in 
cases like this, where more variants of physical transports actually 
really do exist) is worth trying.

Thanks,

-- 
Jiri Kosina
SUSE Labs

