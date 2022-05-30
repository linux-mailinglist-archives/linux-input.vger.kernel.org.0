Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A78965376FF
	for <lists+linux-input@lfdr.de>; Mon, 30 May 2022 10:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbiE3IsN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 May 2022 04:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233159AbiE3IsM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 May 2022 04:48:12 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908F029827
        for <linux-input@vger.kernel.org>; Mon, 30 May 2022 01:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=3irNR4jYA1+TA/VRzhAWsxR2WMrSQSYy2hIm7LiMHY0=; b=TPDJ8g0TV94nkzuuqJjby2DgeI
        YHf/tgSbFijWf1LFVyoUJi7/RbzXcECaz6cah2KKSN5+3UxWH7oXtXvcasKhtZvm/R1XnWlFF7Jsy
        oc3Zz2aiaX2Scn1qmfrbsQ3Y04Rh4BCCbELvM7HQ1HPvkzUu9A03vghWzo2LEP3RjBMPYLxKUs+En
        UX7HrjIud55YKhfVrle0QNi4+WBNcR/1tY0557yeGh88m/mCQVClRyWaQRZnIWPyc44X5Df2PX2GA
        jpE1CAmNHCubZ5Xh949YY6hal9Nz0Q+plkUf5CcNZ9RyT2eu/NrDhLVsO2ib+nDRmUSn45YU9GAm2
        bBDHHykg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nvb4K-002zO6-MU; Mon, 30 May 2022 08:48:09 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 2EB05980DE7; Mon, 30 May 2022 10:48:06 +0200 (CEST)
Date:   Mon, 30 May 2022 10:48:06 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: Suspend/Resume (S3) issues with rmi_smbus
Message-ID: <YpSExunpPdgdjQCz@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

My very aged x240 seems to require unloading and reloading of rmi_smbus
after every suspend cycle, otherwise the touchpad won't work again.

It seems to have started a few releases ago, but it used to be
occasional loss of touchpad, but now with 5.18 it is *every* suspend.

But the thing is, when I look at the git history of that file, it's not
been touched in 2 years or so, so I'm somewhat confused what's causing
this.

The relevant errors in dmesg are:

[26604.508618] rmi4_smbus 0-002c: failed to get SMBus version number!
[26604.508852] rmi4_physical rmi4-03: rmi_driver_reset_handler: Failed to read current IRQ mask.
[26604.509113] rmi4_f01 rmi4-03.fn01: Failed to restore normal operation: -6.
[26604.509117] rmi4_f01 rmi4-03.fn01: Resume failed with code -6.
[26604.509118] rmi4_physical rmi4-03: Failed to suspend functions: -6
[26604.509120] rmi4_smbus 0-002c: Failed to resume device: -6


Any clues where I should start poking? I'm not really familiar with this
part of the kernel.
