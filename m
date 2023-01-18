Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6896717A1
	for <lists+linux-input@lfdr.de>; Wed, 18 Jan 2023 10:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjARJ1T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Jan 2023 04:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbjARJZO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Jan 2023 04:25:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898D44FCF3
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 00:50:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30848616F7
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 08:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949FCC433D2;
        Wed, 18 Jan 2023 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674031835;
        bh=QauonNv0EXGoSeatSna+JMFAAXtdwXpakLfDdsWLD2g=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=TwOUcfYZaa7xvDmEJDaj7Q0DnMZLH/hhyptlcGyE+8GEPq0PHRA8g62cuSkGYtisa
         QhVe7RpMTqjFJXlDHB31+Xzfyfd9TqdJSK7+aWVJbmFGpKSKwmQkCPxx72iHqvHzom
         OwMNCtBzKywhN/aRX7D8PCMa0SpTp3+mgKS3FN3hBc3/Q/i83cR2Sm3NIwoeokeLNk
         cB6vs86CYv3FqgEfYYHuJ+ccN2+g7zVl/48u9VMsb8jQnfU1cqf8eGtc98Sa0D6sEn
         bYcjSoC+1CnTDyeRwhRTOvtv+ATwqjKx7d8f1v8PLZ/qMa/Y9tz1WPMh5pHcowsXLh
         eVyLCYyv50PRg==
Date:   Wed, 18 Jan 2023 09:50:36 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH] HID: sony: remove DualShock4 support.
In-Reply-To: <20230106211425.3048993-1-roderick.colenbrander@sony.com>
Message-ID: <nycvar.YFH.7.76.2301180949580.1734@cbobk.fhfr.pm>
References: <20230106211425.3048993-1-roderick.colenbrander@sony.com>
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

On Fri, 6 Jan 2023, Roderick Colenbrander wrote:

> Now that hid-playstation provides DualShock4 support, remove
> DualShock4 support from hid-sony as it is redundant.
> 
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> ---
>  drivers/hid/hid-sony.c | 1021 ++--------------------------------------
>  1 file changed, 40 insertions(+), 981 deletions(-)

What's not to like about this diffstat :)

Applied, thanks Roderick.

-- 
Jiri Kosina
SUSE Labs

