Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE03671878
	for <lists+linux-input@lfdr.de>; Wed, 18 Jan 2023 11:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjARKEk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Jan 2023 05:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjARKCv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Jan 2023 05:02:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD93654F5
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 01:10:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF1E16172F
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 09:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05840C433D2;
        Wed, 18 Jan 2023 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674033043;
        bh=u4UHakFEkdYXmtJCYeylwNF9AWFdYCrH/uRYp49qcVY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=prbZWDCXdnzRlv0jVHxBuNjAN1DcHqp23pu135nt0Nzb+VsIvMjj9XmwsLsD7MK0u
         9szx7xIh2sfqw796jqMfcOGydPzpft22vSYMtoNeAZCTA9qLCVP4C9uvbw5yZ4KmDg
         GIFH2IxPQzQ6NDMW/ArfPUlwdL9cJhSjOANdtZ3o6BAbpPH+sVePLnV0BP1UJd5N9E
         QXvAJ+B1hb3aadaQWyubm5wXoBxypmpFw0WdH2S6MUOgqPsslz2lbx3My7L81BBG8q
         VxGoP/3nZgAc3ffvvc7c+dV5/H+cULHjQfSr8TyTT/wdDG1Q/p8is3ucgvR/53WZXW
         AdW7zI0dgNX7w==
Date:   Wed, 18 Jan 2023 10:10:44 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Alain Carlucci <alain.carlucci@gmail.com>
Subject: Re: [PATCH 2/5] HID: playstation: sanity check DualShock4 calibration
 data.
In-Reply-To: <20230106015910.3031670-3-roderick.colenbrander@sony.com>
Message-ID: <nycvar.YFH.7.76.2301181010290.1734@cbobk.fhfr.pm>
References: <20230106015910.3031670-1-roderick.colenbrander@sony.com> <20230106015910.3031670-3-roderick.colenbrander@sony.com>
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

On Thu, 5 Jan 2023, Roderick Colenbrander wrote:

> Some DualShock4 devices report invalid calibration data resulting
> in kernel oopses due to division by zero during report handling.
> 
> The devices affected generally appear to be clone devices, which don't
> implement all reports properly and don't populate proper calibration
> data. The issue may have been seen on an official device with erased
> calibration reports.
> 
> This patch prevents the crashes by essentially disabling calibration
> when invalid values are detected.
> 
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> Tested-by: Alain Carlucci <alain.carlucci@gmail.com>

Applied to for-6.2/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs

