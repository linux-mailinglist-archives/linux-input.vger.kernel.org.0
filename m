Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0955C441CBD
	for <lists+linux-input@lfdr.de>; Mon,  1 Nov 2021 15:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhKAOjk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Nov 2021 10:39:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:44102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230204AbhKAOjk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Nov 2021 10:39:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1493C60F0F;
        Mon,  1 Nov 2021 14:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635777426;
        bh=8/GDn0x+jg87Xg+DrvZNagRBZ50QrDE4QG9+BADF8PU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Y39rKQBPLRdKYSWh1fETteN1HGnO+Ukies9g5UKLcYJJYxZuyfMigi/Si/5qMhfuF
         4Tyq3quhKIrg9Xf2PbsJ9tlb02N07A8cbH6R5prlhL62rCHNuLS+lLTyHwONzYjD6K
         4OgUpxaqLs0j7RnWMVCTKRCn9RQN5g5LYzIb7XUl1+WcNBShZq62umnGMS9z3t1VJP
         ItbZuswlSaTOfyKMab794OUkhJ7r8B/40BPu5qGDvbArsl/te1hCsw6GpLvVc7JHuu
         WG8OeLuLuGrNiJ+jtGBWl4EidHTrWS+gN0/N4NHuz8GGL6CQTU2kCK2w9GHLxj9Iwl
         /BF7CAFVNQg5w==
Date:   Mon, 1 Nov 2021 15:37:03 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick.Colenbrander@sony.com
cc:     arnd@kernel.org, benjamin.tissoires@redhat.com,
        roderick@gaikai.com, arnd@arndb.de, pobrn@protonmail.com,
        djogorchock@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid: playstation: add LEDS_CLASS dependency
In-Reply-To: <BY5PR13MB3826F4B874D9EE466B9FF18798879@BY5PR13MB3826.namprd13.prod.outlook.com>
Message-ID: <nycvar.YFH.7.76.2111011535190.12554@cbobk.fhfr.pm>
References: <20211029114044.1058958-1-arnd@kernel.org> <BY5PR13MB3826F4B874D9EE466B9FF18798879@BY5PR13MB3826.namprd13.prod.outlook.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 29 Oct 2021, Roderick.Colenbrander@sony.com wrote:

> Thanks you beat me into looking at this. Something like this got dropped through all the iterations this went through earlier this year.
> 
> I would maybe prefer to make this a hard dependency on multicolor. If 
> conditional not all devices will enable it. We have had various issues 
> already on e.g. Android were some vendors didn't set certain options.

Ah, sorry, I've seen the mail from 0day bot first before Arnd's mail, and 
the fix (adding hard dependency on LEDS_CLASS_MULTICOLOR) is already 
pushed out.

Thanks,

-- 
Jiri Kosina
SUSE Labs

