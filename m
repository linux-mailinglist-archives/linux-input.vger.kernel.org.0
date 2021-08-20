Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0983F2C7A
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 14:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240520AbhHTMw5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 08:52:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240278AbhHTMw4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 08:52:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E65A4610FA;
        Fri, 20 Aug 2021 12:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629463939;
        bh=OoTJIf38pBPH9S17dKpOwgVaFTVAqEHRnEu6JveyWhc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=FZTsqA43x2jGcRP7WydZPjCvsyKRJxaT/FCaKij0xwsDQThXVEKN4gQCqeR0iVGFh
         2EEWXroZTpX8PRXsxqpRdJddGSuU8XWzFB0WGsErBbGGwTr1Ung6585tbHtsj8JGGR
         W0vVrgMiOUe3B9u5uyqTNzOM2gpchriw9W3Zw68liRHjpzbG7gPy0m4hPGA6s2VJOE
         /MdBDQICa6ZSR66VsCvB6ffhebCXfUH8T51dS7cDQnWjwUTI+c3h0b5WlBz6Pcn+Ml
         5u1yMM/Ov2lrvYiaNgDHkIWJUiVWk/f+WogAUDi3jKpn0bMUki+ano3Vfy8xL586sv
         pjT3RbXkfcJ7w==
Date:   Fri, 20 Aug 2021 14:52:15 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jim Broadus <jbroadus@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, johnny.chuang.emc@gmail.com,
        kai.heng.feng@canonical.com
Subject: Re: [PATCH] HID: i2c-hid: Fix Elan touchpad regression
In-Reply-To: <20210809065505.6823-1-jbroadus@gmail.com>
Message-ID: <nycvar.YFH.7.76.2108201452050.15313@cbobk.fhfr.pm>
References: <20210809065505.6823-1-jbroadus@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 8 Aug 2021, Jim Broadus wrote:

> A quirk was recently added for Elan devices that has same device match
> as an entry earlier in the list. The i2c_hid_lookup_quirk function will
> always return the last match in the list, so the new entry shadows the
> old entry. The quirk in the previous entry, I2C_HID_QUIRK_BOGUS_IRQ,
> silenced a flood of messages which have reappeared in the 5.13 kernel.
> 
> This change moves the two quirk flags into the same entry.
> 
> Fixes: ca66a6770bd9 (HID: i2c-hid: Skip ELAN power-on command after reset)
> Signed-off-by: Jim Broadus <jbroadus@gmail.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

