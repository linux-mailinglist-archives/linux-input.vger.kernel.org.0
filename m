Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82C330BC0C
	for <lists+linux-input@lfdr.de>; Tue,  2 Feb 2021 11:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBBKbm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Feb 2021 05:31:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:48646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhBBKbk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 2 Feb 2021 05:31:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC84464F58;
        Tue,  2 Feb 2021 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612261860;
        bh=Hq6DP8Ix5+65mu2UHWhu/j5spne6YI5z5/93e1O5sm4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ZIDdZCUmLIU9nsJ/PoWj78gvHK0JozdsH9EUd8tEiP7VydQBrypRhjfoKNcR4Rv/1
         kpRpuF2Ni/+shFhJcvpiousaeP3XqmgXh9C2WPjc0LKkVLczRCB9DiMb9YgSgRbsfB
         668x0uuHB0+jWYXZUtvsEjYfLf2lszh41z20xaWXYNOXTHY43zZP7qsAEJ5D/yg67R
         HL0nPxRYd5ehs5PQADvsH5GcVhrPHHQOe/UP3ahexDmF50ol5Z97Y/IBjOHGiVKaq9
         vkCspO8nGcVfGZFjHqNro/avoa6A0Zl8TaC35Q0F3rCt/2KvuW/5y4TxryPgaby1Uq
         wuVruzS4f5S+w==
Date:   Tue, 2 Feb 2021 11:30:56 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Nicolas Boichat <drinkcat@chromium.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dtor@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: google: Get HID report on probe to confirm tablet
 switch state
In-Reply-To: <20210115134212.v2.1.I41b9795e4b5bda7209eb9099aebdc6a29677391e@changeid>
Message-ID: <nycvar.YFH.7.76.2102021130440.28696@cbobk.fhfr.pm>
References: <20210115134212.v2.1.I41b9795e4b5bda7209eb9099aebdc6a29677391e@changeid>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 15 Jan 2021, Nicolas Boichat wrote:

> This forces reading the base folded state anytime the device is
> probed, to make sure it's in sync.
> 
> This is useful after a reboot, if the device re-enumerates for
> any reason (e.g. ESD shock), or if the driver is unbound/rebound
> (debugging/testing).
> 
> Without this, the tablet switch state is only synchronized after a
> key is pressed (since the device would then send a report that
> includes the switch state), leading to strange UX (e.g. UI
> mode changes when a key is pressed after reboot).
> 
> This is not a problem on detachable base attach, as the device,
> by itself, sends a report after it is booted up.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Applied, thanks Nicolas.

-- 
Jiri Kosina
SUSE Labs

