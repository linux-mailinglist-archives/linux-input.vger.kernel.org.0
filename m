Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3276A3F2BFA
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 14:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240189AbhHTMXk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 08:23:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:34720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237882AbhHTMXj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 08:23:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07C7060FE6;
        Fri, 20 Aug 2021 12:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629462182;
        bh=5S9q4nhazyBUfMjB1XZTApAg3QkJ9BP0SSfP8zlmtxs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=QquzbTa2B8N8G+GJAgVn2W6BmTyAaxDmBZ/IjULhlpz+r2wiWof/gO302DoumfQur
         MDzVixcxcfxONcyaBsnEAd0HlcwU5dGAzsVlGgj4SFXnGtC9Zu7wZb/oOlZUZn0yHg
         tYV+kTE5U0GBVCYS/Yrf4YxiZciljVYG4GOymwXGggas5GwiJH7LQnYPgwU8gAAxSL
         BxHJZ5PwZbDVw1MtJIjorUE3qdQOPIfPlXMuISz0GTjG17RH1NpRMEJ6b1SZ8UZ1/E
         hgtWRszU3Y2fdk0yR/0e+4hAUwoRvwyX+5Nx9JqstM3hHO37bYg/AiUCd47bWdMTP+
         QApZ5jNZBNcjg==
Date:   Fri, 20 Aug 2021 14:22:59 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Salah Triki <salah.triki@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        gregkh@linuxfoundation.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND v2] hid-elo: update the reference count of the usb device
 structure
In-Reply-To: <20210729004451.GA783805@pc>
Message-ID: <nycvar.YFH.7.76.2108201422490.15313@cbobk.fhfr.pm>
References: <20210729004451.GA783805@pc>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 29 Jul 2021, Salah Triki wrote:

> Use usb_get_dev() to increment the reference count of the usb device
> structure in order to avoid releasing the structure while it is still in
> use. And use usb_put_dev() to decrement the reference count and thus,
> when it will be equal to 0 the structure will be released.

Applied, thanks for spotting this.

-- 
Jiri Kosina
SUSE Labs

