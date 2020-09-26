Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7975E2795AF
	for <lists+linux-input@lfdr.de>; Sat, 26 Sep 2020 02:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729804AbgIZAzR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Sep 2020 20:55:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:46736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729685AbgIZAzQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Sep 2020 20:55:16 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 940F920838;
        Sat, 26 Sep 2020 00:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601081716;
        bh=EF+NoQhiO1JJBHAj0iXIdzIuE6aaxukwuncM+2Rq/cQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=mUkUEjygIDgff94gbGAWGV4Jdwc67wmQQHuiII4bIv1DG6Jbb3Cahw85zqT7SDtxV
         kB2t74L3v2DaYLLMi8GqmQzhhOxbRFf8z/z7ds7O3zmRQXOc613s9Q792rZv1Xi3Ef
         ay1Z1T54HkmQmwqyL1MhWMYSKy/qT0vA3on8JnyM=
Date:   Sat, 26 Sep 2020 02:55:13 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Kenneth Albanowski <kenalba@google.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-input: fix stylus battery reporting
In-Reply-To: <20200925233552.GA4022480@dtor-ws>
Message-ID: <nycvar.YFH.7.76.2009260254550.3336@cbobk.fhfr.pm>
References: <20200925233552.GA4022480@dtor-ws>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 25 Sep 2020, Dmitry Torokhov wrote:

> With commit 4f3882177240 hid-input started clearing of "ignored" usages
> to avoid using garbage that might have been left in them. However
> "battery strength" usages should not be ignored, as we do want to
> use them.
> 
> Fixes: 4f3882177240 ("HID: hid-input: clear unmapped usages")
> Reported-by: Kenneth Albanowski <kenalba@google.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied, thanks Dmitry and Kenneth.

-- 
Jiri Kosina
SUSE Labs

