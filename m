Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF612C40C0
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 14:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgKYM7e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 07:59:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:51636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725616AbgKYM7e (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 07:59:34 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F4E820715;
        Wed, 25 Nov 2020 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606309173;
        bh=x9VuWEs8R/1H7pwEYWnJVREK6qsKKyJK7XKeXU6tryA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=xRQjlUnmGMcDpf7PDkzwOc4snOV0b+XRFD4myopKYpln0+xYZeBoNInLU5v4ssiAV
         pzbizE4T6iDbtjidAmOVPDzjINHbqRo4P+HNyw8/BIQn8CeRDBkPSBVMiq8dFUSMh4
         qzFriZCi5VWxJsw/LJaRQFvetsSBQACpyGkG4cC0=
Date:   Wed, 25 Nov 2020 13:59:30 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: Add hid_device_id for V470 bluetooth
 mouse
In-Reply-To: <20201119132727.32036-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2011251359230.3441@cbobk.fhfr.pm>
References: <20201119132727.32036-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 19 Nov 2020, Hans de Goede wrote:

> The Logitech V470 bluetooth mouse supports HID++-1.0 over bluetooth,
> add its id to the hidpp driver so that it handles it.
> 
> This enables battery monitoring support.
> 
> Note this mouse does not support hi-resolution scroll-wheel events.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

