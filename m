Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA32C218AB
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 14:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbfEQM5V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 08:57:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:41282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728575AbfEQM5R (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 08:57:17 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0AC7820881;
        Fri, 17 May 2019 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558097837;
        bh=zx5GY5v+uEMUfrV+g0FKkQBDIacnlJcb9bNydyTrb6E=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=2OMEV6Z+qHn1l8QU54Un4L3tOjJKcxbKHrHgE9+t/k9YBTNB+mNz48XTzDGjB/Q4e
         OMdpJ4mB1LhE0hNpSP1IAG+8Msv0x8vRIaoiQuiJ+gYXAOAaTZD5ffmeDKiaKfQPVe
         PHvpfGZCtMQCh3VqA2a/B139K4vrvyldx8BsItoc=
Date:   Fri, 17 May 2019 14:57:14 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     Aaron Armstrong Skomra <skomra@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: Re: [PATCH 0/4] Intuos Pro 2nd Gen Small
In-Reply-To: <CAO-hwJKB-64px0vZc9b5SCxoGWbe+_2uaa=9N6_HXowa2yLv6w@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.1905171456440.1962@cbobk.fhfr.pm>
References: <1557527479-9242-1-git-send-email-aaron.skomra@wacom.com> <nycvar.YFH.7.76.1905171358160.1962@cbobk.fhfr.pm> <CAO-hwJKB-64px0vZc9b5SCxoGWbe+_2uaa=9N6_HXowa2yLv6w@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 17 May 2019, Benjamin Tissoires wrote:

> On Fri, May 17, 2019 at 1:58 PM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Fri, 10 May 2019, Aaron Armstrong Skomra wrote:
> >
> > > Add support for the Inutos Pro 2nd Generation Small.
> > >
> > > This patch set is based on top of Jason's two existing patch
> > > sets sent Apr 24th and May 7th.
> >
> > I don't think I've seen those two sets ... ?
> 
> I have them in my inbox at least. And it seemed you were not Cc-ed on them.
> https://patchwork.kernel.org/project/linux-input/list/?series=110743
> https://patchwork.kernel.org/project/linux-input/list/?series=114835
> 
> Sorry, I am catching up with fires everywhere, so didn't have much
> time to apply patches.
> 
> The first series looks good and can go in for-5.1/upstream-fixes I
> guess. I *think* the second series is fine too but I didn't have much
> dedicated brainpower to process it yet.
> 
> Jiri, do you have time today to take care of those or should I try to
> get a little bit of time later today?

If you have looked at them already and even have them in your inbox, it'd 
be nice if you could process it.

Thanks!

-- 
Jiri Kosina
SUSE Labs

