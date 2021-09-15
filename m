Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9905840C779
	for <lists+linux-input@lfdr.de>; Wed, 15 Sep 2021 16:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237961AbhIOOdK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Sep 2021 10:33:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:39574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233771AbhIOOdJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Sep 2021 10:33:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8F3D6044F;
        Wed, 15 Sep 2021 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631716311;
        bh=YkclizvbWMmiIkvXewz1CSndv/hj5phCYHjaoOz0nro=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Cd+aAokzBr430sd/rBB8OtMsmd7hYvE6h+I8Xe7r1UjQeh7R10kFKJf574U4ze2fl
         3zIJ8iG40SWHAc3VwM3pqtbswxIuibRj21eqLa0Idd7UwmKV+pywSEKxbKOhb9aipd
         hZWa2rNOt7Rq7ZLb79kG9dhc9Qd0A8Alj7mm0W47UOOL4pmmUdXHazYueHu5upbyYB
         ofCF/mVTYC/NpeoFpC/WackmXbEW0zduOGvlz/Q7znqJsruhife4SrOnMoyTmu0yNm
         i4bfpWqP8Uj69zIJSyFIvgM/px74ZEqT+rtN1pLtTW1j53F+b0yxwONKdHIYJ0taf2
         u6lY1t12EpTxg==
Date:   Wed, 15 Sep 2021 16:31:48 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, paskripkin@gmail.com
Subject: Re: [PATCH v3] HID: betop: fix slab-out-of-bounds Write in
 betop_probe
In-Reply-To: <20210824150730.9118-1-asha.16@itfac.mrt.ac.lk>
Message-ID: <nycvar.YFH.7.76.2109151631410.15944@cbobk.fhfr.pm>
References: <20210816201544.26405-1-asha.16@itfac.mrt.ac.lk> <20210824150730.9118-1-asha.16@itfac.mrt.ac.lk>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 24 Aug 2021, F.A.Sulaiman wrote:

> Syzbot reported slab-out-of-bounds Write bug in hid-betopff driver.
> The problem is the driver assumes the device must have an input report but
> some malicious devices violate this assumption.
> 
> So this patch checks hid_device's input is non empty before it's been used.
> 
> Reported-by: syzbot+07efed3bc5a1407bd742@syzkaller.appspotmail.com
> Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

