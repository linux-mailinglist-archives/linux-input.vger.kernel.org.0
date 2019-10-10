Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAC4BD3126
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2019 21:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfJJTM3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 15:12:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:36708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbfJJTM2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 15:12:28 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F19822067B;
        Thu, 10 Oct 2019 19:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570734748;
        bh=61T0gvjer9CvIGrqUXvutjaRIy5VBi8mdN4C3nBAtAY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Xz+BY1Cz/L/bSiaZcPIMJgAA5qcufrtQzY2Q7/J39HVBAhNWr9O9ybnPsc0+DvwwA
         A9EulqwOK8bZlsqz+dWIq8fa6re7+2mX2A4epi4Uy3IMjfMhaf9pty696Zrs12N8Ac
         wMXYrf4MPg6JoZOywjx/ByXwohPBJexu4+HypfaA=
Date:   Thu, 10 Oct 2019 21:11:58 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Nicolas Boichat <drinkcat@chromium.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dtor@chromium.org, ikjn@chromium.org
Subject: Re: [PATCH 2/2] HID: google: Detect base folded usage instead of
 hard-coding whiskers
In-Reply-To: <20191003031800.120237-2-drinkcat@chromium.org>
Message-ID: <nycvar.YFH.7.76.1910102111410.13160@cbobk.fhfr.pm>
References: <20191003031800.120237-1-drinkcat@chromium.org> <20191003031800.120237-2-drinkcat@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 3 Oct 2019, Nicolas Boichat wrote:

> Some other hammer-like device will emit a similar code, let's look for
> the folded event in HID usage table, instead of hard-coding whiskers
> in many places.

Applied to for-5.5/whiskers. Thanks,

-- 
Jiri Kosina
SUSE Labs

