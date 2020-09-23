Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE3D2756E0
	for <lists+linux-input@lfdr.de>; Wed, 23 Sep 2020 13:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgIWLLY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Sep 2020 07:11:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:38670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgIWLLX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Sep 2020 07:11:23 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 83DDD2145D;
        Wed, 23 Sep 2020 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600859483;
        bh=hkQAUNzoIZDlIOnSqsIjT4FANxzRdAr5tRKOTda18yA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=SlZuamR/U7BgydtmHUtuaSPvgzv+Od8Q6GLABJnNb6z3l7R3XiZ4E0+/wm3IO2NCc
         XEOBK0eIVR123zmzN3Rn4Wv4iOsPD8gS9bcyatjpxmo28bdwu8NOM1ND3aBIQ+EJCc
         U5+5H1vU1LxZ+b4kn6p70XXEL86k4/dDJqKwcPM8=
Date:   Wed, 23 Sep 2020 13:11:20 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Xiaofei Tan <tanxiaofei@huawei.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxarm@huawei.com
Subject: Re: [PATCH] HID: core: fix some doc warnings in hid-core.c
In-Reply-To: <1600776012-7663-1-git-send-email-tanxiaofei@huawei.com>
Message-ID: <nycvar.YFH.7.76.2009231311110.3336@cbobk.fhfr.pm>
References: <1600776012-7663-1-git-send-email-tanxiaofei@huawei.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 22 Sep 2020, Xiaofei Tan wrote:

> Fix following warnings caused by mismatch bewteen function parameters
> and comments.
> drivers/hid/hid-core.c:931: warning: Function parameter or member 'hid' not described in 'hid_parse_report'
> drivers/hid/hid-core.c:931: warning: Excess function parameter 'device' description in 'hid_parse_report'
> drivers/hid/hid-core.c:961: warning: Function parameter or member 'hid' not described in 'hid_validate_values'
> drivers/hid/hid-core.c:961: warning: Excess function parameter 'device' description in 'hid_validate_values'
> drivers/hid/hid-core.c:1452: warning: Function parameter or member 'report' not described in 'hid_match_report'
> drivers/hid/hid-core.c:1452: warning: Excess function parameter 'report_type' description in 'hid_match_report'
> drivers/hid/hid-core.c:2132: warning: Function parameter or member 'drv' not described in 'new_id_store'
> drivers/hid/hid-core.c:2132: warning: Excess function parameter 'driver' description in 'new_id_store'
> 
> Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

