Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B122EC103
	for <lists+linux-input@lfdr.de>; Wed,  6 Jan 2021 17:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbhAFQV1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jan 2021 11:21:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:49344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727290AbhAFQV1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 Jan 2021 11:21:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 658082312E;
        Wed,  6 Jan 2021 16:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609950046;
        bh=h8eyk7nd0obMPs3jtUBDSaJ6fJKDS8vcQ9Sx4FZowu0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=SJ/R0jgs7ujKw7Sj3zC3X+/4/8/ZPibWFsnAVujXKcoynDNOPy45Ii2b+s1mP7nsM
         9r30kJGEibvT/b0wtWNc0CGfLGR59gIOMoBZb8VHizzQAlRJHHuCD0XvwtstPlGSe2
         x9SGN4inSMCZrBo/RO3Irr1mH9JaM0Lt0v/0fzx16sfPQI5Waze5mKi3KaJyIzCHZf
         dzMdz3TxyxjubTFJiY+yyDv2a22lDOj7Kl0IG1SN94kMHzrM8ELWBp0cCH1NFV6QQF
         7dbOnsEHl7cs+1XgkjthM14uBLQGpT/zyQdUREwBVyaR+NnaTq0/Wgt+F6g71mrOvU
         id9dkrDZU+new==
Date:   Wed, 6 Jan 2021 17:20:43 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Zhang Lixu <lixu.zhang@intel.com>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        srinivas.pandruvada@linux.intel.com, benjamin.tissoires@redhat.com
Subject: Re: [PATCH 0/2] hid: intel-ish-hid: ipc: enable OOB support for
 EHL
In-Reply-To: <20201216063640.4086068-1-lixu.zhang@intel.com>
Message-ID: <nycvar.YFH.7.76.2101061720310.13752@cbobk.fhfr.pm>
References: <20201216063640.4086068-1-lixu.zhang@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 16 Dec 2020, Zhang Lixu wrote:

> The EHL (Elkhart Lake) based platforms provide a OOB (Out of band)
> service, which allows wakup device when the system is in S5 (Soft-Off
> state). This OOB service can be enabled/disabled from BIOS settings.
> 
> These two patches is to enable this feature for EHL platform.
> 
> We have tested these patches on both ISH platforms and EHL platforms,
> it works fine.
> 
> Zhang Lixu (2):
>   hid: intel-ish-hid: ipc: finish power flow for EHL OOB
>   hid: intel-ish-hid: ipc: Address EHL Sx resume issues
> 
>  drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
>  drivers/hid/intel-ish-hid/ipc/ipc.c     | 27 +++++++++++++
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 54 ++++++++++++++++++++++++-
>  3 files changed, 81 insertions(+), 1 deletion(-)

Applied to hid.git#for-5.12/intel-ish.

-- 
Jiri Kosina
SUSE Labs

