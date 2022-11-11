Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACEF62579F
	for <lists+linux-input@lfdr.de>; Fri, 11 Nov 2022 11:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbiKKKIf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Nov 2022 05:08:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbiKKKIf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Nov 2022 05:08:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB51F038
        for <linux-input@vger.kernel.org>; Fri, 11 Nov 2022 02:08:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BD8B9B824E9
        for <linux-input@vger.kernel.org>; Fri, 11 Nov 2022 10:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55037C433C1;
        Fri, 11 Nov 2022 10:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668161309;
        bh=vpBKKcNhfmt40M0+zprnSSmTz0TDPOLvLj2tKkGUppo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=AxaBuF70mdJodb4FBRDZb2LD6HlRGQKUm6cokm5A3bEjfppaRZ22Az/ipbMLbUrla
         w/Pq8yKDtrz/Ybr9jDzYTaGF4rertPeTyhoXju/dCAKAJJGa0+uGfWMus09dj+l61q
         7oY0Hcsq5sWOxs/AkrLRc5CiPES3sskAN9+SDdXt+ujcfEGGqkq6yCvCtC3hnY0smn
         KOQpS7DodwedxEIBLsi/lKmsiIOiH1oeLd4MDhlQ3ZbbXZOHvYIVIJRQH1YH0SBS5i
         VeIyr4kNFh5rFIbir/u6P4VSeS5jWOENi328ikgQv9MtG/QYdZic4nVocTKGbtcu2t
         e1pdclVNXct2g==
Date:   Fri, 11 Nov 2022 11:08:27 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 00/13] hid: playstation: add DualShock4 support
In-Reply-To: <20221029184851.282366-1-roderick.colenbrander@sony.com>
Message-ID: <nycvar.YFH.7.76.2211111108000.6045@cbobk.fhfr.pm>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
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

On Sat, 29 Oct 2022, Roderick Colenbrander wrote:

> Hi,
> 
> Last year, we introduced hid-playstation as the start of a new driver
> for officially supported PlayStation peripherals. The driver initially
> only supported DualSense devices, but we promised to also bring support
> for at least DualShock4 as well.
> 
> This patch series adds DualShock4 support to hid-playstation. It should
> be considered a brand new driver written from scratch in the same design
> as hid-playstation. The driver is more documented and uses structures
> instead of byte offsets with magical values. The driver should be more
> clear and easier to follow. A few little sections of code cary over, which
> Sony contributed before for sensor calibration or dongle support.
> 
> Functionality wise the driver is equivalent to hid-sony. The only subtle
> change is in the naming of the lightbar LEDs. Previously they used a naming
> scheme like '<mac_address>:<color>", which doesn't follow the LED class standards.
> The new scheme uses '<device_name>:<color>' (e.g. input10:red), which is more
> compliant. Due to backwards compatibility in particular for Android, we couldn't
> make it fully compliant. Nor were we able to use the new multicolor LED class.
> 
> Aside from the LED code, the other features behave the same way. The hid-tools
> tests all pass as well. One small change is that we use a different HID report
> 0x12 to get the MAC address in USB mode. This report is the official one even
> though other ones can get the info too, but e.g. clone devices don't tend to
> support it.

Hi Roderick,

this is now queued in hid.git#for-6.2/sony.

Thanks for all the work on this,

-- 
Jiri Kosina
SUSE Labs

