Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCBB496202
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 16:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351352AbiAUPYq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 10:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381552AbiAUPYl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 10:24:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0382BC06173B
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 07:24:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E557618DF
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 15:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20862C340E1;
        Fri, 21 Jan 2022 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642778680;
        bh=SFpvqzgukhmKBMHyNHw/RZnbbGUiv2OpPjSdSMj/ie4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=OCZghMcbMVW0B4gfy+dLs3sUpFDTyq/aFqxEhJhPe/Mr5ytWA/FkB/i2A8Zw6XwIA
         o3O5aMMJ3wICeTt/66qc+8M/NkPIybKVaAQZqxxItQGZ55B+TZmswpF5SuhYdfYdZh
         CQXUF59LiQUMznDpkHHTTds1swgZpxK9zfs/GV9Z51nGO/5XTWvt2RYSk7ID2CsRf5
         NCp6fJyosLVLtuwQeijujJl+tO6AfSnehzXhUAqmHVtSFT7njljdzcoLTr7PSkvaDB
         Vfv0E7Aa79hwDoqPPGNtC3dumX3e/+N2C5X+k5b8TkBpXmJSuw5im54CBdWFLNekKn
         g36Mbob7xad+g==
Date:   Fri, 21 Jan 2022 16:24:37 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Florian Klink <flokli@flokli.de>
cc:     ValdikSS <iam@valdikss.org.ru>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
In-Reply-To: <20220121124116.cj6xtxvzw7rbkcs6@tp>
Message-ID: <nycvar.YFH.7.76.2201211624150.28059@cbobk.fhfr.pm>
References: <20211216224611.440397-1-iam@valdikss.org.ru> <nycvar.YFH.7.76.2201061419420.16505@cbobk.fhfr.pm> <e9e1f6ce-f12c-291b-81a8-c76f72ee29f2@valdikss.org.ru> <20220121124116.cj6xtxvzw7rbkcs6@tp>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 21 Jan 2022, Florian Klink wrote:

> I tested the driver and it's a big improvement. I just sent a v3 with my
> name in the Signed-Off-By field.

Thanks. Where did you send it to? :) I don't seem to have it in my inbox.

-- 
Jiri Kosina
SUSE Labs

