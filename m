Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAC42588D4
	for <lists+linux-input@lfdr.de>; Tue,  1 Sep 2020 09:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgIAHNc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Sep 2020 03:13:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:42798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgIAHNb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Sep 2020 03:13:31 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A228206CD;
        Tue,  1 Sep 2020 07:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598944411;
        bh=9O42hg17SuhF0BA74D2gd0OrA7+tgQO7iOSZlGi0Jgo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=05j3NqRurkkw1YWXGGdmETvF9tEC4MnXqbtDsFcAscRt8gP6FqIrxI1+bNx4cATIk
         VDlJH6jr/SCrptpmsAMsIGGsw/NXrET3UjF7QzihwDUGkR16stF2yx2yv4va+hJ5W3
         v/x/OUHWno0xYJiv6V2bkmaDwbA+9t/uTrz6otQI=
Date:   Tue, 1 Sep 2020 09:13:20 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
cc:     kjlu@umn.edu, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] HID: elan: Fix memleak in elan_input_configured
In-Reply-To: <20200831090643.32489-1-dinghao.liu@zju.edu.cn>
Message-ID: <nycvar.YFH.7.76.2009010913050.4671@cbobk.fhfr.pm>
References: <20200831090643.32489-1-dinghao.liu@zju.edu.cn>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 31 Aug 2020, Dinghao Liu wrote:

> When input_mt_init_slots() fails, input should be freed
> to prevent memleak. When input_register_device() fails,
> we should call input_mt_destroy_slots() to free memory
> allocated by input_mt_init_slots().
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
> 
> Changelog:
> 
> v2: - Add input_mt_destroy_slots() on failure of
>       input_register_device().

Thanks, applied.

-- 
Jiri Kosina
SUSE Labs

