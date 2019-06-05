Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A785635D7F
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2019 15:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbfFENHy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 09:07:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727601AbfFENHy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Jun 2019 09:07:54 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49B8C206BA;
        Wed,  5 Jun 2019 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559740073;
        bh=bwcydyMYJ1No+dHcya2GLXBcrKvYZQxWtKphEAHwu5s=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=f5D24ccqZIKyNy0PBAFyG8ZVWbKbfma8oWrLpNaflzyaymCRmBfCgV8DrzGgCC6vO
         C3tCnLw77VqibgLv6FmI6lqSX7Zn6qgRiWp+8CLcVb/0UrpxOpTwU4EvhYBAzE8/NC
         PqJDb9bZnB4Ln7CGGxDnFldBk+1fuUeCK+e+zAyE=
Date:   Wed, 5 Jun 2019 15:07:50 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     Hans de Goede <hdegoede@redhat.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] few reverts and fixes for 5.2
In-Reply-To: <20190605124408.8637-1-benjamin.tissoires@redhat.com>
Message-ID: <nycvar.YFH.7.76.1906051507060.27227@cbobk.fhfr.pm>
References: <20190605124408.8637-1-benjamin.tissoires@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 5 Jun 2019, Benjamin Tissoires wrote:

> This has been already publicly discussed here, so I am just posting
> for completeness.
> 
> patch 1:
> request to revert it:
> https://patchwork.kernel.org/patch/10844177/#22651385
> 
> patch 2&3:
> related thread:
> https://lkml.org/lkml/2019/5/28/778
> 
> patch 4:
> bug link: https://bugzilla.kernel.org/show_bug.cgi?id=203619
> and related thread: https://lkml.org/lkml/2019/5/28/778
> 
> Cheers,
> Benjamin
> 
> Benjamin Tissoires (3):
>   Revert "HID: Increase maximum report size allowed by
>     hid_field_extract()"
>   Revert "HID: core: Do not call request_module() in async context"
>   Revert "HID: core: Call request_module before doing device_add"
> 
> Hans de Goede (1):
>   HID: logitech-dj: Fix 064d:c52f receiver support

For the set:

Acked-by: Jiri Kosina <jkosina@suse.cz>

Thanks,

-- 
Jiri Kosina
SUSE Labs

