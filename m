Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70BFC1E1D35
	for <lists+linux-input@lfdr.de>; Tue, 26 May 2020 10:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731404AbgEZIYC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 May 2020 04:24:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:46272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728949AbgEZIYB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 May 2020 04:24:01 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B56E207D8;
        Tue, 26 May 2020 08:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590481441;
        bh=ok47yd95+p351/UWjZqTJKy0HYsB+Gptf2FDZPN4qt4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=HtBJ6tRvKaCcav5uwIyyLaI4TUMvIxJ/KSSwScuHw2isvkTAxPZVtoS6yrrXCbD2R
         2z03Vn2wdgd19chiy8k2v9QA2QeXtGHqrlAW4+lBFqow9x6lGphB6DSAb4anOsRTvY
         C3RVT84WWj7Q6SMSN878kgbPfzd+4whDWvhBxb1g=
Date:   Tue, 26 May 2020 10:23:57 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
cc:     benjamin.tissoires@redhat.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: multitouch: Remove MT_CLS_WIN_8_DUAL
In-Reply-To: <20200414091842.25972-1-kai.heng.feng@canonical.com>
Message-ID: <nycvar.YFH.7.76.2005261023250.25812@cbobk.fhfr.pm>
References: <20200414091842.25972-1-kai.heng.feng@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 14 Apr 2020, Kai-Heng Feng wrote:

> After commit c23e2043d5f7 ("HID: multitouch: do not filter mice nodes"),
> MT_CLS_WIN_8 also supports mouse nodes, hence make MT_CLS_WIN_8_DUAL
> redundant.
> 
> Remove MT_CLS_WIN_8_DUAL accordingly.

Benjamin, can I get your Ack on this one please?

Thanks,

-- 
Jiri Kosina
SUSE Labs

