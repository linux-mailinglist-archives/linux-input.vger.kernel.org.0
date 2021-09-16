Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8653A40D3A6
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 09:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbhIPHRA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 03:17:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:42064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232254AbhIPHQ7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 03:16:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E172160F51;
        Thu, 16 Sep 2021 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631776539;
        bh=XR0iDHgJpz1GsMhQZUOrZND8ovGzw3mdUlGSBvzw0rY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=M1rGMdBB/f3uAvoZJYaEMutJ54nUbNMjSsgtlgWtsuNiQZzJaXLCrmOLl+54YWTYb
         IlTlwfWgkmYLNn96xqFdcODcG9Utlor5iSNLSUPnn8/JctcDjP25ImY1Ju8g2e8ZMr
         9FwpM+jk3DR37pi8NrZgCNQbiAHRtmb/uIsdgw8e6xgXxJL/cHdoKTOz2zT0+0P83G
         C3MoaMokvpKG6H4vn/fRjtPoIu/qetwy9w1YKZES/rjnjEGrDGSU7pYKWlTTsGeDru
         QZRXRu3/hG0Ita24VX0h7sfQES5uyOmByW3WuQgOlRNcSQdXaFt4jiJnGRZ1t1UIwq
         m1Y8lI8WWh5VA==
Date:   Thu, 16 Sep 2021 09:15:36 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Evgeny Novikov <novikov@ispras.ru>
cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: Re: [PATCH] AMD_SFH: Fix potential NULL pointer dereference
In-Reply-To: <20210601163801.17848-1-novikov@ispras.ru>
Message-ID: <nycvar.YFH.7.76.2109160915270.15944@cbobk.fhfr.pm>
References: <20210601163801.17848-1-novikov@ispras.ru>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 1 Jun 2021, Evgeny Novikov wrote:

> devm_add_action_or_reset() can suddenly invoke amd_mp2_pci_remove() at
> registration that will cause NULL pointer dereference since
> corresponding data is not initialized yet. The patch moves
> initialization of data before devm_add_action_or_reset().
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

