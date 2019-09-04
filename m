Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 915DCA82D6
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2019 14:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727544AbfIDMdG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Sep 2019 08:33:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:53884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbfIDMdG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Sep 2019 08:33:06 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F33721670;
        Wed,  4 Sep 2019 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567600385;
        bh=iuK4+h4YFFTVKBy7pPD8lTU3pbW/2NrPyHqI2eq7oMw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=F0Az6iIBAvsG7fsXxY/+AWi2NV2/m2GV8hoAIXjALmOOhlgKr3IMmRG/798rn7MC1
         QmfDfBFx2xHXK6IyGww1Lh5rbkb1IIK3ZlKABmktrMPS3D+v1p7Kkf9m0xtuZjmGov
         xwwkP4calS2qlzvRpmN06gFLWxUNhgONLwyndb+Q=
Date:   Wed, 4 Sep 2019 14:32:39 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     hn.chen@weidahitech.com
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH] HID: modify quirks of i2c-hid driver for weida's
 devices
In-Reply-To: <1567151910-3819-1-git-send-email-hn.chen@weidahitech.com>
Message-ID: <nycvar.YFH.7.76.1909041432310.31470@cbobk.fhfr.pm>
References: <1567151910-3819-1-git-send-email-hn.chen@weidahitech.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 30 Aug 2019, hn.chen@weidahitech.com wrote:

> From: HungNien Chen <hn.chen@weidahitech.com>
> 
> This 'SET_PWR_WAKEUP_DEV' quirk only works for weida's devices with pid
> 0xC300 & 0xC301. Some weida's devices with other pids also need this quirk
> now. Use 'HID_ANY_ID' instead of 0xC300 to make all of weida's devices can be
> fixed on the power on issue. This modification should be safe since devices
> without power on issue will send the power on command only once.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

