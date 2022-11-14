Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCFD628C62
	for <lists+linux-input@lfdr.de>; Mon, 14 Nov 2022 23:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237765AbiKNWzw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Nov 2022 17:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbiKNWzw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Nov 2022 17:55:52 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88F71AD9E
        for <linux-input@vger.kernel.org>; Mon, 14 Nov 2022 14:55:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7BB69B815AE
        for <linux-input@vger.kernel.org>; Mon, 14 Nov 2022 22:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125EFC433C1;
        Mon, 14 Nov 2022 22:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668466549;
        bh=AnVA/fVOCmQFt0NgA0qPvspGh8TUsl//bTyeP3JcY/k=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=oTiT+Uowi0YijpUWAtYcyxL4hMRkm0wcf6q+b0HfU6WR79qMJKxmmXEjek5YEkyJh
         KozjIDjggcDVqO/sNofHSWXH73bBHXiIHMO+az+qb485Ynu/SO8v75Xm15ZLY9qyIc
         GWOKi5qIHPoiNiPaA2aunbJ0e8UaZEDHKn/peVqLwBVjpfeO3ZkhfcdP/eg9y/YQoK
         hzLekVAuzWQVzDGqLqjts0RJn6dqAek+Op0JroQkyY3lZt4ZlWYq/NTQQMB9rR2MDn
         IoMYhZ55msWluvQmQ3WXYUT2lheCc7ZVk3LuGVAy93WN9AY2BkO1lQqVWMpPkDYCB8
         2zmYQEQDVl+OQ==
Date:   Mon, 14 Nov 2022 23:55:47 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Rudolf Polzer <rpolzer@google.com>
Subject: Re: [PATCH] HID: ite: Enable QUIRK_TOUCHPAD_ON_OFF_REPORT on Acer
 Aspire Switch V 10
In-Reply-To: <20221108151350.107055-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2211142355360.6045@cbobk.fhfr.pm>
References: <20221108151350.107055-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 8 Nov 2022, Hans de Goede wrote:

> The Acer Aspire Switch V 10 (SW5-017)'s keyboard-dock uses the same
> ITE controller setup as other Acer Switch 2-in-1's.
> 
> This needs special handling for the wifi on/off toggle hotkey as well as
> to properly report touchpad on/off keypresses.
> 
> Add the USB-ids for the SW5-017's keyboard-dock with a quirk setting of
> QUIRK_TOUCHPAD_ON_OFF_REPORT to fix both issues.
> 
> Cc: Rudolf Polzer <rpolzer@google.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

