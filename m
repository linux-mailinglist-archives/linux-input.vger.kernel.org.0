Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C911B21F237
	for <lists+linux-input@lfdr.de>; Tue, 14 Jul 2020 15:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgGNNPe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jul 2020 09:15:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:39910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727046AbgGNNPe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jul 2020 09:15:34 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC43822203;
        Tue, 14 Jul 2020 13:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594732533;
        bh=Htq4vPmtu6PSKGjJFhj/14T9Fj0KkZ2Da6fFdLjHynk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=1vGxWNrLcrezO7iI9KBIXIsulblf+tm7Hvf03Mvnx27CAh88Nc5y60oBfvSNbmm+m
         A72W+1z43VZpXV1nFCRm5uUy31Mcjuk60MofJfPVBgcZ4oE/woJ0yPR0WOy5HvBsIc
         KpixxQFu4ADQdKazfQTFRU47/1HiREmNxS7xEyh8=
Date:   Tue, 14 Jul 2020 15:15:29 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
cc:     benjamin.tissoires@redhat.com, hdegoede@redhat.com,
        anthony.wong@canonical.com,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Pavel Balan <admin@kryma.net>,
        Aaron Ma <aaron.ma@canonical.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] HID: i2c-hid: Enable wakeup capability from
 Suspend-to-Idle
In-Reply-To: <20200709075731.5046-1-kai.heng.feng@canonical.com>
Message-ID: <nycvar.YFH.7.76.2007141515190.23768@cbobk.fhfr.pm>
References: <20200709075731.5046-1-kai.heng.feng@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 9 Jul 2020, Kai-Heng Feng wrote:

> Many laptops can be woken up from Suspend-to-Idle by touchpad. This is
> also the default behavior on other OSes.
> 
> However, if touchpad and touchscreen contact to each other when lid is
> closed, wakeup events can be triggered inadventertly.
> 
> So let's disable the wakeup by default, but enable the wakeup capability
> so users can enable it at their own discretion.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

