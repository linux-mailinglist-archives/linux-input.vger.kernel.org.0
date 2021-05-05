Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC87373C65
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 15:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233599AbhEEN3c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 09:29:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:38280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232626AbhEEN3b (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 09:29:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BF8D6121F;
        Wed,  5 May 2021 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620221315;
        bh=XruXOpQ6wk1MGWHgkFB3iuhkA4jJMCmzu3vUC8XzJ4M=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=LAp8N+NdGcNdSz6GCpw2RKH5cAZom5NPGkWRfuDBgtGEGlKf9N9H1d532wxCkTvDZ
         mPq0clfTA5bR9uj5VRq2Z519SjX6NWuzQ4cptJ/fcLc4F6IafnJLXuJA2u6iG4rvKo
         2QKFew52Y64dXnyatpNLJurU5z82xYzZLkk1QIyeedNxBbv/W6VlrUUl3V4QMrC7D4
         1dso7sHv+uZcOMtFN5thYm/vgA/PmfeTw+qpXBz05fUzVcPKK5qDhyzcxcPHtA2aEj
         jmacfjleFZTswaq11csddjymUpht9AAxQIkajSbJ0NEhdGCZoV3Kar9CdyKmdI4ICf
         lNvIGqRtPCG6A==
Date:   Wed, 5 May 2021 15:28:31 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     Anirudh Rayabharam <mail@anirudhrb.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usbhid: fix info leak in hid_submit_ctrl
In-Reply-To: <CAO-hwJJ4u5NZ-81Tq3PGu-F9r3iUSCiKp=JUsTfuVsyd-Sxsew@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2105051528090.28378@cbobk.fhfr.pm>
References: <20210425173353.10231-1-mail@anirudhrb.com> <nycvar.YFH.7.76.2105051442120.28378@cbobk.fhfr.pm> <CAO-hwJJ4u5NZ-81Tq3PGu-F9r3iUSCiKp=JUsTfuVsyd-Sxsew@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 5 May 2021, Benjamin Tissoires wrote:

> I don't have a reproducer like syzbot has for the exact bug here, as I 
> am relying on one real USB device to check if usbhid is not too broken. 
> However, the test suite should catch if there is an error implied by the 
> hid_report_len() change.

Yes, that was exactly what I wanted to check, sorry for not being verbose 
enough :)

> Anyway, I manually started the job and will report when it is done.

Thanks,

-- 
Jiri Kosina
SUSE Labs

