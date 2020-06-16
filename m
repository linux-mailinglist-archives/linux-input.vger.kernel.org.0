Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDACC1FABEA
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 11:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgFPJI6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 05:08:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:40878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726052AbgFPJI5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 05:08:57 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FB3120679;
        Tue, 16 Jun 2020 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592298537;
        bh=7Qa4mM8KgfhmotUA5hQlnoGWSH1rIvpzaj3OQr5EUSU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=jF3YoqXH8IeGKg90r6lpZ7hSVqsST1gnBqI94D5FvpLD24LMi8ffsZQNvOOn0BAD5
         jBW2cLy7u0e0M0SvQinoT9b20bp3Y/kMGiZFa5d8qUdduVOhUcwR4gglkL3a07OK8q
         2sBCWqtRQ7tuE8bB+haqjW+wame3kq792eR+EE9o=
Date:   Tue, 16 Jun 2020 11:08:53 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
cc:     Siarhei Vishniakou <svv@google.com>,
        linux-input <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: Kasan crash in hid-steam
In-Reply-To: <20200615174149.GA38082@casa>
Message-ID: <nycvar.YFH.7.76.2006161108150.13242@cbobk.fhfr.pm>
References: <CAKF84v0xsK2d+XEEnNC+SnE987fDaD=RyvZzZW3ew8L4K0JHzg@mail.gmail.com> <20200613122235.GA11175@casa> <CAKF84v05UjZg-7ZrVcwExk7Jkux=siR4Y8UnMt7KV0-9BrRfzg@mail.gmail.com> <20200615174149.GA38082@casa>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 15 Jun 2020, Rodrigo Rivas Costa wrote:

> > Thanks Rodrigo,
> > 
> > I ran the test 50 times with your patch, and no crashes.
> 
> Great! Let me CC the linux-input maintainers, to see if they can commit
> this.
> 
> > Tested-by: Siarhei Vishniakou <svv@google.com>
> Signed-off-by: Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>

Thanks for fixing the issue.

Could you please send me/Benjamin the patch, with changelog and all the 
signed-off-by/Tested-by lines, so that we could apply it?

Thanks,

-- 
Jiri Kosina
SUSE Labs

