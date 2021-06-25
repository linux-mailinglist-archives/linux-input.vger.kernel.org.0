Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B66E3B42D4
	for <lists+linux-input@lfdr.de>; Fri, 25 Jun 2021 14:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhFYMGB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Jun 2021 08:06:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:52206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229712AbhFYMGA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Jun 2021 08:06:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07EB661623;
        Fri, 25 Jun 2021 12:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624622619;
        bh=33XLklBIW6AbWqlE9w6IE9tw4mR0CfjrOzZvqAcBb1g=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=LSaKudC1vlDwpn4qbhtT5SzO3VzbBbSZrDSTbCn4H5P26CGpqHUcTr2SXynKLYjcf
         6cYdiByzgLMen2mnYXtV8D6JXAmCyvBtjT76gGqANJTvuyBFmMJR0cR27Mv0a9m9C3
         kvg8W7aAOxbaOXanHiQ24LoLGj0JWiekqZ5sK7XFmXrqmIHuLJo6dcuMvCodB78hiD
         IHviZZtx5n4TTDQp8HDf590nVwbvglMX3Qpn6GqFD++qUyWHulWu6idN3WiZ4cC8e/
         R4jtpd3CwFQN50reori3XVjNAPNG2e9cH2aJzLEfeyNpScFetHYUsSPlOQ+KfLICnU
         N7Oqpwdifp0+w==
Date:   Fri, 25 Jun 2021 14:03:37 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 1/4] HID: core: Add hid_hw_may_wakeup() function
In-Reply-To: <e578896a-52a5-63e2-cf59-fd18d6d0da8f@redhat.com>
Message-ID: <nycvar.YFH.7.76.2106251403220.18969@cbobk.fhfr.pm>
References: <20210529151424.12212-1-hdegoede@redhat.com> <20210529151424.12212-2-hdegoede@redhat.com> <1837eed3-8f99-d9be-0d35-d4b21c0e6f4e@redhat.com> <e578896a-52a5-63e2-cf59-fd18d6d0da8f@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 24 Jun 2021, Hans de Goede wrote:

> >> Add a hid_hw_may_wakeup() function, which is the equivalent of
> >> hid_hw_may_wakeup() for hid devices.
> > 
> > nitpick here, but I think the second `hid_hw_may_wakeup()` is probably wrong.
> 
> Right, the second `hid_hw_may_wakeup()` here should be
> `device_may_wakeup()`. Jiri can you fix this up while applying
> or do you want a new version ?

No worries, I have fixed that up and applied. Thanks,

-- 
Jiri Kosina
SUSE Labs

