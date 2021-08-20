Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9373F2C85
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 14:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237844AbhHTMzC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 08:55:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:40912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237828AbhHTMzC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 08:55:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD5CE60F91;
        Fri, 20 Aug 2021 12:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629464064;
        bh=ycRBYGBaMrCVvvELyUF5fqHohvrHAleMx1NJmLwP5zk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=eHxfpKiooDow4gSee4dRv+oKAMolL0+ff1TDnYFvFUzpZ582b2/MBciohGFPdnbxd
         E3WnJggayHh0jfqm0xkBSik9ENJh8ZfcPh1sYLaySJ2LV+9c1oBw7FZtEVsBNESNuz
         Iyhvtn5P8+gyM9HKGzLe300WmjfiCzTWO4ywdCnHUF22fQ+ygIAY2zsum6qxvYZ8If
         CyFEDBM+b2QpwYFhxj+xkoo3jietNET9qlNByWAT172SsAlfbeUV34OP1JaXvLsks/
         NVjA9tMsyTTX0L3KyuHMmVoKN8VXSzYslOW0P59srIT1l0QX6uL0Qoj/oxk8MznooL
         pa391NzRbZ7hA==
Date:   Fri, 20 Aug 2021 14:54:21 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
cc:     Dario Pagani <dario.pagani.146@gmail.com>,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: thrustmaster: clean up Makefile and adapt quirks
In-Reply-To: <20210810102148.9764-1-lukas.bulwahn@gmail.com>
Message-ID: <nycvar.YFH.7.76.2108201454100.15313@cbobk.fhfr.pm>
References: <20210810102148.9764-1-lukas.bulwahn@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 10 Aug 2021, Lukas Bulwahn wrote:

> Commit c49c33637802 ("HID: support for initialization of some Thrustmaster
> wheels") messed up the Makefile and quirks during the refactoring of this
> commit.
> 
> Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:
> 
> HID_TMINIT
> Referencing files: drivers/hid/Makefile, drivers/hid/hid-quirks.c
> 
> Following the discussion (see Link), CONFIG_HID_THRUSTMASTER is the
> intended config for CONFIG_HID_TMINIT and the file hid-tminit.c was
> actually added as hid-thrustmaster.c.
> 
> So, clean up Makefile and adapt quirks to that refactoring.
> 
> Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
> Link: https://lore.kernel.org/linux-input/CAKXUXMx6dByO03f3dX0X5zjvQp0j2AhJBg0vQFDmhZUhtKxRxw@mail.gmail.com/
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied, thanks Lukas.

-- 
Jiri Kosina
SUSE Labs

